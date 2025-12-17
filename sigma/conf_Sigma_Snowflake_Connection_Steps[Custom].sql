set sigma_warehouse_size='XSMALL';
-- set sigma_warehouse_name='SIGMA_WH';
set sigma_warehouse_name='SIGMA_WH';
USE ROLE ACCOUNTADMIN;

CREATE ROLE sigma_user_role;
CREATE WAREHOUSE IF NOT EXISTS identifier($sigma_warehouse_name) WAREHOUSE_SIZE=$sigma_warehouse_size INITIALLY_SUSPENDED=TRUE
    AUTO_SUSPEND = 5 AUTO_RESUME = TRUE;
GRANT OPERATE, USAGE ON WAREHOUSE identifier($sigma_warehouse_name) TO ROLE sigma_user_role;


CREATE USER sigma_user password='Sigma26Data!' default_role=sigma_user_role default_warehouse='SIGMA_WH' display_name='SIGMA';

GRANT ROLE sigma_user_role TO USER sigma_user;

--set database_sigma='DGCROSS'--identifier($database_sigma)

set database_sigma='DGCUSTOMER'--identifier($database_sigma);

GRANT USAGE ON DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT USAGE ON ALL SCHEMAS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role; 
GRANT REFERENCES ON ALL TABLES IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role; 
GRANT REFERENCES ON ALL EXTERNAL TABLES IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT REFERENCES ON ALL VIEWS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT REFERENCES ON ALL MATERIALIZED VIEWS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT SELECT ON ALL STREAMS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;

USE ROLE ACCOUNTADMIN;


GRANT IMPORTED PRIVILEGES ON DATABASE snowflake TO ROLE sigma_user_role;

GRANT USAGE ON FUTURE SCHEMAS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT REFERENCES ON FUTURE TABLES IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT REFERENCES ON FUTURE EXTERNAL TABLES IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT REFERENCES ON FUTURE VIEWS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT REFERENCES ON FUTURE MATERIALIZED VIEWS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT SELECT ON FUTURE STREAMS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT MONITOR ON FUTURE PIPES IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;

GRANT USAGE ON DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT USAGE ON ALL SCHEMAS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT SELECT ON ALL TABLES IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT SELECT ON ALL EXTERNAL TABLES IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT SELECT ON ALL VIEWS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT SELECT ON ALL MATERIALIZED VIEWS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT SELECT ON ALL STREAMS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;

GRANT USAGE ON FUTURE SCHEMAS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT SELECT ON FUTURE TABLES IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT SELECT ON FUTURE EXTERNAL TABLES IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT SELECT ON FUTURE VIEWS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT SELECT ON FUTURE MATERIALIZED VIEWS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;
GRANT SELECT ON FUTURE STREAMS IN DATABASE identifier($database_sigma) TO ROLE sigma_user_role;