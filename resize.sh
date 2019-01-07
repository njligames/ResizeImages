#!/bin/bash

INDIR=$1
USE="use:\n \tFirst Parameter is the output of the generated images.\n \tSecond Parameter is the width of the output image.\n \tThird Parameter is the height of the output image.\n \tFourth parameter is the backgroud canvas color of the output image. (A list of all colors are in colors.pdf)\n Example:\n \tbash resize.sh images/ 4000 3000 white\n"

if ! [ -z "$INDIR" ]
then

    if [ -d $INDIR ]
    then
        WIDTH=$2
        HEIGHT=$3
        COLOR=$4

        if [ -z "$WIDTH" ]
        then
            WIDTH=4000
        fi

        if [ -z "$HEIGHT" ]
        then
            HEIGHT=3000
        fi

        if [ -z "$COLOR" ]
        then
            COLOR=white
        fi

        mkdir -p out

        for filename in images/*.*; do
            DIR=$(dirname "${filename}")
            mkdir -p out/$DIR

            convert $filename -resize ${WIDTH}x${HEIGHT} -gravity center -background ${COLOR} -extent ${WIDTH}x${HEIGHT} out/$filename
        done
    else
        echo " The in directory '$INDIR' does not exist"
    fi

else
    printf "$USE"
fi


