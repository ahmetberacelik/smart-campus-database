-- Seed: Yemek Menüleri
-- Part 3: Meal Service
-- Örnek 1 haftalık menü (bugünden itibaren)

-- Ana Yemekhane için Öğle Menüleri
INSERT INTO meal_menus (cafeteria_id, menu_date, meal_type, items_json, nutrition_json, price, is_vegan, is_vegetarian, is_published) VALUES
-- Pazartesi
(1, CURDATE(), 'LUNCH', 
 '{"main": "Tavuk Sote", "soup": "Mercimek Çorbası", "side": "Pilav", "salad": "Mevsim Salata", "dessert": "Sütlaç"}',
 '{"calories": 850, "protein": 35, "carbs": 95, "fat": 28}',
 25.00, 0, 0, 1),
(1, CURDATE(), 'DINNER', 
 '{"main": "Karnıyarık", "soup": "Ezogelin Çorbası", "side": "Bulgur Pilavı", "salad": "Cacık", "dessert": "Meyve"}',
 '{"calories": 780, "protein": 22, "carbs": 88, "fat": 32}',
 25.00, 0, 0, 1),

-- Salı
(1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'LUNCH', 
 '{"main": "Izgara Köfte", "soup": "Domates Çorbası", "side": "Makarna", "salad": "Çoban Salata", "dessert": "Baklava"}',
 '{"calories": 920, "protein": 42, "carbs": 78, "fat": 38}',
 28.00, 0, 0, 1),
(1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'DINNER', 
 '{"main": "Sebzeli Güveç", "soup": "Yayla Çorbası", "side": "Pirinç Pilavı", "salad": "Turşu", "dessert": "Komposto"}',
 '{"calories": 650, "protein": 18, "carbs": 82, "fat": 22}',
 22.00, 1, 1, 1),

-- Çarşamba
(1, DATE_ADD(CURDATE(), INTERVAL 2 DAY), 'LUNCH', 
 '{"main": "Balık Tava", "soup": "Balık Çorbası", "side": "Patates Kızartması", "salad": "Roka Salata", "dessert": "Helva"}',
 '{"calories": 880, "protein": 38, "carbs": 68, "fat": 42}',
 35.00, 0, 0, 1),

-- Perşembe
(1, DATE_ADD(CURDATE(), INTERVAL 3 DAY), 'LUNCH', 
 '{"main": "Etli Nohut", "soup": "Tarhana Çorbası", "side": "Pirinç Pilavı", "salad": "Havuç Tarator", "dessert": "Puding"}',
 '{"calories": 820, "protein": 32, "carbs": 92, "fat": 28}',
 25.00, 0, 0, 1),

-- Cuma
(1, DATE_ADD(CURDATE(), INTERVAL 4 DAY), 'LUNCH', 
 '{"main": "Mantı", "soup": "Mercimek Çorbası", "side": "Yoğurt", "salad": "Mevsim Salata", "dessert": "Kadayıf"}',
 '{"calories": 750, "protein": 25, "carbs": 88, "fat": 30}',
 30.00, 0, 1, 1);

-- Mühendislik Yemekhanesi için Öğle Menüleri
INSERT INTO meal_menus (cafeteria_id, menu_date, meal_type, items_json, nutrition_json, price, is_vegan, is_vegetarian, is_published) VALUES
(2, CURDATE(), 'LUNCH', 
 '{"main": "Tavuk Döner", "soup": "Mercimek Çorbası", "side": "Pilav", "salad": "Mevsim Salata", "dessert": "Meyve"}',
 '{"calories": 780, "protein": 32, "carbs": 85, "fat": 26}',
 22.00, 0, 0, 1),
(2, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'LUNCH', 
 '{"main": "Falafel", "soup": "Sebze Çorbası", "side": "Humus", "salad": "Akdeniz Salata", "dessert": "Baklava"}',
 '{"calories": 680, "protein": 18, "carbs": 78, "fat": 32}',
 20.00, 1, 1, 1);
