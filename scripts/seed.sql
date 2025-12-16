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
-- Çoklu Yıl ve Dönem Verileri (2021-2024)
-- =============================================
INSERT INTO course_sections (course_id, section_number, semester, year, instructor_id, classroom_id, capacity, enrolled_count, schedule_json) VALUES

-- =============================================
-- 2021-2022 AKADEMİK YILI
-- =============================================

-- 2021 FALL (Güz Dönemi)
(1, '01', 'FALL', 2021, 1, 1, 60, 58, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}]}'),
(1, '02', 'FALL', 2021, 2, 3, 60, 55, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}]}'),
(2, '01', 'FALL', 2021, 1, 7, 30, 30, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 7}]}'),
(2, '02', 'FALL', 2021, 1, 8, 25, 25, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 8}]}'),
(9, '01', 'FALL', 2021, 2, 5, 50, 48, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}]}'),
(13, '01', 'FALL', 2021, 1, 3, 45, 42, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}]}'),
(17, '01', 'FALL', 2021, 2, 10, 100, 95, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 10}]}'),

-- 2022 SPRING (Bahar Dönemi)
(3, '01', 'SPRING', 2022, 1, 5, 50, 48, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
(3, '02', 'SPRING', 2022, 2, 6, 45, 40, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 6}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 6}]}'),
(4, '01', 'SPRING', 2022, 1, 7, 40, 38, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}]}'),
(10, '01', 'SPRING', 2022, 2, 3, 45, 42, '{"slots": [{"day": "TUESDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}]}'),
(14, '01', 'SPRING', 2022, 1, 4, 40, 38, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 4}]}'),
(18, '01', 'SPRING', 2022, 2, 10, 80, 75, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 10}]}'),

-- 2022 SUMMER (Yaz Dönemi)
(1, '01', 'SUMMER', 2022, 1, 2, 30, 28, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "12:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "09:00", "end": "12:50", "classroom_id": 2}]}'),
(3, '01', 'SUMMER', 2022, 2, 4, 25, 22, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "12:50", "classroom_id": 4}, {"day": "THURSDAY", "start": "09:00", "end": "12:50", "classroom_id": 4}]}'),

-- =============================================
-- 2022-2023 AKADEMİK YILI
-- =============================================

-- 2022 FALL (Güz Dönemi)
(1, '01', 'FALL', 2022, 1, 1, 60, 60, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}]}'),
(1, '02', 'FALL', 2022, 2, 3, 60, 57, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}]}'),
(2, '01', 'FALL', 2022, 1, 7, 30, 30, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 7}]}'),
(5, '01', 'FALL', 2022, 2, 2, 40, 38, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(6, '01', 'FALL', 2022, 1, 4, 40, 35, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}]}'),
(9, '01', 'FALL', 2022, 2, 5, 50, 50, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}]}'),
(11, '01', 'FALL', 2022, 2, 6, 35, 32, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 6}]}'),
(13, '01', 'FALL', 2022, 1, 3, 45, 44, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}]}'),
(15, '01', 'FALL', 2022, 1, 4, 35, 33, '{"slots": [{"day": "MONDAY", "start": "15:00", "end": "16:50", "classroom_id": 4}, {"day": "WEDNESDAY", "start": "15:00", "end": "16:50", "classroom_id": 4}]}'),
(17, '01', 'FALL', 2022, 2, 10, 100, 98, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 10}]}'),
(19, '01', 'FALL', 2022, 2, 11, 60, 55, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),

-- 2023 SPRING (Bahar Dönemi)
(3, '01', 'SPRING', 2023, 1, 5, 50, 50, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
(4, '01', 'SPRING', 2023, 2, 7, 40, 40, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}]}'),
(7, '01', 'SPRING', 2023, 1, 2, 35, 32, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(8, '01', 'SPRING', 2023, 1, 8, 35, 35, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 8}]}'),
(10, '01', 'SPRING', 2023, 2, 3, 45, 43, '{"slots": [{"day": "TUESDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}]}'),
(12, '01', 'SPRING', 2023, 2, 6, 30, 28, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 6}]}'),
(14, '01', 'SPRING', 2023, 1, 4, 40, 40, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 4}]}'),
(16, '01', 'SPRING', 2023, 1, 3, 30, 28, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "11:50", "classroom_id": 3}]}'),
(18, '01', 'SPRING', 2023, 2, 10, 80, 78, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 10}]}'),
(20, '01', 'SPRING', 2023, 2, 11, 50, 45, '{"slots": [{"day": "WEDNESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),

-- =============================================
-- 2023-2024 AKADEMİK YILI
-- =============================================

-- 2023 FALL (Güz Dönemi)
(1, '01', 'FALL', 2023, 1, 1, 60, 60, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}]}'),
(1, '02', 'FALL', 2023, 2, 3, 60, 58, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}]}'),
(1, '03', 'FALL', 2023, 1, 5, 50, 48, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
(2, '01', 'FALL', 2023, 1, 7, 30, 30, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 7}]}'),
(2, '02', 'FALL', 2023, 1, 8, 25, 25, '{"slots": [{"day": "THURSDAY", "start": "13:00", "end": "15:50", "classroom_id": 8}]}'),
(5, '01', 'FALL', 2023, 2, 2, 40, 40, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(6, '01', 'FALL', 2023, 1, 4, 40, 38, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}]}'),
(9, '01', 'FALL', 2023, 2, 5, 50, 50, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}]}'),
(13, '01', 'FALL', 2023, 1, 3, 45, 45, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}]}'),
(17, '01', 'FALL', 2023, 2, 10, 100, 100, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 10}]}'),

-- 2024 SPRING (Bahar Dönemi)
(3, '01', 'SPRING', 2024, 1, 5, 50, 50, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
(3, '02', 'SPRING', 2024, 2, 6, 45, 42, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 6}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 6}]}'),
(4, '01', 'SPRING', 2024, 1, 7, 40, 40, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}]}'),
(7, '01', 'SPRING', 2024, 2, 2, 35, 35, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(8, '01', 'SPRING', 2024, 1, 8, 35, 35, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 8}]}'),
(10, '01', 'SPRING', 2024, 2, 3, 45, 45, '{"slots": [{"day": "TUESDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}]}'),
(11, '01', 'SPRING', 2024, 2, 6, 35, 33, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 6}]}'),
(14, '01', 'SPRING', 2024, 1, 4, 40, 40, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 4}]}'),
(15, '01', 'SPRING', 2024, 1, 3, 35, 35, '{"slots": [{"day": "MONDAY", "start": "15:00", "end": "16:50", "classroom_id": 3}, {"day": "WEDNESDAY", "start": "15:00", "end": "16:50", "classroom_id": 3}]}'),
(18, '01', 'SPRING', 2024, 2, 10, 80, 80, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 10}]}'),
(19, '01', 'SPRING', 2024, 2, 11, 60, 58, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),

-- =============================================
-- 2024-2025 AKADEMİK YILI (Aktif Dönem)
-- =============================================

-- 2024 FALL (Güz Dönemi) - AKTİF
(1, '01', 'FALL', 2024, 1, 1, 60, 45, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}]}'),
(1, '02', 'FALL', 2024, 2, 3, 60, 52, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}]}'),
(2, '01', 'FALL', 2024, 1, 7, 30, 25, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 7}]}'),
(2, '02', 'FALL', 2024, 1, 8, 25, 20, '{"slots": [{"day": "THURSDAY", "start": "13:00", "end": "15:50", "classroom_id": 8}]}'),
(3, '01', 'FALL', 2024, 2, 5, 50, 38, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
(4, '01', 'FALL', 2024, 1, 7, 40, 35, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 7}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 7}]}'),
(5, '01', 'FALL', 2024, 2, 2, 40, 32, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(6, '01', 'FALL', 2024, 1, 4, 40, 28, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}]}'),
(7, '01', 'FALL', 2024, 2, 2, 35, 22, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 2}]}'),
(8, '01', 'FALL', 2024, 1, 8, 35, 30, '{"slots": [{"day": "TUESDAY", "start": "15:00", "end": "17:50", "classroom_id": 8}]}'),
(9, '01', 'FALL', 2024, 2, 5, 50, 42, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}]}'),
(10, '01', 'FALL', 2024, 2, 3, 45, 38, '{"slots": [{"day": "TUESDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}]}'),
(11, '01', 'FALL', 2024, 2, 6, 35, 25, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 6}]}'),
(12, '01', 'FALL', 2024, 2, 6, 30, 18, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 6}]}'),
(13, '01', 'FALL', 2024, 1, 3, 45, 40, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}]}'),
(14, '01', 'FALL', 2024, 1, 4, 40, 35, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 4}]}'),
(15, '01', 'FALL', 2024, 1, 4, 35, 28, '{"slots": [{"day": "MONDAY", "start": "15:00", "end": "16:50", "classroom_id": 4}, {"day": "WEDNESDAY", "start": "15:00", "end": "16:50", "classroom_id": 4}]}'),
(16, '01', 'FALL', 2024, 1, 3, 30, 20, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 3}]}'),
(17, '01', 'FALL', 2024, 2, 10, 100, 85, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 10}]}'),
(18, '01', 'FALL', 2024, 2, 10, 80, 65, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 10}]}'),
(19, '01', 'FALL', 2024, 2, 11, 60, 48, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),
(20, '01', 'FALL', 2024, 2, 11, 50, 35, '{"slots": [{"day": "WEDNESDAY", "start": "14:00", "end": "16:50", "classroom_id": 11}]}'),

-- =============================================
-- 2024-2025 AKADEMİK YILI (Devam)
-- =============================================

-- 2025 SPRING (Bahar Dönemi) - Planlanan
(3, '01', 'SPRING', 2025, 1, 5, 50, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
(3, '02', 'SPRING', 2025, 2, 6, 45, 0, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 6}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 6}]}'),
(4, '01', 'SPRING', 2025, 1, 7, 40, 0, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}]}'),
(7, '01', 'SPRING', 2025, 2, 2, 35, 0, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(8, '01', 'SPRING', 2025, 1, 8, 35, 0, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 8}]}'),
(10, '01', 'SPRING', 2025, 2, 3, 45, 0, '{"slots": [{"day": "TUESDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}]}'),
(11, '01', 'SPRING', 2025, 2, 6, 35, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 6}]}'),
(12, '01', 'SPRING', 2025, 2, 6, 30, 0, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 6}]}'),
(14, '01', 'SPRING', 2025, 1, 4, 40, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 4}]}'),
(15, '01', 'SPRING', 2025, 1, 3, 35, 0, '{"slots": [{"day": "MONDAY", "start": "15:00", "end": "16:50", "classroom_id": 3}, {"day": "WEDNESDAY", "start": "15:00", "end": "16:50", "classroom_id": 3}]}'),
(16, '01', 'SPRING', 2025, 1, 3, 30, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 3}]}'),
(18, '01', 'SPRING', 2025, 2, 10, 80, 0, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 10}]}'),
(19, '01', 'SPRING', 2025, 2, 11, 60, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),
(20, '01', 'SPRING', 2025, 2, 11, 50, 0, '{"slots": [{"day": "WEDNESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),

-- 2025 SUMMER (Yaz Dönemi) - Planlanan
(1, '01', 'SUMMER', 2025, 1, 2, 30, 0, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "12:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "09:00", "end": "12:50", "classroom_id": 2}]}'),
(3, '01', 'SUMMER', 2025, 2, 4, 25, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "12:50", "classroom_id": 4}, {"day": "THURSDAY", "start": "09:00", "end": "12:50", "classroom_id": 4}]}'),
(5, '01', 'SUMMER', 2025, 2, 2, 25, 0, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "16:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "13:00", "end": "16:50", "classroom_id": 2}]}'),
(9, '01', 'SUMMER', 2025, 1, 5, 30, 0, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "16:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "13:00", "end": "16:50", "classroom_id": 5}]}'),

-- =============================================
-- 2025-2026 AKADEMİK YILI
-- =============================================

-- 2025 FALL (Güz Dönemi) - Planlanan
(1, '01', 'FALL', 2025, 1, 1, 60, 0, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}]}'),
(1, '02', 'FALL', 2025, 2, 3, 60, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}]}'),
(2, '01', 'FALL', 2025, 1, 7, 30, 0, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 7}]}'),
(2, '02', 'FALL', 2025, 1, 8, 25, 0, '{"slots": [{"day": "THURSDAY", "start": "13:00", "end": "15:50", "classroom_id": 8}]}'),
(3, '01', 'FALL', 2025, 2, 5, 50, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
(4, '01', 'FALL', 2025, 1, 7, 40, 0, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 7}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 7}]}'),
(5, '01', 'FALL', 2025, 2, 2, 40, 0, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(6, '01', 'FALL', 2025, 1, 4, 40, 0, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}]}'),
(7, '01', 'FALL', 2025, 2, 2, 35, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 2}]}'),
(8, '01', 'FALL', 2025, 1, 8, 35, 0, '{"slots": [{"day": "TUESDAY", "start": "15:00", "end": "17:50", "classroom_id": 8}]}'),
(9, '01', 'FALL', 2025, 2, 5, 50, 0, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}]}'),
(10, '01', 'FALL', 2025, 2, 3, 45, 0, '{"slots": [{"day": "TUESDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}]}'),
(11, '01', 'FALL', 2025, 2, 6, 35, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 6}]}'),
(12, '01', 'FALL', 2025, 2, 6, 30, 0, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 6}]}'),
(13, '01', 'FALL', 2025, 1, 3, 45, 0, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}]}'),
(14, '01', 'FALL', 2025, 1, 4, 40, 0, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 4}]}'),
(15, '01', 'FALL', 2025, 1, 4, 35, 0, '{"slots": [{"day": "MONDAY", "start": "15:00", "end": "16:50", "classroom_id": 4}, {"day": "WEDNESDAY", "start": "15:00", "end": "16:50", "classroom_id": 4}]}'),
(16, '01', 'FALL', 2025, 1, 3, 30, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 3}]}'),
(17, '01', 'FALL', 2025, 2, 10, 100, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 10}]}'),
(18, '01', 'FALL', 2025, 2, 10, 80, 0, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 10}]}'),
(19, '01', 'FALL', 2025, 2, 11, 60, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),
(20, '01', 'FALL', 2025, 2, 11, 50, 0, '{"slots": [{"day": "WEDNESDAY", "start": "14:00", "end": "16:50", "classroom_id": 11}]}'),

-- 2026 SPRING (Bahar Dönemi) - Planlanan
(3, '01', 'SPRING', 2026, 1, 5, 50, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
(3, '02', 'SPRING', 2026, 2, 6, 45, 0, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 6}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 6}]}'),
(4, '01', 'SPRING', 2026, 1, 7, 40, 0, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}]}'),
(7, '01', 'SPRING', 2026, 2, 2, 35, 0, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(8, '01', 'SPRING', 2026, 1, 8, 35, 0, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 8}]}'),
(10, '01', 'SPRING', 2026, 2, 3, 45, 0, '{"slots": [{"day": "TUESDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}]}'),
(11, '01', 'SPRING', 2026, 2, 6, 35, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 6}]}'),
(12, '01', 'SPRING', 2026, 2, 6, 30, 0, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 6}]}'),
(14, '01', 'SPRING', 2026, 1, 4, 40, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 4}]}'),
(15, '01', 'SPRING', 2026, 1, 3, 35, 0, '{"slots": [{"day": "MONDAY", "start": "15:00", "end": "16:50", "classroom_id": 3}, {"day": "WEDNESDAY", "start": "15:00", "end": "16:50", "classroom_id": 3}]}'),
(16, '01', 'SPRING', 2026, 1, 3, 30, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 3}]}'),
(18, '01', 'SPRING', 2026, 2, 10, 80, 0, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 10}]}'),
(19, '01', 'SPRING', 2026, 2, 11, 60, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),
(20, '01', 'SPRING', 2026, 2, 11, 50, 0, '{"slots": [{"day": "WEDNESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}');

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