#!/bin/bash

python acs_download.py \
  --year 2018 \
  --variables \
    NAME \
    B01001_002E \
  --state PA \
  --geography 'block group' \
  --out_dir .