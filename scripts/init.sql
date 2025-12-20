-- =============================================
-- Smart Campus Database - Initialization Script
-- Description: Tüm tabloları oluşturur (Migration V1-V13)
-- Part 1: Kimlik Doğrulama ve Kullanıcı Yönetimi
-- Part 2: Akademik Yönetim ve GPS Yoklama
-- Usage: Docker container başlatıldığında otomatik çalışır
-- =============================================

-- Database ayarları
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- =============================================
-- V1: Departments Table
-- =============================================
CREATE TABLE IF NOT EXISTS departments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT 'Bölüm adı',
    code VARCHAR(10) NOT NULL UNIQUE COMMENT 'Bölüm kodu (Örn: CENG)',
    faculty_name VARCHAR(100) NOT NULL COMMENT 'Bağlı olduğu fakülte adı',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_department_code (code),
    INDEX idx_department_faculty (faculty_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V2: Users Table
-- =============================================
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL UNIQUE COMMENT 'Kullanıcı e-posta adresi (Giriş için)',
    password_hash VARCHAR(255) NOT NULL COMMENT 'BCrypt ile hashlenmiş şifre',
    first_name VARCHAR(50) NOT NULL COMMENT 'Ad',
    last_name VARCHAR(50) NOT NULL COMMENT 'Soyad',
    phone_number VARCHAR(20) NULL COMMENT 'Telefon numarası',
    profile_picture VARCHAR(255) NULL COMMENT 'Profil fotoğrafı dosya yolu/URL',
    role ENUM('STUDENT', 'FACULTY', 'ADMIN') NOT NULL COMMENT 'Kullanıcı rolü',
    is_verified TINYINT(1) DEFAULT 0 COMMENT 'Email doğrulaması yapıldı mı?',
    is_active TINYINT(1) DEFAULT 1 COMMENT 'Hesap aktif mi?',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Kayıt olma tarihi',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Son güncelleme tarihi',
    deleted_at TIMESTAMP NULL COMMENT 'Soft delete zaman damgası',
    
    INDEX idx_users_email (email),
    INDEX idx_users_role (role),
    INDEX idx_users_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V3: Students Table
-- =============================================
CREATE TABLE IF NOT EXISTS students (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE COMMENT 'users tablosuna referans',
    department_id BIGINT NOT NULL COMMENT 'departments tablosuna referans',
    student_number VARCHAR(20) NOT NULL UNIQUE COMMENT 'Okul numarası',
    enrollment_date DATE NULL COMMENT 'Kayıt tarihi',
    gpa DECIMAL(3,2) DEFAULT 0.00 COMMENT 'Dönem ortalaması',
    cgpa DECIMAL(3,2) DEFAULT 0.00 COMMENT 'Genel not ortalaması',
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE RESTRICT,
    
    INDEX idx_students_number (student_number),
    INDEX idx_students_department (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V4: Faculty Table
-- =============================================
CREATE TABLE IF NOT EXISTS faculty (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE COMMENT 'users tablosuna referans',
    department_id BIGINT NOT NULL COMMENT 'departments tablosuna referans',
    employee_number VARCHAR(20) NOT NULL UNIQUE COMMENT 'Sicil numarası',
    title VARCHAR(50) NOT NULL COMMENT 'Unvan (Dr., Prof., Arş. Gör. vb.)',
    office_location VARCHAR(100) NULL COMMENT 'Ofis konumu',
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE RESTRICT,
    
    INDEX idx_faculty_employee_number (employee_number),
    INDEX idx_faculty_department (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V5: Authentication Tables
-- =============================================

-- Refresh Token Tablosu
CREATE TABLE IF NOT EXISTS refresh_tokens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT 'Token sahibi kullanıcı',
    token VARCHAR(255) NOT NULL UNIQUE COMMENT 'Refresh token string',
    expiry_date TIMESTAMP NOT NULL COMMENT 'Token geçerlilik süresi',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    
    INDEX idx_refresh_tokens_user (user_id),
    INDEX idx_refresh_tokens_expiry (expiry_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Email Doğrulama Tokenları Tablosu
CREATE TABLE IF NOT EXISTS email_verification_tokens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT 'Doğrulanacak kullanıcı',
    token VARCHAR(255) NOT NULL UNIQUE COMMENT 'Doğrulama token',
    expiry_date TIMESTAMP NOT NULL COMMENT 'Geçerlilik süresi (24 saat)',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    
    INDEX idx_email_verification_user (user_id),
    INDEX idx_email_verification_expiry (expiry_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Şifre Sıfırlama Tokenları Tablosu
CREATE TABLE IF NOT EXISTS password_reset_tokens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT 'Şifresini sıfırlayan kullanıcı',
    token VARCHAR(255) NOT NULL UNIQUE COMMENT 'Reset token',
    expiry_date TIMESTAMP NOT NULL COMMENT 'Geçerlilik süresi (15 dakika)',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    
    INDEX idx_password_reset_user (user_id),
    INDEX idx_password_reset_expiry (expiry_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V6: Courses Table (Part 2)
-- =============================================
CREATE TABLE IF NOT EXISTS courses (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE COMMENT 'Ders kodu (Örn: CENG301)',
    name VARCHAR(150) NOT NULL COMMENT 'Ders adı',
    description TEXT COMMENT 'Ders açıklaması',
    credits INT NOT NULL DEFAULT 3 COMMENT 'Kredi sayısı',
    ects INT NOT NULL DEFAULT 5 COMMENT 'ECTS kredisi',
    department_id BIGINT NOT NULL COMMENT 'Bağlı olduğu bölüm',
    syllabus_url VARCHAR(255) COMMENT 'Ders izlencesi URL',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE RESTRICT,
    
    INDEX idx_courses_code (code),
    INDEX idx_courses_department (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V7: Course Prerequisites Table (Part 2)
-- =============================================
CREATE TABLE IF NOT EXISTS course_prerequisites (
    course_id BIGINT NOT NULL COMMENT 'Ana ders',
    prerequisite_id BIGINT NOT NULL COMMENT 'Ön koşul ders',
    
    PRIMARY KEY (course_id, prerequisite_id),
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (prerequisite_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V8: Classrooms Table (Part 2) - MUST BE BEFORE course_sections
-- =============================================
CREATE TABLE IF NOT EXISTS classrooms (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    building VARCHAR(50) NOT NULL COMMENT 'Bina adı',
    room_number VARCHAR(20) NOT NULL COMMENT 'Oda numarası',
    capacity INT NOT NULL COMMENT 'Kapasite',
    latitude DECIMAL(10, 8) NOT NULL COMMENT 'GPS enlem koordinatı',
    longitude DECIMAL(11, 8) NOT NULL COMMENT 'GPS boylam koordinatı',
    features_json JSON COMMENT 'Derslik özellikleri',
    is_active TINYINT(1) DEFAULT 1 COMMENT 'Aktif mi?',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE KEY uk_room (building, room_number),
    INDEX idx_classrooms_building (building)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V9: Course Sections Table (Part 2)
-- =============================================
CREATE TABLE IF NOT EXISTS course_sections (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    course_id BIGINT NOT NULL COMMENT 'Hangi derse ait',
    section_number VARCHAR(10) NOT NULL COMMENT 'Bölüm numarası (01, 02)',
    semester ENUM('FALL', 'SPRING', 'SUMMER') NOT NULL COMMENT 'Dönem',
    year INT NOT NULL COMMENT 'Akademik yıl',
    instructor_id BIGINT NOT NULL COMMENT 'Dersi veren öğretim üyesi',
    classroom_id BIGINT NULL COMMENT 'Derslik (GPS koordinatları için)',
    capacity INT NOT NULL DEFAULT 40 COMMENT 'Kontenjan',
    enrolled_count INT NOT NULL DEFAULT 0 COMMENT 'Kayıtlı öğrenci sayısı',
    schedule_json JSON COMMENT 'Ders programı (gün, saat, derslik)',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (instructor_id) REFERENCES faculty(id) ON DELETE RESTRICT,
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id) ON DELETE SET NULL,
    
    UNIQUE KEY uk_section (course_id, section_number, semester, year),
    INDEX idx_sections_semester_year (semester, year),
    INDEX idx_sections_instructor (instructor_id),
    INDEX idx_sections_classroom (classroom_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V9: Enrollments Table (Part 2)
-- =============================================
CREATE TABLE IF NOT EXISTS enrollments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL COMMENT 'Öğrenci',
    section_id BIGINT NOT NULL COMMENT 'Ders bölümü',
    status ENUM('ENROLLED', 'DROPPED', 'COMPLETED', 'FAILED') NOT NULL DEFAULT 'ENROLLED' COMMENT 'Kayıt durumu',
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Kayıt tarihi',
    midterm_grade DECIMAL(5,2) COMMENT 'Vize notu (0-100)',
    final_grade DECIMAL(5,2) COMMENT 'Final notu (0-100)',
    homework_grade DECIMAL(5,2) COMMENT 'Ödev notu (0-100)',
    letter_grade VARCHAR(2) COMMENT 'Harf notu (AA, BA, BB vb.)',
    grade_point DECIMAL(3,2) COMMENT '4.0 üzerinden not',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (section_id) REFERENCES course_sections(id) ON DELETE CASCADE,
    
    UNIQUE KEY uk_enrollment (student_id, section_id),
    INDEX idx_enrollments_student (student_id),
    INDEX idx_enrollments_section (section_id),
    INDEX idx_enrollments_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Classrooms table moved above course_sections)

-- =============================================
-- V11: Attendance Sessions Table (Part 2)
-- =============================================
CREATE TABLE IF NOT EXISTS attendance_sessions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    section_id BIGINT NOT NULL COMMENT 'Hangi ders bölümü',
    instructor_id BIGINT NOT NULL COMMENT 'Yoklamayı açan öğretim üyesi',
    classroom_id BIGINT COMMENT 'Derslik',
    session_date DATE NOT NULL COMMENT 'Yoklama tarihi',
    start_time TIME NOT NULL COMMENT 'Başlangıç saati',
    end_time TIME COMMENT 'Bitiş saati',
    latitude DECIMAL(10, 8) NOT NULL COMMENT 'Yoklama merkez GPS enlem',
    longitude DECIMAL(11, 8) NOT NULL COMMENT 'Yoklama merkez GPS boylam',
    geofence_radius INT DEFAULT 15 COMMENT 'Geçerli yarıçap (metre)',
    qr_code VARCHAR(255) UNIQUE COMMENT 'QR kod',
    qr_code_generated_at TIMESTAMP NULL COMMENT 'QR kod oluşturulma zamanı',
    status ENUM('ACTIVE', 'CLOSED') DEFAULT 'ACTIVE' COMMENT 'Oturum durumu',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (section_id) REFERENCES course_sections(id) ON DELETE CASCADE,
    FOREIGN KEY (instructor_id) REFERENCES faculty(id) ON DELETE RESTRICT,
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id) ON DELETE SET NULL,
    
    INDEX idx_attendance_sessions_section_date (section_id, session_date),
    INDEX idx_attendance_sessions_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V12: Attendance Records Table (Part 2)
-- =============================================
CREATE TABLE IF NOT EXISTS attendance_records (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    session_id BIGINT NOT NULL COMMENT 'Yoklama oturumu',
    student_id BIGINT NOT NULL COMMENT 'Öğrenci',
    status ENUM('PRESENT', 'ABSENT', 'LATE', 'EXCUSED') NOT NULL DEFAULT 'PRESENT' COMMENT 'Yoklama durumu',
    check_in_time TIMESTAMP NULL COMMENT 'Yoklama verme zamanı',
    check_in_method ENUM('GPS', 'QR_CODE', 'MANUAL') DEFAULT 'GPS' COMMENT 'Yoklama yöntemi',
    latitude DECIMAL(10, 8) COMMENT 'Öğrencinin GPS enlemi',
    longitude DECIMAL(11, 8) COMMENT 'Öğrencinin GPS boylamı',
    distance_from_classroom DECIMAL(10, 2) COMMENT 'Derslikten uzaklık (metre)',
    gps_accuracy DECIMAL(10, 2) COMMENT 'GPS doğruluğu (metre)',
    is_flagged TINYINT(1) DEFAULT 0 COMMENT 'Şüpheli mi?',
    flag_reason VARCHAR(255) COMMENT 'İşaretleme sebebi',
    ip_address VARCHAR(45) COMMENT 'Öğrencinin IP adresi',
    device_info VARCHAR(500) COMMENT 'Cihaz bilgisi',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (session_id) REFERENCES attendance_sessions(id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    
    UNIQUE KEY uk_attendance (session_id, student_id),
    INDEX idx_attendance_records_student (student_id),
    INDEX idx_attendance_records_flagged (is_flagged),
    INDEX idx_attendance_records_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V13: Excuse Requests Table (Part 2)
-- =============================================
CREATE TABLE IF NOT EXISTS excuse_requests (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL COMMENT 'Mazeret sahibi öğrenci',
    session_id BIGINT NOT NULL COMMENT 'İlgili yoklama oturumu',
    reason TEXT NOT NULL COMMENT 'Mazeret açıklaması',
    document_url VARCHAR(255) COMMENT 'Belge dosyası URL',
    status ENUM('PENDING', 'APPROVED', 'REJECTED') DEFAULT 'PENDING' COMMENT 'Talep durumu',
    reviewed_by BIGINT COMMENT 'Onaylayan/reddeden öğretim üyesi',
    reviewed_at TIMESTAMP NULL COMMENT 'İnceleme tarihi',
    reviewer_notes TEXT COMMENT 'İnceleme notları',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (session_id) REFERENCES attendance_sessions(id) ON DELETE CASCADE,
    FOREIGN KEY (reviewed_by) REFERENCES faculty(id) ON DELETE SET NULL,
    
    INDEX idx_excuse_requests_student (student_id),
    INDEX idx_excuse_requests_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- Initialization Complete
-- =============================================
SELECT 'Smart Campus Database initialized successfully! (Part 1 + Part 2)' AS status;

-- =============================================
-- PART 3: Meal Service, Event Management, Scheduling
-- =============================================

-- =============================================
-- V14: Cafeterias Table (Part 3 - Meal Service)
-- =============================================
CREATE TABLE IF NOT EXISTS cafeterias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT 'Yemekhane adı',
    location VARCHAR(200) COMMENT 'Konum açıklaması',
    capacity INT NOT NULL DEFAULT 200 COMMENT 'Kapasite',
    latitude DECIMAL(10, 8) COMMENT 'GPS enlem',
    longitude DECIMAL(11, 8) COMMENT 'GPS boylam',
    opening_time TIME DEFAULT '07:00:00' COMMENT 'Açılış saati',
    closing_time TIME DEFAULT '21:00:00' COMMENT 'Kapanış saati',
    is_active TINYINT(1) DEFAULT 1 COMMENT 'Aktif mi?',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_cafeteria_active (is_active),
    INDEX idx_cafeteria_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V15: Meal Menus Table (Part 3 - Meal Service)
-- =============================================
CREATE TABLE IF NOT EXISTS meal_menus (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cafeteria_id BIGINT NOT NULL COMMENT 'Yemekhane referansı',
    menu_date DATE NOT NULL COMMENT 'Menü tarihi',
    meal_type ENUM('BREAKFAST', 'LUNCH', 'DINNER') NOT NULL COMMENT 'Öğün tipi',
    items_json JSON NOT NULL COMMENT 'Yemek öğeleri listesi',
    nutrition_json JSON COMMENT 'Besin değerleri',
    price DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT 'Ücret (TL)',
    is_vegan TINYINT(1) DEFAULT 0,
    is_vegetarian TINYINT(1) DEFAULT 0,
    is_published TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (cafeteria_id) REFERENCES cafeterias(id) ON DELETE CASCADE,
    UNIQUE KEY uk_menu (cafeteria_id, menu_date, meal_type),
    INDEX idx_menu_date (menu_date),
    INDEX idx_menu_published (is_published)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V16: Wallets Table (Part 3 - Payment)
-- =============================================
CREATE TABLE IF NOT EXISTS wallets (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE COMMENT 'Kullanıcı referansı',
    balance DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    currency VARCHAR(3) DEFAULT 'TRY',
    is_scholarship TINYINT(1) DEFAULT 0,
    daily_scholarship_limit INT DEFAULT 2,
    scholarship_used_today INT DEFAULT 0,
    last_scholarship_reset DATE,
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_wallet_user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V17: Transactions Table (Part 3 - Payment)
-- =============================================
CREATE TABLE IF NOT EXISTS transactions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    wallet_id BIGINT NOT NULL,
    type ENUM('CREDIT', 'DEBIT') NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    balance_after DECIMAL(10, 2) NOT NULL,
    reference_type ENUM('TOPUP', 'MEAL', 'EVENT', 'REFUND') NOT NULL,
    reference_id BIGINT,
    description VARCHAR(255),
    payment_method VARCHAR(50),
    payment_reference VARCHAR(255),
    status ENUM('PENDING', 'COMPLETED', 'FAILED', 'CANCELLED') DEFAULT 'COMPLETED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (wallet_id) REFERENCES wallets(id) ON DELETE CASCADE,
    INDEX idx_transaction_wallet (wallet_id),
    INDEX idx_transaction_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V18: Meal Reservations Table (Part 3 - Meal Service)
-- =============================================
CREATE TABLE IF NOT EXISTS meal_reservations (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    menu_id BIGINT NOT NULL,
    cafeteria_id BIGINT NOT NULL,
    reservation_date DATE NOT NULL,
    meal_type ENUM('BREAKFAST', 'LUNCH', 'DINNER') NOT NULL,
    amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    qr_code VARCHAR(100) NOT NULL UNIQUE,
    is_scholarship_used TINYINT(1) DEFAULT 0,
    status ENUM('RESERVED', 'USED', 'CANCELLED', 'EXPIRED') DEFAULT 'RESERVED',
    used_at TIMESTAMP NULL,
    cancelled_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (menu_id) REFERENCES meal_menus(id) ON DELETE RESTRICT,
    FOREIGN KEY (cafeteria_id) REFERENCES cafeterias(id) ON DELETE RESTRICT,
    INDEX idx_reservation_user (user_id),
    INDEX idx_reservation_qr (qr_code),
    INDEX idx_reservation_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V19: Events Table (Part 3 - Event Management)
-- =============================================
CREATE TABLE IF NOT EXISTS events (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    category ENUM('CONFERENCE', 'WORKSHOP', 'SEMINAR', 'SOCIAL', 'SPORTS', 'CULTURAL', 'CAREER') NOT NULL,
    event_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME,
    location VARCHAR(200) NOT NULL,
    capacity INT NOT NULL DEFAULT 100,
    registered_count INT NOT NULL DEFAULT 0,
    registration_deadline TIMESTAMP NULL,
    is_paid TINYINT(1) DEFAULT 0,
    price DECIMAL(10, 2) DEFAULT 0.00,
    organizer_id BIGINT NOT NULL,
    image_url VARCHAR(255),
    status ENUM('DRAFT', 'PUBLISHED', 'CANCELLED', 'COMPLETED') DEFAULT 'DRAFT',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (organizer_id) REFERENCES users(id) ON DELETE RESTRICT,
    INDEX idx_event_date (event_date),
    INDEX idx_event_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V20: Event Registrations Table (Part 3 - Event Management)
-- =============================================
CREATE TABLE IF NOT EXISTS event_registrations (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    event_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    qr_code VARCHAR(100) NOT NULL UNIQUE,
    checked_in TINYINT(1) DEFAULT 0,
    checked_in_at TIMESTAMP NULL,
    status ENUM('REGISTERED', 'WAITLIST', 'CANCELLED', 'ATTENDED') DEFAULT 'REGISTERED',
    waitlist_position INT NULL,
    custom_fields_json JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY uk_event_registration (event_id, user_id),
    INDEX idx_registration_qr (qr_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V21: Schedules Table (Part 3 - Course Scheduling)
-- =============================================
CREATE TABLE IF NOT EXISTS schedules (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    section_id BIGINT NOT NULL,
    day_of_week ENUM('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    classroom_id BIGINT NOT NULL,
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (section_id) REFERENCES course_sections(id) ON DELETE CASCADE,
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id) ON DELETE RESTRICT,
    INDEX idx_schedule_section (section_id),
    INDEX idx_schedule_classroom (classroom_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- V22: Classroom Reservations Table (Part 3 - Scheduling)
-- =============================================
CREATE TABLE IF NOT EXISTS classroom_reservations (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    classroom_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    reservation_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    purpose VARCHAR(255) NOT NULL,
    status ENUM('PENDING', 'APPROVED', 'REJECTED', 'CANCELLED') DEFAULT 'PENDING',
    approved_by BIGINT NULL,
    approved_at TIMESTAMP NULL,
    rejection_reason VARCHAR(255),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id) ON DELETE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (approved_by) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_reservation_classroom (classroom_id),
    INDEX idx_reservation_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- Full Initialization Complete (Part 1 + 2 + 3)
-- =============================================
SELECT 'Smart Campus Database initialized successfully! (Part 1 + Part 2 + Part 3)' AS status;