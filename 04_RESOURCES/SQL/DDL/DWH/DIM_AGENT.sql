--------------------------------------------------------------------------------
-- Script: Create DIM_AGENT Dimension Table
-- Description: Agent dimension table for call center analytics
-- Schema: DWH
--------------------------------------------------------------------------------

USE SCHEMA DWH;

--------------------------------------------------------------------------------
-- Create Agent Dimension Table
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS DWH.DIM_AGENT 
(
    AGENT_KEY INTEGER IDENTITY(1,1) NOT NULL COMMENT 'Surrogate key for agent dimension',
    AGENT_CODE VARCHAR(50) NULL COMMENT 'Business key - unique identifier for agent',
    AGENT_NAME VARCHAR(50) NULL COMMENT 'Agent full name',
    -- Constraints
    CONSTRAINT UNQ_DIM_AGENT_AGENT_ID UNIQUE (AGENT_CODE),
    CONSTRAINT PK_DIM_AGENT PRIMARY KEY (AGENT_KEY)
) COMMENT = 'Agent dimension table containing agent information for call center analytics';


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------