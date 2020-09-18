#!/bin/bash

head -n 1000 output.csv | tr [:upper:] [:lower:] | tr ' ' '_' | sed 's/#/num/' | csvsql -i postgresql --db-schema jianing_yang --tables jianing_yang_assignment1 | tee create_table.sql