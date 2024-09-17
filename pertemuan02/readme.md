# Analisis Kebutuhan dari Sisi Pengguna (User)

1. **Fungsionalitas:**

   - Pengguna, baik pelamar maupun staf, membutuhkan aplikasi yang bisa:
     - **Pelamar**:
       - Melamar pekerjaan yang tersedia.
       - Melihat dan memilih pekerjaan yang tersedia berdasarkan deskripsi pekerjaan, status, dan lainnya.
   - **General**: Pengguna membutuhkan sistem yang bisa mengelola berbagai interaksi antara pelamar dan admin untuk mengoptimalkan proses rekrutmen.

2. **Antarmuka Pengguna (User Interface):**

   - Antarmuka yang intuitif diperlukan agar pelamar dan tim bisa dengan mudah menavigasi aplikasi.
   - Untuk pelamar, antarmuka form yang sederhana dan jelas untuk mengisi data diri, serta tampilan daftar pekerjaan.

3. **Kinerja:**

   - Aplikasi harus cepat dan responsif. Pengguna menginginkan waktu loading yang minimal saat mengakses daftar pekerjaan dan melamar.
   - Aplikasi harus mampu menangani banyak pelamar.

4. **Keamanan:**
   - Data pelamar seperti email, alamat, dan data pribadi lainnya harus dilindungi dari akses yang tidak sah.
   - Harus ada mekanisme untuk memastikan bahwa hanya pengguna yang berwenang (misalnya admin) yang dapat menambahkan atau mengubah informasi pekerjaan.
   - Pengguna harus bisa mempercayai sistem ini dalam menyimpan informasi pribadi dengan aman (misalnya, menggunakan enkripsi untuk kata sandi dan data sensitif lainnya).

# Analisis Kebutuhan dari Sisi Administrator (Admin)

1. **Pengelolaan Data:**
   - Admin harus bisa mengelola data pelamar, pekerjaan, wawancara, serta informasi terkait tim. Tabel-tabel dalam database harus terhubung dengan baik agar admin dapat melihat seluruh informasi yang relevan dari satu antarmuka.
   - Dibutuhkan sistem pencarian dan filter untuk mempermudah pencarian pelamar berdasarkan status pekerjaan, jadwal wawancara, atau berdasarkan profil pelamar.
   - Admin harus bisa mem-backup dan merestore data pelamar, tim, pekerjaan, dan wawancara untuk memastikan tidak ada data yang hilang.

2. **Laporan:**
   - Admin harus dapat menghasilkan laporan terkait pelamar, wawancara, dan pekerjaan yang sedang dibuka atau sudah terisi.
   - Laporan juga harus mencakup informasi mengenai performa wawancara, jumlah pelamar yang mendaftar pada posisi tertentu, serta status wawancara pelamar.

3. **Pengembangan dan Pemeliharaan:**
   - Sistem harus fleksibel dan bisa diperbarui di masa mendatang. Misalnya, menambahkan fitur baru seperti integrasi dengan platform media sosial atau portal karir.
   - Administrator juga membutuhkan sistem monitoring untuk melacak masalah teknis, misalnya waktu loading yang lama atau kegagalan input data.


# Kesimpulan
