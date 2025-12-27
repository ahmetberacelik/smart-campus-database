-- Migration V25: Fix attendance_sessions time columns
-- Fixes: "Data truncation: Incorrect datetime value" error
-- Changes start_time and end_time columns from DATETIME/TIMESTAMP to TIME type

-- Check if columns exist and modify them to TIME type
-- This migration is safe to run multiple times (idempotent)

-- Fix start_time column
ALTER TABLE attendance_sessions 
MODIFY COLUMN start_time TIME NOT NULL COMMENT 'Başlangıç saati';

-- Fix end_time column
ALTER TABLE attendance_sessions 
MODIFY COLUMN end_time TIME NULL COMMENT 'Bitiş saati';

