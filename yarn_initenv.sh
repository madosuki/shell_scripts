#!/bin/bash
if type "yarn" > /dev/null 2 > & 1 ; then
    yarn global add typescript eslint tslint hexo
else
    echo "Please run 'brew install yarn'"
fi
