#!/usr/bin/env bash

set -eu

NC='\033[0m' # No Color
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'

#USE_QUIET_MODE="$1"
#USE_VERBOSE_MODE="$2"
#CONFIG_FILE="$3"
#FOLDER_PATH="$4"
FILE=error.log

#echo -e "${BLUE}USE_QUIET_MODE: $1${NC}"
#echo -e "${BLUE}USE_VERBOSE_MODE: $2${NC}"
#echo -e "${BLUE}FOLDER_PATH: $4${NC}"

echo -e "${YELLOW}=========================> REMARK CHECK <=========================${NC}"
remark --no-color -q md 2>&1 | tee error.log
if [ -s "$FILE" ]; then
    echo "$FILE exist"
    echo "there was an error"
    #echo "::set-output name=status::There was an issue."
    #echo "::error file=error.log ::Something went wrong"
    echo ::set-output name=status::$(cat error.log)
    echo "::error file=error.log ::Something went wrong"
    #exit 1
else
    echo "great, all good"
    echo ::set-output name=status::'Success'
    #exit 0
fi



#remark --frail md
#find -name \*.md -exec remark --frail {} \;
