-- Seed: Ders Kayıtları
-- Part 2: Akademik Yönetim
-- Tüm 5 öğrenci CENG101 ve CENG102'ye kayıtlı

INSERT INTO enrollments (student_id, section_id, status) VALUES
-- Öğrenci 1 (Mehmet Demir) - CENG101 ve CENG102
(1, 1, 'ENROLLED'),
(1, 2, 'ENROLLED'),

-- Öğrenci 2 (Zeynep Çelik) - CENG101 ve CENG102
(2, 1, 'ENROLLED'),
(2, 2, 'ENROLLED'),

-- Öğrenci 3 (Ali Öztürk) - CENG101 ve CENG102
(3, 1, 'ENROLLED'),
(3, 2, 'ENROLLED'),

-- Öğrenci 4 (Fatma Şahin) - CENG101 ve CENG102
(4, 1, 'ENROLLED'),
(4, 2, 'ENROLLED'),

-- Öğrenci 5 (Emre Aydın) - CENG101 ve CENG102
(5, 1, 'ENROLLED'),
(5, 2, 'ENROLLED');
