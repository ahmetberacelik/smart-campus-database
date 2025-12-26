-- =============================================
-- V23: Notifications Table (Part 4 - Notification System)
-- Description: Kullanıcı bildirimleri tablosu
-- =============================================

CREATE TABLE IF NOT EXISTS notifications (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT 'Bildirim alıcısı',
    type ENUM('INFO', 'WARNING', 'SUCCESS', 'ERROR') NOT NULL DEFAULT 'INFO' COMMENT 'Bildirim tipi',
    category ENUM('ACADEMIC', 'ATTENDANCE', 'MEAL', 'EVENT', 'PAYMENT', 'SYSTEM') NOT NULL COMMENT 'Bildirim kategorisi',
    title VARCHAR(200) NOT NULL COMMENT 'Bildirim başlığı',
    message TEXT NOT NULL COMMENT 'Bildirim içeriği',
    data_json JSON NULL COMMENT 'Ek veri (link, id vb.)',
    is_read TINYINT(1) DEFAULT 0 COMMENT 'Okundu mu?',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_notification_user (user_id),
    INDEX idx_notification_category (category),
    INDEX idx_notification_read (is_read),
    INDEX idx_notification_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
