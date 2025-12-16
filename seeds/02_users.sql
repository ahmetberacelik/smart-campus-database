-- =============================================
-- Seed: 02 - Users (Kullanıcılar)
-- Description: Test kullanıcıları (1 Admin, 2 Faculty, 5 Student)
-- Password: password123 (BCrypt hash - Spring Security uyumlu)
-- Generated: 2024-12-16 with BCryptPasswordEncoder(10)
-- =============================================

-- Admin Kullanıcı
INSERT INTO users (email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active) VALUES
('admin@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Sistem', 'Admin', '05001234567', 'ADMIN', 1, 1);

-- Öğretim Üyeleri
INSERT INTO users (email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active) VALUES
('ahmet.yilmaz@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Ahmet', 'Yılmaz', '05321234567', 'FACULTY', 1, 1),
('ayse.demir@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Ayşe', 'Demir', '05331234567', 'FACULTY', 1, 1);

-- Öğrenciler
INSERT INTO users (email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active) VALUES
('ali.kaya@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Ali', 'Kaya', '05411234567', 'STUDENT', 1, 1),
('zeynep.celik@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Zeynep', 'Çelik', '05421234567', 'STUDENT', 1, 1),
('mehmet.ozturk@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Mehmet', 'Öztürk', '05431234567', 'STUDENT', 1, 1),
('fatma.sahin@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Fatma', 'Şahin', '05441234567', 'STUDENT', 1, 1),
('emre.arslan@smartcampus.edu.tr', '$2a$10$eWvsw2Zlfdu181oYqXvHBuTEagcp4OQbA.5oyGmrSF5s0BgpyUY8u', 'Emre', 'Arslan', '05451234567', 'STUDENT', 1, 1);


