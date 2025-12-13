-- =============================================
-- Migration: V1 - Create Departments Table
-- Description: Üniversitedeki akademik bölümleri tutar
-- =============================================

CREATE TABLE IF NOT EXISTS departments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT 'Bölüm adı',
    code VARCHAR(10) NOT NULL UNIQUE COMMENT 'Bölüm kodu (Örn: CENG)',
    faculty_name VARCHAR(100) NOT NULL COMMENT 'Bağlı olduğu fakülte adı',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_department_code (code),
    INDEX idx_department_faculty (faculty_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


