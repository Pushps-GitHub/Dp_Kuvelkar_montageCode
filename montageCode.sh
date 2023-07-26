#!/bin/bash

RED="\e[91m"	
GREEN="\e[92m"	
YELLOW="\e[93m"	
BLUE="\e[94m" 	
MAGENTA="\e[95m" 
CYAN="\e[96m"
ENDCOLOR="\e[0m"

canvas() {

echo -e " ${RED}Creating canvas ${ENDCOLOR}"

convert -size 14000x9000 canvas:white -fill white -stroke blue -strokewidth 150 -draw "rectangle 150,150 13850,8850" border.png

echo -e " ${GREEN}Bordering Done${ENDCOLOR}"

convert -size 4150x3150 canvas:white -fill white -stroke yellow -strokewidth 2 -draw "rectangle 350,350 2000,2000" horizontalFrame.png

echo -e " ${YELLOW}Creating Frames${ENDCOLOR}"

convert -size 3150x4150 canvas:white -fill white -stroke yellow -strokewidth 2 -draw "rectangle 350,350 2000,2000" verticalFrame.png

convert -size 1375x875 canvas:white -fill white -stroke yellow -strokewidth 2 -draw "rectangle 350,350 500,500" horizontalFrame2.png

echo -e " ${BLUE}Horizontal Frames Done${ENDCOLOR}"

convert -size 2262x3686 canvas:white -fill white -stroke yellow -strokewidth 2 -draw "rectangle 350,350 500,500" verticalFrame2.png

echo -e " ${MAGENTA}Vertical Frames Done${ENDCOLOR}"

sleep 1

echo -e " ${CYAN}Canvas Created ${ENDCOLOR}"

sleep 1
}

impressions() {

canvas

echo -e " ${RED}Creating Impressions on Canvas ${ENDCOLOR}"

convert horizontalFrame.png TFGs.jpg -gravity center -composite tfgs.png

convert horizontalFrame.png paperPresentationCTIS.jpeg -gravity center -composite ppc.png

convert horizontalFrame2.png DIAC.jpg -gravity center -composite d.png

echo -e " ${GREEN}Horizontal Impressions Created ${ENDCOLOR}"

convert verticalFrame.png RND-Meets.jpeg -gravity center -composite rdm.png

echo -e " ${YELLOW}Vertical Impressions Created ${ENDCOLOR}"


rm horizontalFrame.png verticalFrame.png verticalFrame2.png horizontalFrame2.png

sleep 1

echo -e " ${BLUE}Framing temp files cleared${ENDCOLOR}"

}

scaling() {

impressions

sleep 1

echo -e " ${MAGENTA}Scaling Images to fit on Canvas ${ENDCOLOR}"

convert tfgs.png -resize 200% tfgs2.png

echo -e " ${CYAN}Image 1 done${ENDCOLOR}"

convert rdm.png -resize 160% rdm2.png

echo -e " ${RED}Image 2 done${ENDCOLOR}"

convert ppc.png -resize 145% ppc2.png

echo -e " ${GREEN}Image 3 done${ENDCOLOR}"

convert d.png -resize 500% d2.png

echo -e " ${YELLOW}Image 4 done${ENDCOLOR}"

sleep 1

echo -e " ${BLUE}All Images Scaled ${ENDCOLOR}"

sleep 1

rm tfgs.png rdm.png ppc.png d.png

echo -e " ${MAGENTA}Scaling temp files cleared${ENDCOLOR}"

sleep 1

}

composition() {

scaling

echo -e " ${CYAN}Creating the Collage ${ENDCOLOR}"

convert border.png tfgs2.png -geometry +5400+250 -composite c1.png

echo -e " ${RED}Image 1 done${ENDCOLOR}"

convert c1.png rdm2.png -geometry +400+300 -composite c2.png

echo -e " ${GREEN}Image 2 done${ENDCOLOR}"

convert c2.png ppc2.png -geometry +7700+4200 -composite c3.png

echo -e " ${YELLOW}Image 3 done${ENDCOLOR}"

convert c3.png d2.png -geometry +400+4400 -composite c4.png

echo -e " ${BLUE}Image 4 done${ENDCOLOR}"

convert c4.png QR_Code.png -geometry +6500+6600 -composite Dp_Kuvelkar_montage.png

echo -e " ${MAGENTA}Collage Created ${ENDCOLOR}"

sleep 1

echo -e " ${CYAN}Clearing all temp files${ENDCOLOR}"

rm border.png tfgs2.png c1.png rdm2.png c2.png ppc2.png c3.png d2.png c4.png

sleep 1

echo -e " ${RED}All temp files cleared${ENDCOLOR}"

sleep 1

echo -e " ${GREEN}Opening the Collage${ENDCOLOR}"

xdg-open Dp_Kuvelkar_montage.png

sleep 4

}

composition
