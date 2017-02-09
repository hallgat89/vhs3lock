#!/bin/bash


# https://github.com/hallgat89/vhs3lock
# Depends on: i3lock, xfonts-terminus, imagemagick

BG='/tmp/vhslock.png'
BGCOLOR='0000ff'
FONT='Terminus'
WIDTH=1920
HEIGHT=1080

gen_background() {
    ips='PLAY'	
    convert -size "$WIDTH x $HEIGHT" xc:#"$BGCOLOR" -font "$FONT" -pointsize 72 \
        -channel RGB -fill white -strokewidth 2 \
        -draw "text 200,200 'PLAY►'" \
        -draw "text $((WIDTH-300)),200 '--:--'" \
        -draw "text 200,$((HEIGHT-200)) 'SLP'" \
        -draw "text $((WIDTH-350)),$((HEIGHT-200)) '0:000'" "$BG"
}

# Start making the background
gen_background

# Lock again with the new background
i3lock -c $BGCOLOR -i $BG
#SCREENSIZE is the size of the image, if you set it smaller, you can tile it with -t
