--------------------------------------------------------------------------------
-- Script: Create LOOKUP Stage Table
-- Description: Table for storing audio transcription results and related metadata
--              generated from EXTRACT.AUDIO_FILES for analytics and reporting
-- Schema: STAGE
--------------------------------------------------------------------------------

USE SCHEMA EXTRACT;

--------------------------------------------------------------------------------
-- Create Audio Transcript Stage Table
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS EXTRACT.LOOKUP 
(
    LOOKUP_FILTER VARCHAR COMMENT 'Category or type of lookup (e.g., CALL_TYPE)',
    LOOKUP_ID NUMBER COMMENT 'Unique identifier for the lookup entry',
    LOOKUP_CODE VARCHAR COMMENT 'Short code representing the lookup value',
    LOOKUP_LOWER_BOUND FLOAT COMMENT 'Lower boundary value for numeric ranges if applicable',
    LOOKUP_UPPER_BOUND FLOAT COMMENT 'Upper boundary value for numeric ranges if applicable',
    LOOKUP_SHORT_NAME VARCHAR COMMENT 'Brief display name for the lookup value',
    LOOKUP_LONG_NAME VARCHAR COMMENT 'Full display name for the lookup value',
    LOOKUP_DESC VARCHAR COMMENT 'Detailed description of the lookup value',
    LOOKUP_SORT_ORDER NUMBER COMMENT 'Sorting order for display purposes'
) COMMENT = 'Reference table containing lookup values and their descriptions for various categories used in the call center analytics system';


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------