-- =============================================
-- Migration: V2 - Create Users Table
-- Description: Tüm kullanıcıların temel kimlik bilgilerini tutar
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


