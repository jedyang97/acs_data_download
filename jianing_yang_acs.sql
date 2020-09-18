SET ROLE jianing3;

CREATE SCHEMA IF NOT EXISTS jianing_yang_acs_schema;

DROP TABLE IF EXISTS jianing_yang_acs_schema.jianing_yang_acs_table;

CREATE TABLE jianing_yang_acs_schema.jianing_yang_acs_table (
        name VARCHAR NOT NULL,
        b01001_002e DECIMAL NOT NULL,
        state DECIMAL NOT NULL,
        county DECIMAL NOT NULL,
        tract DECIMAL NOT NULL,
        block_group DECIMAL NOT NULL
);


\COPY jianing_yang_acs_schema.jianing_yang_acs_table from 'output.csv' WITH CSV HEADER;