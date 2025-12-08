-- =============================================
-- Smart Campus Database - Initialization Script
-- Description: Tüm tabloları oluşturur (Migration V1-V5)
-- Usage: Docker container başlatıldığında otomatik çalışır
-- =============================================

-- Database ayarları
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- =============================================
-- V1: Departments Table
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

-- =============================================
-- V2: Users Table
-- =============================================
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL UNIQUE COMMENT 'Kullanıcı e-posta adresi (Giriş için)',
    password_hash VARCHAR(255) NOT NULL COMMENT 'BCrypt ile hashlenmiş şifre',
    first_name VARCHAR(50) NOT NULL COMMENT 'Ad',
    last_name VARCHAR(50) NOT NULL COMMENT 'Soyad',
    phone_number VARCHAR(20) NULL COMMENT 'Telefon numarası',
    profile_picture VARCHAR(255) NULL COMMENT 'Profil fotoğrafı dosya yolu/URL',
    role ENUM('STUDENT', 'FACULTY', 'ADMIN') NOT NULL COMMENT 'Kullanıcı rolü',
    is_verified TINYINT(1) DEFAULT 0 COMMENT 'Email doğrulaması yapıldı mı?',
    is_active TINYINT(1) DEFAULT 1 COMMENT 'Hesap aktif mi?',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Kayıt olma tarihi',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Son güncelleme tarihi',
    deleted_at TIMESTAMP NULL COMMENT 'Soft delete zaman damgası',
    
    INDEX idx_users_email (email),
    INDEX idx_users_role (role),
    INDEX idx_users_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V3: Students Table
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

-- =============================================
-- V4: Faculty Table
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

-- =============================================
-- V5: Authentication Tables
-- =============================================

-- Refresh Token Tablosu
CREATE TABLE IF NOT EXISTS refresh_tokens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT 'Token sahibi kullanıcı',
    token VARCHAR(255) NOT NULL UNIQUE COMMENT 'Refresh token string',
    expiry_date TIMESTAMP NOT NULL COMMENT 'Token geçerlilik süresi',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    
    INDEX idx_refresh_tokens_user (user_id),
    INDEX idx_refresh_tokens_expiry (expiry_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Email Doğrulama Tokenları Tablosu
CREATE TABLE IF NOT EXISTS email_verification_tokens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT 'Doğrulanacak kullanıcı',
    token VARCHAR(255) NOT NULL UNIQUE COMMENT 'Doğrulama token',
    expiry_date TIMESTAMP NOT NULL COMMENT 'Geçerlilik süresi (24 saat)',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    
    INDEX idx_email_verification_user (user_id),
    INDEX idx_email_verification_expiry (expiry_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Şifre Sıfırlama Tokenları Tablosu
CREATE TABLE IF NOT EXISTS password_reset_tokens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT 'Şifresini sıfırlayan kullanıcı',
    token VARCHAR(255) NOT NULL UNIQUE COMMENT 'Reset token',
    expiry_date TIMESTAMP NOT NULL COMMENT 'Geçerlilik süresi (15 dakika)',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    
    INDEX idx_password_reset_user (user_id),
    INDEX idx_password_reset_expiry (expiry_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- Initialization Complete
-- =============================================
SELECT 'Smart Campus Database initialized successfully!' AS status;

