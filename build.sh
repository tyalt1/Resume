#!/bin/bash

git rm -f *.pdf
make
git add *.pdf
git commit -m "BUILD `date +%b%Y`"
