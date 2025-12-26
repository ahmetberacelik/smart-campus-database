-- =============================================
-- Seed: 16 - Attendance Records (Yoklama Kayıtları)
-- Description: Analytics dashboard için yoklama kayıt verileri
-- Part 4: Analytics desteği
-- =============================================

-- Attendance session ID'leri 1-17 arası olacak (önceki seed'den)
-- Student ID'ler: 1-5 arası

-- CENG101 yoklamaları için kayıtlar (session 1-6, students 1-2)
INSERT INTO attendance_records (session_id, student_id, status, check_in_time, check_in_method, latitude, longitude, distance_from_classroom, gps_accuracy) VALUES
-- Session 1 (21 gün önce)
(1, 1, 'PRESENT', DATE_SUB(NOW(), INTERVAL 21 DAY), 'GPS', 41.10528000, 29.02514000, 2.5, 5.0),
(1, 2, 'PRESENT', DATE_SUB(NOW(), INTERVAL 21 DAY), 'GPS', 41.10527500, 29.02513500, 1.2, 4.5),

-- Session 2 (19 gün önce)
(2, 1, 'PRESENT', DATE_SUB(NOW(), INTERVAL 19 DAY), 'QR_CODE', 41.10528100, 29.02514100, 3.0, 6.0),
(2, 2, 'LATE', DATE_SUB(NOW(), INTERVAL 19 DAY), 'GPS', 41.10527000, 29.02513000, 2.0, 5.0),

-- Session 3 (14 gün önce)
(3, 1, 'PRESENT', DATE_SUB(NOW(), INTERVAL 14 DAY), 'GPS', 41.10527900, 29.02513800, 1.5, 4.0),
(3, 2, 'PRESENT', DATE_SUB(NOW(), INTERVAL 14 DAY), 'GPS', 41.10527600, 29.02513600, 1.8, 4.2),

-- Session 4 (12 gün önce)
(4, 1, 'ABSENT', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, 'PRESENT', DATE_SUB(NOW(), INTERVAL 12 DAY), 'QR_CODE', 41.10527700, 29.02513700, 1.0, 3.5),

-- Session 5 (7 gün önce)
(5, 1, 'PRESENT', DATE_SUB(NOW(), INTERVAL 7 DAY), 'GPS', 41.10527800, 29.02513900, 0.5, 3.0),
(5, 2, 'PRESENT', DATE_SUB(NOW(), INTERVAL 7 DAY), 'GPS', 41.10528200, 29.02514200, 4.0, 6.5),

-- Session 6 (5 gün önce)
(6, 1, 'PRESENT', DATE_SUB(NOW(), INTERVAL 5 DAY), 'GPS', 41.10527750, 29.02513850, 1.0, 4.0),
(6, 2, 'LATE', DATE_SUB(NOW(), INTERVAL 5 DAY), 'GPS', 41.10528000, 29.02514000, 2.5, 5.0),

-- EEE101 yoklamaları (session 12-14, student 3)
(12, 3, 'PRESENT', DATE_SUB(NOW(), INTERVAL 21 DAY), 'GPS', 41.10540200, 29.02530200, 2.0, 5.0),
(13, 3, 'PRESENT', DATE_SUB(NOW(), INTERVAL 14 DAY), 'QR_CODE', 41.10540100, 29.02530100, 1.5, 4.0),
(14, 3, 'ABSENT', NULL, NULL, NULL, NULL, NULL, NULL),

-- ME101 yoklamaları (session 15-17, student 4)
(15, 4, 'PRESENT', DATE_SUB(NOW(), INTERVAL 20 DAY), 'GPS', 41.10530300, 29.02516400, 2.5, 5.5),
(16, 4, 'LATE', DATE_SUB(NOW(), INTERVAL 13 DAY), 'GPS', 41.10530200, 29.02516300, 2.0, 5.0),
(17, 4, 'PRESENT', DATE_SUB(NOW(), INTERVAL 6 DAY), 'GPS', 41.10530100, 29.02516200, 1.0, 4.0);

SELECT CONCAT('Attendance Records inserted: ', ROW_COUNT()) AS info;
