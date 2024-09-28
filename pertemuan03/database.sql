CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pekerjaan (
    id_pekerjaan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    status ENUM('aktif', 'non-aktif') DEFAULT 'aktif',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pelamar (
    id_pelamar INT AUTO_INCREMENT PRIMARY KEY,
    nama_lengkap VARCHAR(255) NOT NULL,
    tgl_lahir DATE NOT NULL,
    alamat TEXT,
    kode_pos VARCHAR(10),
    email VARCHAR(255) UNIQUE NOT NULL,
    jenis_kelamin ENUM('L', 'P'),
    no_tlp VARCHAR(20),
    id_pekerjaan INT,
    lulusan VARCHAR(255),
    berkas VARCHAR(255),  -- nama file pdf
    status ENUM('pending', 'diterima', 'ditolak') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pekerjaan) REFERENCES pekerjaan(id_pekerjaan) ON DELETE SET NULL
);
