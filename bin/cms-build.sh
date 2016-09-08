#!/bin/bash

cat ./taxonomy/cms.taxonomy | cut -f7- | tr '\t' '\n' | sed 's/\ //' | sort -u | grep -v na > cms.page

echo -e "<a class="navi" href='index.html'>HOME</a>" >> navi.html

while read MENUITEM
	do
		echo -e "<a class="navi" href='"$MENUITEM".html'>"$MENUITEM"</a>" >> navi.html
	done <cms.page

while read PAGES
	do
		OUTPUT=$(echo "$PAGES".html)
		cat ./taxonomy/cms.taxonomy | grep -i "$PAGES" | sed $'s/\t/"\t"/g' | sed 's/$/\"/' | sed 's/^/\"/' | sed 's/\ \"/\"/g' > cms."$PAGES"
		rm "$OUTPUT"

		echo -e "<!DOCTYPE html>" >> "$OUTPUT"
		echo -e "<html lang="en">" >> "$OUTPUT"
		echo -e "<head>" >> "$OUTPUT"
		echo -e "    <meta charset="utf-8">" >> "$OUTPUT"
		echo -e "    <meta http-equiv="X-UA-Compatible" content="IE=edge">" >> "$OUTPUT"
		echo -e "    <meta name="viewport" content="width=device-width, initial-scale=1">" >> "$OUTPUT"
		echo -e "    <meta name="description" content="">" >> "$OUTPUT"
		echo -e "    <meta name="author" content="">" >> "$OUTPUT"
		echo -e "    <title>Access Internet Content for Free</title>" >> "$OUTPUT"
		echo -e "    <link href="style/bootstrap.min.css" rel="stylesheet">" >> "$OUTPUT"
		echo -e "    <link href="style/ie10-viewport-bug-workaround.css" rel="stylesheet">" >> "$OUTPUT"
		echo -e "    <script src="js/ie-emulation-modes-warning.js"></script>" >> "$OUTPUT"
		echo -e "    <link href="style/index.css" rel='"stylesheet"'>" >> "$OUTPUT"
		echo -e "  </head>" >> "$OUTPUT"
		cat navi.html >> "$OUTPUT"
		echo -e "    <div class='"container marketing"'>" >> "$OUTPUT"
		echo -e "      <div class='"row"'>" >> "$OUTPUT"

		while read VALUES
			do

				IMAGE=$(echo -e $VALUES | cut -d '"' -f2 | sed 's/$/\"/' | sed 's/^/\"/')
				NAME=$(echo -e $VALUES | cut -d '"' -f6 | sed 's/$/\"/' | sed 's/^/\"/')
				TITLE=$(echo -e $VALUES | cut -d '"' -f6)
				SOURCE=$(echo -e $VALUES | cut -d '"' -f4 | sed 's/$/\"/' | sed 's/^/\"/')
				DESCRIPTION=$(echo -e $VALUES | cut -d '"' -f14)
				CATEGORY=$(echo -e $VALUES | cut -d '"' -f8 | sed 's/$/\"/' | sed 's/^/\"/')
				# LANGUAGE=$(echo -e $VALUES | cut -d '"' -f10)

				WIDTH=$(echo 140 | sed 's/$/\"/' | sed 's/^/\"/' )
				HEIGHT=$(echo 140 | sed 's/$/\"/' | sed 's/^/\"/' )

				echo -e "        <div class='"col-lg-4"'>" >> "$OUTPUT"
				echo -e "          <a href="$SOURCE"><img class='"img-circle"' src="$IMAGE" alt="$NAME" width="$WIDTH" height="$HEIGHT"></a>" >> "$OUTPUT"
				echo -e "          <h2>"$TITLE"</h2>" >> "$OUTPUT" 
				#  <font class='"language"'>("$LANGUAGE")</font>
				# echo -e "          <p>"$DESCRIPTION"</p>" >> "$OUTPUT"
				echo -e "        </div>" >> "$OUTPUT"
				echo -e " " >> "$OUTPUT"

			done <cms."$PAGES"

		echo -e "      </div>" >> "$OUTPUT"
		echo -e "      <footer>" >> "$OUTPUT"
		echo -e "        <p class='"pull-right"'><a href="#">Back to top</a></p>" >> "$OUTPUT"
		echo -e "        <p>&copy; 2016 Skynet</p>" >> "$OUTPUT"
		echo -e "      </footer>" >> "$OUTPUT"
		echo -e "    </div>" >> "$OUTPUT"
		echo -e "    <script src='"js/jquery-1.11.3.min"'></script>" >> "$OUTPUT"
		echo -e "    <script>window.jQuery || document.write('<script src='"js/jquery.min.js"'><\/script>')</script>" >> "$OUTPUT"
		echo -e "    <script src='"js/bootstrap.min.js"'></script>" >> "$OUTPUT"
		echo -e "    <script src='"js/holder.min.js"'></script>" >> "$OUTPUT"
		echo -e "    <script src='"js/ie10-viewport-bug-workaround.js"'></script>" >> "$OUTPUT"
		echo -e "  </body>" >> "$OUTPUT"
		echo -e "</html>" >> "$OUTPUT"

		rm cms."$PAGES"
	done <cms.page
rm navi.html

		rm index.html

		echo -e "<!DOCTYPE html>" >> index.html
		echo -e "<html lang="en">" >> index.html
		echo -e "<meta http-equiv="content-type" content="text/html;charset=utf-8" />" >> index.html
		echo -e "<head>" >> index.html
		echo -e "    <meta charset="utf-8">" >> index.html
		echo -e "    <meta http-equiv="X-UA-Compatible" content="IE=edge">" >> index.html
		echo -e "    <meta name="viewport" content="width=device-width, initial-scale=1">" >> index.html
		echo -e "    <meta name="description" content="">" >> index.html
		echo -e "    <meta name="author" content="">" >> index.html
		echo -e "    <link rel="icon" href="favicon.ico">" >> index.html
		echo -e "    <title>Skynet, Your Free Community Internet</title>" >> index.html
		echo -e "    <link href="style/bootstrap.min.css" rel="stylesheet">" >> index.html
		echo -e "    <link href="style/ie10-viewport-bug-workaround.css" rel="stylesheet">" >> index.html
		echo -e "    <link href="style/cover.css" rel="stylesheet">" >> index.html
		echo -e "    <script src="js/ie-emulation-modes-warning.js"></script>" >> index.html
		echo -e "  </head>" >> index.html
		echo -e "  <body>" >> index.html
		echo -e "    <div class="site-wrapper">" >> index.html
		echo -e "      <div class="site-wrapper-inner">" >> index.html
		echo -e "        <div class="cover-container">" >> index.html
		echo -e "          <div class='"masthead clearfix"'>" >> index.html
		echo -e "            <div class="inner">" >> index.html
		echo -e "              <h3 class="masthead-brand">S K Y N E T</h3>" >> index.html
		echo -e "              <nav>" >> index.html
		echo -e "                <ul class='"nav masthead-nav"'>" >> index.html
		echo -e "                  <li class="active"><a href="#">Home</a></li>" >> index.html

		while read ITEMS
			do 
				echo -e "                  <li><a href='"$ITEMS".html'>"$ITEMS"</a></li>" >> index.html
		done <cms.page

		echo -e "                </ul>" >> index.html
		echo -e "              </nav>" >> index.html
		echo -e "            </div>" >> index.html
		echo -e "          </div>" >> index.html
		echo -e "          <div class="inner cover">" >> index.html
		echo -e "            <h1 class="cover-heading">Your Free Community Internet</h1>" >> index.html
		echo -e "            <p class="lead">Skynet is a collection of internet content that can be accessed for free by anyone in the coverered area. Skynet is solar powered.</p>" >> index.html
		echo -e "            <p class="lead">" >> index.html
		echo -e "              <a href="#" class='"btn btn-lg btn-default"'>Learn more</a>" >> index.html
		echo -e "            </p>" >> index.html
		echo -e "          </div>" >> index.html
		echo -e "          <div class="mastfoot">" >> index.html
		echo -e "            <div class="inner">" >> index.html
		echo -e "              <p>&copy; 2016 Skynet</p>" >> index.html
		echo -e "            </div>" >> index.html
		echo -e "          </div>" >> index.html
		echo -e "        </div>" >> index.html
		echo -e "      </div>" >> index.html
		echo -e "    </div>" >> index.html
		echo -e "    <script src='"js/jquery-1.11.3.min"'></script>" >> index.html
		echo -e "    <script>window.jQuery || document.write('<script src='"js/jquery.min.js"'><\/script>')</script>" >> index.html
		echo -e "    <script src='"js/bootstrap.min.js"''></script>" >> index.html
		echo -e "    <script src='"js/ie10-viewport-bug-workaround.js"'></script>" >> index.html
		echo -e "  </body>" >> index.html
		echo -e "</html>" >> index.html

		rm cms.page
