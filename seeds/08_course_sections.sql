-- Seed: Ders Bölümleri
-- Part 2: Akademik Yönetim
-- 2024-2025 Güz Dönemi

INSERT INTO course_sections (course_id, section_number, semester, year, instructor_id, capacity, enrolled_count, schedule_json) VALUES
-- CENG101 - Dr. Ahmet Yılmaz (faculty_id = 1)
(1, '01', 'FALL', 2024, 1, 60, 5, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}]}'),

-- CENG102 - Dr. Ahmet Yılmaz (faculty_id = 1)
(2, '01', 'FALL', 2024, 1, 30, 5, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 7}]}'),

-- CENG201 - Prof. Dr. Ayşe Kaya (faculty_id = 2)
(3, '01', 'FALL', 2024, 2, 50, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),

-- CENG301 - Prof. Dr. Ayşe Kaya (faculty_id = 2)
(5, '01', 'FALL', 2024, 2, 40, 0, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),

-- CENG402 - Dr. Ahmet Yılmaz (faculty_id = 1)
(8, '01', 'FALL', 2024, 1, 35, 0, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 7}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 7}]}'),

-- EEE101 - Dr. Ahmet Yılmaz (faculty_id = 1) - Farklı bölüm dersi örneği
(9, '01', 'FALL', 2024, 1, 50, 0, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}]}'),

-- BA101 - Prof. Dr. Ayşe Kaya (faculty_id = 2)
(17, '01', 'FALL', 2024, 2, 100, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 10}]}');
