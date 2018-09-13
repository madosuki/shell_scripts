#!/bin/sh

sudo gem install solargraph
pip install solargraph-utils.py --user
yard gems 
yard config --gem-install-yri 
