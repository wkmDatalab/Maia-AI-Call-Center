--------------------------------------------------------------------------------
-- Script: Create DIM_CALL_PRIORITY Dimension Table
-- Description: Call priority dimension table for categorizing call urgency
-- Schema: DWH
--------------------------------------------------------------------------------
USE SCHEMA DWH;

--------------------------------------------------------------------------------
-- Create Call Priority Dimension Table
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS DWH.DIM_CALL_PRIORITY 
(
    CALL_PRIORITY_KEY INTEGER IDENTITY(1,1) NOT NULL COMMENT 'Surrogate key for call priority dimension',
    CALL_PRIORITY_CODE VARCHAR(50) NULL COMMENT 'Business key - unique code for call priority',
    CALL_PRIORITY VARCHAR(255) NULL COMMENT 'Call priority name/label',
    CALL_PRIORITY_DESC VARCHAR(255) NULL COMMENT 'Detailed description of call priority',
    CALL_PRIORITY_SORT_ORDER INTEGER NULL COMMENT 'Sort order for displaying priorities',
    
    -- Constraints
    CONSTRAINT UNQ_DIM_CALL_PRIORITY UNIQUE (CALL_PRIORITY_CODE),
    CONSTRAINT PK_DIM_CALL_PRIORITY PRIMARY KEY (CALL_PRIORITY_KEY)
) COMMENT = 'Call priority dimension table for categorizing call urgency levels'

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
