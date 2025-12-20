-- Seed: Cüzdanlar
-- Part 3: Meal Service
-- Tüm mevcut kullanıcılar için cüzdan oluştur

-- Öğrenciler için cüzdan (bazıları burslu)
INSERT INTO wallets (user_id, balance, is_scholarship, daily_scholarship_limit, is_active)
SELECT 
    u.id,
    CASE 
        WHEN s.student_number IN ('20210001', '20210002') THEN 0.00  -- Burslu öğrenciler
        ELSE ROUND(50 + RAND() * 200, 2)  -- Diğerleri için rastgele bakiye
    END,
    CASE 
        WHEN s.student_number IN ('20210001', '20210002') THEN 1  -- Burslu
        ELSE 0
    END,
    2,
    1
FROM users u
INNER JOIN students s ON u.id = s.user_id
WHERE u.role = 'STUDENT';

-- Öğretim üyeleri için cüzdan
INSERT INTO wallets (user_id, balance, is_scholarship, is_active)
SELECT 
    u.id,
    ROUND(100 + RAND() * 300, 2),
    0,
    1
FROM users u
INNER JOIN faculty f ON u.id = f.user_id
WHERE u.role = 'FACULTY';

-- Admin için cüzdan
INSERT INTO wallets (user_id, balance, is_scholarship, is_active)
SELECT 
    u.id,
    500.00,
    0,
    1
FROM users u
WHERE u.role = 'ADMIN';
