-- =============================================
-- Seed: 18 - Event Registrations (Etkinlik Kayıtları)
-- Description: Analytics dashboard için etkinlik kayıt verileri
-- Part 4: Analytics desteği
-- =============================================

-- Events ID'ler: 1-5 (seed'deki etkinlikler)
-- Yazılım Kariyer Günleri (1), React.js Workshop (2), AI Konferansı (3), Bahar Şenliği (4), Futbol Turnuvası (5)
-- User ID'ler: 22-26 (öğrenciler), 2-10 (hocalar)

INSERT INTO event_registrations (event_id, user_id, registration_date, qr_code, checked_in, checked_in_at, status, waitlist_position) VALUES
-- Yazılım Kariyer Günleri (event_id=1) - 8 kayıt
(1, 22, DATE_SUB(NOW(), INTERVAL 3 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(1, 23, DATE_SUB(NOW(), INTERVAL 3 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(1, 24, DATE_SUB(NOW(), INTERVAL 2 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(1, 25, DATE_SUB(NOW(), INTERVAL 2 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(1, 26, DATE_SUB(NOW(), INTERVAL 1 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(1, 2, DATE_SUB(NOW(), INTERVAL 4 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(1, 3, DATE_SUB(NOW(), INTERVAL 4 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(1, 4, DATE_SUB(NOW(), INTERVAL 5 DAY), CONCAT('ER-', UUID()), 0, NULL, 'CANCELLED', NULL),

-- React.js Workshop (event_id=2) - 6 kayıt (ücretli)
(2, 22, DATE_SUB(NOW(), INTERVAL 5 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(2, 23, DATE_SUB(NOW(), INTERVAL 4 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(2, 24, DATE_SUB(NOW(), INTERVAL 3 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(2, 25, DATE_SUB(NOW(), INTERVAL 3 DAY), CONCAT('ER-', UUID()), 0, NULL, 'CANCELLED', NULL),
(2, 2, DATE_SUB(NOW(), INTERVAL 6 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(2, 5, DATE_SUB(NOW(), INTERVAL 2 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),

-- AI Konferansı (event_id=3) - 10 kayıt
(3, 22, DATE_SUB(NOW(), INTERVAL 7 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(3, 23, DATE_SUB(NOW(), INTERVAL 7 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(3, 24, DATE_SUB(NOW(), INTERVAL 6 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(3, 25, DATE_SUB(NOW(), INTERVAL 6 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(3, 26, DATE_SUB(NOW(), INTERVAL 5 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(3, 2, DATE_SUB(NOW(), INTERVAL 8 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(3, 3, DATE_SUB(NOW(), INTERVAL 8 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(3, 4, DATE_SUB(NOW(), INTERVAL 9 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(3, 5, DATE_SUB(NOW(), INTERVAL 9 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(3, 6, DATE_SUB(NOW(), INTERVAL 10 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),

-- Bahar Şenliği (event_id=4) - 5 kayıt
(4, 22, DATE_SUB(NOW(), INTERVAL 2 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(4, 23, DATE_SUB(NOW(), INTERVAL 2 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(4, 24, DATE_SUB(NOW(), INTERVAL 1 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(4, 25, DATE_SUB(NOW(), INTERVAL 1 DAY), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL),
(4, 26, NOW(), CONCAT('ER-', UUID()), 0, NULL, 'REGISTERED', NULL);

-- Update event registered_count
UPDATE events SET registered_count = (SELECT COUNT(*) FROM event_registrations WHERE event_id = 1 AND status = 'REGISTERED') WHERE id = 1;
UPDATE events SET registered_count = (SELECT COUNT(*) FROM event_registrations WHERE event_id = 2 AND status = 'REGISTERED') WHERE id = 2;
UPDATE events SET registered_count = (SELECT COUNT(*) FROM event_registrations WHERE event_id = 3 AND status = 'REGISTERED') WHERE id = 3;
UPDATE events SET registered_count = (SELECT COUNT(*) FROM event_registrations WHERE event_id = 4 AND status = 'REGISTERED') WHERE id = 4;

SELECT CONCAT('Event Registrations inserted: ', (SELECT COUNT(*) FROM event_registrations)) AS info;
