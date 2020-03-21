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

#echo -e "${BLUE}USE_QUIET_MODE: $1${NC}"
#echo -e "${BLUE}USE_VERBOSE_MODE: $2${NC}"
#echo -e "${BLUE}FOLDER_PATH: $4${NC}"

echo -e "${YELLOW}=========================> REMARK CHECK <=========================${NC}"
find -name \*.md -not -path "./node_modules/*" -exec ./node_modules/.bin/remark {} \;
