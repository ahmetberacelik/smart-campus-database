-- Seed: Ders Bölümleri
-- Part 2: Akademik Yönetim
-- Çoklu Yıl ve Dönem Verileri (2021-2026)
-- NOT: Her ders her dönemde yalnızca bir kez açılabilir (tek section)

INSERT INTO course_sections (course_id, section_number, semester, year, instructor_id, classroom_id, capacity, enrolled_count, schedule_json) VALUES

-- =============================================
-- 2021-2022 AKADEMİK YILI
-- =============================================

-- 2021 FALL (Güz Dönemi)
(1, '01', 'FALL', 2021, 1, 1, 60, 58, '{"slots": [{"day": "MONDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}, {"day": "WEDNESDAY", "start": "09:00", "end": "10:50", "classroom_id": 1}]}'),
(2, '01', 'FALL', 2021, 1, 7, 30, 30, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 7}]}'),
(9, '01', 'FALL', 2021, 2, 5, 50, 48, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}]}'),
(13, '01', 'FALL', 2021, 1, 3, 45, 42, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}]}'),
(17, '01', 'FALL', 2021, 2, 10, 100, 95, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 10}]}'),

-- 2022 SPRING (Bahar Dönemi)
(3, '01', 'SPRING', 2022, 1, 5, 50, 48, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
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
(2, '01', 'FALL', 2023, 1, 7, 30, 30, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 7}]}'),
(5, '01', 'FALL', 2023, 2, 2, 40, 40, '{"slots": [{"day": "MONDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}, {"day": "WEDNESDAY", "start": "13:00", "end": "14:50", "classroom_id": 2}]}'),
(6, '01', 'FALL', 2023, 1, 4, 40, 38, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 4}]}'),
(9, '01', 'FALL', 2023, 2, 5, 50, 50, '{"slots": [{"day": "MONDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}, {"day": "WEDNESDAY", "start": "11:00", "end": "12:50", "classroom_id": 5}]}'),
(13, '01', 'FALL', 2023, 1, 3, 45, 45, '{"slots": [{"day": "TUESDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}, {"day": "THURSDAY", "start": "13:00", "end": "14:50", "classroom_id": 3}]}'),
(17, '01', 'FALL', 2023, 2, 10, 100, 100, '{"slots": [{"day": "FRIDAY", "start": "09:00", "end": "11:50", "classroom_id": 10}]}'),

-- 2024 SPRING (Bahar Dönemi)
(3, '01', 'SPRING', 2024, 1, 5, 50, 50, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
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
(2, '01', 'FALL', 2024, 1, 7, 30, 25, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 7}]}'),
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

-- 2025 SPRING (Bahar Dönemi) - Planlanan
(3, '01', 'SPRING', 2025, 1, 5, 50, 0, '{"slots": [{"day": "TUESDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}, {"day": "THURSDAY", "start": "09:00", "end": "10:50", "classroom_id": 5}]}'),
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
(2, '01', 'FALL', 2025, 1, 7, 30, 0, '{"slots": [{"day": "FRIDAY", "start": "13:00", "end": "15:50", "classroom_id": 7}]}'),
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
