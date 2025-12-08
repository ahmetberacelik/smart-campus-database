-- =============================================
-- Seed: 03 - Students (Öğrenci Detayları)
-- Description: Öğrenci akademik bilgileri
-- =============================================

-- Ali Kaya - Bilgisayar Mühendisliği
INSERT INTO students (user_id, department_id, student_number, enrollment_date, gpa, cgpa)
SELECT u.id, d.id, '20210001', '2021-09-15', 3.45, 3.50
FROM users u, departments d
WHERE u.email = 'ali.kaya@smartcampus.edu.tr' AND d.code = 'CENG';

-- Zeynep Çelik - Bilgisayar Mühendisliği
INSERT INTO students (user_id, department_id, student_number, enrollment_date, gpa, cgpa)
SELECT u.id, d.id, '20210002', '2021-09-15', 3.80, 3.75
FROM users u, departments d
WHERE u.email = 'zeynep.celik@smartcampus.edu.tr' AND d.code = 'CENG';

-- Mehmet Öztürk - Elektrik-Elektronik Mühendisliği
INSERT INTO students (user_id, department_id, student_number, enrollment_date, gpa, cgpa)
SELECT u.id, d.id, '20220001', '2022-09-15', 2.90, 3.00
FROM users u, departments d
WHERE u.email = 'mehmet.ozturk@smartcampus.edu.tr' AND d.code = 'EEE';

-- Fatma Şahin - Makine Mühendisliği
INSERT INTO students (user_id, department_id, student_number, enrollment_date, gpa, cgpa)
SELECT u.id, d.id, '20220002', '2022-09-15', 3.20, 3.15
FROM users u, departments d
WHERE u.email = 'fatma.sahin@smartcampus.edu.tr' AND d.code = 'ME';

-- Emre Arslan - İşletme
INSERT INTO students (user_id, department_id, student_number, enrollment_date, gpa, cgpa)
SELECT u.id, d.id, '20230001', '2023-09-15', 3.60, 3.60
FROM users u, departments d
WHERE u.email = 'emre.arslan@smartcampus.edu.tr' AND d.code = 'BA';

