-- Migration V8: Ders Bölümleri Tablosu
-- Part 2: Akademik Yönetim

CREATE TABLE course_sections (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    course_id BIGINT NOT NULL,
    section_number VARCHAR(10) NOT NULL,
    semester ENUM('FALL', 'SPRING', 'SUMMER') NOT NULL,
    year INT NOT NULL,
    instructor_id BIGINT NOT NULL,
    classroom_id BIGINT NULL COMMENT 'Derslik (GPS koordinatları için)',
    capacity INT NOT NULL DEFAULT 40,
    enrolled_count INT NOT NULL DEFAULT 0,
    schedule_json JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (instructor_id) REFERENCES faculty(id),
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id) ON DELETE SET NULL,
    UNIQUE KEY uk_section (course_id, section_number, semester, year),
    INDEX idx_semester_year (semester, year),
    INDEX idx_instructor (instructor_id),
    INDEX idx_classroom (classroom_id)
);
