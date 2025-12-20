-- =============================================
-- Migration: V15 - Create Meal Menus Table
-- Description: Günlük yemek menülerini tutar
-- Part 3: Meal Service
-- =============================================

CREATE TABLE IF NOT EXISTS meal_menus (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cafeteria_id BIGINT NOT NULL COMMENT 'Yemekhane referansı',
    menu_date DATE NOT NULL COMMENT 'Menü tarihi',
    meal_type ENUM('BREAKFAST', 'LUNCH', 'DINNER') NOT NULL COMMENT 'Öğün tipi',
    items_json JSON NOT NULL COMMENT 'Yemek öğeleri listesi',
    nutrition_json JSON COMMENT 'Besin değerleri (kalori, protein, vb.)',
    price DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT 'Ücret (TL)',
    is_vegan TINYINT(1) DEFAULT 0 COMMENT 'Vegan uygun mu?',
    is_vegetarian TINYINT(1) DEFAULT 0 COMMENT 'Vejetaryen uygun mu?',
    is_published TINYINT(1) DEFAULT 0 COMMENT 'Yayınlandı mı?',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (cafeteria_id) REFERENCES cafeterias(id) ON DELETE CASCADE,
    UNIQUE KEY uk_menu (cafeteria_id, menu_date, meal_type),
    INDEX idx_menu_date (menu_date),
    INDEX idx_menu_type (meal_type),
    INDEX idx_menu_published (is_published)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
