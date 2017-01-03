#!/bin/bash
INPUT=$1

# For each town
while IFS=, read townName url
do

	echo "Working On..."
	echo "Town Name : $townName"
	echo "URL : $url"

	# # Make directory
	baseDir=../data/townSites2/$townName/
	mkdir -p $baseDir
	
	linklist="$baseDir$townName-linklist.txt" 
	sortedurls="$baseDir$townName-sortedurls.txt"
	sitemap="$baseDir$townName-sitemap.xml"
	
	# Clear the URL of carridge returns
	url=$(echo $url|tr -d '\r')

	wget --spider --recursive --level=2 --no-verbose --show-progress --wait=0.25 --random-wait=on -c -e robots=off -U mozilla --no-cookies --reject=.rss,.gif,.png,.jpg,.css,.js,.txt --reject-regex='\?' --directory-prefix=$baseDir --output-file=$linklist "$url"
	grep -i URL $linklist | awk -F 'URL:' '{print $2}' | awk '{$1=$1};1' | awk '{print $1}' | sort -u | sed '/^$/d' > $sortedurls
	
	header='<?xml version="1.0" encoding="UTF-8"?><urlset
	      xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
	      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
	            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">' 
	
	echo $header > $sitemap
	while read p; do
	  case "$p" in 
	  */ | *.html | *.htm)
	    echo '<url><loc>'$p'</loc></url>' >> $sitemap
	    ;;  
	  *)
	    ;;
	 esac
	done < $sortedurls
	echo "</urlset>" >> $sitemap

done < "$INPUT"