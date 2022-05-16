<?php

$dest=imagecreatetruecolor(4096,4096);

for ($i = 0; $i <= 3; $i++) {
    for ($j = 0; $j <= 3; $j ++) {
        $url = 'https://tiles.telegeography.com/maps/submarine-cable-map-2015/2/' . $j . '/' . $i . '.png';

        $image = imagecreatefrompng($url);
        imagecopymerge($dest, $image, (256*$j), (256*$i), 0, 0, imagesx($image), imagesy($image), 100);
    }
}

imagepng($dest, 'img/final/final2.png');
