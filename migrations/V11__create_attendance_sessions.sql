-- Migration V11: Yoklama Oturumları Tablosu
-- Part 2: GPS Yoklama

CREATE TABLE attendance_sessions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    section_id BIGINT NOT NULL,
    instructor_id BIGINT NOT NULL,
    classroom_id BIGINT,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    geofence_radius INT DEFAULT 15,
    qr_code VARCHAR(255) UNIQUE,
    qr_expiry TIMESTAMP NULL,
    status ENUM('ACTIVE', 'CLOSED') DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (section_id) REFERENCES course_sections(id) ON DELETE CASCADE,
    FOREIGN KEY (instructor_id) REFERENCES faculty(id),
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id),
    INDEX idx_section_date (section_id, date),
    INDEX idx_status (status)
);
