-- =============================================
-- Migration: V14 - Create Cafeterias Table
-- Description: Kampüsteki yemekhaneleri tutar
-- Part 3: Meal Service
-- =============================================

CREATE TABLE IF NOT EXISTS cafeterias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT 'Yemekhane adı',
    location VARCHAR(200) COMMENT 'Konum açıklaması',
    capacity INT NOT NULL DEFAULT 200 COMMENT 'Kapasite',
    latitude DECIMAL(10, 8) COMMENT 'GPS enlem',
    longitude DECIMAL(11, 8) COMMENT 'GPS boylam',
    opening_time TIME DEFAULT '07:00:00' COMMENT 'Açılış saati',
    closing_time TIME DEFAULT '21:00:00' COMMENT 'Kapanış saati',
    is_active TINYINT(1) DEFAULT 1 COMMENT 'Aktif mi?',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_cafeteria_active (is_active),
    INDEX idx_cafeteria_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
