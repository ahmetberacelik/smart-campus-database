-- =============================================
-- Smart Campus Database - Seed Script
-- Description: Test verileri ekler (Part 1 + Part 2)
-- Usage: docker exec -i smart_campus_db mysql -u root -p smart_campus < scripts/seed.sql
-- =============================================

-- Database seç
USE smart_campus;

-- UTF-8 karakter kodlaması ayarla
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
SET collation_connection = 'utf8mb4_unicode_ci';

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
-- 05: Courses (Dersler) - Part 2
-- =============================================
INSERT INTO courses (code, name, description, credits, ects, department_id) VALUES
-- Bilgisayar Mühendisliği Dersleri (department_id = 1)
('CENG101', 'Programlamaya Giriş', 'Temel programlama kavramları ve algoritma geliştirme', 4, 6, 1),
('CENG102', 'Programlama Lab', 'Programlama uygulamaları laboratuvarı', 2, 3, 1),
('CENG201', 'Veri Yapıları', 'Temel veri yapıları ve algoritmalar', 4, 6, 1),
('CENG202', 'Nesne Yönelimli Programlama', 'OOP prensipleri ve Java/C++ uygulamaları', 3, 5, 1),
('CENG301', 'Veritabanı Sistemleri', 'İlişkisel veritabanları ve SQL', 3, 5, 1),
('CENG302', 'İşletim Sistemleri', 'İşletim sistemi kavramları ve yönetimi', 3, 5, 1),
('CENG401', 'Yazılım Mühendisliği', 'Yazılım geliştirme süreçleri ve metodolojileri', 3, 5, 1),
('CENG402', 'Web Programlama', 'Modern web teknolojileri ve uygulama geliştirme', 3, 5, 1),

-- Elektrik-Elektronik Mühendisliği Dersleri (department_id = 2)
('EEE101', 'Devre Analizi', 'Temel elektrik devre analizi', 4, 6, 2),
('EEE201', 'Elektronik I', 'Analog elektronik devreleri', 3, 5, 2),
('EEE301', 'Sinyal ve Sistemler', 'Sürekli ve ayrık zamanlı sinyaller', 3, 5, 2),
('EEE401', 'Haberleşme Sistemleri', 'Analog ve dijital haberleşme', 3, 5, 2),

-- Makine Mühendisliği Dersleri (department_id = 3)
('ME101', 'Statik', 'Mühendislik mekaniği temelleri', 3, 5, 3),
('ME201', 'Dinamik', 'Hareket ve kuvvet analizi', 3, 5, 3),
('ME301', 'Termodinamik', 'Enerji dönüşüm prensipleri', 3, 5, 3),
('ME401', 'Makine Tasarımı', 'Mekanik sistem tasarımı', 3, 5, 3),

-- İşletme Dersleri (department_id = 4)
('BA101', 'İşletmeye Giriş', 'Temel işletme kavramları', 3, 5, 4),
('BA201', 'Muhasebe Prensipleri', 'Finansal muhasebe temelleri', 3, 5, 4),
('BA301', 'Pazarlama Yönetimi', 'Pazarlama stratejileri ve uygulamaları', 3, 5, 4),
('BA401', 'Stratejik Yönetim', 'Kurumsal strateji geliştirme', 3, 5, 4);

-- =============================================
-- 06: Course Prerequisites (Ön Koşul Dersleri) - Part 2
-- =============================================
INSERT INTO course_prerequisites (course_id, prerequisite_id) VALUES
-- CENG201 (Veri Yapıları) için CENG101 (Programlamaya Giriş) önkoşul
(3, 1),
-- CENG202 (OOP) için CENG101 önkoşul
(4, 1),
-- CENG301 (Veritabanı) için CENG201 önkoşul
(5, 3),
-- CENG302 (İşletim Sistemleri) için CENG201 önkoşul
(6, 3),
-- CENG401 (Yazılım Müh.) için CENG202 ve CENG301 önkoşul
(7, 4),
(7, 5),
-- CENG402 (Web Programlama) için CENG301 önkoşul
(8, 5),

-- EEE201 için EEE101 önkoşul
(10, 9),
-- EEE301 için EEE201 önkoşul
(11, 10),
-- EEE401 için EEE301 önkoşul
(12, 11),

-- ME201 için ME101 önkoşul
(14, 13),
-- ME301 için ME201 önkoşul
(15, 14),
-- ME401 için ME301 önkoşul
(16, 15),

-- BA201 için BA101 önkoşul
(18, 17),
-- BA301 için BA201 önkoşul
(19, 18),
-- BA401 için BA301 önkoşul
(20, 19);

-- =============================================
-- 07: Classrooms (Derslikler) - Part 2
-- GPS koordinatları örnek kampüs koordinatlarıdır
-- =============================================
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

-- =============================================
-- 08: Course Sections (Ders Bölümleri) - Part 2
-- 2024-2025 Güz Dönemi
-- =============================================
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
(17, '01', 'FALL', 2024, 2, 100, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 10}]}' );

-- =============================================
-- 09: Enrollments (Ders Kayıtları) - Part 2
-- Tüm 5 öğrenci CENG101 ve CENG102'ye kayıtlı
-- =============================================
INSERT INTO enrollments (student_id, section_id, status) VALUES
-- Öğrenci 1 (Ali Kaya) - CENG101 ve CENG102
(1, 1, 'ENROLLED'),
(1, 2, 'ENROLLED'),

-- Öğrenci 2 (Zeynep Çelik) - CENG101 ve CENG102
(2, 1, 'ENROLLED'),
(2, 2, 'ENROLLED'),

-- Öğrenci 3 (Mehmet Öztürk) - CENG101 ve CENG102
(3, 1, 'ENROLLED'),
(3, 2, 'ENROLLED'),

-- Öğrenci 4 (Fatma Şahin) - CENG101 ve CENG102
(4, 1, 'ENROLLED'),
(4, 2, 'ENROLLED'),

-- Öğrenci 5 (Emre Arslan) - CENG101 ve CENG102
(5, 1, 'ENROLLED'),
(5, 2, 'ENROLLED');

-- =============================================
-- Seed Complete
-- =============================================
SELECT 'Seed data inserted successfully! (Part 1 + Part 2)' AS status;
SELECT CONCAT('Total Users: ', COUNT(*)) AS info FROM users;
SELECT CONCAT('Total Students: ', COUNT(*)) AS info FROM students;
SELECT CONCAT('Total Faculty: ', COUNT(*)) AS info FROM faculty;
SELECT CONCAT('Total Departments: ', COUNT(*)) AS info FROM departments;
SELECT CONCAT('Total Courses: ', COUNT(*)) AS info FROM courses;
SELECT CONCAT('Total Course Sections: ', COUNT(*)) AS info FROM course_sections;
SELECT CONCAT('Total Classrooms: ', COUNT(*)) AS info FROM classrooms;
SELECT CONCAT('Total Enrollments: ', COUNT(*)) AS info FROM enrollments;