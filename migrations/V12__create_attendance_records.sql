-- Migration V12: Yoklama Kayıtları Tablosu
-- Part 2: GPS Yoklama

CREATE TABLE attendance_records (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    session_id BIGINT NOT NULL,
    student_id BIGINT NOT NULL,
    check_in_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    distance_from_center DECIMAL(10, 2) NOT NULL,
    ip_address VARCHAR(45),
    is_flagged TINYINT(1) DEFAULT 0,
    flag_reason VARCHAR(255),
    check_in_method ENUM('GPS', 'QR_CODE', 'MANUAL') DEFAULT 'GPS',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id) REFERENCES attendance_sessions(id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    UNIQUE KEY uk_attendance (session_id, student_id),
    INDEX idx_student (student_id),
    INDEX idx_flagged (is_flagged)
);
