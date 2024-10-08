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


### 5. Implementasi database dengan file migrasi LARAVEL

## Migrasi untuk tabel admins

```php

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class CreateAdminsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admins', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->string('password');
            $table->timestamps();
        });

        // Insert data admin
        DB::table('admins')->insert([
            'name' => 'Admin Pertama',
            'email' => 'admin@example.com',
            'password' => Hash::make('password123'),
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admins');
    }
}


```

## Migrasi untuk tabel pekerjaan

```php

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class CreatePekerjaanTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pekerjaan', function (Blueprint $table) {
            $table->id('id_pekerjaan');
            $table->string('nama');
            $table->enum('status', ['aktif', 'non-aktif'])->default('aktif');
            $table->timestamps();
        });

        // Insert data pekerjaan
        DB::table('pekerjaan')->insert([
            ['nama' => 'Software Engineer', 'status' => 'aktif', 'created_at' => now(), 'updated_at' => now()],
            ['nama' => 'Data Analyst', 'status' => 'aktif', 'created_at' => now(), 'updated_at' => now()],
            ['nama' => 'Product Manager', 'status' => 'aktif', 'created_at' => now(), 'updated_at' => now()],
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pekerjaan');
    }
}


```

## Migrasi untuk tabel pelamar

```php

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class CreatePelamarTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pelamar', function (Blueprint $table) {
            $table->id('id_pelamar');
            $table->string('nama_lengkap');
            $table->date('tgl_lahir');
            $table->text('alamat')->nullable();
            $table->string('kode_pos', 10)->nullable();
            $table->string('email')->unique();
            $table->enum('jenis_kelamin', ['L', 'P']);
            $table->string('no_tlp', 20)->nullable();
            $table->foreignId('id_pekerjaan')->nullable()->constrained('pekerjaan')->onDelete('set null');
            $table->string('lulusan');
            $table->string('berkas'); // file berkas PDF
            $table->enum('status', ['pending', 'diterima', 'ditolak'])->default('pending');
            $table->timestamps();
        });

        // Insert data pelamar
        DB::table('pelamar')->insert([
            [
                'nama_lengkap' => 'John Doe',
                'tgl_lahir' => '1990-01-01',
                'alamat' => 'Jl. Example No. 1',
                'kode_pos' => '12345',
                'email' => 'johndoe@example.com',
                'jenis_kelamin' => 'L',
                'no_tlp' => '081234567890',
                'id_pekerjaan' => 1, // Software Engineer
                'lulusan' => 'S1 Teknik Informatika',
                'berkas' => 'johndoe_cv.pdf',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'nama_lengkap' => 'Jane Smith',
                'tgl_lahir' => '1992-02-02',
                'alamat' => 'Jl. Example No. 2',
                'kode_pos' => '54321',
                'email' => 'janesmith@example.com',
                'jenis_kelamin' => 'P',
                'no_tlp' => '089876543210',
                'id_pekerjaan' => 2, // Data Analyst
                'lulusan' => 'S1 Statistik',
                'berkas' => 'janesmith_cv.pdf',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'nama_lengkap' => 'Michael Johnson',
                'tgl_lahir' => '1988-03-03',
                'alamat' => 'Jl. Example No. 3',
                'kode_pos' => '67890',
                'email' => 'michaeljohnson@example.com',
                'jenis_kelamin' => 'L',
                'no_tlp' => '087654321098',
                'id_pekerjaan' => 3, // Product Manager
                'lulusan' => 'S2 Manajemen Bisnis',
                'berkas' => 'michaeljohnson_cv.pdf',
                'created_at' => now(),
                'updated_at' => now(),
            ]
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pelamar');
    }
}


```

### 5. Kesimpulan
Sistem rekrutmen karyawan ini dirancang untuk memfasilitasi proses pendaftaran pelamar dan pengelolaan pekerjaan oleh admin. Dengan adanya tabel yang terstruktur dan relasi yang jelas, sistem ini akan mendukung efisiensi dalam manajemen rekrutmen.
