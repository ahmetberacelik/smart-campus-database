-- =============================================
-- Seed: 17 - Meal Reservations (Yemek Rezervasyonları)
-- Description: Analytics dashboard için yemek rezervasyon verileri
-- Part 4: Analytics desteği
-- =============================================

-- Öğrenciler ve bazı personel için yemek rezervasyonları
-- User ID'ler: 22-26 (öğrenciler), 2-5 (hocalar)
-- Menu ID'ler: 1-5 (seed'deki menüler)
-- Cafeteria ID'ler: 1-2

INSERT INTO meal_reservations (user_id, menu_id, cafeteria_id, reservation_date, meal_type, amount, qr_code, is_scholarship_used, status, used_at) VALUES
-- Bugünkü rezervasyonlar
(22, 1, 1, CURDATE(), 'LUNCH', 25.00, CONCAT('MR-', UUID()), 0, 'RESERVED', NULL),
(23, 1, 1, CURDATE(), 'LUNCH', 25.00, CONCAT('MR-', UUID()), 1, 'USED', NOW()),
(24, 1, 1, CURDATE(), 'LUNCH', 25.00, CONCAT('MR-', UUID()), 0, 'USED', NOW()),
(25, 5, 2, CURDATE(), 'LUNCH', 22.00, CONCAT('MR-', UUID()), 0, 'RESERVED', NULL),
(2, 2, 1, CURDATE(), 'DINNER', 25.00, CONCAT('MR-', UUID()), 0, 'RESERVED', NULL),

-- Dünkü rezervasyonlar
(22, 1, 1, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'LUNCH', 25.00, CONCAT('MR-', UUID()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 1 DAY)),
(23, 1, 1, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'LUNCH', 25.00, CONCAT('MR-', UUID()), 1, 'USED', DATE_SUB(NOW(), INTERVAL 1 DAY)),
(24, 1, 1, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'LUNCH', 25.00, CONCAT('MR-', UUID()), 0, 'CANCELLED', NULL),
(3, 2, 1, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'DINNER', 25.00, CONCAT('MR-', UUID()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 1 DAY)),

-- Geçmiş hafta rezervasyonları
(22, 1, 1, DATE_SUB(CURDATE(), INTERVAL 3 DAY), 'LUNCH', 25.00, CONCAT('MR-', UUID()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 3 DAY)),
(22, 2, 1, DATE_SUB(CURDATE(), INTERVAL 3 DAY), 'DINNER', 25.00, CONCAT('MR-', UUID()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 3 DAY)),
(23, 1, 1, DATE_SUB(CURDATE(), INTERVAL 4 DAY), 'LUNCH', 25.00, CONCAT('MR-', UUID()), 1, 'USED', DATE_SUB(NOW(), INTERVAL 4 DAY)),
(24, 5, 2, DATE_SUB(CURDATE(), INTERVAL 5 DAY), 'LUNCH', 22.00, CONCAT('MR-', UUID()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 5 DAY)),
(25, 1, 1, DATE_SUB(CURDATE(), INTERVAL 5 DAY), 'LUNCH', 25.00, CONCAT('MR-', UUID()), 1, 'USED', DATE_SUB(NOW(), INTERVAL 5 DAY)),
(26, 1, 1, DATE_SUB(CURDATE(), INTERVAL 6 DAY), 'LUNCH', 25.00, CONCAT('MR-', UUID()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 6 DAY)),
(22, 1, 1, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 'LUNCH', 25.00, CONCAT('MR-', UUID()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 7 DAY)),
(23, 2, 1, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 'DINNER', 25.00, CONCAT('MR-', UUID()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 7 DAY)),

-- Yarınki rezervasyonlar
(22, 3, 1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'LUNCH', 28.00, CONCAT('MR-', UUID()), 0, 'RESERVED', NULL),
(23, 3, 1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'LUNCH', 28.00, CONCAT('MR-', UUID()), 1, 'RESERVED', NULL),
(24, 4, 1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'DINNER', 22.00, CONCAT('MR-', UUID()), 0, 'RESERVED', NULL);

SELECT CONCAT('Meal Reservations inserted: ', ROW_COUNT()) AS info;
