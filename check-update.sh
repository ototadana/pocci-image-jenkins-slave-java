#!/bin/bash

cd `dirname $0`

LATEST=`curl -s http://www.us.apache.org/dist/maven/maven-3/ |grep "\[DIR\]" |sed -E 's/^.+<a href=.+\/">(.+)\/<\/a> +(....-..-.. ..:..)(.+)/\2 \1/g' |sort -r |head -1 |cut -d" " -f3`
CURRENT=`grep "ENV MVN_VERSION" Dockerfile |cut -d" " -f3`
if [ ${LATEST} != ${CURRENT} ]; then
    echo "MVN_VERSION: ${CURRENT} --> ${LATEST}"
fi
