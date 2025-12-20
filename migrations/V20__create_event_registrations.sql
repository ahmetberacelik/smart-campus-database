-- =============================================
-- Migration: V20 - Create Event Registrations Table
-- Description: Etkinlik kayıtlarını tutar
-- Part 3: Event Management
-- =============================================

CREATE TABLE IF NOT EXISTS event_registrations (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    event_id BIGINT NOT NULL COMMENT 'Etkinlik referansı',
    user_id BIGINT NOT NULL COMMENT 'Kullanıcı referansı',
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Kayıt tarihi',
    qr_code VARCHAR(100) NOT NULL UNIQUE COMMENT 'Giriş QR kodu',
    checked_in TINYINT(1) DEFAULT 0 COMMENT 'Giriş yapıldı mı?',
    checked_in_at TIMESTAMP NULL COMMENT 'Giriş zamanı',
    status ENUM('REGISTERED', 'WAITLIST', 'CANCELLED', 'ATTENDED') DEFAULT 'REGISTERED' COMMENT 'Kayıt durumu',
    waitlist_position INT NULL COMMENT 'Bekleme listesi sırası',
    custom_fields_json JSON COMMENT 'Ek form alanları',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY uk_event_registration (event_id, user_id),
    INDEX idx_registration_qr (qr_code),
    INDEX idx_registration_status (status),
    INDEX idx_registration_user (user_id),
    INDEX idx_registration_waitlist (waitlist_position)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
