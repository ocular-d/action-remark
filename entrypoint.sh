#!/usr/bin/env bash

set -eu

# Vars
NC='\033[0m' # No Color
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'

FILE=error.log

echo -e "${YELLOW}=========================> REMARK CHECK <=========================${NC}"
remark --no-color -q 2>&1 | tee error.log
if [ -s "$FILE" ]; then
    echo -e "${RED}Ooh, there was an error${NC}"
    echo ::set-output name=exit_code::1
else
    echo -e "${GREEN}Great, all good${NC}"
    echo ::set-output name=status::'Success'
fi
