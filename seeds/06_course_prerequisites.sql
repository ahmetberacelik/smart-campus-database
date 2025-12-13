-- Seed: Ön Koşul Dersleri
-- Part 2: Akademik Yönetim

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
