#!/bin/bash

#Declerations

#sets the current dir path
curdir=$(pwd)

#Set the default include-dir to none
INCLUDEDIR=""
#checks for the include dir 
INCLUDE_TAR="/usr/local/include/lynis /usr/local/lynis/include /usr/share/lynis/include ./include"

for i in ${$INCLUDE_TAR}; do
if $i

