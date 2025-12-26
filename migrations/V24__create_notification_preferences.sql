-- =============================================
-- V24: Notification Preferences Table (Part 4)
-- Description: Kullanıcı bildirim tercihleri
-- =============================================

CREATE TABLE IF NOT EXISTS notification_preferences (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE COMMENT 'Kullanıcı (her kullanıcı için 1 kayıt)',
    
    -- Email Preferences
    email_academic TINYINT(1) DEFAULT 1,
    email_attendance TINYINT(1) DEFAULT 1,
    email_meal TINYINT(1) DEFAULT 0,
    email_event TINYINT(1) DEFAULT 1,
    email_payment TINYINT(1) DEFAULT 1,
    email_system TINYINT(1) DEFAULT 1,
    
    -- Push Preferences
    push_academic TINYINT(1) DEFAULT 1,
    push_attendance TINYINT(1) DEFAULT 1,
    push_meal TINYINT(1) DEFAULT 1,
    push_event TINYINT(1) DEFAULT 1,
    push_payment TINYINT(1) DEFAULT 1,
    push_system TINYINT(1) DEFAULT 0,
    
    -- SMS Preferences (kritik bildirimler için)
    sms_attendance TINYINT(1) DEFAULT 1,
    sms_payment TINYINT(1) DEFAULT 0,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
