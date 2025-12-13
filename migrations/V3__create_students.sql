-- =============================================
-- Migration: V3 - Create Students Table
-- Description: Öğrenci rolündeki kullanıcıların akademik bilgilerini tutar
-- =============================================

CREATE TABLE IF NOT EXISTS students (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE COMMENT 'users tablosuna referans',
    department_id BIGINT NOT NULL COMMENT 'departments tablosuna referans',
    student_number VARCHAR(20) NOT NULL UNIQUE COMMENT 'Okul numarası',
    enrollment_date DATE NULL COMMENT 'Kayıt tarihi',
    gpa DECIMAL(3,2) DEFAULT 0.00 COMMENT 'Dönem ortalaması',
    cgpa DECIMAL(3,2) DEFAULT 0.00 COMMENT 'Genel not ortalaması',
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE RESTRICT,
    
    INDEX idx_students_number (student_number),
    INDEX idx_students_department (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


