#!/bin/bash

read -p "logo : " LOGO
read -p "landing page : " SOURCE
read -p "title : " TITLE 
read -p "category : " CATEGORY 
read -p "format : " FORMAT
read -p "description : " DESCRIPTION
read -p "languages : " LANGUAGES

COL1=$(echo $LOGO)
COL2=$(echo $SOURCE)
COL3=$(echo $TITLE)
COL4=$(echo $CATEGORY)
COL5=$(echo $FORMAT)
COL6=$(echo $DESCRIPTION)
COL7=$(echo -e $LANGUAGES | tr ',' '\t')

echo -e ""$COL1"\t"$COL2"\t"$COL3"\t"$COL4"\t"$COL5"\t"$COL6"" | tr '\n' '\t' >> cms-input.temp && echo "$COL7" | tr ' ' '\t' >> cms-input.temp 

cat cms-input.temp >> cms.taxonomy
rm cms-input.temp

./cms-build.sh

