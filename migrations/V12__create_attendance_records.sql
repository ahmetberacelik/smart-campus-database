-- Migration V12: Yoklama Kayıtları Tablosu
-- Part 2: GPS Yoklama

CREATE TABLE attendance_records (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    session_id BIGINT NOT NULL,
    student_id BIGINT NOT NULL,
    status ENUM('PRESENT', 'ABSENT', 'LATE', 'EXCUSED') NOT NULL DEFAULT 'PRESENT' COMMENT 'Yoklama durumu',
    check_in_time TIMESTAMP NULL COMMENT 'Giriş zamanı',
    check_in_method ENUM('GPS', 'QR_CODE', 'MANUAL') DEFAULT 'GPS',
    latitude DECIMAL(10, 8) COMMENT 'Öğrenci GPS enlem',
    longitude DECIMAL(11, 8) COMMENT 'Öğrenci GPS boylam',
    distance_from_classroom DECIMAL(10, 2) COMMENT 'Derslikten uzaklık (metre)',
    gps_accuracy DECIMAL(10, 2) COMMENT 'GPS doğruluğu (metre)',
    is_flagged TINYINT(1) DEFAULT 0 COMMENT 'Şüpheli işaretli mi',
    flag_reason VARCHAR(255) COMMENT 'İşaretlenme nedeni',
    ip_address VARCHAR(45) COMMENT 'IP adresi',
    device_info VARCHAR(500) COMMENT 'Cihaz bilgisi',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id) REFERENCES attendance_sessions(id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    UNIQUE KEY uk_attendance (session_id, student_id),
    INDEX idx_student (student_id),
    INDEX idx_flagged (is_flagged),
    INDEX idx_status (status)
);
