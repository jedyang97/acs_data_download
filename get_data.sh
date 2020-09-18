#!/bin/bash

python acs_download.py \
  --year 2018 \
  --variables \
    NAME \
    B02001_001E \
    B02001_002E \
    B02001_003E \
    B02001_005E \
    B02001_007E \
    B25119_001E \
    B01001_002E \
    B01001_026E \
    B15001_002E \
    B15001_009E \
    B15001_043E \
    B15001_050E \
  --state PA \
  --geography 'block group' \
  --out_dir .