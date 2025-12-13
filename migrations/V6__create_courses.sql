-- Migration V6: Dersler Tablosu
-- Part 2: Akademik Yönetim

CREATE TABLE courses (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    credits INT NOT NULL DEFAULT 3,
    ects INT NOT NULL DEFAULT 5,
    department_id BIGINT NOT NULL,
    syllabus_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES departments(id),
    INDEX idx_code (code),
    INDEX idx_department (department_id)
);
