-- =============================================
-- Migration: V17 - Create Transactions Table
-- Description: Mali işlem kayıtlarını tutar
-- Part 3: Meal Service (Payment)
-- =============================================

CREATE TABLE IF NOT EXISTS transactions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    wallet_id BIGINT NOT NULL COMMENT 'Cüzdan referansı',
    type ENUM('CREDIT', 'DEBIT') NOT NULL COMMENT 'CREDIT=para yükleme, DEBIT=harcama',
    amount DECIMAL(10, 2) NOT NULL COMMENT 'İşlem tutarı',
    balance_after DECIMAL(10, 2) NOT NULL COMMENT 'İşlem sonrası bakiye',
    reference_type ENUM('TOPUP', 'MEAL', 'EVENT', 'REFUND') NOT NULL COMMENT 'Referans tipi',
    reference_id BIGINT COMMENT 'İlişkili kayıt ID',
    description VARCHAR(255) COMMENT 'İşlem açıklaması',
    payment_method VARCHAR(50) COMMENT 'Ödeme yöntemi (Stripe, PayTR, vb.)',
    payment_reference VARCHAR(255) COMMENT 'Ödeme gateway referans ID',
    status ENUM('PENDING', 'COMPLETED', 'FAILED', 'CANCELLED') DEFAULT 'COMPLETED' COMMENT 'İşlem durumu',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (wallet_id) REFERENCES wallets(id) ON DELETE CASCADE,
    INDEX idx_transaction_wallet (wallet_id),
    INDEX idx_transaction_type (type),
    INDEX idx_transaction_reference (reference_type, reference_id),
    INDEX idx_transaction_status (status),
    INDEX idx_transaction_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
