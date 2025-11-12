SET time_zone = '+00:00';

CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    user_type ENUM('disability', 'hr', 'company', 'admin') NOT NULL,
    account_status ENUM('active', 'inactive', 'suspended') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Company_Profiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    company_description TEXT,
    company_address TEXT,
    industry VARCHAR(100),
    website_url VARCHAR(255),
    company_logo_path VARCHAR(255),
    disability_verified BOOLEAN DEFAULT FALSE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE Disability_Profiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    address TEXT,
    about_me VARCHAR(50),
    disability_type ENUM(
        'none',             
        'low_vision',      
        'color_blind',    
        'dyslexia',         
        'motor_disability', 
        'blind',           
        'cognitive'        
    ) NOT NULL DEFAULT 'none',
    skills TEXT,
    job_type ENUM(
        'remote',          
        'onsite',     
        'hybrid',         
        'desk_based',      
        'field_work',     
        'voice_based',    
        'creative',       
        'technical',      
        'manual'          
    ) NOT NULL DEFAULT 'remote',
    education_level VARCHAR(50),
    certif_file_path VARCHAR(255),
    cv_file_path VARCHAR(255),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE HR_Profiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    company_id INT NOT NULL,
    position_title VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (company_id) REFERENCES Company_Profiles(id) ON DELETE CASCADE
);

CREATE TABLE Jobs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    jobdesk TEXT,
    location VARCHAR(255),
    job_type ENUM(
        'remote',          
        'onsite',     
        'hybrid',         
        'desk_based',      
        'field_work',     
        'voice_based',    
        'creative',       
        'technical',      
        'manual'          
    ) NOT NULL DEFAULT 'remote',
    salary DECIMAL(15, 2),
    minimum_education VARCHAR(50),
    minimum_years_experience INT,
    disability_type ENUM(
        'none',             
        'low_vision',      
        'color_blind',    
        'dyslexia',         
        'motor_disability', 
        'blind',           
        'cognitive'        
    ) NOT NULL DEFAULT 'none',
    registration_deadline DATE,
    publication_status ENUM('draft', 'published', 'closed') DEFAULT 'draft',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (company_id) REFERENCES Company_Profiles(id) ON DELETE CASCADE
);

CREATE TABLE Applications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    job_id INT NOT NULL,
    candidate_id INT NOT NULL,
    application_status ENUM('pending', 'reviewed', 'shortlisted', 'rejected', 'accepted') DEFAULT 'pending',
    hr_notes TEXT,
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (job_id) REFERENCES Jobs(id) ON DELETE CASCADE,
    FOREIGN KEY (candidate_id) REFERENCES Disability_Profiles(id) ON DELETE CASCADE
);

CREATE TABLE Experiences (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    position_title VARCHAR(255),
    company_name VARCHAR(255),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES Disability_Profiles(id) ON DELETE CASCADE
);

CREATE TABLE Conversations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    job_id INT NOT NULL,
    company_id INT NOT NULL,
    hr_user_id INT NOT NULL,
    jobseeker_id INT NOT NULL,
    status ENUM('active', 'closed') DEFAULT 'active',
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_message_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (job_id) REFERENCES Jobs(id) ON DELETE CASCADE,
    FOREIGN KEY (company_id) REFERENCES Company_Profiles(id) ON DELETE CASCADE,
    FOREIGN KEY (hr_user_id) REFERENCES HR_Profiles(id) ON DELETE CASCADE,
    FOREIGN KEY (jobseeker_id) REFERENCES Disability_Profiles(id) ON DELETE CASCADE
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

CREATE TABLE Reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reviewer_id INT NOT NULL,
    reviewee_id INT NOT NULL,
    related_job_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    review_content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reviewer_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (reviewee_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (related_job_id) REFERENCES Jobs(id) ON DELETE SET NULL
);

CREATE TABLE Reports_User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    related_job_id INT,
    review_id INT,
    reported_user_id INT NOT NULL,
    reporter_id INT NOT NULL,
    reason TEXT NOT NULL,
    status ENUM('pending', 'reviewed', 'resolved', 'dismissed') DEFAULT 'pending',
    admin_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (related_job_id) REFERENCES Jobs(id) ON DELETE SET NULL,
    FOREIGN KEY (review_id) REFERENCES Reviews(id) ON DELETE SET NULL,
    FOREIGN KEY (reported_user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (reporter_id) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE Blacklists (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    created_by INT NOT NULL,
    reason TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (created_by) REFERENCES Users(id) ON DELETE CASCADE
);

-- optimization 

CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_users_user_type ON Users(user_type);
CREATE INDEX idx_company_user_id ON Company_Profiles(user_id);
CREATE INDEX idx_disability_user_id ON Disability_Profiles(user_id);
CREATE INDEX idx_hr_user_id ON HR_Profiles(user_id);
CREATE INDEX idx_hr_company_id ON HR_Profiles(company_id);
CREATE INDEX idx_jobs_company_id ON Jobs(company_id);
CREATE INDEX idx_jobs_status ON Jobs(publication_status);
CREATE INDEX idx_applications_job_id ON Applications(job_id);
CREATE INDEX idx_applications_candidate_id ON Applications(candidate_id);
CREATE INDEX idx_experiences_user_id ON Experiences(user_id);
CREATE INDEX idx_conversations_job_id ON Conversations(job_id);
CREATE INDEX idx_messages_conversation_id ON Messages(conversation_id);
CREATE INDEX idx_reviews_reviewer_id ON Reviews(reviewer_id);
CREATE INDEX idx_reviews_reviewee_id ON Reviews(reviewee_id);
CREATE INDEX idx_reports_reported_user_id ON Reports_User(reported_user_id);
CREATE INDEX idx_blacklists_user_id ON Blacklists(user_id);