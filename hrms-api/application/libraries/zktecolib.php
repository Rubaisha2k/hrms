<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
error_reporting(0);
define('CMD_CONNECT', 1000);
define('USHRT_MAX', 65535);
define('CMD_ACK_ERROR', 2001);
define('CMD_ACK_OK', 2000);
define('CMD_OPTIONS_RRQ', 11);
define('CMD_PREPARE_DATA', 1500);
define('CMD_USERTEMP_RRQ', 9);

class Zktecolib
{
    public $ip = null;
    public $port = null;
    public $socket = null;
    public $session_id = 0;
    public $received_data = '';
    public $user_data = array();
    public $attendance_data = array();
    public $timeout_sec = 5;
    public $timeout_usec = 5000000;

    public function __construct($ip = null, $port = null)
    {
        if ($ip != null) {
            $this->ip = $ip;
        }
        if ($port != null) {
            $this->port = $port;
        }
        $this->socket = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
        //$this->setTimeout($this->timeout_sec, $this->timeout_usec);
    }

    public function connect($ip= null, $port = 4370)
    {
        if ($ip != null) {
            $this->ip = $ip;
        }
        if ($port != null) {
            $this->port = $port;
        }
        if ($this->ip == null || $this->port == null) {
            return false;
        }
        json_output(200,$this->ip);
        $command = CMD_CONNECT;
        json_output(200, $command);
        $command_string = '';
        $chksum = 0;
        $session_id = 0;
        $reply_id = -1 + USHRT_MAX;
        $buf = $this->createHeader($command, $chksum, $session_id, $reply_id, $command_string);
        socket_sendto($this->socket, $buf, strlen($buf), 0, $this->ip, $this->port);
        try {
            socket_recvfrom($this->socket, $this->received_data, 1024, 0, $this->ip, $this->port);
            if (strlen($this->received_data) > 0) {
                $u = unpack('H2h1/H2h2/H2h3/H2h4/H2h5/H2h6', substr($this->received_data, 0, 8));
                $this->session_id = hexdec($u['h6'] . $u['h5']);
                return true;
                json_output(200, strlen($this->received_data));
            } else {
                json_output(200,"False");
                return false;
            }
        } catch (ErrorException $e) {
            json_output(200,"Error");
            return false;
        } catch (exception $e) {
            json_output(200,"error");
            return false;
        }
    }
    public function getDeviceName($net = true)
    {
        $command = CMD_OPTIONS_RRQ;
        $command_string = '~DeviceName';
        $return = $this->execCommand($command, $command_string);
        if ($net) {
            $arr = explode("=", $return, 2);
            //json_output(200,$arr[0]);
            return $arr[0];
        } else {
            json_output(200,$return);
        }
    }
    public function execCommand($command, $command_string = '', $offset_data = 8)
    {
        $chksum = 0;
        $session_id = $this->session_id;
        $u = unpack('H2h1/H2h2/H2h3/H2h4/H2h5/H2h6/H2h7/H2h8', substr($this->received_data, 0, 8));
        $reply_id = hexdec($u['h8'] . $u['h7']);
        $buf = $this->createHeader($command, $chksum, $session_id, $reply_id, $command_string);
        socket_sendto($this->socket, $buf, strlen($buf), MSG_EOR, $this->ip, $this->port);
        try {
            socket_recvfrom($this->socket, $this->received_data, 1024, 0, $this->ip, $this->port);
            $u = unpack('H2h1/H2h2/H2h3/H2h4/H2h5/H2h6', substr($this->received_data, 0, 8));
            $this->session_id =  hexdec($u['h6'] . $u['h5']);
            json_output(200, $this->ip);
            return substr($this->received_data, $offset_data);
        } catch (ErrorException $e) {
            return false;
        } catch (exception $e) {
            return false;
        }
    }
    private function getSizeUser()
    {
        $u = unpack('H2h1/H2h2/H2h3/H2h4/H2h5/H2h6/H2h7/H2h8', substr($this->received_data, 0, 8));
        $command = hexdec($u['h2'] . $u['h1']);
        if ($command == CMD_PREPARE_DATA) {
            $u = unpack('H2h1/H2h2/H2h3/H2h4', substr($this->received_data, 8, 4));
            $size = hexdec($u['h4'] . $u['h3'] . $u['h2'] . $u['h1']);
            return $size;
        } else {
            return false;
        }
    }


    public function createHeader($command, $chksum, $session_id, $reply_id, $command_string)
    {
        $buf = pack('SSSS', $command, $chksum, $session_id, $reply_id) . $command_string;
        $buf = unpack('C' . (8 + strlen($command_string)) . 'c', $buf);
        $u = unpack('S', $this->checkSum($buf));
        if (is_array($u)) {
            while (list($key) = each($u)) {
                $u = $u[$key];
                break;
            }
        }
        $chksum = $u;
        $reply_id += 1;
        if ($reply_id >= USHRT_MAX) {
            $reply_id -= USHRT_MAX;
        }
        $buf = pack('SSSS', $command, $chksum, $session_id, $reply_id);
        return $buf . $command_string;
    }
    private function checkValid($reply)
    {
        $u = unpack('H2h1/H2h2', substr($reply, 0, 8));
        $command = hexdec($u['h2'] . $u['h1']);
        if ($command == CMD_ACK_OK) {
            return true;
        } else {
            return false;
        }
    }
    private function checkSum($p)
    {
        /* This function calculates the chksum of the packet to be sent to the time clock */
        $l = count($p);
        $chksum = 0;
        $i = $l;
        $j = 1;
        while ($i > 1) {
            $u = unpack('S', pack('C2', $p['c' . $j], $p['c' . ($j + 1)]));
            $chksum += $u[1];
            if ($chksum > USHRT_MAX) {
                $chksum -= USHRT_MAX;
            }
            $i -= 2;
            $j += 2;
        }
        if ($i) {
            $chksum = $chksum + $p['c' . strval(count($p))];
        }
        while ($chksum > USHRT_MAX) {
            $chksum -= USHRT_MAX;
        }
        if ($chksum > 0) {
            $chksum = -($chksum);
        } else {
            $chksum = abs($chksum);
        }
        $chksum -= 1;
        while ($chksum < 0) {
            $chksum += USHRT_MAX;
        }
        return pack('S', $chksum);
    }

public function getUserData()
    {
        $uid = 1;
        $command = CMD_USERTEMP_RRQ;
        $command_string = chr(5);
        $chksum = 0;
        $session_id = $this->session_id;
        $u = unpack('H2h1/H2h2/H2h3/H2h4/H2h5/H2h6/H2h7/H2h8', substr($this->received_data, 0, 8));
        $reply_id = hexdec($u['h8'] . $u['h7']);
        $buf = $this->createHeader($command, $chksum, $session_id, $reply_id, $command_string);
        socket_sendto($this->socket, $buf, strlen($buf), 0, $this->ip, $this->port);
        try {
            socket_recvfrom($this->socket, $this->received_data, 1024, 0, $this->ip, $this->port);
            $u = unpack('H2h1/H2h2/H2h3/H2h4/H2h5/H2h6', substr($this->received_data, 0, 8));
            $bytes = $this->getSizeUser();
            if ($bytes) {
                while ($bytes > 0) {
                    socket_recvfrom($this->socket, $received_data, 1032, 0, $this->ip, $this->port);
                    array_push($this->user_data, $received_data);
                    $bytes -= 1024;
                }
                $this->session_id =  hexdec($u['h6'] . $u['h5']);
                socket_recvfrom($this->socket, $received_data, 1024, 0, $this->ip, $this->port);
            }
            $users = array();
            $retdata = "";
            if (count($this->user_data) > 0) {
                for ($x = 0; $x < count($this->user_data); $x++) {
                    if ($x > 0) {
                        $this->user_data[$x] = substr($this->user_data[$x], 8);
                    }
                    if ($x > 0) {
                        $retdata .= substr($this->user_data[$x], 0);
                    } else {
                        $retdata .= substr($this->user_data[$x], 12);
                    }
                }
            }
            return $retdata;
        } catch (ErrorException $e) {
            return false;
        } catch (exception $e) {
            return false;
        }
    }
}

?>