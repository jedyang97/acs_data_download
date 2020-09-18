SET ROLE jianing3;

CREATE SCHEMA IF NOT EXISTS jianing_yang_acs_schema;

DROP TABLE IF EXISTS jianing_yang_acs_schema.jianing_yang_acs_table;

\i create_table.sql


\COPY jianing_yang_acs_schema.jianing_yang_acs_table from 'output.csv' WITH CSV HEADER;