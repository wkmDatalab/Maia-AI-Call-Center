--------------------------------------------------------------------------------
-- Script: Create FCT_CALL_TRANSCRIPT Fact Table
-- Description: Main fact table for call transcript analytics
-- Schema: DWH
--------------------------------------------------------------------------------

USE SCHEMA DWH;

--------------------------------------------------------------------------------
-- Create Transcript Fact Table
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS DWH.FCT_CALL_TRANSCRIPT 
(
    CALL_TRANSCRIPT_ID VARCHAR(50) NOT NULL COMMENT 'Primary key - unique identifier for each transcript',
    CALL_SUMMARY VARCHAR(1000) NULL COMMENT 'AI-generated summary of the call',
    CALL_TRANSCRIPT VARCHAR(5000) NULL COMMENT 'Full transcript text of the call',
    --------------------------------------------------------------------------------
    --DIMENSIONS
    --------------------------------------------------------------------------------
    AGENT_KEY INTEGER NULL COMMENT 'Foreign key to DIM_AGENT',
    CALL_TYPE_KEY INTEGER NULL COMMENT 'Foreign key to DIM_CALL_TYPE',
    CALL_PRIORITY_KEY INTEGER NULL COMMENT 'Foreign key to DIM_CALL_PRIORITY',
    CALL_STATUS_KEY INTEGER NULL COMMENT 'Foreign key to DIM_CALL_STATUS',
    CALL_SENTIMENT_KEY INTEGER NULL COMMENT 'Foreign key to DIM_CALL_SENTIMENT',
    --------------------------------------------------------------------------------
    --MEASURES
    --------------------------------------------------------------------------------
    CALL_DURATION INTEGER NULL COMMENT 'Call duration in seconds',
    CALL_WORD_COUNT INTEGER NULL COMMENT 'Number of words in transcript',
    CALL_CHARACTER_COUNT INTEGER NULL COMMENT 'Number of characters in transcript',
    CALL_SENTIMENT_SCORE FLOAT NULL COMMENT 'AI-generated sentiment score (typically -1 to +1)',
    --------------------------------------------------------------------------------
    --CONSTRAINTS
    --------------------------------------------------------------------------------
    CONSTRAINT UNQ_FCT_TRANSCRIPT_ID UNIQUE (CALL_TRANSCRIPT_ID),
    CONSTRAINT PK_FCT_TRANSCRIPT PRIMARY KEY (CALL_TRANSCRIPT_ID),
    CONSTRAINT FK_FCT_CALL_TRANSCRIPT_AGENT FOREIGN KEY (AGENT_KEY) REFERENCES DIM_AGENT(AGENT_KEY),
    CONSTRAINT FK_FCT_CALL_TRANSCRIPT_CALL_TYPE FOREIGN KEY (CALL_TYPE_KEY) REFERENCES DIM_CALL_TYPE(CALL_TYPE_KEY),
    CONSTRAINT FK_FCT_CALL_TRANSCRIPT_PRIORITY FOREIGN KEY (CALL_PRIORITY_KEY) REFERENCES DIM_CALL_PRIORITY(CALL_PRIORITY_KEY),
    CONSTRAINT FK_FCT_CALL_TRANSCRIPT_STATUS FOREIGN KEY (CALL_STATUS_KEY) REFERENCES DIM_CALL_STATUS(CALL_STATUS_KEY),
    CONSTRAINT FK_FCT_CALL_TRANSCRIPT_SENTIMENT_CALL_SENTIMENT_KEY FOREIGN KEY (CALL_SENTIMENT_KEY) REFERENCES DIM_CALL_SENTIMENT(CALL_SENTIMENT_KEY)
)
COMMENT = 'Main fact table containing call transcript data and related metrics';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
