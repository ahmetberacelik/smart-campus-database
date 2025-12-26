-- =============================================
-- Seed: 19 - Enrollment Grades (Ders Notları)
-- Description: Analytics dashboard GPA dağılımı için not verileri
-- Part 4: Analytics desteği
-- =============================================

-- Mevcut enrollments için notları güncelle
-- Enrollment ID'ler: 1-7 (seed'deki kayıtlar)
-- Letter grades: AA(4.0), BA(3.5), BB(3.0), CB(2.5), CC(2.0), DC(1.5), DD(1.0), FF(0.0)

UPDATE enrollments SET 
    midterm_grade = 85.00,
    final_grade = 90.00,
    homework_grade = 88.00,
    letter_grade = 'AA',
    grade_point = 4.00,
    status = 'COMPLETED'
WHERE id = 1;

UPDATE enrollments SET 
    midterm_grade = 78.00,
    final_grade = 82.00,
    homework_grade = 80.00,
    letter_grade = 'BA',
    grade_point = 3.50,
    status = 'COMPLETED'
WHERE id = 2;

UPDATE enrollments SET 
    midterm_grade = 92.00,
    final_grade = 95.00,
    homework_grade = 90.00,
    letter_grade = 'AA',
    grade_point = 4.00,
    status = 'COMPLETED'
WHERE id = 3;

UPDATE enrollments SET 
    midterm_grade = 70.00,
    final_grade = 75.00,
    homework_grade = 72.00,
    letter_grade = 'BB',
    grade_point = 3.00,
    status = 'COMPLETED'
WHERE id = 4;

UPDATE enrollments SET 
    midterm_grade = 65.00,
    final_grade = 68.00,
    homework_grade = 70.00,
    letter_grade = 'CB',
    grade_point = 2.50,
    status = 'COMPLETED'
WHERE id = 5;

UPDATE enrollments SET 
    midterm_grade = 55.00,
    final_grade = 60.00,
    homework_grade = 58.00,
    letter_grade = 'CC',
    grade_point = 2.00,
    status = 'COMPLETED'
WHERE id = 6;

UPDATE enrollments SET 
    midterm_grade = 80.00,
    final_grade = 85.00,
    homework_grade = 82.00,
    letter_grade = 'BA',
    grade_point = 3.50,
    status = 'COMPLETED'
WHERE id = 7;

-- Daha fazla çeşitlilik için yeni enrollment ve not verileri ekle
-- Farklı section'lara farklı öğrenciler kaydet

-- Öğrenci 1 (Ali) - Daha fazla ders
INSERT INTO enrollments (student_id, section_id, status, midterm_grade, final_grade, homework_grade, letter_grade, grade_point) VALUES
(1, 5, 'COMPLETED', 88.00, 92.00, 85.00, 'AA', 4.00),  -- CENG201
(1, 7, 'COMPLETED', 75.00, 78.00, 80.00, 'BB', 3.00);  -- CENG301

-- Öğrenci 2 (Zeynep) - Daha fazla ders
INSERT INTO enrollments (student_id, section_id, status, midterm_grade, final_grade, homework_grade, letter_grade, grade_point) VALUES
(2, 5, 'COMPLETED', 95.00, 98.00, 92.00, 'AA', 4.00),  -- CENG201
(2, 7, 'COMPLETED', 82.00, 88.00, 85.00, 'BA', 3.50);  -- CENG301

-- Öğrenci 3 (Mehmet - EEE) - Daha fazla ders
INSERT INTO enrollments (student_id, section_id, status, midterm_grade, final_grade, homework_grade, letter_grade, grade_point) VALUES
(3, 12, 'COMPLETED', 60.00, 65.00, 62.00, 'CC', 2.00);  -- EEE201

-- Öğrenci 4 (Fatma - ME) - Daha fazla ders
INSERT INTO enrollments (student_id, section_id, status, midterm_grade, final_grade, homework_grade, letter_grade, grade_point) VALUES
(4, 16, 'COMPLETED', 72.00, 78.00, 75.00, 'CB', 2.50);  -- ME201

-- Öğrenci 5 (Emre - BA) - Daha fazla ders
INSERT INTO enrollments (student_id, section_id, status, midterm_grade, final_grade, homework_grade, letter_grade, grade_point) VALUES
(5, 20, 'COMPLETED', 85.00, 88.00, 82.00, 'BA', 3.50);  -- BA201

-- FF notu olan birkaç kayıt (başarısız)
INSERT INTO enrollments (student_id, section_id, status, midterm_grade, final_grade, homework_grade, letter_grade, grade_point) VALUES
(3, 13, 'FAILED', 35.00, 40.00, 45.00, 'FF', 0.00);  -- EEE301 - Başarısız

SELECT CONCAT('Enrollment grades updated and added: ', (SELECT COUNT(*) FROM enrollments WHERE letter_grade IS NOT NULL)) AS info;
