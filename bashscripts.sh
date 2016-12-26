wget --spider --recursive --wait=1 --no-verbose --output-file=wgetlog.txt http://www.middleborough.com/
sed -n "s@.\+ URL:\([^ ]\+\) .\+@\1@p" wgetlog.txt | sed "s@&@\&amp;@" > sedlog.txt