-- =============================================
-- Migration: V22 - Create Classroom Reservations Table
-- Description: Derslik rezervasyonlarını tutar
-- Part 3: Course Scheduling
-- =============================================

CREATE TABLE IF NOT EXISTS classroom_reservations (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    classroom_id BIGINT NOT NULL COMMENT 'Derslik referansı',
    user_id BIGINT NOT NULL COMMENT 'Rezervasyon yapan kullanıcı',
    reservation_date DATE NOT NULL COMMENT 'Rezervasyon tarihi',
    start_time TIME NOT NULL COMMENT 'Başlangıç saati',
    end_time TIME NOT NULL COMMENT 'Bitiş saati',
    purpose VARCHAR(255) NOT NULL COMMENT 'Kullanım amacı',
    status ENUM('PENDING', 'APPROVED', 'REJECTED', 'CANCELLED') DEFAULT 'PENDING' COMMENT 'Durum',
    approved_by BIGINT NULL COMMENT 'Onaylayan admin',
    approved_at TIMESTAMP NULL COMMENT 'Onay zamanı',
    rejection_reason VARCHAR(255) COMMENT 'Red nedeni',
    notes TEXT COMMENT 'Ek notlar',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id) ON DELETE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (approved_by) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_reservation_classroom (classroom_id),
    INDEX idx_reservation_date (reservation_date),
    INDEX idx_reservation_user (user_id),
    INDEX idx_reservation_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
