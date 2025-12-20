-- Seed: Ders Programları
-- Part 3: Course Scheduling
-- Mevcut course_sections için örnek program

-- course_sections tablosundaki veriler için schedule ekle
-- Her section için haftada 2 gün ders

INSERT INTO schedules (section_id, day_of_week, start_time, end_time, classroom_id)
SELECT 
    cs.id,
    CASE (cs.id % 5)
        WHEN 0 THEN 'MONDAY'
        WHEN 1 THEN 'TUESDAY'
        WHEN 2 THEN 'WEDNESDAY'
        WHEN 3 THEN 'THURSDAY'
        WHEN 4 THEN 'FRIDAY'
    END,
    CASE (cs.id % 4)
        WHEN 0 THEN '09:00:00'
        WHEN 1 THEN '11:00:00'
        WHEN 2 THEN '14:00:00'
        WHEN 3 THEN '16:00:00'
    END,
    CASE (cs.id % 4)
        WHEN 0 THEN '10:30:00'
        WHEN 1 THEN '12:30:00'
        WHEN 2 THEN '15:30:00'
        WHEN 3 THEN '17:30:00'
    END,
    COALESCE(cs.classroom_id, (SELECT id FROM classrooms LIMIT 1))
FROM course_sections cs
WHERE cs.classroom_id IS NOT NULL
LIMIT 20;
