CREATE TABLE jianing_yang_acs_schema.jianing_yang_acs_table (
	name VARCHAR NOT NULL, 
	"estimate!!total" DECIMAL NOT NULL, 
	"estimate!!total!!white_alone" DECIMAL NOT NULL, 
	"estimate!!total!!black_or_african_american_alone" DECIMAL NOT NULL, 
	"estimate!!total!!asian_alone" DECIMAL NOT NULL, 
	"estimate!!total!!some_other_race_alone" DECIMAL NOT NULL, 
	"estimate!!median_household_income_in_the_past_12_months_(in_2018_inflation-adjusted_dollars)_--!!total" BOOLEAN, 
	"estimate!!total!!male" DECIMAL NOT NULL, 
	"estimate!!total!!female" DECIMAL NOT NULL, 
	"estimate!!total!!male_2" BOOLEAN, 
	"estimate!!total!!male!!18_to_24_years!!bachelor's_degree" BOOLEAN, 
	"estimate!!total!!female_2" BOOLEAN, 
	"estimate!!total!!female!!18_to_24_years!!bachelor's_degree" BOOLEAN, 
	state DECIMAL NOT NULL, 
	county DECIMAL NOT NULL, 
	tract DECIMAL NOT NULL, 
	block_group DECIMAL NOT NULL
);
