-- =============================================
-- Migration: V5 - Create Authentication Tables
-- Description: JWT token yönetimi, email doğrulama ve şifre sıfırlama tabloları
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

