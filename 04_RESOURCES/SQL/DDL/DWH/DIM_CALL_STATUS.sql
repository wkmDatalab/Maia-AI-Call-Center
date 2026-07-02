--------------------------------------------------------------------------------
-- Script: Create DIM_CALL_STATUS Dimension Table
-- Description: Call status dimension table for tracking call resolution states
-- Schema: DWH
--------------------------------------------------------------------------------

USE SCHEMA DWH;

--------------------------------------------------------------------------------
-- Create Call Status Dimension Table
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS DWH.DIM_CALL_STATUS
(
    CALL_STATUS_KEY INTEGER IDENTITY(1,1) NOT NULL COMMENT 'Surrogate key for call status dimension',
    CALL_STATUS_CODE VARCHAR(50) NULL COMMENT 'Business key - unique code for call status',
    CALL_STATUS VARCHAR(255) NULL COMMENT 'Call status name/label (e.g., Resolved, Escalated, Pending)',
    CALL_STATUS_DESC VARCHAR(255) NULL COMMENT 'Detailed description of call status',
    CALL_STATUS_SORT_ORDER INTEGER NULL COMMENT 'Sort order for displaying statuses',   
    -- Constraints
    CONSTRAINT UNQ_DIM_CALL_STATUS UNIQUE (CALL_STATUS_CODE),
    CONSTRAINT PK_DIM_CALL_STATUS PRIMARY KEY (CALL_STATUS_KEY)
)
COMMENT = 'Call status dimension table for tracking call resolution and completion states';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

