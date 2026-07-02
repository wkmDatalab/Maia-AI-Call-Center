--------------------------------------------------------------------------------
-- Script: Create DIM_CALL_SENTIMENT Dimension Table
-- Description: Call sentiment dimension table for categorizing call emotions
-- Schema: DWH
--------------------------------------------------------------------------------

USE SCHEMA DWH;

--------------------------------------------------------------------------------
-- Create Call Sentiment Dimension Table
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS DWH.DIM_CALL_SENTIMENT 
(
    CALL_SENTIMENT_KEY INTEGER IDENTITY(1,1) NOT NULL COMMENT 'Surrogate key for call sentiment dimension',
    CALL_SENTIMENT_CODE VARCHAR(50) NULL COMMENT 'Business key - unique code for call sentiment',
    CALL_SENTIMENT VARCHAR(255) NULL COMMENT 'Call sentiment name/label (e.g., Positive, Negative, Neutral)',
    CALL_SENTIMENT_DESC VARCHAR(255) NULL COMMENT 'Detailed description of call sentiment',
    CALL_SENTIMENT_SORT_ORDER INTEGER NULL COMMENT 'Sort order for displaying sentiments',
    -- Constraints
    CONSTRAINT UNQ_DIM_CALL_SENTIMENT UNIQUE (CALL_SENTIMENT_CODE),
    CONSTRAINT PK_DIM_CALL_SENTIMENT PRIMARY KEY (CALL_SENTIMENT_KEY)
)
COMMENT = 'Call sentiment dimension table for categorizing emotional tone of calls';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
