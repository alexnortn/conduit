#!/bin/bash
sitedomain=http://www.middleborough.com/
wget -q --spider --recursive --level=inf --no-verbose --show-progress --wait=0.1 -e robots=off --output-file=linklist.txt $sitedomain