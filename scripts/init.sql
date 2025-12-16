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