-- =============================================
-- Migration: V4 - Create Faculty Table
-- Description: Öğretim üyelerinin bilgilerini tutar
-- =============================================

CREATE TABLE IF NOT EXISTS faculty (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE COMMENT 'users tablosuna referans',
    department_id BIGINT NOT NULL COMMENT 'departments tablosuna referans',
    employee_number VARCHAR(20) NOT NULL UNIQUE COMMENT 'Sicil numarası',
    title VARCHAR(50) NOT NULL COMMENT 'Unvan (Dr., Prof., Arş. Gör. vb.)',
    office_location VARCHAR(100) NULL COMMENT 'Ofis konumu',
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE RESTRICT,
    
    INDEX idx_faculty_employee_number (employee_number),
    INDEX idx_faculty_department (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

