-- =============================================
-- Seed: 04 - Faculty (Öğretim Üyesi Detayları)
-- Description: Öğretim üyesi bilgileri
-- =============================================

-- Dr. Ahmet Yılmaz - Bilgisayar Mühendisliği
INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP001', 'Dr. Öğr. Üyesi', 'Mühendislik Fakültesi A-101'
FROM users u, departments d
WHERE u.email = 'ahmet.yilmaz@smartcampus.edu.tr' AND d.code = 'CENG';

-- Prof. Dr. Ayşe Demir - Elektrik-Elektronik Mühendisliği
INSERT INTO faculty (user_id, department_id, employee_number, title, office_location)
SELECT u.id, d.id, 'EMP002', 'Prof. Dr.', 'Mühendislik Fakültesi B-205'
FROM users u, departments d
WHERE u.email = 'ayse.demir@smartcampus.edu.tr' AND d.code = 'EEE';


