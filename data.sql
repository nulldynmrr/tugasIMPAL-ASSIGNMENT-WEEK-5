
-- 1. UNTUK KANDIDAT: Melihat riwayat lamaran Citra Dewi (id: 5)
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


-- 2. UNTUK PERUSAHAAN: Melihat daftar pelamar untuk lowongan 'Senior Backend Developer' (job_id: 1)
SELECT 
    dp.full_name AS 'Nama Pelamar',
    dp.skills AS 'Keahlian',
    dp.cv_file_path AS 'Link CV',
    a.application_status AS 'Status',
    a.applied_at AS 'Tanggal Melamar'
FROM Applications a
JOIN Disability_Profiles dp ON a.candidate_id = dp.user_id
WHERE a.job_id = 1;


-- 3. UNTUK ADMIN: Menampilkan semua laporan yang masih aktif ('Submitted') untuk ditindaklanjuti
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


-- 4. UNTUK ADMIN: Statistik ringkas untuk dashboard
SELECT 
    (SELECT COUNT(*) FROM Users WHERE user_type = 'candidate') AS 'Total Kandidat',
    (SELECT COUNT(*) FROM Users WHERE user_type = 'employer') AS 'Total Perusahaan',
    (SELECT COUNT(*) FROM Jobs WHERE publication_status = 'open') AS 'Lowongan Aktif',
    (SELECT COUNT(*) FROM Reports WHERE report_status = 'Submitted') AS 'Laporan Baru';