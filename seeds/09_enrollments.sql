-- Seed: Ders Kayıtları
-- Part 2: Akademik Yönetim
-- Tüm 5 öğrenci 2024 FALL dönemindeki derslere kayıtlı

-- 2024 FALL Section ID'leri (08_course_sections.sql'deki sıraya göre):
-- ID 50: CENG101 (course_id=1)
-- ID 51: CENG102 (course_id=2)
-- ID 52: CENG201 (course_id=3)
-- ID 53: CENG202 (course_id=4)
-- ID 54: CENG301 (course_id=5)
-- ID 55: CENG302 (course_id=6)
-- ID 56: CENG401 (course_id=7)
-- ID 57: CENG402 (course_id=8)
-- ID 58: EEE101 (course_id=9)
-- ID 59: EEE201 (course_id=10)
-- ID 60: EEE301 (course_id=11)
-- ID 61: EEE401 (course_id=12)
-- ID 62: ME101 (course_id=13)
-- ID 63: ME201 (course_id=14)
-- ID 64: ME301 (course_id=15)
-- ID 65: ME401 (course_id=16)
-- ID 66: BA101 (course_id=17)
-- ID 67: BA201 (course_id=18)
-- ID 68: BA301 (course_id=19)
-- ID 69: BA401 (course_id=20)

INSERT INTO enrollments (student_id, section_id, status) VALUES
-- Öğrenci 1 (Mehmet Demir) - CENG öğrencisi
(1, 50, 'ENROLLED'),  -- CENG101
(1, 51, 'ENROLLED'),  -- CENG102

-- Öğrenci 2 (Zeynep Çelik) - CENG öğrencisi
(2, 50, 'ENROLLED'),  -- CENG101
(2, 51, 'ENROLLED'),  -- CENG102

-- Öğrenci 3 (Ali Öztürk) - EEE öğrencisi
(3, 58, 'ENROLLED'),  -- EEE101
(3, 59, 'ENROLLED'),  -- EEE201

-- Öğrenci 4 (Fatma Şahin) - ME öğrencisi
(4, 62, 'ENROLLED'),  -- ME101
(4, 63, 'ENROLLED'),  -- ME201

-- Öğrenci 5 (Emre Aydın) - BA öğrencisi
(5, 66, 'ENROLLED'),  -- BA101
(5, 67, 'ENROLLED'); -- BA201
