INSERT INTO Users (email, password, user_type, account_status) VALUES
('admin@jobportal.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'active'),
('hr@techcorp.id', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'company', 'active'),
('recruit@startupjaya.co', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'company', 'active'),
('career@globalmart.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'company', 'active'),
('hiring@creativeworks.id', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'company', 'active'),
('hrd@healthfirst.co', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'company', 'active'),
('budi.susanto@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'disability', 'active'),
('citra.dewi@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'disability', 'active'),
('rina.hartono@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'disability', 'active'),
('david.lee@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'disability', 'active'),
('sarah.putri@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'disability', 'active');

INSERT INTO Company_Profiles (user_id, company_name, company_description, company_address, industry, website_url, company_logo_path, disability_verified) VALUES
(2, 'TechCorp Indonesia', 'Perusahaan teknologi terkemuka yang fokus pada pengembangan software enterprise', 'Jl. Sudirman No. 1, Jakarta Pusat, DKI Jakarta', 'Information Technology', 'https://techcorp.id', '/logos/techcorp.png', TRUE),
(3, 'Startup Jaya Digital', 'Agensi kreatif yang bergerak di bidang digital marketing dan branding', 'Jl. Gatot Subroto No. 2, Bandung, Jawa Barat', 'Creative Agency', 'https://startupjaya.co', '/logos/startupjaya.png', TRUE),
(4, 'Global Mart', 'Perusahaan retail besar dengan cabang di seluruh Indonesia', 'Jl. Thamrin No. 5, Surabaya, Jawa Timur', 'Retail', 'https://globalmart.com', '/logos/globalmart.png', FALSE),
(5, 'Creative Works Studio', 'Studio desain yang mengkhususkan diri dalam branding dan UI/UX', 'Jl. Dago No. 10, Bandung, Jawa Barat', 'Design & Creative', 'https://creativeworks.id', '/logos/creativeworks.png', TRUE),
(6, 'HealthFirst Clinic', 'Klinik kesehatan modern dengan layanan 24 jam', 'Jl. Diponegoro No. 8, Yogyakarta, DIY', 'Healthcare', 'https://healthfirst.co', '/logos/healthfirst.png', TRUE);

INSERT INTO Disability_Profiles (user_id, full_name, address, about_me, disability_type, skills, job_type, education_level, certif_file_path, cv_file_path) VALUES
(7, 'Budi Susanto', 'Jl. Melati No. 15, Jakarta Selatan', 'Backend dev 5 tahun pengalaman', 'motor_disability', 'Python, Django, SQL, AWS, Docker, PostgreSQL', 'remote', 'S1 Teknik Informatika', '/certificates/budi_cert.pdf', '/cv/budi_susanto.pdf'),
(8, 'Citra Dewi', 'Jl. Mawar No. 20, Bandung', 'UI/UX passionate accessibility', 'low_vision', 'Figma, UI/UX Research, Prototyping, Adobe XD, Sketch', 'hybrid', 'S1 Desain Komunikasi Visual', '/certificates/citra_cert.pdf', '/cv/citra_dewi.pdf'),
(9, 'Rina Hartono', 'Jl. Anggrek No. 8, Surabaya', 'Content writer SEO specialist', 'motor_disability', 'Content Writing, SEO, WordPress, Copywriting, Google Analytics', 'remote', 'S1 Sastra Inggris', '/certificates/rina_cert.pdf', '/cv/rina_hartono.pdf'),
(10, 'David Lee', 'Jl. Kenanga No. 12, Jakarta Barat', 'Full-stack dev fokus frontend', 'low_vision', 'JavaScript, React, Node.js, TypeScript, MongoDB', 'remote', 'S1 Sistem Informasi', '/certificates/david_cert.pdf', '/cv/david_lee.pdf'),
(11, 'Sarah Putri', 'Jl. Cempaka No. 5, Yogyakarta', 'Graphic designer spesialisasi branding', 'dyslexia', 'Adobe Illustrator, Photoshop, Branding, InDesign, CorelDraw', 'hybrid', 'S1 Desain Grafis', '/certificates/sarah_cert.pdf', '/cv/sarah_putri.pdf');

INSERT INTO HR_Profiles (user_id, company_id, position_title) VALUES
(2, 1, 'HR Manager'),
(3, 2, 'Recruitment Specialist'),
(4, 3, 'HR Director'),
(5, 4, 'Talent Acquisition Lead'),
(6, 5, 'HR Coordinator');

INSERT INTO Jobs (company_id, title, description, jobdesk, location, job_type, salary, minimum_education, minimum_years_experience, disability_type, registration_deadline, publication_status) VALUES
(1, 'Senior Backend Developer', 'Kami mencari backend developer berpengalaman untuk membangun sistem yang scalable', 'Membangun dan memelihara API, Mengoptimalkan database, Implementasi microservices', 'Jakarta / Remote', 'remote', 18000000.00, 'S1 Teknik Informatika', 3, 'none', '2025-12-31', 'published'),
(2, 'UI/UX Designer', 'Bergabunglah dengan tim kreatif kami untuk menciptakan pengalaman digital yang luar biasa', 'Mendesain antarmuka yang accessible, Melakukan user research, Membuat prototyping', 'Bandung', 'hybrid', 10000000.00, 'S1 Desain', 2, 'none', '2025-12-15', 'published'),
(1, 'Data Analyst', 'Analisis data untuk mendukung keputusan bisnis strategis', 'Menganalisis data, Membuat dashboard, Reporting ke management', 'Remote', 'remote', 12000000.00, 'S1 Statistika/Matematika', 1, 'none', '2025-11-30', 'published'),
(4, 'Graphic Designer', 'Membuat visual yang menarik untuk berbagai kampanye marketing', 'Desain materi marketing, Branding, Ilustrasi digital', 'Bandung', 'onsite', 8000000.00, 'D3/S1 Desain Grafis', 1, 'none', '2025-12-20', 'published'),
(3, 'Admin Gudang', 'Mengelola operasional gudang dan sistem inventory', 'Pencatatan stok, Koordinasi dengan supplier, Laporan inventory', 'Surabaya', 'onsite', 5500000.00, 'SMA/SMK', 0, 'motor_disability', '2025-11-25', 'published'),
(5, 'Perawat Pendamping', 'Memberikan perawatan dan dukungan kepada pasien', 'Monitoring kondisi pasien, Administrasi medis, Koordinasi dengan dokter', 'Yogyakarta', 'onsite', 6000000.00, 'D3 Keperawatan', 1, 'none', '2025-12-10', 'published'),
(2, 'Social Media Specialist', 'Kelola media sosial untuk meningkatkan engagement brand', 'Content creation, Community management, Social media analytics', 'Remote', 'remote', 7000000.00, 'S1 Komunikasi/Marketing', 1, 'none', '2025-12-05', 'published');

INSERT INTO Applications (job_id, candidate_id, application_status, hr_notes) VALUES
(1, 1, 'accepted', 'Selamat! Anda diterima sebagai Senior Backend Developer. Mohon cek email untuk offering letter dan proses onboarding.'),
(2, 2, 'rejected', 'Terima kasih atas minat Anda. Portfolio Anda bagus, namun saat ini kami mencari kandidat dengan pengalaman lebih spesifik di user research.'),
(3, 2, 'reviewed', 'Lamaran Anda sedang dalam tahap review oleh tim technical. Kami akan menghubungi dalam 3-5 hari kerja.'),
(4, 5, 'shortlisted', 'Portfolio Anda sangat menarik! Kami akan menghubungi untuk jadwal interview minggu depan.'),
(5, 3, 'pending', NULL),
(3, 4, 'pending', NULL),
(7, 3, 'accepted', 'Selamat bergabung dengan tim Startup Jaya Digital! Kami excited untuk bekerja sama dengan Anda.'),
(6, 1, 'reviewed', 'Kualifikasi Anda sesuai. Kami sedang proses verifikasi referensi.'),
(1, 4, 'rejected', 'Terima kasih telah melamar. Pengalaman Anda lebih cocok untuk posisi mid-level.'),
(2, 5, 'shortlisted', 'Kami tertarik dengan portfolio Anda. Interview akan dijadwalkan segera.');

INSERT INTO Experiences (user_id, position_title, company_name, start_date, end_date) VALUES
(1, 'Junior Backend Developer', 'PT Digital Solusi', '2019-01-15', '2021-06-30'),
(1, 'Backend Developer', 'PT Tech Innovation', '2021-07-01', '2024-10-31'),
(2, 'UI Designer', 'Creative Studio XYZ', '2020-03-01', '2022-12-31'),
(2, 'Senior UI/UX Designer', 'Design House Indonesia', '2023-01-15', NULL),
(3, 'Content Writer', 'Media Online ABC', '2021-05-01', '2023-08-31'),
(3, 'SEO Specialist', 'Digital Agency Pro', '2023-09-01', NULL),
(4, 'Frontend Developer', 'Startup Digital', '2020-06-01', '2022-12-31'),
(4, 'Full-stack Developer', 'Tech Solutions Ltd', '2023-01-10', NULL),
(5, 'Junior Graphic Designer', 'Print House Co', '2019-08-01', '2021-05-31'),
(5, 'Graphic Designer', 'Branding Agency', '2021-06-01', NULL);

INSERT INTO Conversations (job_id, company_id, hr_user_id, jobseeker_id, status) VALUES
(1, 1, 1, 1, 'active'),
(2, 2, 2, 2, 'active'),
(4, 4, 4, 5, 'active'),
(7, 2, 2, 3, 'closed');

INSERT INTO Messages (conversation_id, sender_id, message_content) VALUES
(1, 7, 'Selamat pagi, saya ingin menanyakan kelanjutan dari proses lamaran saya untuk posisi Senior Backend Developer.'),
(1, 2, 'Pagi Pak Budi, terima kasih sudah follow up. Lamaran Anda sudah kami terima dan sedang dalam tahap review oleh tim technical.'),
(1, 7, 'Baik, terima kasih atas informasinya. Kira-kira berapa lama proses reviewnya?'),
(1, 2, 'Biasanya 3-5 hari kerja. Kami akan segera menghubungi Anda.'),
(2, 8, 'Halo, apakah ada update untuk lamaran saya sebagai UI/UX Designer?'),
(2, 3, 'Halo Citra, mohon maaf untuk posisi tersebut membutuhkan pengalaman lebih spesifik di user research. Namun kami akan keep CV Anda untuk posisi lain yang sesuai.'),
(2, 8, 'Baik, terima kasih atas informasinya.'),
(3, 11, 'Selamat siang, saya ingin mengonfirmasi jadwal interview untuk posisi Graphic Designer.'),
(3, 5, 'Selamat siang Sarah, interview dijadwalkan Jumat depan jam 10.00 WIB via Google Meet. Link akan dikirim via email.'),
(3, 11, 'Baik, terima kasih. Saya akan prepare dengan baik.'),
(4, 9, 'Terima kasih sudah menerima saya sebagai Social Media Specialist!'),
(4, 3, 'Sama-sama Rina! Kami senang Anda bergabung. Dokumen onboarding sudah dikirim ke email ya.');

INSERT INTO Reviews (reviewer_id, reviewee_id, related_job_id, rating, review_content) VALUES
(7, 2, 1, 5, 'Proses rekrutmen sangat profesional dan cepat. HR sangat membantu dan komunikatif. Aksesibilitas untuk kandidat disabilitas juga diperhatikan dengan baik.'),
(8, 3, 2, 3, 'Feedback penolakannya cukup jelas dan konstruktif, tapi proses dari apply hingga mendapat kabar memakan waktu hampir 3 minggu.'),
(9, 3, 7, 5, 'Sangat senang bisa diterima! Komunikasi selama proses rekrutmen sangat baik. Tim HR sangat ramah dan helpful.'),
(7, 3, NULL, 4, 'Pernah interview di perusahaan ini untuk posisi lain, lingkungannya terlihat sangat positif dan inclusive terhadap disabilitas.'),
(11, 5, 4, 5, 'Proses interview berjalan dengan lancar dan nyaman. Pertanyaan interviewnya relevan dan tidak diskriminatif.');

INSERT INTO Reports_User (related_job_id, review_id, reported_user_id, reporter_id, reason, status, admin_notes) VALUES
(2, NULL, 3, 8, 'Deskripsi pekerjaan tidak sesuai dengan yang ditawarkan saat interview awal. Gaji yang disebutkan di iklan jauh lebih tinggi dari yang ditawarkan saat interview.', 'pending', NULL),
(5, NULL, 4, 7, 'Perusahaan tidak responsif setelah lebih dari 4 minggu lamaran dikirim. Tidak ada konfirmasi atau rejection letter.', 'pending', NULL),
(6, NULL, 6, 10, 'Lokasi interview tidak memiliki akses lift atau ramp untuk kursi roda. Tidak ramah untuk kandidat dengan disabilitas mobilitas.', 'reviewed', 'Tim akan follow up dengan perusahaan terkait aksesibilitas.'),
(NULL, NULL, 5, 9, 'Perusahaan ini diduga melakukan diskriminasi dalam proses seleksi. Menanyakan hal-hal personal yang tidak relevan dengan pekerjaan.', 'resolved', 'Sudah dikonfirmasi dengan perusahaan. Perusahaan telah melakukan perbaikan SOP interview.'),
(3, NULL, 2, 8, 'Lowongan ini sepertinya fiktif atau sudah terisi. Hanya untuk mengumpulkan data pelamar karena tidak ada respon sama sekali.', 'pending', NULL);

INSERT INTO Blacklists (user_id, created_by, reason) VALUES
(8, 1, 'Melakukan spam aplikasi ke banyak lowongan dengan CV yang tidak relevan. Sudah diperingatkan 3 kali.'),
(4, 1, 'Perusahaan tidak memenuhi standar aksesibilitas dan tidak kooperatif saat diminta perbaikan. Multiple reports dari kandidat.');

-- Contoh Query 
-- 1. Riwayat lamaran kandidat 
SELECT 
    j.title AS 'Posisi yang Dilamar',
    cp.company_name AS 'Perusahaan',
    a.application_status AS 'Status Lamaran',
    a.hr_notes AS 'Catatan dari HR',
    a.applied_at AS 'Tanggal Melamar'
FROM Applications a
JOIN Jobs j ON a.job_id = j.id
JOIN Company_Profiles cp ON j.company_id = cp.id
JOIN Disability_Profiles dp ON a.candidate_id = dp.id
WHERE dp.user_id = 8
ORDER BY a.applied_at DESC;

-- 2. Daftar pelamar untuk lowongan 
SELECT 
    dp.full_name AS 'Nama Pelamar',
    dp.disability_type AS 'Tipe Disabilitas',
    dp.skills AS 'Keahlian',
    dp.cv_file_path AS 'Link CV',
    a.application_status AS 'Status',
    a.applied_at AS 'Tanggal Melamar'
FROM Applications a
JOIN Disability_Profiles dp ON a.candidate_id = dp.id
WHERE a.job_id = 1
ORDER BY a.applied_at DESC;

-- 3. Laporan pending untuk admin
SELECT 
    r.id AS 'ID Laporan',
    dp.full_name AS 'Pelapor',
    u_reported.email AS 'User Dilaporkan',
    j.title AS 'Lowongan Terkait',
    r.reason AS 'Alasan Laporan',
    r.status AS 'Status',
    r.created_at AS 'Tanggal Laporan'
FROM Reports_User r
JOIN Users u_reported ON r.reported_user_id = u_reported.id
JOIN Users u_reporter ON r.reporter_id = u_reporter.id
JOIN Disability_Profiles dp ON u_reporter.id = dp.user_id
LEFT JOIN Jobs j ON r.related_job_id = j.id
WHERE r.status = 'pending'
ORDER BY r.created_at DESC;

-- 4. Dashboard statistik untuk admin
SELECT 
    (SELECT COUNT(*) FROM Users WHERE user_type = 'disability') AS 'Total Kandidat',
    (SELECT COUNT(*) FROM Users WHERE user_type = 'company') AS 'Total Perusahaan',
    (SELECT COUNT(*) FROM Jobs WHERE publication_status = 'published') AS 'Lowongan Aktif',
    (SELECT COUNT(*) FROM Applications WHERE application_status = 'pending') AS 'Lamaran Pending',
    (SELECT COUNT(*) FROM Reports_User WHERE status = 'pending') AS 'Laporan Baru';

-- 5. Percakapan 
SELECT 
    c.id AS 'Conversation ID',
    j.title AS 'Lowongan',
    cp.company_name AS 'Perusahaan',
    dp.full_name AS 'Kandidat',
    m.message_content AS 'Pesan',
    u.email AS 'Pengirim',
    m.created_at AS 'Waktu'
FROM Messages m
JOIN Conversations c ON m.conversation_id = c.id
JOIN Jobs j ON c.job_id = j.id
JOIN Company_Profiles cp ON c.company_id = cp.id
JOIN Disability_Profiles dp ON c.jobseeker_id = dp.id
JOIN Users u ON m.