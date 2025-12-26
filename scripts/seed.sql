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

-- Admin Kullanıcı (user_id = 1)
INSERT INTO users (email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active) VALUES
('admin@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Sistem', 'Admin', '05001234567', 'ADMIN', 1, 1);

-- =============================================
-- Öğretim Üyeleri (20 Hoca - Her Ders Tek Hoca)
-- =============================================

-- CENG Bölümü Hocaları (8 hoca, user_id = 2-9)
INSERT INTO users (email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active) VALUES
('ahmet.yilmaz@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Ahmet', 'Yılmaz', '05321234501', 'FACULTY', 1, 1),
('burak.kara@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Burak', 'Kara', '05321234502', 'FACULTY', 1, 1),
('can.ozkan@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Can', 'Özkan', '05321234503', 'FACULTY', 1, 1),
('deniz.aydin@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Deniz', 'Aydın', '05321234504', 'FACULTY', 1, 1),
('ege.sen@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Ege', 'Şen', '05321234505', 'FACULTY', 1, 1),
('fatih.koc@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Fatih', 'Koç', '05321234506', 'FACULTY', 1, 1),
('gokhan.yildiz@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Gökhan', 'Yıldız', '05321234507', 'FACULTY', 1, 1),
('hakan.polat@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Hakan', 'Polat', '05321234508', 'FACULTY', 1, 1);

-- EEE Bölümü Hocaları (4 hoca, user_id = 10-13)
INSERT INTO users (email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active) VALUES
('ayse.demir@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Ayşe', 'Demir', '05331234501', 'FACULTY', 1, 1),
('ibrahim.cetin@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'İbrahim', 'Çetin', '05331234502', 'FACULTY', 1, 1),
('jale.aksoy@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Jale', 'Aksoy', '05331234503', 'FACULTY', 1, 1),
('kemal.dogan@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Kemal', 'Doğan', '05331234504', 'FACULTY', 1, 1);

-- ME Bölümü Hocaları (4 hoca, user_id = 14-17)
INSERT INTO users (email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active) VALUES
('levent.gunes@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Levent', 'Güneş', '05341234501', 'FACULTY', 1, 1),
('murat.sahin@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Murat', 'Şahin', '05341234502', 'FACULTY', 1, 1),
('nuri.yilmaz@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Nuri', 'Yılmaz', '05341234503', 'FACULTY', 1, 1),
('oguz.kaya@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Oğuz', 'Kaya', '05341234504', 'FACULTY', 1, 1);

-- BA Bölümü Hocaları (4 hoca, user_id = 18-21)
INSERT INTO users (email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active) VALUES
('pinar.demir@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Pınar', 'Demir', '05351234501', 'FACULTY', 1, 1),
('riza.ozdemir@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Rıza', 'Özdemir', '05351234502', 'FACULTY', 1, 1),
('selin.arslan@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Selin', 'Arslan', '05351234503', 'FACULTY', 1, 1),
('tarik.eren@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Tarık', 'Eren', '05351234504', 'FACULTY', 1, 1);

-- =============================================
-- Öğrenciler (5 öğrenci, user_id = 22-26)
-- =============================================
INSERT INTO users (email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active) VALUES
('ali.kaya@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Ali', 'Kaya', '05411234567', 'STUDENT', 1, 1),
('zeynep.celik@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Zeynep', 'Çelik', '05421234567', 'STUDENT', 1, 1),
('mehmet.ozturk@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Mehmet', 'Öztürk', '05431234567', 'STUDENT', 1, 1),
('fatma.sahin@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Fatma', 'Şahin', '05441234567', 'STUDENT', 1, 1),
('emre.arslan@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Emre', 'Arslan', '05451234567', 'STUDENT', 1, 1);

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
-- 20 Hoca - Her Bölüme Kendi Hocaları
-- =============================================

-- CENG Bölümü Hocaları (faculty_id = 1-8)
INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP001', 'Dr. Öğr. Üyesi', 'Mühendislik A-101'
FROM users u, departments d WHERE u.email = 'ahmet.yilmaz@smartcampus.edu.tr' AND d.code = 'CENG';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP002', 'Dr. Öğr. Üyesi', 'Mühendislik A-102'
FROM users u, departments d WHERE u.email = 'burak.kara@smartcampus.edu.tr' AND d.code = 'CENG';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP003', 'Doç. Dr.', 'Mühendislik A-103'
FROM users u, departments d WHERE u.email = 'can.ozkan@smartcampus.edu.tr' AND d.code = 'CENG';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP004', 'Dr. Öğr. Üyesi', 'Mühendislik A-104'
FROM users u, departments d WHERE u.email = 'deniz.aydin@smartcampus.edu.tr' AND d.code = 'CENG';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP005', 'Prof. Dr.', 'Mühendislik A-105'
FROM users u, departments d WHERE u.email = 'ege.sen@smartcampus.edu.tr' AND d.code = 'CENG';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP006', 'Dr. Öğr. Üyesi', 'Mühendislik A-106'
FROM users u, departments d WHERE u.email = 'fatih.koc@smartcampus.edu.tr' AND d.code = 'CENG';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP007', 'Doç. Dr.', 'Mühendislik A-107'
FROM users u, departments d WHERE u.email = 'gokhan.yildiz@smartcampus.edu.tr' AND d.code = 'CENG';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP008', 'Dr. Öğr. Üyesi', 'Mühendislik A-108'
FROM users u, departments d WHERE u.email = 'hakan.polat@smartcampus.edu.tr' AND d.code = 'CENG';

-- EEE Bölümü Hocaları (faculty_id = 9-12)
INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP009', 'Prof. Dr.', 'Mühendislik B-201'
FROM users u, departments d WHERE u.email = 'ayse.demir@smartcampus.edu.tr' AND d.code = 'EEE';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP010', 'Dr. Öğr. Üyesi', 'Mühendislik B-202'
FROM users u, departments d WHERE u.email = 'ibrahim.cetin@smartcampus.edu.tr' AND d.code = 'EEE';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP011', 'Doç. Dr.', 'Mühendislik B-203'
FROM users u, departments d WHERE u.email = 'jale.aksoy@smartcampus.edu.tr' AND d.code = 'EEE';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP012', 'Dr. Öğr. Üyesi', 'Mühendislik B-204'
FROM users u, departments d WHERE u.email = 'kemal.dogan@smartcampus.edu.tr' AND d.code = 'EEE';

-- ME Bölümü Hocaları (faculty_id = 13-16)
INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP013', 'Dr. Öğr. Üyesi', 'Mühendislik C-301'
FROM users u, departments d WHERE u.email = 'levent.gunes@smartcampus.edu.tr' AND d.code = 'ME';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP014', 'Doç. Dr.', 'Mühendislik C-302'
FROM users u, departments d WHERE u.email = 'murat.sahin@smartcampus.edu.tr' AND d.code = 'ME';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP015', 'Prof. Dr.', 'Mühendislik C-303'
FROM users u, departments d WHERE u.email = 'nuri.yilmaz@smartcampus.edu.tr' AND d.code = 'ME';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP016', 'Dr. Öğr. Üyesi', 'Mühendislik C-304'
FROM users u, departments d WHERE u.email = 'oguz.kaya@smartcampus.edu.tr' AND d.code = 'ME';

-- BA Bölümü Hocaları (faculty_id = 17-20)
INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP017', 'Dr. Öğr. Üyesi', 'İşletme D-401'
FROM users u, departments d WHERE u.email = 'pinar.demir@smartcampus.edu.tr' AND d.code = 'BA';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP018', 'Doç. Dr.', 'İşletme D-402'
FROM users u, departments d WHERE u.email = 'riza.ozdemir@smartcampus.edu.tr' AND d.code = 'BA';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP019', 'Prof. Dr.', 'İşletme D-403'
FROM users u, departments d WHERE u.email = 'selin.arslan@smartcampus.edu.tr' AND d.code = 'BA';

INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP020', 'Dr. Öğr. Üyesi', 'İşletme D-404'
FROM users u, departments d WHERE u.email = 'tarik.eren@smartcampus.edu.tr' AND d.code = 'BA';

-- =============================================
-- 05: Courses (Dersler) - Part 2
-- =============================================
INSERT INTO courses (code, name, description, credits, ects, department_id) VALUES
-- Bilgisayar Mühendisliği Dersleri (department_id = 1, course_id = 1-8)
('CENG101', 'Programlamaya Giriş', 'Temel programlama kavramları ve algoritma geliştirme', 4, 6, 1),
('CENG102', 'Programlama Lab', 'Programlama uygulamaları laboratuvarı', 2, 3, 1),
('CENG201', 'Veri Yapıları', 'Temel veri yapıları ve algoritmalar', 4, 6, 1),
('CENG202', 'Nesne Yönelimli Programlama', 'OOP prensipleri ve Java/C++ uygulamaları', 3, 5, 1),
('CENG301', 'Veritabanı Sistemleri', 'İlişkisel veritabanları ve SQL', 3, 5, 1),
('CENG302', 'İşletim Sistemleri', 'İşletim sistemi kavramları ve yönetimi', 3, 5, 1),
('CENG401', 'Yazılım Mühendisliği', 'Yazılım geliştirme süreçleri ve metodolojileri', 3, 5, 1),
('CENG402', 'Web Programlama', 'Modern web teknolojileri ve uygulama geliştirme', 3, 5, 1),

-- Elektrik-Elektronik Mühendisliği Dersleri (department_id = 2, course_id = 9-12)
('EEE101', 'Devre Analizi', 'Temel elektrik devre analizi', 4, 6, 2),
('EEE201', 'Elektronik I', 'Analog elektronik devreleri', 3, 5, 2),
('EEE301', 'Sinyal ve Sistemler', 'Sürekli ve ayrık zamanlı sinyaller', 3, 5, 2),
('EEE401', 'Haberleşme Sistemleri', 'Analog ve dijital haberleşme', 3, 5, 2),

-- Makine Mühendisliği Dersleri (department_id = 3, course_id = 13-16)
('ME101', 'Statik', 'Mühendislik mekaniği temelleri', 3, 5, 3),
('ME201', 'Dinamik', 'Hareket ve kuvvet analizi', 3, 5, 3),
('ME301', 'Termodinamik', 'Enerji dönüşüm prensipleri', 3, 5, 3),
('ME401', 'Makine Tasarımı', 'Mekanik sistem tasarımı', 3, 5, 3),

-- İşletme Dersleri (department_id = 4, course_id = 17-20)
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
-- HER DERS TEK HOCA TARAFINDAN VERİLİYOR
-- 
-- Ders-Hoca Atamaları:
-- CENG101 (course_id=1)  → faculty_id=1  (Ahmet Yılmaz)
-- CENG102 (course_id=2)  → faculty_id=2  (Burak Kara)
-- CENG201 (course_id=3)  → faculty_id=3  (Can Özkan)
-- CENG202 (course_id=4)  → faculty_id=4  (Deniz Aydın)
-- CENG301 (course_id=5)  → faculty_id=5  (Ege Şen)
-- CENG302 (course_id=6)  → faculty_id=6  (Fatih Koç)
-- CENG401 (course_id=7)  → faculty_id=7  (Gökhan Yıldız)
-- CENG402 (course_id=8)  → faculty_id=8  (Hakan Polat)
-- EEE101  (course_id=9)  → faculty_id=9  (Ayşe Demir)
-- EEE201  (course_id=10) → faculty_id=10 (İbrahim Çetin)
-- EEE301  (course_id=11) → faculty_id=11 (Jale Aksoy)
-- EEE401  (course_id=12) → faculty_id=12 (Kemal Doğan)
-- ME101   (course_id=13) → faculty_id=13 (Levent Güneş)
-- ME201   (course_id=14) → faculty_id=14 (Murat Şahin)
-- ME301   (course_id=15) → faculty_id=15 (Nuri Yılmaz)
-- ME401   (course_id=16) → faculty_id=16 (Oğuz Kaya)
-- BA101   (course_id=17) → faculty_id=17 (Pınar Demir)
-- BA201   (course_id=18) → faculty_id=18 (Rıza Özdemir)
-- BA301   (course_id=19) → faculty_id=19 (Selin Arslan)
-- BA401   (course_id=20) → faculty_id=20 (Tarık Eren)
-- =============================================
INSERT INTO course_sections (course_id, section_number, semester, year, instructor_id, classroom_id, capacity, enrolled_count, schedule_json) VALUES

-- =============================================
-- 2024-2025 AKADEMİK YILI (Aktif Dönem)
-- =============================================

-- 2024 FALL (Güz Dönemi) - AKTİF
-- CENG Dersleri
(1, '01', 'FALL', 2024, 1, 1, 60, 45, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}]}'),
(1, '02', 'FALL', 2024, 1, 3, 60, 52, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}]}'),
(2, '01', 'FALL', 2024, 2, 7, 30, 25, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 7}]}'),
(2, '02', 'FALL', 2024, 2, 8, 25, 20, '{"slots": [{"day": "THURSDAY", "start": "13:00", "end": "15:50", "classroom_id": 8}]}'),
(3, '01', 'FALL', 2024, 3, 5, 50, 38, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
(4, '01', 'FALL', 2024, 4, 7, 40, 35, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 7}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 7}]}'),
(5, '01', 'FALL', 2024, 5, 2, 40, 32, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(6, '01', 'FALL', 2024, 6, 4, 40, 28, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}]}'),
(7, '01', 'FALL', 2024, 7, 2, 35, 22, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 2}]}'),
(8, '01', 'FALL', 2024, 8, 8, 35, 30, '{"slots": [{"day": "TUESDAY", "start": "15:00", "end": "17:50", "classroom_id": 8}]}'),

-- EEE Dersleri
(9, '01', 'FALL', 2024, 9, 5, 50, 42, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}]}'),
(10, '01', 'FALL', 2024, 10, 3, 45, 38, '{"slots": [{"day": "TUESDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}]}'),
(11, '01', 'FALL', 2024, 11, 6, 35, 25, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 6}]}'),
(12, '01', 'FALL', 2024, 12, 6, 30, 18, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 6}]}'),

-- ME Dersleri
(13, '01', 'FALL', 2024, 13, 3, 45, 40, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}]}'),
(14, '01', 'FALL', 2024, 14, 4, 40, 35, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 4}]}'),
(15, '01', 'FALL', 2024, 15, 4, 35, 28, '{"slots": [{"day": "MONDAY", "start": "15:00", "end": "16:50", "classroom_id": 4}, {"day": "WEDNESDAY", "start": "15:00", "end": "16:50", "classroom_id": 4}]}'),
(16, '01', 'FALL', 2024, 16, 3, 30, 20, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 3}]}'),

-- BA Dersleri
(17, '01', 'FALL', 2024, 17, 10, 100, 85, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 10}]}'),
(18, '01', 'FALL', 2024, 18, 10, 80, 65, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 10}]}'),
(19, '01', 'FALL', 2024, 19, 11, 60, 48, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),
(20, '01', 'FALL', 2024, 20, 11, 50, 35, '{"slots": [{"day": "WEDNESDAY", "start": "14:00", "end": "16:50", "classroom_id": 11}]}'),

-- =============================================
-- 2025 SPRING (Bahar Dönemi) - Planlanan
-- =============================================
(3, '01', 'SPRING', 2025, 3, 5, 50, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
(3, '02', 'SPRING', 2025, 3, 6, 45, 0, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 6}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 6}]}'),
(4, '01', 'SPRING', 2025, 4, 7, 40, 0, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}]}'),
(7, '01', 'SPRING', 2025, 7, 2, 35, 0, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(8, '01', 'SPRING', 2025, 8, 8, 35, 0, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 8}]}'),
(10, '01', 'SPRING', 2025, 10, 3, 45, 0, '{"slots": [{"day": "TUESDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}]}'),
(11, '01', 'SPRING', 2025, 11, 6, 35, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 6}]}'),
(12, '01', 'SPRING', 2025, 12, 6, 30, 0, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 6}]}'),
(14, '01', 'SPRING', 2025, 14, 4, 40, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 4}]}'),
(15, '01', 'SPRING', 2025, 15, 3, 35, 0, '{"slots": [{"day": "MONDAY", "start": "15:00", "end": "16:50", "classroom_id": 3}, {"day": "WEDNESDAY", "start": "15:00", "end": "16:50", "classroom_id": 3}]}'),
(16, '01', 'SPRING', 2025, 16, 3, 30, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 3}]}'),
(18, '01', 'SPRING', 2025, 18, 10, 80, 0, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 10}]}'),
(19, '01', 'SPRING', 2025, 19, 11, 60, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),
(20, '01', 'SPRING', 2025, 20, 11, 50, 0, '{"slots": [{"day": "WEDNESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),

-- =============================================
-- 2025 SUMMER (Yaz Dönemi) - Planlanan
-- =============================================
(1, '01', 'SUMMER', 2025, 1, 2, 30, 0, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "12:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "09:00", "end": "12:50", "classroom_id": 2}]}'),
(3, '01', 'SUMMER', 2025, 3, 4, 25, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "12:50", "classroom_id": 4}, {"day": "THURSDAY", "start": "09:00", "end": "12:50", "classroom_id": 4}]}'),
(5, '01', 'SUMMER', 2025, 5, 2, 25, 0, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "16:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "13:00", "end": "16:50", "classroom_id": 2}]}'),
(9, '01', 'SUMMER', 2025, 9, 5, 30, 0, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "16:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "13:00", "end": "16:50", "classroom_id": 5}]}'),

-- =============================================
-- 2025-2026 AKADEMİK YILI
-- =============================================

-- 2025 FALL (Güz Dönemi) - Planlanan
(1, '01', 'FALL', 2025, 1, 1, 60, 0, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}]}'),
(1, '02', 'FALL', 2025, 1, 3, 60, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 3}]}'),
(2, '01', 'FALL', 2025, 2, 7, 30, 0, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 7}]}'),
(2, '02', 'FALL', 2025, 2, 8, 25, 0, '{"slots": [{"day": "THURSDAY", "start": "13:00", "end": "15:50", "classroom_id": 8}]}'),
(3, '01', 'FALL', 2025, 3, 5, 50, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
(4, '01', 'FALL', 2025, 4, 7, 40, 0, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 7}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 7}]}'),
(5, '01', 'FALL', 2025, 5, 2, 40, 0, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(6, '01', 'FALL', 2025, 6, 4, 40, 0, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}]}'),
(7, '01', 'FALL', 2025, 7, 2, 35, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 2}]}'),
(8, '01', 'FALL', 2025, 8, 8, 35, 0, '{"slots": [{"day": "TUESDAY", "start": "15:00", "end": "17:50", "classroom_id": 8}]}'),
(9, '01', 'FALL', 2025, 9, 5, 50, 0, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}]}'),
(10, '01', 'FALL', 2025, 10, 3, 45, 0, '{"slots": [{"day": "TUESDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}]}'),
(11, '01', 'FALL', 2025, 11, 6, 35, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 6}]}'),
(12, '01', 'FALL', 2025, 12, 6, 30, 0, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 6}]}'),
(13, '01', 'FALL', 2025, 13, 3, 45, 0, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}]}'),
(14, '01', 'FALL', 2025, 14, 4, 40, 0, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 4}]}'),
(15, '01', 'FALL', 2025, 15, 4, 35, 0, '{"slots": [{"day": "MONDAY", "start": "15:00", "end": "16:50", "classroom_id": 4}, {"day": "WEDNESDAY", "start": "15:00", "end": "16:50", "classroom_id": 4}]}'),
(16, '01', 'FALL', 2025, 16, 3, 30, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 3}]}'),
(17, '01', 'FALL', 2025, 17, 10, 100, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 10}]}'),
(18, '01', 'FALL', 2025, 18, 10, 80, 0, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 10}]}'),
(19, '01', 'FALL', 2025, 19, 11, 60, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),
(20, '01', 'FALL', 2025, 20, 11, 50, 0, '{"slots": [{"day": "WEDNESDAY", "start": "14:00", "end": "16:50", "classroom_id": 11}]}'),

-- 2026 SPRING (Bahar Dönemi) - Planlanan
(3, '01', 'SPRING', 2026, 3, 5, 50, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
(3, '02', 'SPRING', 2026, 3, 6, 45, 0, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 6}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 6}]}'),
(4, '01', 'SPRING', 2026, 4, 7, 40, 0, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 7}]}'),
(7, '01', 'SPRING', 2026, 7, 2, 35, 0, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(8, '01', 'SPRING', 2026, 8, 8, 35, 0, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 8}]}'),
(10, '01', 'SPRING', 2026, 10, 3, 45, 0, '{"slots": [{"day": "TUESDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "11:00", "end": "12:50", "classroom_id": 3}]}'),
(11, '01', 'SPRING', 2026, 11, 6, 35, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 6}]}'),
(12, '01', 'SPRING', 2026, 12, 6, 30, 0, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 6}]}'),
(14, '01', 'SPRING', 2026, 14, 4, 40, 0, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 4}]}'),
(15, '01', 'SPRING', 2026, 15, 3, 35, 0, '{"slots": [{"day": "MONDAY", "start": "15:00", "end": "16:50", "classroom_id": 3}, {"day": "WEDNESDAY", "start": "15:00", "end": "16:50", "classroom_id": 3}]}'),
(16, '01', 'SPRING', 2026, 16, 3, 30, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 3}]}'),
(18, '01', 'SPRING', 2026, 18, 10, 80, 0, '{"slots": [{"day": "MONDAY", "start": "14:00", "end": "16:50", "classroom_id": 10}]}'),
(19, '01', 'SPRING', 2026, 19, 11, 60, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}'),
(20, '01', 'SPRING', 2026, 20, 11, 50, 0, '{"slots": [{"day": "WEDNESDAY", "start": "09:00", "end": "11:50", "classroom_id": 11}]}');

-- =============================================
-- 09: Enrollments (Ders Kayıtları) - Part 2
-- Öğrenciler 2024 FALL dönemindeki derslere kayıtlı
-- Section ID'ler 2024 FALL için: 1-22 arası
-- =============================================
INSERT INTO enrollments (student_id, section_id, status) VALUES
-- Öğrenci 1 (Ali Kaya - CENG) - CENG101 ve CENG102
(1, 1, 'ENROLLED'),  -- CENG101 Section 01
(1, 3, 'ENROLLED'),  -- CENG102 Section 01

-- Öğrenci 2 (Zeynep Çelik - CENG) - CENG101 ve CENG102
(2, 1, 'ENROLLED'),  -- CENG101 Section 01
(2, 3, 'ENROLLED'),  -- CENG102 Section 01

-- Öğrenci 3 (Mehmet Öztürk - EEE) - EEE101
(3, 11, 'ENROLLED'),  -- EEE101 Section 01

-- Öğrenci 4 (Fatma Şahin - ME) - ME101
(4, 15, 'ENROLLED'),  -- ME101 Section 01

-- Öğrenci 5 (Emre Arslan - BA) - BA101
(5, 19, 'ENROLLED');  -- BA101 Section 01

-- =============================================
-- Seed Complete (Part 1 + Part 2)
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

-- =============================================
-- PART 3: Meal Service, Event Management, Scheduling
-- =============================================

-- =============================================
-- 10: Cafeterias (Yemekhaneler) - Part 3
-- =============================================
INSERT INTO cafeterias (name, location, capacity, latitude, longitude, opening_time, closing_time) VALUES
('Ana Yemekhane', 'Merkez Kampüs, A Blok Zemin Kat', 500, 41.10500000, 29.02500000, '07:00:00', '21:00:00'),
('Mühendislik Yemekhanesi', 'Mühendislik Fakültesi, B Blok', 200, 41.10540000, 29.02530000, '11:00:00', '15:00:00');

-- =============================================
-- 11: Meal Menus (Yemek Menüleri) - Part 3
-- =============================================
INSERT INTO meal_menus (cafeteria_id, menu_date, meal_type, items_json, nutrition_json, price, is_vegan, is_vegetarian, is_published) VALUES
-- Ana Yemekhane Öğle Menüleri
(1, CURDATE(), 'LUNCH', 
 '{"main": "Tavuk Sote", "soup": "Mercimek Çorbası", "side": "Pilav", "salad": "Mevsim Salata", "dessert": "Sütlaç"}',
 '{"calories": 850, "protein": 35, "carbs": 95, "fat": 28}',
 25.00, 0, 0, 1),
(1, CURDATE(), 'DINNER', 
 '{"main": "Karnıyarık", "soup": "Ezogelin Çorbası", "side": "Bulgur Pilavı", "salad": "Cacık", "dessert": "Meyve"}',
 '{"calories": 780, "protein": 22, "carbs": 88, "fat": 32}',
 25.00, 0, 0, 1),
(1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'LUNCH', 
 '{"main": "Izgara Köfte", "soup": "Domates Çorbası", "side": "Makarna", "salad": "Çoban Salata", "dessert": "Baklava"}',
 '{"calories": 920, "protein": 42, "carbs": 78, "fat": 38}',
 28.00, 0, 0, 1),
(1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'DINNER', 
 '{"main": "Sebzeli Güveç", "soup": "Yayla Çorbası", "side": "Pirinç Pilavı", "salad": "Turşu", "dessert": "Komposto"}',
 '{"calories": 650, "protein": 18, "carbs": 82, "fat": 22}',
 22.00, 1, 1, 1),
-- Mühendislik Yemekhanesi
(2, CURDATE(), 'LUNCH', 
 '{"main": "Tavuk Döner", "soup": "Mercimek Çorbası", "side": "Pilav", "salad": "Mevsim Salata", "dessert": "Meyve"}',
 '{"calories": 780, "protein": 32, "carbs": 85, "fat": 26}',
 22.00, 0, 0, 1);

-- =============================================
-- 12: Wallets (Cüzdanlar) - Part 3
-- =============================================
-- Tüm kullanıcılar için cüzdan oluştur
INSERT INTO wallets (user_id, balance, is_scholarship, daily_scholarship_limit, is_active)
SELECT 
    u.id,
    CASE 
        WHEN u.role = 'STUDENT' THEN ROUND(50 + RAND() * 150, 2)
        WHEN u.role = 'FACULTY' THEN ROUND(100 + RAND() * 200, 2)
        ELSE 500.00
    END,
    CASE WHEN u.role = 'STUDENT' AND u.id % 3 = 0 THEN 1 ELSE 0 END,
    2,
    1
FROM users u;

-- =============================================
-- 13: Events (Etkinlikler) - Part 3
-- =============================================
INSERT INTO events (title, description, category, event_date, start_time, end_time, location, capacity, registered_count, registration_deadline, is_paid, price, organizer_id, status) VALUES
('Yazılım Kariyer Günleri 2025', 
 'Türkiye''nin önde gelen teknoloji şirketlerinden uzmanlarla kariyer fırsatlarını keşfedin.',
 'CAREER', 
 DATE_ADD(CURDATE(), INTERVAL 7 DAY), 
 '10:00:00', '17:00:00',
 'Kongre Merkezi, Ana Salon',
 300, 0,
 DATE_ADD(CURDATE(), INTERVAL 5 DAY),
 0, 0.00,
 1,
 'PUBLISHED'),
('React.js Workshop', 
 'React.js ile modern web uygulaması geliştirmeyi öğrenin. Hooks, Context API ve best practices.',
 'WORKSHOP', 
 DATE_ADD(CURDATE(), INTERVAL 10 DAY), 
 '14:00:00', '18:00:00',
 'Bilgisayar Merkezi, LAB-1',
 30, 0,
 DATE_ADD(CURDATE(), INTERVAL 8 DAY),
 1, 50.00,
 1,
 'PUBLISHED'),
('Yapay Zeka ve Gelecek Konferansı', 
 'AI, Machine Learning ve Deep Learning konularında akademisyenler sunum yapacak.',
 'CONFERENCE', 
 DATE_ADD(CURDATE(), INTERVAL 14 DAY), 
 '09:00:00', '18:00:00',
 'Mühendislik A, A-201 Amfi',
 150, 0,
 DATE_ADD(CURDATE(), INTERVAL 12 DAY),
 0, 0.00,
 1,
 'PUBLISHED'),
('Bahar Şenliği 2025', 
 'Canlı müzik, yemek standları ve eğlenceli aktivitelerle dolu bir gün.',
 'SOCIAL', 
 DATE_ADD(CURDATE(), INTERVAL 21 DAY), 
 '12:00:00', '22:00:00',
 'Merkez Kampüs Çim Alan',
 1000, 0,
 DATE_ADD(CURDATE(), INTERVAL 20 DAY),
 0, 0.00,
 1,
 'PUBLISHED'),
('Fakülteler Arası Futbol Turnuvası', 
 'Fakülteler arası futbol turnuvası! Takımınızı oluşturun ve şampiyonluk için yarışın.',
 'SPORTS', 
 DATE_ADD(CURDATE(), INTERVAL 30 DAY), 
 '10:00:00', '18:00:00',
 'Spor Kompleksi Futbol Sahası',
 200, 0,
 DATE_ADD(CURDATE(), INTERVAL 25 DAY),
 0, 0.00,
 1,
 'DRAFT');

-- =============================================
-- Full Seed Complete (Part 1 + Part 2 + Part 3)
-- =============================================
SELECT 'Seed data inserted successfully! (Part 1 + Part 2 + Part 3)' AS status;
SELECT CONCAT('Total Cafeterias: ', COUNT(*)) AS info FROM cafeterias;
SELECT CONCAT('Total Meal Menus: ', COUNT(*)) AS info FROM meal_menus;
SELECT CONCAT('Total Wallets: ', COUNT(*)) AS info FROM wallets;
SELECT CONCAT('Total Events: ', COUNT(*)) AS info FROM events;

-- =============================================
-- 14: Schedules (Ders Programları) - Part 3
-- course_sections verilerine göre schedule oluştur
-- =============================================
INSERT INTO schedules (section_id, day_of_week, start_time, end_time, classroom_id) VALUES
-- 2024 FALL - CENG Dersleri
(1, 'MONDAY', '09:00:00', '10:50:00', 1),
(1, 'WEDNESDAY', '09:00:00', '10:50:00', 1),
(2, 'TUESDAY', '09:00:00', '10:50:00', 3),
(2, 'THURSDAY', '09:00:00', '10:50:00', 3),
(3, 'FRIDAY', '13:00:00', '15:50:00', 7),
(4, 'THURSDAY', '13:00:00', '15:50:00', 8),
(5, 'TUESDAY', '09:00:00', '10:50:00', 5),
(5, 'THURSDAY', '09:00:00', '10:50:00', 5),
(6, 'MONDAY', '11:00:00', '12:50:00', 7),
(6, 'WEDNESDAY', '11:00:00', '12:50:00', 7),
(7, 'MONDAY', '13:00:00', '14:50:00', 2),
(7, 'WEDNESDAY', '13:00:00', '14:50:00', 2),
(8, 'TUESDAY', '13:00:00', '14:50:00', 4),
(8, 'THURSDAY', '13:00:00', '14:50:00', 4),
(9, 'FRIDAY', '09:00:00', '11:50:00', 2),
(10, 'TUESDAY', '15:00:00', '17:50:00', 8),

-- 2024 FALL - EEE Dersleri
(11, 'MONDAY', '11:00:00', '12:50:00', 5),
(11, 'WEDNESDAY', '11:00:00', '12:50:00', 5),
(12, 'TUESDAY', '11:00:00', '12:50:00', 3),
(12, 'THURSDAY', '11:00:00', '12:50:00', 3),
(13, 'FRIDAY', '09:00:00', '11:50:00', 6),
(14, 'MONDAY', '14:00:00', '16:50:00', 6),

-- 2024 FALL - ME Dersleri
(15, 'TUESDAY', '13:00:00', '14:50:00', 3),
(15, 'THURSDAY', '13:00:00', '14:50:00', 3),
(16, 'FRIDAY', '13:00:00', '15:50:00', 4),
(17, 'MONDAY', '15:00:00', '16:50:00', 4),
(17, 'WEDNESDAY', '15:00:00', '16:50:00', 4),
(18, 'TUESDAY', '09:00:00', '11:50:00', 3),

-- 2024 FALL - BA Dersleri
(19, 'FRIDAY', '09:00:00', '11:50:00', 10),
(20, 'MONDAY', '14:00:00', '16:50:00', 10),
(21, 'TUESDAY', '09:00:00', '11:50:00', 11),
(22, 'WEDNESDAY', '14:00:00', '16:50:00', 11);

SELECT CONCAT('Total Schedules: ', COUNT(*)) AS info FROM schedules;

-- =============================================
-- 15: Classroom Reservations (Örnek) - Part 3
-- =============================================
INSERT INTO classroom_reservations (classroom_id, user_id, reservation_date, start_time, end_time, purpose, status, notes) VALUES
(7, 1, DATE_ADD(CURDATE(), INTERVAL 3 DAY), '10:00:00', '12:00:00', 'Proje Toplantısı', 'APPROVED', 'Yazılım Mühendisliği ekibi toplantısı'),
(8, 1, DATE_ADD(CURDATE(), INTERVAL 5 DAY), '14:00:00', '16:00:00', 'Workshop Hazırlık', 'PENDING', 'React.js workshop için ön hazırlık'),
(2, 22, DATE_ADD(CURDATE(), INTERVAL 7 DAY), '15:00:00', '17:00:00', 'Çalışma Grubu', 'PENDING', 'Öğrenci çalışma grubu');

SELECT CONCAT('Total Classroom Reservations: ', COUNT(*)) AS info FROM classroom_reservations;

-- =============================================
-- 16: Notification Preferences (Part 4) - Tüm kullanıcılar için varsayılan tercihler
-- =============================================
INSERT INTO notification_preferences (user_id) 
SELECT id FROM users;

SELECT CONCAT('Total Notification Preferences: ', COUNT(*)) AS info FROM notification_preferences;

-- =============================================
-- 17: Sample Notifications (Part 4)
-- =============================================
INSERT INTO notifications (user_id, type, category, title, message, data_json, is_read) VALUES
-- Akademik Bildirimler (öğrenciler için)
(22, 'INFO', 'ACADEMIC', 'Ders Kaydı Onaylandı', 'CENG301 - Veri Yapıları dersine kaydınız onaylandı.', '{"courseId": 1, "sectionId": 1}', 0),
(22, 'SUCCESS', 'ACADEMIC', 'Not Girildi', 'CENG201 - Algoritma dersinden vize notunuz girildi: 85', '{"enrollmentId": 1, "grade": 85}', 1),
(23, 'WARNING', 'ACADEMIC', 'Ders Bırakma Son Tarihi', 'Ders bırakma dönemi 3 gün sonra sona erecek.', '{"deadline": "2025-01-15"}', 0),

-- Yoklama Bildirimleri
(22, 'INFO', 'ATTENDANCE', 'Yoklama Açıldı', 'CENG301 - Veri Yapıları dersi için yoklama açıldı. 30 dakika içinde yoklama verin.', '{"sessionId": 1}', 0),
(23, 'WARNING', 'ATTENDANCE', 'Devamsızlık Uyarısı', 'CENG202 dersinde devamsızlık oranınız %25''e ulaştı.', '{"courseId": 2, "absenceRate": 25}', 0),
(24, 'ERROR', 'ATTENDANCE', 'Kritik Devamsızlık', 'EEE201 dersinde devamsızlık oranınız %35''e ulaştı. Dersten kalabilirsiniz!', '{"courseId": 5, "absenceRate": 35}', 0),

-- Yemek Bildirimleri
(22, 'SUCCESS', 'MEAL', 'Rezervasyon Onaylandı', 'Yarınki öğle yemeği rezervasyonunuz onaylandı.', '{"reservationId": 1, "mealType": "LUNCH"}', 1),
(23, 'INFO', 'MEAL', 'Menü Güncellendi', 'Haftalık yemek menüsü güncellendi. Görmek için tıklayın.', '{"weekStart": "2025-01-06"}', 0),

-- Etkinlik Bildirimleri
(22, 'INFO', 'EVENT', 'Etkinlik Hatırlatma', 'Kayıtlı olduğunuz "Yapay Zeka Workshop" etkinliği yarın saat 14:00''de başlayacak.', '{"eventId": 1}', 0),
(24, 'SUCCESS', 'EVENT', 'Etkinlik Kaydı', 'Kariyer Günleri etkinliğine kaydınız alındı.', '{"eventId": 2, "registrationId": 5}', 1),

-- Ödeme Bildirimleri
(25, 'SUCCESS', 'PAYMENT', 'Bakiye Yüklendi', 'Cüzdanınıza 100 TL başarıyla yüklendi.', '{"amount": 100, "transactionId": 1}', 1),
(22, 'WARNING', 'PAYMENT', 'Düşük Bakiye', 'Cüzdan bakiyeniz 20 TL''nin altına düştü.', '{"balance": 15}', 0),

-- Sistem Bildirimleri
(1, 'INFO', 'SYSTEM', 'Sistem Güncellemesi', 'Smart Campus sistemi yarın 02:00-04:00 arası bakımda olacaktır.', '{"maintenanceStart": "2025-01-10T02:00:00"}', 0),
(22, 'INFO', 'SYSTEM', 'Hoş Geldiniz', 'Smart Campus sistemine hoş geldiniz! Profilinizi tamamlayın.', '{}', 1);

SELECT CONCAT('Total Notifications: ', COUNT(*)) AS info FROM notifications;

-- =============================================
-- PART 4: Analytics Data - Attendance Sessions
-- =============================================
INSERT INTO attendance_sessions (section_id, instructor_id, classroom_id, session_date, start_time, end_time, latitude, longitude, geofence_radius, qr_code, qr_code_generated_at, status) VALUES
-- CENG101-01 Yoklamaları
(1, 1, 1, DATE_SUB(CURDATE(), INTERVAL 21 DAY), '09:00:00', '10:50:00', 41.10527800, 29.02513900, 15, 'QR-CENG101-W1-1', DATE_SUB(CURDATE(), INTERVAL 21 DAY), 'CLOSED'),
(1, 1, 1, DATE_SUB(CURDATE(), INTERVAL 19 DAY), '09:00:00', '10:50:00', 41.10527800, 29.02513900, 15, 'QR-CENG101-W1-2', DATE_SUB(CURDATE(), INTERVAL 19 DAY), 'CLOSED'),
(1, 1, 1, DATE_SUB(CURDATE(), INTERVAL 14 DAY), '09:00:00', '10:50:00', 41.10527800, 29.02513900, 15, 'QR-CENG101-W2-1', DATE_SUB(CURDATE(), INTERVAL 14 DAY), 'CLOSED'),
(1, 1, 1, DATE_SUB(CURDATE(), INTERVAL 12 DAY), '09:00:00', '10:50:00', 41.10527800, 29.02513900, 15, 'QR-CENG101-W2-2', DATE_SUB(CURDATE(), INTERVAL 12 DAY), 'CLOSED'),
(1, 1, 1, DATE_SUB(CURDATE(), INTERVAL 7 DAY), '09:00:00', '10:50:00', 41.10527800, 29.02513900, 15, 'QR-CENG101-W3-1', DATE_SUB(CURDATE(), INTERVAL 7 DAY), 'CLOSED'),
(1, 1, 1, DATE_SUB(CURDATE(), INTERVAL 5 DAY), '09:00:00', '10:50:00', 41.10527800, 29.02513900, 15, 'QR-CENG101-W3-2', DATE_SUB(CURDATE(), INTERVAL 5 DAY), 'CLOSED'),
-- CENG201-01 Yoklamaları
(5, 3, 5, DATE_SUB(CURDATE(), INTERVAL 20 DAY), '09:00:00', '10:50:00', 41.10532400, 29.02518500, 15, 'QR-CENG201-W1-1', DATE_SUB(CURDATE(), INTERVAL 20 DAY), 'CLOSED'),
(5, 3, 5, DATE_SUB(CURDATE(), INTERVAL 18 DAY), '09:00:00', '10:50:00', 41.10532400, 29.02518500, 15, 'QR-CENG201-W1-2', DATE_SUB(CURDATE(), INTERVAL 18 DAY), 'CLOSED'),
(5, 3, 5, DATE_SUB(CURDATE(), INTERVAL 13 DAY), '09:00:00', '10:50:00', 41.10532400, 29.02518500, 15, 'QR-CENG201-W2-1', DATE_SUB(CURDATE(), INTERVAL 13 DAY), 'CLOSED'),
(5, 3, 5, DATE_SUB(CURDATE(), INTERVAL 11 DAY), '09:00:00', '10:50:00', 41.10532400, 29.02518500, 15, 'QR-CENG201-W2-2', DATE_SUB(CURDATE(), INTERVAL 11 DAY), 'CLOSED'),
(5, 3, 5, DATE_SUB(CURDATE(), INTERVAL 6 DAY), '09:00:00', '10:50:00', 41.10532400, 29.02518500, 15, 'QR-CENG201-W3-1', DATE_SUB(CURDATE(), INTERVAL 6 DAY), 'CLOSED'),
-- EEE101-01 Yoklamaları
(11, 9, 5, DATE_SUB(CURDATE(), INTERVAL 21 DAY), '11:00:00', '12:50:00', 41.10540000, 29.02530000, 15, 'QR-EEE101-W1-1', DATE_SUB(CURDATE(), INTERVAL 21 DAY), 'CLOSED'),
(11, 9, 5, DATE_SUB(CURDATE(), INTERVAL 14 DAY), '11:00:00', '12:50:00', 41.10540000, 29.02530000, 15, 'QR-EEE101-W2-1', DATE_SUB(CURDATE(), INTERVAL 14 DAY), 'CLOSED'),
(11, 9, 5, DATE_SUB(CURDATE(), INTERVAL 7 DAY), '11:00:00', '12:50:00', 41.10540000, 29.02530000, 15, 'QR-EEE101-W3-1', DATE_SUB(CURDATE(), INTERVAL 7 DAY), 'CLOSED'),
-- ME101-01 Yoklamaları
(15, 13, 3, DATE_SUB(CURDATE(), INTERVAL 20 DAY), '13:00:00', '14:50:00', 41.10530100, 29.02516200, 15, 'QR-ME101-W1-1', DATE_SUB(CURDATE(), INTERVAL 20 DAY), 'CLOSED'),
(15, 13, 3, DATE_SUB(CURDATE(), INTERVAL 13 DAY), '13:00:00', '14:50:00', 41.10530100, 29.02516200, 15, 'QR-ME101-W2-1', DATE_SUB(CURDATE(), INTERVAL 13 DAY), 'CLOSED'),
(15, 13, 3, DATE_SUB(CURDATE(), INTERVAL 6 DAY), '13:00:00', '14:50:00', 41.10530100, 29.02516200, 15, 'QR-ME101-W3-1', DATE_SUB(CURDATE(), INTERVAL 6 DAY), 'CLOSED');

SELECT CONCAT('Total Attendance Sessions: ', COUNT(*)) AS info FROM attendance_sessions;

-- =============================================
-- PART 4: Analytics Data - Attendance Records
-- =============================================
INSERT INTO attendance_records (session_id, student_id, status, check_in_time, check_in_method, latitude, longitude, distance_from_classroom, gps_accuracy) VALUES
-- CENG101 Session 1-6 (students 1-2)
(1, 1, 'PRESENT', DATE_SUB(NOW(), INTERVAL 21 DAY), 'GPS', 41.10528000, 29.02514000, 2.5, 5.0),
(1, 2, 'PRESENT', DATE_SUB(NOW(), INTERVAL 21 DAY), 'GPS', 41.10527500, 29.02513500, 1.2, 4.5),
(2, 1, 'PRESENT', DATE_SUB(NOW(), INTERVAL 19 DAY), 'QR_CODE', 41.10528100, 29.02514100, 3.0, 6.0),
(2, 2, 'LATE', DATE_SUB(NOW(), INTERVAL 19 DAY), 'GPS', 41.10527000, 29.02513000, 2.0, 5.0),
(3, 1, 'PRESENT', DATE_SUB(NOW(), INTERVAL 14 DAY), 'GPS', 41.10527900, 29.02513800, 1.5, 4.0),
(3, 2, 'PRESENT', DATE_SUB(NOW(), INTERVAL 14 DAY), 'GPS', 41.10527600, 29.02513600, 1.8, 4.2),
(4, 1, 'ABSENT', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, 'PRESENT', DATE_SUB(NOW(), INTERVAL 12 DAY), 'QR_CODE', 41.10527700, 29.02513700, 1.0, 3.5),
(5, 1, 'PRESENT', DATE_SUB(NOW(), INTERVAL 7 DAY), 'GPS', 41.10527800, 29.02513900, 0.5, 3.0),
(5, 2, 'PRESENT', DATE_SUB(NOW(), INTERVAL 7 DAY), 'GPS', 41.10528200, 29.02514200, 4.0, 6.5),
(6, 1, 'PRESENT', DATE_SUB(NOW(), INTERVAL 5 DAY), 'GPS', 41.10527750, 29.02513850, 1.0, 4.0),
(6, 2, 'LATE', DATE_SUB(NOW(), INTERVAL 5 DAY), 'GPS', 41.10528000, 29.02514000, 2.5, 5.0),
-- EEE101 (sessions 12-14, student 3)
(12, 3, 'PRESENT', DATE_SUB(NOW(), INTERVAL 21 DAY), 'GPS', 41.10540200, 29.02530200, 2.0, 5.0),
(13, 3, 'PRESENT', DATE_SUB(NOW(), INTERVAL 14 DAY), 'QR_CODE', 41.10540100, 29.02530100, 1.5, 4.0),
(14, 3, 'ABSENT', NULL, NULL, NULL, NULL, NULL, NULL),
-- ME101 (sessions 15-17, student 4)
(15, 4, 'PRESENT', DATE_SUB(NOW(), INTERVAL 20 DAY), 'GPS', 41.10530300, 29.02516400, 2.5, 5.5),
(16, 4, 'LATE', DATE_SUB(NOW(), INTERVAL 13 DAY), 'GPS', 41.10530200, 29.02516300, 2.0, 5.0),
(17, 4, 'PRESENT', DATE_SUB(NOW(), INTERVAL 6 DAY), 'GPS', 41.10530100, 29.02516200, 1.0, 4.0);

SELECT CONCAT('Total Attendance Records: ', COUNT(*)) AS info FROM attendance_records;

-- =============================================
-- PART 4: Analytics Data - Meal Reservations
-- =============================================
INSERT INTO meal_reservations (user_id, menu_id, cafeteria_id, reservation_date, meal_type, amount, qr_code, is_scholarship_used, status, used_at) VALUES
-- Bugünkü rezervasyonlar
(22, 1, 1, CURDATE(), 'LUNCH', 25.00, CONCAT('MR-TODAY-1-', UNIX_TIMESTAMP()), 0, 'RESERVED', NULL),
(23, 1, 1, CURDATE(), 'LUNCH', 25.00, CONCAT('MR-TODAY-2-', UNIX_TIMESTAMP()), 1, 'USED', NOW()),
(24, 1, 1, CURDATE(), 'LUNCH', 25.00, CONCAT('MR-TODAY-3-', UNIX_TIMESTAMP()), 0, 'USED', NOW()),
(25, 5, 2, CURDATE(), 'LUNCH', 22.00, CONCAT('MR-TODAY-4-', UNIX_TIMESTAMP()), 0, 'RESERVED', NULL),
(2, 2, 1, CURDATE(), 'DINNER', 25.00, CONCAT('MR-TODAY-5-', UNIX_TIMESTAMP()), 0, 'RESERVED', NULL),
-- Dünkü rezervasyonlar
(22, 1, 1, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'LUNCH', 25.00, CONCAT('MR-Y1-1-', UNIX_TIMESTAMP()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 1 DAY)),
(23, 1, 1, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'LUNCH', 25.00, CONCAT('MR-Y1-2-', UNIX_TIMESTAMP()), 1, 'USED', DATE_SUB(NOW(), INTERVAL 1 DAY)),
(24, 1, 1, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'LUNCH', 25.00, CONCAT('MR-Y1-3-', UNIX_TIMESTAMP()), 0, 'CANCELLED', NULL),
(3, 2, 1, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'DINNER', 25.00, CONCAT('MR-Y1-4-', UNIX_TIMESTAMP()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 1 DAY)),
-- Geçmiş hafta
(22, 1, 1, DATE_SUB(CURDATE(), INTERVAL 3 DAY), 'LUNCH', 25.00, CONCAT('MR-W1-1-', UNIX_TIMESTAMP()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 3 DAY)),
(22, 2, 1, DATE_SUB(CURDATE(), INTERVAL 3 DAY), 'DINNER', 25.00, CONCAT('MR-W1-2-', UNIX_TIMESTAMP()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 3 DAY)),
(23, 1, 1, DATE_SUB(CURDATE(), INTERVAL 4 DAY), 'LUNCH', 25.00, CONCAT('MR-W1-3-', UNIX_TIMESTAMP()), 1, 'USED', DATE_SUB(NOW(), INTERVAL 4 DAY)),
(24, 5, 2, DATE_SUB(CURDATE(), INTERVAL 5 DAY), 'LUNCH', 22.00, CONCAT('MR-W1-4-', UNIX_TIMESTAMP()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 5 DAY)),
(25, 1, 1, DATE_SUB(CURDATE(), INTERVAL 5 DAY), 'LUNCH', 25.00, CONCAT('MR-W1-5-', UNIX_TIMESTAMP()), 1, 'USED', DATE_SUB(NOW(), INTERVAL 5 DAY)),
(26, 1, 1, DATE_SUB(CURDATE(), INTERVAL 6 DAY), 'LUNCH', 25.00, CONCAT('MR-W1-6-', UNIX_TIMESTAMP()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 6 DAY)),
(22, 1, 1, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 'LUNCH', 25.00, CONCAT('MR-W2-1-', UNIX_TIMESTAMP()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 7 DAY)),
(23, 2, 1, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 'DINNER', 25.00, CONCAT('MR-W2-2-', UNIX_TIMESTAMP()), 0, 'USED', DATE_SUB(NOW(), INTERVAL 7 DAY));

SELECT CONCAT('Total Meal Reservations: ', COUNT(*)) AS info FROM meal_reservations;

-- =============================================
-- PART 4: Analytics Data - Event Registrations
-- =============================================
INSERT INTO event_registrations (event_id, user_id, registration_date, qr_code, checked_in, checked_in_at, status, waitlist_position) VALUES
-- Yazılım Kariyer Günleri (event_id=1)
(1, 22, DATE_SUB(NOW(), INTERVAL 3 DAY), CONCAT('ER-E1-1-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(1, 23, DATE_SUB(NOW(), INTERVAL 3 DAY), CONCAT('ER-E1-2-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(1, 24, DATE_SUB(NOW(), INTERVAL 2 DAY), CONCAT('ER-E1-3-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(1, 25, DATE_SUB(NOW(), INTERVAL 2 DAY), CONCAT('ER-E1-4-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(1, 26, DATE_SUB(NOW(), INTERVAL 1 DAY), CONCAT('ER-E1-5-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(1, 2, DATE_SUB(NOW(), INTERVAL 4 DAY), CONCAT('ER-E1-6-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(1, 3, DATE_SUB(NOW(), INTERVAL 4 DAY), CONCAT('ER-E1-7-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
-- React.js Workshop (event_id=2)
(2, 22, DATE_SUB(NOW(), INTERVAL 5 DAY), CONCAT('ER-E2-1-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(2, 23, DATE_SUB(NOW(), INTERVAL 4 DAY), CONCAT('ER-E2-2-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(2, 24, DATE_SUB(NOW(), INTERVAL 3 DAY), CONCAT('ER-E2-3-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(2, 2, DATE_SUB(NOW(), INTERVAL 6 DAY), CONCAT('ER-E2-4-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
-- AI Konferansı (event_id=3)
(3, 22, DATE_SUB(NOW(), INTERVAL 7 DAY), CONCAT('ER-E3-1-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(3, 23, DATE_SUB(NOW(), INTERVAL 7 DAY), CONCAT('ER-E3-2-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(3, 24, DATE_SUB(NOW(), INTERVAL 6 DAY), CONCAT('ER-E3-3-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(3, 25, DATE_SUB(NOW(), INTERVAL 6 DAY), CONCAT('ER-E3-4-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(3, 26, DATE_SUB(NOW(), INTERVAL 5 DAY), CONCAT('ER-E3-5-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(3, 2, DATE_SUB(NOW(), INTERVAL 8 DAY), CONCAT('ER-E3-6-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(3, 3, DATE_SUB(NOW(), INTERVAL 8 DAY), CONCAT('ER-E3-7-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(3, 4, DATE_SUB(NOW(), INTERVAL 9 DAY), CONCAT('ER-E3-8-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
-- Bahar Şenliği (event_id=4)
(4, 22, DATE_SUB(NOW(), INTERVAL 2 DAY), CONCAT('ER-E4-1-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(4, 23, DATE_SUB(NOW(), INTERVAL 2 DAY), CONCAT('ER-E4-2-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(4, 24, DATE_SUB(NOW(), INTERVAL 1 DAY), CONCAT('ER-E4-3-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL),
(4, 25, DATE_SUB(NOW(), INTERVAL 1 DAY), CONCAT('ER-E4-4-', UNIX_TIMESTAMP()), 0, NULL, 'REGISTERED', NULL);

-- Update event registered_count
UPDATE events SET registered_count = (SELECT COUNT(*) FROM event_registrations WHERE event_id = 1 AND status = 'REGISTERED') WHERE id = 1;
UPDATE events SET registered_count = (SELECT COUNT(*) FROM event_registrations WHERE event_id = 2 AND status = 'REGISTERED') WHERE id = 2;
UPDATE events SET registered_count = (SELECT COUNT(*) FROM event_registrations WHERE event_id = 3 AND status = 'REGISTERED') WHERE id = 3;
UPDATE events SET registered_count = (SELECT COUNT(*) FROM event_registrations WHERE event_id = 4 AND status = 'REGISTERED') WHERE id = 4;

SELECT CONCAT('Total Event Registrations: ', COUNT(*)) AS info FROM event_registrations;

-- =============================================
-- PART 4: Analytics Data - Enrollment Grades (GPA Distribution)
-- =============================================
-- Update existing enrollments with grades
UPDATE enrollments SET midterm_grade = 85.00, final_grade = 90.00, homework_grade = 88.00, letter_grade = 'AA', grade_point = 4.00, status = 'COMPLETED' WHERE id = 1;
UPDATE enrollments SET midterm_grade = 78.00, final_grade = 82.00, homework_grade = 80.00, letter_grade = 'BA', grade_point = 3.50, status = 'COMPLETED' WHERE id = 2;
UPDATE enrollments SET midterm_grade = 92.00, final_grade = 95.00, homework_grade = 90.00, letter_grade = 'AA', grade_point = 4.00, status = 'COMPLETED' WHERE id = 3;
UPDATE enrollments SET midterm_grade = 70.00, final_grade = 75.00, homework_grade = 72.00, letter_grade = 'BB', grade_point = 3.00, status = 'COMPLETED' WHERE id = 4;
UPDATE enrollments SET midterm_grade = 65.00, final_grade = 68.00, homework_grade = 70.00, letter_grade = 'CB', grade_point = 2.50, status = 'COMPLETED' WHERE id = 5;
UPDATE enrollments SET midterm_grade = 55.00, final_grade = 60.00, homework_grade = 58.00, letter_grade = 'CC', grade_point = 2.00, status = 'COMPLETED' WHERE id = 6;
UPDATE enrollments SET midterm_grade = 80.00, final_grade = 85.00, homework_grade = 82.00, letter_grade = 'BA', grade_point = 3.50, status = 'COMPLETED' WHERE id = 7;

-- Add more enrollments with grades for better distribution
INSERT INTO enrollments (student_id, section_id, status, midterm_grade, final_grade, homework_grade, letter_grade, grade_point) VALUES
(1, 5, 'COMPLETED', 88.00, 92.00, 85.00, 'AA', 4.00),
(1, 7, 'COMPLETED', 75.00, 78.00, 80.00, 'BB', 3.00),
(2, 5, 'COMPLETED', 95.00, 98.00, 92.00, 'AA', 4.00),
(2, 7, 'COMPLETED', 82.00, 88.00, 85.00, 'BA', 3.50),
(3, 12, 'COMPLETED', 60.00, 65.00, 62.00, 'CC', 2.00),
(4, 16, 'COMPLETED', 72.00, 78.00, 75.00, 'CB', 2.50),
(5, 20, 'COMPLETED', 85.00, 88.00, 82.00, 'BA', 3.50),
(3, 13, 'FAILED', 35.00, 40.00, 45.00, 'FF', 0.00);

SELECT CONCAT('Total Enrollments with grades: ', COUNT(*)) AS info FROM enrollments WHERE letter_grade IS NOT NULL;

-- =============================================
-- Full Seed Complete (All Parts including Part 4 Analytics)
-- =============================================
SELECT 'All seed data inserted successfully! (Part 1 + Part 2 + Part 3 + Part 4 + Analytics)' AS final_status;


