--------------------------------------------------------------------------------
-- Script: Create AUDIO_TRANSCRIPT Stage Table
-- Description: Table for storing audio transcription results and related metadata
--              generated from EXTRACT.AUDIO_FILES for analytics and reporting
-- Schema: STAGE
--------------------------------------------------------------------------------

USE SCHEMA STAGE;

--------------------------------------------------------------------------------
-- Create Audio Transcript Stage Table
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS STAGE.AUDIO_TRANSCRIPT_ANALYSIS
(
    CALL_TRANSCRIPT_ID VARCHAR COMMENT 'Unique identifier linking transcription back to source audio file',
    CALL_SUMMARY VARCHAR(1000) NULL COMMENT 'AI-generated summary of the call',
    CALL_TRANSCRIPT VARCHAR(5000) NULL COMMENT 'Full transcript text of the call',
    CALL_DATE DATE NULL COMMENT 'Date when the call occurred',
    AGENT_CODE VARCHAR(50) NULL COMMENT 'Initials identifying the call center agent',
    AGENT_NAME VARCHAR(50) NULL COMMENT 'Name identifying the call center agent',
    CALL_TYPE_CODE VARCHAR(50) NULL COMMENT 'Code indicating the type of call',
    CALL_SENTIMENT_CODE VARCHAR(50) NULL COMMENT 'Overall sentiment score for the call',
    CALL_PRIORITY_CODE VARCHAR(50) NULL COMMENT 'Code indicating call priority level',
    CALL_STATUS_CODE VARCHAR(50) NULL COMMENT 'Code indicating the final status of the call',
    CALL_DURATION NUMBER NULL COMMENT 'Length of the audio recording in seconds',
    CALL_CHARACTER_COUNT NUMBER NULL COMMENT 'Number of characters in the transcript text',
    CALL_WORD_COUNT NUMBER NULL COMMENT 'Number of words in the transcript text',
    CALL_SENTIMENT_SCORE FLOAT NULL COMMENT 'Overall sentiment score for the call'
)
COMMENT = 'Stage table containing audio transcription results and enriched metadata for analytics';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------