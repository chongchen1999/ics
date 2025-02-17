#!/usr/bin/env bash

find . -type f -print0 \
| xargs -0 stat -f "%m %N" \
| sort -rn | head -1 | cut -f2- -d" "