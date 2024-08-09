# 
# Write a shell script finder-app/writer.sh as described below
#
# - Accepts the following arguments: the first argument is a full path to a file (including filename) on the
#    filesystem, referred to below as writefile; the second argument is a text string which will be written
#    within this file, referred to below as writestr
# - Exits with value 1 error and print statements if any of the arguments above were not specified
# - Creates a new file with name and path writefile with content writestr, overwriting any existing file and
#    creating the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.
# Example:
#       writer.sh /tmp/aesd/assignment1/sample.txt ios
#
# Creates file:
#    /tmp/aesd/assignment1/sample.txt
#
#            With content:
#            ios

#!/bin/sh

# Full path to a file (including filename) on the filesystem
writefile=$1
# Text string which will be written within this file
writestr=$2

# Check if the number of parameters passed is less than 2 or greater than 2
if [ $# -lt 2 ] || [ $# -gt 2 ]
then
    echo "Wrong number of parameters passed. Expected 2 parameters, received $# parameter(s)"
    exit 1
fi

# Check if the first parameter is empty
if [ -z "$writefile" ]
then
    echo "The first parameter is empty"
    exit 1
fi

# Check if the second parameter is empty
if [ -z "$writestr" ]
then
    echo "The second parameter is empty"
    exit 1
fi

# Ensure the directory exists
mkdir -p "$(dirname "$writefile")"

# Check if the directory could not be created
if [ $? -ne 0 ]
then
    echo "The directory could not be created"
    exit 1
fi

echo "$writestr" > "$writefile"

# Check if the file could not be created
if [ $? -ne 0 ]
then
    echo "The file could not be created"
    exit 1
fi

# Exit with value 0
exit 0
