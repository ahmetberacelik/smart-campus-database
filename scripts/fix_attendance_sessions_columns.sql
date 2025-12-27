-- Fix: attendance_sessions tablosundaki kolon uyumsuzluklarını düzelt
-- Bu script canlı veritabanı için kullanılır (down -v yapmadan)

-- 1. 'date' kolonunu 'session_date' olarak yeniden adlandır
ALTER TABLE attendance_sessions CHANGE COLUMN `date` `session_date` DATE NOT NULL;

-- 2. 'qr_expiry' kolonunu 'qr_code_generated_at' olarak yeniden adlandır
ALTER TABLE attendance_sessions CHANGE COLUMN `qr_expiry` `qr_code_generated_at` TIMESTAMP NULL;

-- 3. 'updated_at' kolonu ekle (yoksa)
ALTER TABLE attendance_sessions ADD COLUMN IF NOT EXISTS `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 4. start_time ve end_time kolonlarını TIME tipine çevir (DATETIME/TIMESTAMP ise)
-- Bu, "Data truncation: Incorrect datetime value" hatasını düzeltir
ALTER TABLE attendance_sessions 
MODIFY COLUMN start_time TIME NOT NULL COMMENT 'Başlangıç saati',
MODIFY COLUMN end_time TIME NULL COMMENT 'Bitiş saati';

-- Index'i güncelle
DROP INDEX IF EXISTS idx_section_date ON attendance_sessions;
CREATE INDEX idx_section_date ON attendance_sessions(section_id, session_date);

