-- Fix: attendance_sessions tablosundaki kolon uyumsuzluklarını düzelt
-- Bu script canlı veritabanı için kullanılır (down -v yapmadan)

-- 1. 'date' kolonunu 'session_date' olarak yeniden adlandır
ALTER TABLE attendance_sessions CHANGE COLUMN `date` `session_date` DATE NOT NULL;

-- 2. 'qr_expiry' kolonunu 'qr_code_generated_at' olarak yeniden adlandır
ALTER TABLE attendance_sessions CHANGE COLUMN `qr_expiry` `qr_code_generated_at` TIMESTAMP NULL;

-- 3. 'updated_at' kolonu ekle (yoksa)
ALTER TABLE attendance_sessions ADD COLUMN IF NOT EXISTS `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Index'i güncelle
DROP INDEX idx_section_date ON attendance_sessions;
CREATE INDEX idx_section_date ON attendance_sessions(section_id, session_date);

