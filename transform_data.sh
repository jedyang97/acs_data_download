#!/bin/bash

head -n 1000 output.csv | tr [:upper:] [:lower:] | tr ' ' '_' | sed 's/#/num/' | csvsql -i postgresql --db-schema jianing_yang_acs_schema --tables jianing_yang_acs_table | tee create_table.sql