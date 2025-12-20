-- =============================================
-- Migration: V16 - Create Wallets Table
-- Description: Kullanıcı cüzdanlarını tutar
-- Part 3: Meal Service (Payment)
-- =============================================

CREATE TABLE IF NOT EXISTS wallets (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE COMMENT 'Kullanıcı referansı',
    balance DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT 'Bakiye (TL)',
    currency VARCHAR(3) DEFAULT 'TRY' COMMENT 'Para birimi',
    is_scholarship TINYINT(1) DEFAULT 0 COMMENT 'Burslu öğrenci mi?',
    daily_scholarship_limit INT DEFAULT 2 COMMENT 'Günlük burs hakkı',
    scholarship_used_today INT DEFAULT 0 COMMENT 'Bugün kullanılan burs hakkı',
    last_scholarship_reset DATE COMMENT 'Son burs sıfırlama tarihi',
    is_active TINYINT(1) DEFAULT 1 COMMENT 'Aktif mi?',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_wallet_user (user_id),
    INDEX idx_wallet_scholarship (is_scholarship),
    INDEX idx_wallet_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
