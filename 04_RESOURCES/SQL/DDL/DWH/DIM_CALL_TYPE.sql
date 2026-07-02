--------------------------------------------------------------------------------
-- Script: Create DIM_CALL_TYPE Dimension Table
-- Description: Call type dimension table for categorizing types of customer calls
-- Schema: DWH
--------------------------------------------------------------------------------

USE SCHEMA DWH;
--------------------------------------------------------------------------------
-- Create Call Type Dimension Table
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS DWH.DIM_CALL_TYPE 
(
    CALL_TYPE_KEY INTEGER IDENTITY(1,1) NOT NULL COMMENT 'Surrogate key for call type dimension',
    CALL_TYPE_CODE VARCHAR(50) NULL COMMENT 'Business key - unique code for call type',
    CALL_TYPE VARCHAR(255) NULL COMMENT 'Call type name/label (e.g., Support, Sales, Complaint)',
    CALL_TYPE_DESC VARCHAR(255) NULL COMMENT 'Detailed description of call type',
    CALL_TYPE_SORT_ORDER INTEGER NULL COMMENT 'Sort order for displaying call types',
    -- Constraints
    CONSTRAINT UNQ_DIM_CALL_TYPE UNIQUE (CALL_TYPE_CODE),
    CONSTRAINT PK_DIM_CALL_TYPE PRIMARY KEY (CALL_TYPE_KEY)
) COMMENT = 'Call type dimension table for categorizing different types of customer calls';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

