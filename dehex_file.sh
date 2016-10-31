#!/bin/bash

########################################################################
#
#  Replace all the hex codes in the file to ascii values
#  Example: \x3c  -->  <
#          \x3e  -->  >
#          \x3d  -->  =
#
########################################################################

input_file=$1
path="$(dirname $input_file)"

sed '
s/\\x3c/</g
s/\\x3e/>/g
s/\\x3d/=/g
s/\\x22/"/g
s/\\x26/&/g
s/\\\\/\\/g
s/\\t/	/g
s/\\n/ \
/g' < $input_file | sed "s/\\x27/'/g" > $path/temp.txt

mv $path/temp.txt $input_file
