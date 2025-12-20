-- =============================================
-- Migration: V19 - Create Events Table
-- Description: Kampüs etkinliklerini tutar
-- Part 3: Event Management
-- =============================================

CREATE TABLE IF NOT EXISTS events (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL COMMENT 'Etkinlik başlığı',
    description TEXT COMMENT 'Etkinlik açıklaması',
    category ENUM('CONFERENCE', 'WORKSHOP', 'SEMINAR', 'SOCIAL', 'SPORTS', 'CULTURAL', 'CAREER') NOT NULL COMMENT 'Kategori',
    event_date DATE NOT NULL COMMENT 'Etkinlik tarihi',
    start_time TIME NOT NULL COMMENT 'Başlangıç saati',
    end_time TIME COMMENT 'Bitiş saati',
    location VARCHAR(200) NOT NULL COMMENT 'Konum',
    capacity INT NOT NULL DEFAULT 100 COMMENT 'Kapasite',
    registered_count INT NOT NULL DEFAULT 0 COMMENT 'Kayıtlı kişi sayısı',
    registration_deadline TIMESTAMP NULL COMMENT 'Kayıt son tarihi',
    is_paid TINYINT(1) DEFAULT 0 COMMENT 'Ücretli mi?',
    price DECIMAL(10, 2) DEFAULT 0.00 COMMENT 'Ücret (TL)',
    organizer_id BIGINT NOT NULL COMMENT 'Organizatör kullanıcı',
    image_url VARCHAR(255) COMMENT 'Etkinlik görseli',
    status ENUM('DRAFT', 'PUBLISHED', 'CANCELLED', 'COMPLETED') DEFAULT 'DRAFT' COMMENT 'Durum',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (organizer_id) REFERENCES users(id) ON DELETE RESTRICT,
    INDEX idx_event_date (event_date),
    INDEX idx_event_category (category),
    INDEX idx_event_status (status),
    INDEX idx_event_organizer (organizer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
