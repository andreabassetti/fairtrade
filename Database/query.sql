-- Check data import
select count(*) from fairtrade

-- Create fairtrade_conditions table
CREATE TABLE fairtrade_conditions (
	Response_ID VARCHAR NOT NULL,
	gender_core VARCHAR NOT NULL,
	age_core INT NOT NULL,
	education_level_core VARCHAR NOT NULL,
    worker_type_core VARCHAR NOT NULL,
	understand_contract VARCHAR NOT NULL,
    entity_tenure_total_months INT NOT NULL,
	safety_core VARCHAR NOT NULL,
    accident_last_year VARCHAR NOT NULL,
	covid_safety_measures_core VARCHAR NOT NULL,
	pressure_to_work_core VARCHAR NOT NULL,
    PRIMARY KEY (Response_ID)
);

-- Check data import
select * from fairtrade_conditions

-- Create fairtrade_satisfaction table
CREATE TABLE fairtrade_satisfaction (
	Response_ID VARCHAR NOT NULL,
    workplace_satis_core VARCHAR NOT NULL,
	trust_leadership_core VARCHAR NOT NULL,
	living_wage_tf_core VARCHAR NOT NULL,
    conditions_rate_core VARCHAR NOT NULL,
	return_next_season_core VARCHAR NOT NULL,
	management_complaint_treatment_core VARCHAR NOT NULL,
	leadership_feedback_core VARCHAR NOT NULL,
	factory_recommend_tf_score INT NOT NULL,
    FOREIGN KEY (Response_ID) REFERENCES fairtrade_conditions (Response_ID),
	PRIMARY KEY (Response_ID)
);

-- Check data import
select * from fairtrade_satisfaction

-- Perform an INNER JOIN ON fairtrade_conditions and fairtrade_satisfaction tables
SELECT fairtrade_conditions.gender_core,
	fairtrade_conditions.age_core,
	fairtrade_conditions.education_level_core,
	fairtrade_conditions.worker_type_core,
	fairtrade_conditions.understand_contract,
	fairtrade_conditions.entity_tenure_total_months,
	fairtrade_conditions.safety_core,
	fairtrade_conditions.accident_last_year,
	fairtrade_conditions.covid_safety_measures_core,
	fairtrade_conditions.pressure_to_work_core,
	fairtrade_satisfaction.workplace_satis_core,
	fairtrade_satisfaction.trust_leadership_core,
	fairtrade_satisfaction.living_wage_tf_core,
	fairtrade_satisfaction.conditions_rate_core,
	fairtrade_satisfaction.return_next_season_core,
	fairtrade_satisfaction.management_complaint_treatment_core,
	fairtrade_satisfaction.leadership_feedback_core,
	fairtrade_satisfaction.factory_recommend_tf_score
FROM fairtrade_conditions
INNER JOIN fairtrade_satisfaction
ON fairtrade_conditions.Response_ID = fairtrade_satisfaction.Response_ID;
