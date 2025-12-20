-- Seed: Etkinlikler
-- Part 3: Event Management
-- 5 örnek etkinlik

-- Admin kullanıcının ID'sini al
SET @admin_id = (SELECT id FROM users WHERE role = 'ADMIN' LIMIT 1);

INSERT INTO events (title, description, category, event_date, start_time, end_time, location, capacity, registered_count, registration_deadline, is_paid, price, organizer_id, status) VALUES

-- Kariyer Etkinliği
('Yazılım Kariyer Günleri 2025', 
 'Türkiye''nin önde gelen teknoloji şirketlerinden uzmanlarla kariyer fırsatlarını keşfedin. Staj ve iş imkanları hakkında bilgi alın.',
 'CAREER', 
 DATE_ADD(CURDATE(), INTERVAL 7 DAY), 
 '10:00:00', '17:00:00',
 'Kongre Merkezi, Ana Salon',
 300, 0,
 DATE_ADD(CURDATE(), INTERVAL 5 DAY),
 0, 0.00,
 @admin_id,
 'PUBLISHED'),

-- Workshop
('React.js Workshop', 
 'React.js ile modern web uygulaması geliştirmeyi öğrenin. Hooks, Context API ve best practices konuları işlenecek.',
 'WORKSHOP', 
 DATE_ADD(CURDATE(), INTERVAL 10 DAY), 
 '14:00:00', '18:00:00',
 'Bilgisayar Merkezi, LAB-1',
 30, 0,
 DATE_ADD(CURDATE(), INTERVAL 8 DAY),
 1, 50.00,
 @admin_id,
 'PUBLISHED'),

-- Konferans
('Yapay Zeka ve Gelecek Konferansı', 
 'AI, Machine Learning ve Deep Learning konularında akademisyenler ve sektör profesyonelleri sunum yapacak.',
 'CONFERENCE', 
 DATE_ADD(CURDATE(), INTERVAL 14 DAY), 
 '09:00:00', '18:00:00',
 'Mühendislik A, A-201 Amfi',
 150, 0,
 DATE_ADD(CURDATE(), INTERVAL 12 DAY),
 0, 0.00,
 @admin_id,
 'PUBLISHED'),

-- Sosyal Etkinlik
('Bahar Şenliği 2025', 
 'Canlı müzik, yemek standları ve eğlenceli aktivitelerle dolu bir gün. Tüm kampüs ailesine açıktır.',
 'SOCIAL', 
 DATE_ADD(CURDATE(), INTERVAL 21 DAY), 
 '12:00:00', '22:00:00',
 'Merkez Kampüs Çim Alan',
 1000, 0,
 DATE_ADD(CURDATE(), INTERVAL 20 DAY),
 0, 0.00,
 @admin_id,
 'PUBLISHED'),

-- Spor Etkinliği
('Fakülteler Arası Futbol Turnuvası', 
 'Fakülteler arası futbol turnuvası başlıyor! Takımınızı oluşturun ve şampiyonluk için yarışın.',
 'SPORTS', 
 DATE_ADD(CURDATE(), INTERVAL 30 DAY), 
 '10:00:00', '18:00:00',
 'Spor Kompleksi Futbol Sahası',
 200, 0,
 DATE_ADD(CURDATE(), INTERVAL 25 DAY),
 0, 0.00,
 @admin_id,
 'DRAFT');
