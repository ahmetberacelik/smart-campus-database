-- Migration V7: Ön Koşul Dersleri Tablosu
-- Part 2: Akademik Yönetim

CREATE TABLE course_prerequisites (
    course_id BIGINT NOT NULL,
    prerequisite_id BIGINT NOT NULL,
    PRIMARY KEY (course_id, prerequisite_id),
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (prerequisite_id) REFERENCES courses(id) ON DELETE CASCADE
);
