-- =============================================
-- Migration: V18 - Create Meal Reservations Table
-- Description: Yemek rezervasyonlarını tutar
-- Part 3: Meal Service
-- =============================================

CREATE TABLE IF NOT EXISTS meal_reservations (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT 'Kullanıcı referansı',
    menu_id BIGINT NOT NULL COMMENT 'Menü referansı',
    cafeteria_id BIGINT NOT NULL COMMENT 'Yemekhane referansı',
    reservation_date DATE NOT NULL COMMENT 'Rezervasyon tarihi',
    meal_type ENUM('BREAKFAST', 'LUNCH', 'DINNER') NOT NULL COMMENT 'Öğün tipi',
    amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT 'Ödenen tutar',
    qr_code VARCHAR(100) NOT NULL UNIQUE COMMENT 'Benzersiz QR kod',
    is_scholarship_used TINYINT(1) DEFAULT 0 COMMENT 'Burs kullanıldı mı?',
    status ENUM('RESERVED', 'USED', 'CANCELLED', 'EXPIRED') DEFAULT 'RESERVED' COMMENT 'Rezervasyon durumu',
    used_at TIMESTAMP NULL COMMENT 'Kullanım zamanı',
    cancelled_at TIMESTAMP NULL COMMENT 'İptal zamanı',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (menu_id) REFERENCES meal_menus(id) ON DELETE RESTRICT,
    FOREIGN KEY (cafeteria_id) REFERENCES cafeterias(id) ON DELETE RESTRICT,
    INDEX idx_reservation_user (user_id),
    INDEX idx_reservation_date (reservation_date),
    INDEX idx_reservation_qr (qr_code),
    INDEX idx_reservation_status (status),
    INDEX idx_reservation_menu (menu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
