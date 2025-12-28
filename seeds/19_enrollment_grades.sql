-- =============================================
-- Seed: 19 - Enrollment Grades (Ders Notları)
-- Description: Analytics dashboard GPA dağılımı için not verileri
-- Part 4: Analytics desteği
-- =============================================

-- Mevcut enrollments için notları güncelle
-- Enrollment ID'ler: 1-10 (seed'deki kayıtlar)
-- Letter grades: AA(4.0), BA(3.5), BB(3.0), CB(2.5), CC(2.0), DC(1.5), DD(1.0), FF(0.0)

-- Öğrenci 1 - CENG101
UPDATE enrollments SET 
    midterm_grade = 85.00,
    final_grade = 90.00,
    homework_grade = 88.00,
    letter_grade = 'AA',
    grade_point = 4.00,
    status = 'COMPLETED'
WHERE id = 1;

-- Öğrenci 1 - CENG102
UPDATE enrollments SET 
    midterm_grade = 78.00,
    final_grade = 82.00,
    homework_grade = 80.00,
    letter_grade = 'BA',
    grade_point = 3.50,
    status = 'COMPLETED'
WHERE id = 2;

-- Öğrenci 2 - CENG101
UPDATE enrollments SET 
    midterm_grade = 92.00,
    final_grade = 95.00,
    homework_grade = 90.00,
    letter_grade = 'AA',
    grade_point = 4.00,
    status = 'COMPLETED'
WHERE id = 3;

-- Öğrenci 2 - CENG102
UPDATE enrollments SET 
    midterm_grade = 70.00,
    final_grade = 75.00,
    homework_grade = 72.00,
    letter_grade = 'BB',
    grade_point = 3.00,
    status = 'COMPLETED'
WHERE id = 4;

-- Öğrenci 3 - EEE101
UPDATE enrollments SET 
    midterm_grade = 65.00,
    final_grade = 68.00,
    homework_grade = 70.00,
    letter_grade = 'CB',
    grade_point = 2.50,
    status = 'COMPLETED'
WHERE id = 5;

-- Öğrenci 3 - EEE201
UPDATE enrollments SET 
    midterm_grade = 55.00,
    final_grade = 60.00,
    homework_grade = 58.00,
    letter_grade = 'CC',
    grade_point = 2.00,
    status = 'COMPLETED'
WHERE id = 6;

-- Öğrenci 4 - ME101
UPDATE enrollments SET 
    midterm_grade = 80.00,
    final_grade = 85.00,
    homework_grade = 82.00,
    letter_grade = 'BA',
    grade_point = 3.50,
    status = 'COMPLETED'
WHERE id = 7;

-- Öğrenci 4 - ME201
UPDATE enrollments SET 
    midterm_grade = 72.00,
    final_grade = 78.00,
    homework_grade = 75.00,
    letter_grade = 'CB',
    grade_point = 2.50,
    status = 'COMPLETED'
WHERE id = 8;

-- Öğrenci 5 - BA101
UPDATE enrollments SET 
    midterm_grade = 88.00,
    final_grade = 92.00,
    homework_grade = 85.00,
    letter_grade = 'AA',
    grade_point = 4.00,
    status = 'COMPLETED'
WHERE id = 9;

-- Öğrenci 5 - BA201
UPDATE enrollments SET 
    midterm_grade = 75.00,
    final_grade = 78.00,
    homework_grade = 80.00,
    letter_grade = 'BB',
    grade_point = 3.00,
    status = 'COMPLETED'
WHERE id = 10;

SELECT CONCAT('Enrollment grades updated: ', (SELECT COUNT(*) FROM enrollments WHERE letter_grade IS NOT NULL)) AS info;
