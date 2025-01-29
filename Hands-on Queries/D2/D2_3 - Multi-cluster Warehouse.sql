/*----------------D2_3 Hands-on----------------
1) Multi-cluster warehouse behaviour
2) Meaning of the MIN[/MAX]_CLUSTER_COUNT option
3) Meaning of the SCALING_POLICY option 
----------------------------------------------*/

-- Set context
USE ROLE SYSADMIN;

CREATE OR REPLACE WAREHOUSE MULTI_CLUSTER_WAREHOUSE_STANDARD_XS 
WAREHOUSE_SIZE = 'XSMALL' 
WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 600 
AUTO_RESUME = TRUE 
MIN_CLUSTER_COUNT = 1 
MAX_CLUSTER_COUNT = 2 
SCALING_POLICY = 'STANDARD';

SHOW WAREHOUSES LIKE 'MULTI%';

-- Set context
USE ROLE ACCOUNTADMIN;

CREATE OR REPLACE USER USER1 password='temp' default_role = SYSADMIN DEFAULT_WAREHOUSE=MULTI_CLUSTER_WAREHOUSE_STANDARD_XS;
GRANT ROLE SYSADMIN TO USER USER1;
CREATE OR REPLACE USER USER2 password='temp' default_role = SYSADMIN DEFAULT_WAREHOUSE=MULTI_CLUSTER_WAREHOUSE_STANDARD_XS;
GRANT ROLE SYSADMIN TO USER USER2;
CREATE OR REPLACE USER USER3 password='temp' default_role = SYSADMIN DEFAULT_WAREHOUSE=MULTI_CLUSTER_WAREHOUSE_STANDARD_XS;
GRANT ROLE SYSADMIN TO USER USER3;

DROP USER USER1;
DROP USER USER2;
DROP USER USER3;

DROP WAREHOUSE MULTI_CLUSTER_WAREHOUSE_STANDARD_XS;