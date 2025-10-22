-- Tabel utama untuk semua pengguna (kandidat, perusahaan, admin)
CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    user_type VARCHAR(50) NOT NULL COMMENT "'candidate', 'employer', or 'admin'",
    account_status VARCHAR(50) NOT NULL DEFAULT 'active' COMMENT "'active', 'deactivated'",
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel untuk profil detail kandidat
CREATE TABLE Disability_Profiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    address TEXT,
    about_me TEXT,
    disability_type VARCHAR(100),
    skills TEXT,
    cv_file_path VARCHAR(255),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- Tabel untuk profil detail perusahaan
CREATE TABLE Company_Profiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    company_description TEXT,
    industry VARCHAR(100),
    company_address TEXT,
    website VARCHAR(255),
    company_logo_path VARCHAR(255),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- Tabel untuk semua lowongan pekerjaan
CREATE TABLE Jobs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employer_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(100),
    job_type VARCHAR(50),
    salary VARCHAR(100),
    publication_status VARCHAR(50) DEFAULT 'open' COMMENT "'open', 'closed', 'removed'",
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employer_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- Tabel untuk mencatat lamaran dari kandidat ke pekerjaan
CREATE TABLE Applications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    job_id INT NOT NULL,
    candidate_id INT NOT NULL,
    application_status VARCHAR(50) NOT NULL DEFAULT 'Submitted' COMMENT "'Submitted', 'Viewed', 'In Progress', 'Accepted', 'Rejected'",
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    hr_notes TEXT COMMENT 'Feedback or comments from HR',
    FOREIGN KEY (job_id) REFERENCES Jobs(id) ON DELETE CASCADE,
    FOREIGN KEY (candidate_id) REFERENCES Users(id) ON DELETE CASCADE,
    UNIQUE (job_id, candidate_id)
);

-- Tabel untuk ulasan dari kandidat ke perusahaan
CREATE TABLE Reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reviewer_id INT NOT NULL,
    reviewee_id INT NOT NULL,
    rating INT,
    review_content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reviewer_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (reviewee_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- Tabel untuk laporan dari pengguna terhadap perusahaan/lowongan
CREATE TABLE Reports (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reporter_id INT NOT NULL,
    reported_company_id INT NOT NULL,
    related_job_id INT,
    reason TEXT NOT NULL,
    report_status VARCHAR(50) NOT NULL DEFAULT 'Submitted' COMMENT "'Submitted', 'Under Review', 'Resolved'",
    admin_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (reporter_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (reported_company_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (related_job_id) REFERENCES Jobs(id) ON DELETE SET NULL
);

-- Tabel untuk sistem chat
CREATE TABLE Conversations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Conversation_Participants (
    conversation_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (conversation_id, user_id),
    FOREIGN KEY (conversation_id) REFERENCES Conversations(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE Messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    conversation_id INT NOT NULL,
    sender_id INT NOT NULL,
    message_content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conversation_id) REFERENCES Conversations(id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES Users(id) ON DELETE CASCADE
);