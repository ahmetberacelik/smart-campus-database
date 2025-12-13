-- Seed: Derslikler
-- Part 2: GPS Yoklama
-- NOT: GPS koordinatları örnek kampüs koordinatlarıdır (İstanbul Teknik Üniversitesi civarı)

INSERT INTO classrooms (building, room_number, capacity, latitude, longitude, features_json) VALUES
-- Mühendislik Fakültesi A Binası
('Mühendislik A', 'A-101', 60, 41.10527800, 29.02513900, '{"hasProjector": true, "hasComputers": false, "hasWhiteboard": true, "type": "LECTURE_HALL"}'),
('Mühendislik A', 'A-102', 40, 41.10530100, 29.02516200, '{"hasProjector": true, "hasComputers": false, "hasWhiteboard": true, "type": "CLASSROOM"}'),
('Mühendislik A', 'A-201', 80, 41.10532400, 29.02518500, '{"hasProjector": true, "hasComputers": false, "hasWhiteboard": true, "type": "LECTURE_HALL"}'),
('Mühendislik A', 'A-202', 35, 41.10534700, 29.02520800, '{"hasProjector": true, "hasComputers": false, "hasWhiteboard": true, "type": "CLASSROOM"}'),

-- Mühendislik Fakültesi B Binası
('Mühendislik B', 'B-101', 50, 41.10540000, 29.02530000, '{"hasProjector": true, "hasComputers": false, "hasWhiteboard": true, "type": "LECTURE_HALL"}'),
('Mühendislik B', 'B-201', 45, 41.10542300, 29.02532300, '{"hasProjector": true, "hasComputers": false, "hasWhiteboard": true, "type": "CLASSROOM"}'),

-- Bilgisayar Laboratuvarları
('Bilgisayar Merkezi', 'LAB-1', 30, 41.10550000, 29.02540000, '{"hasProjector": true, "hasComputers": true, "hasWhiteboard": true, "type": "COMPUTER_LAB"}'),
('Bilgisayar Merkezi', 'LAB-2', 25, 41.10552300, 29.02542300, '{"hasProjector": true, "hasComputers": true, "hasWhiteboard": true, "type": "COMPUTER_LAB"}'),
('Bilgisayar Merkezi', 'LAB-3', 20, 41.10554600, 29.02544600, '{"hasProjector": true, "hasComputers": true, "hasWhiteboard": false, "type": "COMPUTER_LAB"}'),

-- İşletme Fakültesi
('İşletme Binası', 'İŞL-101', 100, 41.10560000, 29.02550000, '{"hasProjector": true, "hasComputers": false, "hasWhiteboard": true, "type": "AUDITORIUM"}'),
('İşletme Binası', 'İŞL-201', 40, 41.10562300, 29.02552300, '{"hasProjector": true, "hasComputers": false, "hasWhiteboard": true, "type": "CLASSROOM"}');
