-- Migration V9: Ders Kayıtları Tablosu
-- Part 2: Akademik Yönetim

CREATE TABLE enrollments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL,
    section_id BIGINT NOT NULL,
    status ENUM('ENROLLED', 'DROPPED', 'COMPLETED', 'FAILED') NOT NULL DEFAULT 'ENROLLED',
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    midterm_grade DECIMAL(5,2),
    final_grade DECIMAL(5,2),
    homework_grade DECIMAL(5,2),
    letter_grade VARCHAR(2),
    grade_point DECIMAL(3,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (section_id) REFERENCES course_sections(id) ON DELETE CASCADE,
    UNIQUE KEY uk_enrollment (student_id, section_id),
    INDEX idx_student (student_id),
    INDEX idx_section (section_id),
    INDEX idx_status (status)
);
