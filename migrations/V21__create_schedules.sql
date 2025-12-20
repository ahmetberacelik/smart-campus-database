-- =============================================
-- Migration: V21 - Create Schedules Table
-- Description: Ders programlarını tutar
-- Part 3: Course Scheduling
-- =============================================

CREATE TABLE IF NOT EXISTS schedules (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    section_id BIGINT NOT NULL COMMENT 'Ders bölümü referansı',
    day_of_week ENUM('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY') NOT NULL COMMENT 'Gün',
    start_time TIME NOT NULL COMMENT 'Başlangıç saati',
    end_time TIME NOT NULL COMMENT 'Bitiş saati',
    classroom_id BIGINT NOT NULL COMMENT 'Derslik referansı',
    is_active TINYINT(1) DEFAULT 1 COMMENT 'Aktif mi?',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (section_id) REFERENCES course_sections(id) ON DELETE CASCADE,
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id) ON DELETE RESTRICT,
    INDEX idx_schedule_section (section_id),
    INDEX idx_schedule_day (day_of_week),
    INDEX idx_schedule_classroom (classroom_id),
    INDEX idx_schedule_time (start_time, end_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
