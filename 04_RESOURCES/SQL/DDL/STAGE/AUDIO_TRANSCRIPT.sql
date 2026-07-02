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
CREATE TABLE IF NOT EXISTS STAGE.AUDIO_TRANSCRIPT
(
    CALL_TRANSCRIPT_ID VARCHAR COMMENT 'Unique identifier linking transcription back to source audio file',
    FILE_PATH          VARCHAR COMMENT 'Path where the source audio file is stored',
    AUDIO_FILE_URL     VARCHAR COMMENT 'External URL reference to the source audio file',
    FILE_SIZE          NUMBER(38,0) COMMENT 'Size of the original audio file in bytes',
    LAST_MODIFIED      TIMESTAMP_TZ(3) COMMENT 'Timestamp when the source file was last updated',
    TRANSCRIPT_JSON    VARIANT COMMENT 'Raw transcript output in JSON format',
    DURATION           NUMBER COMMENT 'Length of the audio recording in seconds',
    TRANSCRIPT         TEXT COMMENT 'Plain text transcript generated from audio file',
    TRANSCRIPTION_DATE TIMESTAMP_LTZ COMMENT 'Date and time when the transcription was performed',
    CHARACTER_COUNT    NUMBER COMMENT 'Number of characters in the transcript text',
    WORD_COUNT         NUMBER COMMENT 'Number of words in the transcript text'
)
COMMENT = 'Stage table containing audio transcription results and enriched metadata for analytics';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------