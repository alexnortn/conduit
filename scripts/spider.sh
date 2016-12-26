#!/bin/bash
sitedomain=http://www.middleborough.com/
wget --spider --recursive --level=inf --no-verbose --output-file=linklist.txt $sitedomain
grep -i URL linklist.txt | awk -F 'URL:' '{print $2}' | awk '{$1=$1};1' | awk '{print $1}' | sort -u | sed '/^$/d' > sortedurls.txt
header='<?xml version="1.0" encoding="UTF-8"?><urlset
      xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">' 
echo $header > sitemap.xml
while read p; do
  case "$p" in 
  */ | *.html | *.htm)
    echo '<url><loc>'$p'</loc></url>' >> sitemap.xml
    ;;  
  *)
    ;;
 esac
done < sortedurls.txt
echo "</urlset>" >> sitemap.xml