-- =============================================
-- Smart Campus Database - Seed Script
-- Description: Test verileri ekler
-- Usage: docker exec -i smart_campus_db mysql -u root -p smart_campus < scripts/seed.sql
-- =============================================

-- Database seç
USE smart_campus;

-- =============================================
-- 01: Departments (Bölümler)
-- =============================================
INSERT INTO departments (name, code, faculty_name) VALUES
('Bilgisayar Mühendisliği', 'CENG', 'Mühendislik Fakültesi'),
('Elektrik-Elektronik Mühendisliği', 'EEE', 'Mühendislik Fakültesi'),
('Makine Mühendisliği', 'ME', 'Mühendislik Fakültesi'),
('İşletme', 'BA', 'İktisadi ve İdari Bilimler Fakültesi');

-- =============================================
-- 02: Users (Kullanıcılar)
-- Password: password123 (BCrypt hash)
-- =============================================

-- Admin Kullanıcı
INSERT INTO users (email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active) VALUES
('admin@smartcampus.edu.tr', '$2a$10$EqKcp1WFKVQISheBxkV8qOEb.OMjSPvKnHJPLAl.pL5aNLwzVy5Aq', 'Sistem', 'Admin', '05001234567', 'ADMIN', 1, 1);

-- Öğretim Üyeleri
INSERT INTO users (email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active) VALUES
('ahmet.yilmaz@smartcampus.edu.tr', '$2a$10$EqKcp1WFKVQISheBxkV8qOEb.OMjSPvKnHJPLAl.pL5aNLwzVy5Aq', 'Ahmet', 'Yılmaz', '05321234567', 'FACULTY', 1, 1),
('ayse.demir@smartcampus.edu.tr', '$2a$10$EqKcp1WFKVQISheBxkV8qOEb.OMjSPvKnHJPLAl.pL5aNLwzVy5Aq', 'Ayşe', 'Demir', '05331234567', 'FACULTY', 1, 1);

-- Öğrenciler
INSERT INTO users (email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active) VALUES
('ali.kaya@smartcampus.edu.tr', '$2a$10$EqKcp1WFKVQISheBxkV8qOEb.OMjSPvKnHJPLAl.pL5aNLwzVy5Aq', 'Ali', 'Kaya', '05411234567', 'STUDENT', 1, 1),
('zeynep.celik@smartcampus.edu.tr', '$2a$10$EqKcp1WFKVQISheBxkV8qOEb.OMjSPvKnHJPLAl.pL5aNLwzVy5Aq', 'Zeynep', 'Çelik', '05421234567', 'STUDENT', 1, 1),
('mehmet.ozturk@smartcampus.edu.tr', '$2a$10$EqKcp1WFKVQISheBxkV8qOEb.OMjSPvKnHJPLAl.pL5aNLwzVy5Aq', 'Mehmet', 'Öztürk', '05431234567', 'STUDENT', 1, 1),
('fatma.sahin@smartcampus.edu.tr', '$2a$10$EqKcp1WFKVQISheBxkV8qOEb.OMjSPvKnHJPLAl.pL5aNLwzVy5Aq', 'Fatma', 'Şahin', '05441234567', 'STUDENT', 1, 1),
('emre.arslan@smartcampus.edu.tr', '$2a$10$EqKcp1WFKVQISheBxkV8qOEb.OMjSPvKnHJPLAl.pL5aNLwzVy5Aq', 'Emre', 'Arslan', '05451234567', 'STUDENT', 1, 1);

-- =============================================
-- 03: Students (Öğrenci Detayları)
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

-- =============================================
-- 04: Faculty (Öğretim Üyesi Detayları)
-- =============================================

-- Dr. Ahmet Yılmaz - Bilgisayar Mühendisliği
INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP001', 'Dr. Öğr. Üyesi', 'Mühendislik Fakültesi A-101'
FROM users u, departments d
WHERE u.email = 'ahmet.yilmaz@smartcampus.edu.tr' AND d.code = 'CENG';

-- Prof. Dr. Ayşe Demir - Elektrik-Elektronik Mühendisliği
INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP002', 'Prof. Dr.', 'Mühendislik Fakültesi B-205'
FROM users u, departments d
WHERE u.email = 'ayse.demir@smartcampus.edu.tr' AND d.code = 'EEE';

-- =============================================
-- Seed Complete
-- =============================================
SELECT 'Seed data inserted successfully!' AS status;
SELECT CONCAT('Total Users: ', COUNT(*)) AS info FROM users;
SELECT CONCAT('Total Students: ', COUNT(*)) AS info FROM students;
SELECT CONCAT('Total Faculty: ', COUNT(*)) AS info FROM faculty;
SELECT CONCAT('Total Departments: ', COUNT(*)) AS info FROM departments;

