--------------------------------------------------------------------------------
-- Script: Create AUDIO_FILES Extract Table
-- Description: Table for storing raw audio file metadata and content 
--              used in transcription and analytics processes
-- Schema: EXTRACT
--------------------------------------------------------------------------------

USE SCHEMA EXTRACT;

--------------------------------------------------------------------------------
-- Create Agent Dimension Table
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS EXTRACT.AUDIO_FILES
(
    CALL_TRANSCRIPT_ID VARCHAR COMMENT 'Unique identifier for each audio file record',
    FILE_PATH VARCHAR COMMENT 'Path where the audio file is stored',
    AUDIO_FILE FILE COMMENT 'Binary audio file content',
    AUDIO_FILE_URL VARCHAR COMMENT 'External URL reference to the audio file',
    FILE_SIZE NUMBER(38,0) COMMENT 'Size of the audio file in bytes',
    LAST_MODIFIED TIMESTAMP_TZ(3) COMMENT 'Date and time when the file was last modified',
    FILE_EXTENSION VARCHAR COMMENT 'File extension indicating audio format (e.g., wav, mp3)'
)
COMMENT = 'Extract table containing audio files and metadata for transcription and analytics';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

