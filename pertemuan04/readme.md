# Sistem Informasi Lowongan Keja Berbasis Web Menggunakan Laravel

## Judul
Sistem Informasi Lowongan Keja Berbasis Web Menggunakan Laravel

## Analisis Kebutuhan

### 1. Kebutuhan Fungsional

#### a. Tabel Admin
- **Fungsi**: Mengelola aplikasi rekrutmen, termasuk menambah, mengedit, dan menghapus data pekerjaan serta memantau status pelamar.
- **Input**: Nama, email, dan password untuk otentikasi.
- **Output**: Daftar pekerjaan dan daftar pelamar dengan status pendaftaran.

#### b. Tabel Pelamar
- **Fungsi**: Menyimpan informasi pelamar yang melamar pekerjaan.
- **Input**: Data pribadi pelamar (nama, tanggal lahir, alamat, kode pos, email, jenis kelamin, nomor telepon), ID pekerjaan yang dilamar, lulusan, dan berkas (CV/portofolio).
- **Output**: Status pendaftaran pelamar (pending, diterima, ditolak).

#### c. Tabel Pekerjaan
- **Fungsi**: Menyimpan informasi tentang posisi pekerjaan yang tersedia.
- **Input**: Nama pekerjaan dan status (aktif/non-aktif).
- **Output**: Daftar pekerjaan yang tersedia untuk pelamar.

### 2. Kebutuhan Non-Fungsional
- **Keamanan**: Sistem harus menjamin keamanan data admin dan pelamar, terutama informasi sensitif seperti password dan data pribadi.
- **Ketersediaan**: Sistem harus selalu tersedia untuk admin dan pelamar untuk mengakses informasi dan melakukan pendaftaran.
- **Usability**: Antarmuka pengguna harus intuitif dan mudah digunakan untuk admin dan pelamar.

### 3. Kebutuhan Data
- **Data Admin**: Informasi untuk login dan pengelolaan aplikasi.
- **Data Pelamar**: Informasi pribadi dan dokumen pendukung untuk proses rekrutmen.
- **Data Pekerjaan**: Informasi tentang posisi yang tersedia dan statusnya.

### 4. Relasi Antar Tabel
- **Pelamar dan Pekerjaan**: Setiap pelamar dapat melamar untuk satu posisi pekerjaan, yang dihubungkan melalui `id_pekerjaan`.

### 5. Kesimpulan
Sistem rekrutmen karyawan ini dirancang untuk memfasilitasi proses pendaftaran pelamar dan pengelolaan pekerjaan oleh admin. Dengan adanya tabel yang terstruktur dan relasi yang jelas, sistem ini akan mendukung efisiensi dalam manajemen rekrutmen.
