-- Seed: Ders Kayıtları
-- Part 2: Akademik Yönetim
-- Tüm 5 öğrenci 2024 FALL dönemindeki derslere kayıtlı

-- Öğrenci user ID'leri (users tablosundaki sıralama):
-- user_id=21: Mehmet Demir (CENG öğrencisi)
-- user_id=22: Zeynep Çelik (CENG öğrencisi)
-- user_id=23: Ali Öztürk (EEE öğrencisi)
-- user_id=24: Fatma Şahin (ME öğrencisi)
-- user_id=25: Emre Aydın (BA öğrencisi)

-- 2024 FALL dönemi dersleri için enrollment kayıtları
-- section_id'leri dinamik olarak sorgula (hardcoded ID'ler veritabanına bağlı olarak değişebilir)

-- Önce mevcut enrollments'ları temizle (yeniden oluşturmak için)
DELETE FROM enrollments WHERE student_id IN (21, 22, 23, 24, 25);

-- CENG öğrencileri (Mehmet Demir - user_id=21, Zeynep Çelik - user_id=22)
-- CENG101 (course_id=1), CENG102 (course_id=2), CENG301 (course_id=5) derslerine kayıt
INSERT INTO enrollments (student_id, section_id, status)
SELECT 21, cs.id, 'ENROLLED'
FROM course_sections cs
WHERE cs.course_id = 1 AND cs.semester = 'FALL' AND cs.year = 2024;

INSERT INTO enrollments (student_id, section_id, status)
SELECT 21, cs.id, 'ENROLLED'
FROM course_sections cs
WHERE cs.course_id = 2 AND cs.semester = 'FALL' AND cs.year = 2024;

INSERT INTO enrollments (student_id, section_id, status)
SELECT 22, cs.id, 'ENROLLED'
FROM course_sections cs
WHERE cs.course_id = 1 AND cs.semester = 'FALL' AND cs.year = 2024;

INSERT INTO enrollments (student_id, section_id, status)
SELECT 22, cs.id, 'ENROLLED'
FROM course_sections cs
WHERE cs.course_id = 2 AND cs.semester = 'FALL' AND cs.year = 2024;

INSERT INTO enrollments (student_id, section_id, status)
SELECT 22, cs.id, 'ENROLLED'
FROM course_sections cs
WHERE cs.course_id = 5 AND cs.semester = 'FALL' AND cs.year = 2024;

-- EEE öğrencisi (Ali Öztürk - user_id=23)
-- EEE101 (course_id=9), EEE201 (course_id=10) derslerine kayıt
INSERT INTO enrollments (student_id, section_id, status)
SELECT 23, cs.id, 'ENROLLED'
FROM course_sections cs
WHERE cs.course_id = 9 AND cs.semester = 'FALL' AND cs.year = 2024;

INSERT INTO enrollments (student_id, section_id, status)
SELECT 23, cs.id, 'ENROLLED'
FROM course_sections cs
WHERE cs.course_id = 10 AND cs.semester = 'FALL' AND cs.year = 2024;

-- ME öğrencisi (Fatma Şahin - user_id=24)
-- ME101 (course_id=13), ME201 (course_id=14) derslerine kayıt
INSERT INTO enrollments (student_id, section_id, status)
SELECT 24, cs.id, 'ENROLLED'
FROM course_sections cs
WHERE cs.course_id = 13 AND cs.semester = 'FALL' AND cs.year = 2024;

INSERT INTO enrollments (student_id, section_id, status)
SELECT 24, cs.id, 'ENROLLED'
FROM course_sections cs
WHERE cs.course_id = 14 AND cs.semester = 'FALL' AND cs.year = 2024;

-- BA öğrencisi (Emre Aydın - user_id=25)
-- BA101 (course_id=17), BA201 (course_id=18) derslerine kayıt
INSERT INTO enrollments (student_id, section_id, status)
SELECT 25, cs.id, 'ENROLLED'
FROM course_sections cs
WHERE cs.course_id = 17 AND cs.semester = 'FALL' AND cs.year = 2024;

INSERT INTO enrollments (student_id, section_id, status)
SELECT 25, cs.id, 'ENROLLED'
FROM course_sections cs
WHERE cs.course_id = 18 AND cs.semester = 'FALL' AND cs.year = 2024;

-- Enrollment kayıtlarını kontrol et
SELECT 
    e.id as enrollment_id,
    u.first_name,
    u.last_name,
    c.code as course_code,
    c.name as course_name,
    cs.semester,
    cs.year,
    e.status
FROM enrollments e
JOIN users u ON e.student_id = u.id
JOIN course_sections cs ON e.section_id = cs.id
JOIN courses c ON cs.course_id = c.id
WHERE e.student_id IN (21, 22, 23, 24, 25)
ORDER BY u.last_name, c.code;
