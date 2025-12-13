-- Seed: Dersler
-- Part 2: Akademik Yönetim

INSERT INTO courses (code, name, description, credits, ects, department_id) VALUES
-- Bilgisayar Mühendisliği Dersleri (department_id = 1)
('CENG101', 'Programlamaya Giriş', 'Temel programlama kavramları ve algoritma geliştirme', 4, 6, 1),
('CENG102', 'Programlama Lab', 'Programlama uygulamaları laboratuvarı', 2, 3, 1),
('CENG201', 'Veri Yapıları', 'Temel veri yapıları ve algoritmalar', 4, 6, 1),
('CENG202', 'Nesne Yönelimli Programlama', 'OOP prensipleri ve Java/C++ uygulamaları', 3, 5, 1),
('CENG301', 'Veritabanı Sistemleri', 'İlişkisel veritabanları ve SQL', 3, 5, 1),
('CENG302', 'İşletim Sistemleri', 'İşletim sistemi kavramları ve yönetimi', 3, 5, 1),
('CENG401', 'Yazılım Mühendisliği', 'Yazılım geliştirme süreçleri ve metodolojileri', 3, 5, 1),
('CENG402', 'Web Programlama', 'Modern web teknolojileri ve uygulama geliştirme', 3, 5, 1),

-- Elektrik-Elektronik Mühendisliği Dersleri (department_id = 2)
('EEE101', 'Devre Analizi', 'Temel elektrik devre analizi', 4, 6, 2),
('EEE201', 'Elektronik I', 'Analog elektronik devreleri', 3, 5, 2),
('EEE301', 'Sinyal ve Sistemler', 'Sürekli ve ayrık zamanlı sinyaller', 3, 5, 2),
('EEE401', 'Haberleşme Sistemleri', 'Analog ve dijital haberleşme', 3, 5, 2),

-- Makine Mühendisliği Dersleri (department_id = 3)
('ME101', 'Statik', 'Mühendislik mekaniği temelleri', 3, 5, 3),
('ME201', 'Dinamik', 'Hareket ve kuvvet analizi', 3, 5, 3),
('ME301', 'Termodinamik', 'Enerji dönüşüm prensipleri', 3, 5, 3),
('ME401', 'Makine Tasarımı', 'Mekanik sistem tasarımı', 3, 5, 3),

-- İşletme Dersleri (department_id = 4)
('BA101', 'İşletmeye Giriş', 'Temel işletme kavramları', 3, 5, 4),
('BA201', 'Muhasebe Prensipleri', 'Finansal muhasebe temelleri', 3, 5, 4),
('BA301', 'Pazarlama Yönetimi', 'Pazarlama stratejileri ve uygulamaları', 3, 5, 4),
('BA401', 'Stratejik Yönetim', 'Kurumsal strateji geliştirme', 3, 5, 4);
