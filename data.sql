-- 1. Membuat pengguna
-- Ketentuan : 1 Admin, 5 Perusahaan, 5 Kandidat
INSERT INTO Users (id, email, password_hash, user_type) VALUES
(1, 'admin@jobportal.com', 'hashed_password_admin', 'admin'),
-- Perusahaan
(2, 'hr@techcorp.id', 'hashed_password_hr1', 'employer'),
(3, 'recruit@startupjaya.co', 'hashed_password_hr2', 'employer'),
(6, 'career@globalmart.com', 'hashed_password_hr3', 'employer'),
(7, 'hiring@creativeworks.id', 'hashed_password_hr4', 'employer'),
(8, 'hrd@healthfirst.co', 'hashed_password_hr5', 'employer'),
-- Kandidat
(4, 'budi.susanto@email.com', 'hashed_password_budi', 'candidate'),
(5, 'citra.dewi@email.com', 'hashed_password_citra', 'candidate'),
(9, 'rina.hartono@email.com', 'hashed_password_rina', 'candidate'),
(10, 'david.lee@email.com', 'hashed_password_david', 'candidate'),
(11, 'sarah.putri@email.com', 'hashed_password_sarah', 'candidate');

-- 2. Profil perusahaan 
INSERT INTO Company_Profiles (user_id, company_name, industry, company_address, website) VALUES
(2, 'TechCorp Indonesia', 'Information Technology', 'Jl. Sudirman No. 1, Jakarta', 'https://techcorp.id'),
(3, 'Startup Jaya Digital', 'Creative Agency', 'Jl. Gatot Subroto No. 2, Bandung', 'https://startupjaya.co'),
(6, 'Global Mart', 'Retail', 'Jl. Thamrin No. 5, Surabaya', 'https://globalmart.com'),
(7, 'Creative Works Studio', 'Design', 'Jl. Dago No. 10, Bandung', 'https://creativeworks.id'),
(8, 'HealthFirst Clinic', 'Healthcare', 'Jl. Diponegoro No. 8, Yogyakarta', 'https://healthfirst.co');

-- 3. Profil kandidat
INSERT INTO Disability_Profiles (user_id, full_name, phone_number, skills, disability_type, cv_file_path) VALUES
(4, 'Budi Susanto', '081234567890', 'Python, Django, SQL, AWS', 'Mobilitas Rendah', '/cv/budi_susanto.pdf'),
(5, 'Citra Dewi', '081122334455', 'Figma, UI/UX Research, Prototyping', 'Tunarungu', '/cv/citra_dewi.pdf'),
(9, 'Rina Hartono', '081222333444', 'Content Writing, SEO, WordPress', 'Pengguna Kursi Roda', '/cv/rina_hartono.pdf'),
(10, 'David Lee', '081333444555', 'JavaScript, React, Node.js', 'Tunanetra Parsial', '/cv/david_lee.pdf'),
(11, 'Sarah Putri', '081444555666', 'Adobe Illustrator, Photoshop, Branding', 'Disleksia', '/cv/sarah_putri.pdf');

-- 4. Perusahaan post lowongan pekerjaan
INSERT INTO Jobs (id, employer_id, title, description, location, job_type, salary) VALUES
(1, 2, 'Senior Backend Developer', 'Membangun dan memelihara sisi server aplikasi kami.', 'Jakarta', 'Full-time', 'Rp 15jt - 20jt'),
(2, 3, 'UI/UX Designer', 'Mendesain antarmuka yang indah dan ramah pengguna.', 'Bandung', 'Full-time', 'Rp 8jt - 12jt'),
(3, 2, 'Data Analyst', 'Menganalisis data untuk insight bisnis.', 'Remote', 'Contract', 'Rp 10jt'),
(4, 7, 'Graphic Designer', 'Membuat aset visual untuk kampanye marketing.', 'Bandung', 'Full-time', 'Rp 7jt - 9jt'),
(5, 6, 'Admin Gudang', 'Mengelola stok barang dan melakukan pencatatan.', 'Surabaya', 'Full-time', 'Rp 5jt - 6jt'),
(6, 8, 'Perawat Jaga', 'Memberikan pelayanan kesehatan kepada pasien.', 'Yogyakarta', 'Part-time', 'Rp 3jt'),
(7, 3, 'Social Media Specialist', 'Mengelola semua akun media sosial perusahaan.', 'Remote', 'Contract', 'Rp 6jt');

-- 5. Kandidat melamar pekerjaan 
INSERT INTO Applications (job_id, candidate_id, application_status, hr_notes) VALUES
(1, 4, 'Accepted', 'Selamat! Anda diterima. Mohon cek email untuk offering letter.'),
(2, 5, 'Rejected', 'Terima kasih atas minat Anda. Saat ini kami mencari kandidat dengan pengalaman lebih di bidang riset kualitatif.'),
(3, 5, 'In Progress', 'Lamaran Anda sedang kami review.'),
(4, 11, 'In Progress', 'Portfolio Anda menarik, kami akan segera jadwalkan interview.'),
(5, 9, 'Submitted', NULL),
(3, 10, 'Submitted', NULL),
(7, 9, 'Accepted', 'Selamat bergabung dengan tim Startup Jaya Digital!');

-- 6. Kandidat memberikan ulasan 
INSERT INTO Reviews (reviewer_id, reviewee_id, rating, review_content) VALUES
(4, 2, 5, 'Proses rekrutmen sangat profesional dan cepat. HR sangat membantu.'),
(5, 3, 3, 'Feedback penolakannya cukup jelas, tapi prosesnya agak lama.'),
(9, 3, 5, 'Sangat senang bisa diterima! Komunikasi selama proses rekrutmen sangat baik.'),
(4, 3, 4, 'Pernah interview di sini, lingkungannya terlihat sangat positif.'),
(11, 2, 4, 'Meskipun belum ada hasil, proses interview berjalan dengan lancar dan nyaman.');

-- 7. Pengguna melaporkan perusahaan/lowongan 
INSERT INTO Reports (reporter_id, reported_company_id, related_job_id, reason, report_status) VALUES
(5, 3, 2, 'Deskripsi pekerjaan tidak sesuai dengan yang ditawarkan saat interview awal. Gaji yang disebutkan juga jauh lebih rendah.', 'Submitted'),
(4, 6, 5, 'Perusahaan tidak responsif setelah lebih dari 3 minggu lamaran dikirim.', 'Submitted'),
(10, 8, 6, 'Lokasi interview tidak memiliki akses yang ramah untuk disabilitas.', 'Under Review'),
(9, 7, NULL, 'Perusahaan ini diduga melakukan diskriminasi dalam proses seleksi.', 'Resolved'),
(5, 2, 3, 'Lowongan ini sepertinya fiktif, hanya untuk mengumpulkan data pelamar.', 'Submitted');

-- 8. Membuat data untuk sistem chat 
INSERT INTO Conversations (id) VALUES (1), (2), (3);

INSERT INTO Conversation_Participants (conversation_id, user_id) VALUES
(1, 4), (1, 2), 
(2, 5), (2, 3), 
(3, 11), (3, 7);

INSERT INTO Messages (conversation_id, sender_id, message_content) VALUES
(1, 4, 'Selamat pagi, saya ingin menanyakan kelanjutan dari proses lamaran saya untuk posisi Backend Developer.'),
(1, 2, 'Pagi Budi, terima kasih sudah follow up. Lamaran Anda sudah kami terima dan sedang dalam tahap review oleh user.'),
(2, 5, 'Halo, apakah ada update untuk lamaran saya sebagai UI/UX Designer?'),
(1, 4, 'Baik, terima kasih atas informasinya.'),
(2, 3, 'Halo Citra, mohon maaf untuk posisi tersebut sudah terisi. Terima kasih atas partisipasinya.'),
(3, 11, 'Selamat siang, saya ingin mengonfirmasi jadwal interview untuk posisi Graphic Designer.');

-- 9. UNTUK KANDIDAT
-- Melihat riwayat lamaran Citra Dewi
SELECT 
    j.title AS 'Posisi yang Dilamar',
    cp.company_name AS 'Perusahaan',
    a.application_status AS 'Status Lamaran',
    a.hr_notes AS 'Catatan dari HR',
    a.applied_at AS 'Tanggal Melamar'
FROM Applications a
JOIN Jobs j ON a.job_id = j.id
JOIN Company_Profiles cp ON j.employer_id = cp.user_id
WHERE a.candidate_id = 5
ORDER BY a.applied_at DESC;


-- 2. UNTUK PERUSAHAAN
-- Melihat daftar pelamar untuk lowongan 'Senior Backend Developer' 
SELECT 
    dp.full_name AS 'Nama Pelamar',
    dp.skills AS 'Keahlian',
    dp.cv_file_path AS 'Link CV',
    a.application_status AS 'Status',
    a.applied_at AS 'Tanggal Melamar'
FROM Applications a
JOIN Disability_Profiles dp ON a.candidate_id = dp.user_id
WHERE a.job_id = 1;


-- 3. UNTUK ADMIN
-- Menampilkan semua laporan yang masih aktif ('Submitted') untuk ditindaklanjuti
SELECT 
    r.id AS 'ID Laporan',
    reporter_profile.full_name AS 'Pelapor',
    reported_company.company_name AS 'Perusahaan Dilaporkan',
    j.title AS 'Lowongan Terkait',
    r.reason AS 'Alasan Laporan',
    r.created_at AS 'Tanggal Laporan'
FROM Reports r
JOIN Disability_Profiles reporter_profile ON r.reporter_id = reporter_profile.user_id
JOIN Company_Profiles reported_company ON r.reported_company_id = reported_company.user_id
LEFT JOIN Jobs j ON r.related_job_id = j.id
WHERE r.report_status = 'Submitted';


-- 4. UNTUK ADMIN
-- Statistik untuk dashboard
SELECT 
    (SELECT COUNT(*) FROM Users WHERE user_type = 'candidate') AS 'Total Kandidat',
    (SELECT COUNT(*) FROM Users WHERE user_type = 'employer') AS 'Total Perusahaan',
    (SELECT COUNT(*) FROM Jobs WHERE publication_status = 'open') AS 'Lowongan Aktif',
    (SELECT COUNT(*) FROM Reports WHERE report_status = 'Submitted') AS 'Laporan Baru';