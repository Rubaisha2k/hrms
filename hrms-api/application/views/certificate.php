<?php 
header('content-type: image/jpeg');
$font = realpath('arial.ttf');
$image = imagecreatefromjpeg('uploads/logo/logo_1597746768.jpg');
$color = imagecolorallocate($image , 51, 51, 102);
$date = date('d F, Y');
//$text = "hello";
imagettftext($image, 14, 0, 13, 20, $color, $font, $date);
imagejpeg($image);
imagedestroy($image);
?>