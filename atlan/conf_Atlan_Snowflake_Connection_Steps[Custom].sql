USE ROLE ACCOUNTADMIN;
set atlan_warehouse_size='XSMALL';
set atlan_warehouse_name='ATLAN_WH';

-- CREATE ROLE IF NOT EXISTS atlan_user_role;
CREATE ROLE IF NOT EXISTS atlan_user_role COMMENT = 'Role for atlan data handling.';


CREATE WAREHOUSE IF NOT EXISTS identifier($atlan_warehouse_name) WAREHOUSE_SIZE=$atlan_warehouse_size INITIALLY_SUSPENDED=TRUE
    AUTO_SUSPEND = 5 AUTO_RESUME = TRUE;
GRANT OPERATE, USAGE ON WAREHOUSE identifier($atlan_warehouse_name) TO ROLE atlan_user_role;




CREATE USER atlan_user password='AtlanUTECJun26$' default_role=atlan_user_role default_warehouse='ATLAN_WH' display_name='ATLAN';

GRANT ROLE atlan_user_role TO USER atlan_user;

set database_atlan='DGCROSS'--identifier($database_atlan)

GRANT USAGE ON DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT USAGE ON ALL SCHEMAS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role; 
GRANT REFERENCES ON ALL TABLES IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role; 
GRANT REFERENCES ON ALL EXTERNAL TABLES IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT REFERENCES ON ALL VIEWS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT REFERENCES ON ALL MATERIALIZED VIEWS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT SELECT ON ALL STREAMS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;

USE ROLE ACCOUNTADMIN;


GRANT IMPORTED PRIVILEGES ON DATABASE snowflake TO ROLE atlan_user_role;

GRANT USAGE ON FUTURE SCHEMAS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT REFERENCES ON FUTURE TABLES IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT REFERENCES ON FUTURE EXTERNAL TABLES IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT REFERENCES ON FUTURE VIEWS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT REFERENCES ON FUTURE MATERIALIZED VIEWS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT SELECT ON FUTURE STREAMS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT MONITOR ON FUTURE PIPES IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;

GRANT USAGE ON DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT USAGE ON ALL SCHEMAS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT SELECT ON ALL TABLES IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT SELECT ON ALL EXTERNAL TABLES IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT SELECT ON ALL VIEWS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT SELECT ON ALL MATERIALIZED VIEWS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT SELECT ON ALL STREAMS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;

GRANT USAGE ON FUTURE SCHEMAS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT SELECT ON FUTURE TABLES IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT SELECT ON FUTURE EXTERNAL TABLES IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT SELECT ON FUTURE VIEWS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT SELECT ON FUTURE MATERIALIZED VIEWS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;
GRANT SELECT ON FUTURE STREAMS IN DATABASE identifier($database_atlan) TO ROLE atlan_user_role;