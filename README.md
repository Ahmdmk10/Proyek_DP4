<div align="center">

![Status](https://img.shields.io/badge/Status-Active-2ea44f?style=for-the-badge)
![Bahasa](https://img.shields.io/badge/Bahasa-Pascal-E3A21A?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-CLI%20%2F%20Terminal-1f6feb?style=for-the-badge)
![Proyek](https://img.shields.io/badge/Proyek-Lab%20Dasar%20Pemrograman-ff69b4?style=for-the-badge)

```text
======      =====     =     =     ===      ======
=     =    =     =    ==   ==    =   =    =
=     =    =     =    = = = =   =======    =====
=     =    =     =    =  =  =   =     =         =
======      =====     =     =   =     =   ======
```

# 💰 DoMas (Dompet Mahasiswa)

### Terminal-Based Financial Tracking System sebagai Solusi Praktis Pengendalian Pengeluaran Harian Mahasiswa

*Catat setiap rupiah, jaga uang bulananmu sampai akhir bulan.* ✨

**Proyek UTS Dasar Pemrograman (DP4)**<br>
Program Studi Ilmu Komputer, Universitas Sumatera Utara<br>
Semester Ganjil T.A. 2026/2027

</div>

---

<details>
<summary><b>📑 Daftar Isi (klik untuk membuka)</b></summary>

<br>

1. [👥 Anggota Kelompok](#-anggota-kelompok)
2. [📖 Latar Belakang](#-latar-belakang)
3. [🎯 Tentang DoMas](#-tentang-domas)
4. [🚀 Fitur dan Fungsi Utama](#-fitur-dan-fungsi-utama)
5. [📸 Tangkapan Layar](#-tangkapan-layar)
6. [🖥️ Contoh Tampilan](#️-contoh-tampilan)
7. [🏆 Tujuan Pembuatan](#-tujuan-pembuatan)
8. [⚙️ Cara Menjalankan Program](#️-cara-menjalankan-program)

</details>

---

## 👥 Anggota Kelompok

| No | Nama | NIM | KOM | Lab |
|:-:|---|---|:-:|:-:|
| 1 | *(isi nama lengkap)* | *(isi NIM)* | *(isi KOM)* | *(isi nomor lab)* |

---

## 📖 Latar Belakang

Mahasiswa perantau atau anak kos harus mengatur uang sendiri. Uang bulanan datang sekaligus di awal bulan, sedangkan pengeluaran datang sedikit demi sedikit setiap hari: makan, ongkos, kuota, fotokopi tugas, dan lain-lain.

Banyak yang mencatat keuangan secara **manual** atau tidak mencatat sama sekali. Akibatnya:

- 😵 Tidak tahu uang habis ke mana.
- 📉 Pengeluaran kecil menumpuk tanpa terasa.
- 🚨 Di akhir bulan saldo menipis dan terjadi **defisit anggaran**.

DoMas dibuat untuk membantu masalah ini: catat cepat lewat terminal, hitung otomatis, dan beri peringatan **sebelum** uang habis.

---

## 🎯 Tentang DoMas

**DoMas (Dompet Mahasiswa)** adalah aplikasi pencatat keuangan berbasis **Command Line Interface (CLI)** yang ditulis dengan bahasa **Pascal**. Program dibuat dengan konsep **pemrograman modular**:

| 🧩 Konsep | 📌 Dipakai untuk |
|---|---|
| `procedure` dan `function` | Memecah program menjadi tugas kecil yang bisa dipakai ulang |
| `record` | Menyimpan satu catatan transaksi (tanggal, jenis, kategori, nominal, keterangan) |
| Array terstruktur | Menampung hingga 200 transaksi dan total per kategori |
| File biner (*typed file*) | Menyimpan data agar tidak hilang saat program ditutup |
| Penanganan error I/O | Program tidak berhenti saat file belum ada (`{$I-}`, `{$I+}`, `IOResult`) |

---

## 🚀 Fitur dan Fungsi Utama

### 1. 📥 Pencatatan Pemasukan (`CatatPemasukan`)

- Mencatat uang masuk seperti kiriman orang tua atau gaji kerja paruh waktu.
- Tanggal dibatasi sesuai jumlah hari di bulan berjalan (tahun kabisat ikut dihitung).
- Kapasitas maksimal **200 transaksi**. Kalau penuh, program memberi pesan dan data lama tetap aman.

> 🧠 **Logika singkat:** tanggal dibatasi oleh `HariDalamBulan`. Data disiapkan dulu di variabel sementara, lalu dimasukkan ke array dan langsung disimpan ke file.

### 2. 📤 Pencatatan Pengeluaran dan Validasi Saldo (`CatatPengeluaran`)

Pengeluaran dicatat dalam **5 kategori**:

| No | Kategori |
|:-:|---|
| 1 | 🍛 Makan |
| 2 | 🚌 Transport |
| 3 | 📶 Kuota |
| 4 | 🖨️ Fotokopi |
| 5 | 📦 Lainnya |

- 🛡️ **Validasi sisa saldo.** Pengeluaran yang lebih besar dari sisa saldo ditolak, jadi saldo tidak pernah minus.
- ⚠️ **Peringatan dini anggaran.** Begitu pengeluaran mencapai **80 persen** dari anggaran, program menampilkan peringatan beserta persentasenya.

> 🧠 **Logika singkat:** nominal dibandingkan dengan `SisaSaldo` (total pemasukan dikurangi total pengeluaran bulan itu). Kalau lebih besar, transaksi ditolak. Kalau lolos, total pengeluaran dibandingkan dengan 80 persen anggaran untuk menentukan perlu tidaknya peringatan.

### 3. 📊 Ringkasan Keuangan Bulanan (`TampilRingkasan`)

- Menampilkan anggaran, total pemasukan, total pengeluaran, dan sisa saldo.
- Menampilkan pengeluaran per kategori beserta persentasenya.
- 🧮 **Jatah harian otomatis:** sisa saldo dibagi sisa hari di bulan itu.

> 🧠 **Logika singkat:** total dijumlahkan dengan perulangan sambil menyaring bulan dan tahun. Sisa hari = jumlah hari bulan ini dikurangi tanggal hari ini ditambah 1. Jatah harian = sisa saldo dibagi sisa hari.

### 4. 📝 Ekspor Laporan Bulanan (`CetakLaporan`)

Menulis laporan bulan berjalan ke file teks **`laporan_bulan.txt`**, berisi ringkasan, total per kategori, dan daftar transaksi bulan itu.

> 🧠 **Logika singkat:** file teks dibuat dengan `rewrite`, isinya ditulis dengan `writeln(F, ...)`, hanya transaksi di bulan dan tahun aktif yang ikut ditulis, lalu file ditutup.

### 5. 💾 Manajemen File dan Tanggal Otomatis

- 📅 Tanggal diambil otomatis dari komputer lewat `GetDate`.
- 🗃️ File biner **`dompetkos.dat`** menyimpan semua transaksi.
- 🗃️ File biner **`anggaran.dat`** menyimpan anggaran bulanan.
- 🔒 Saat pertama dijalankan, file belum ada. Program mendeteksinya lewat `IOResult`, lalu meminta anggaran awal tanpa error.

> 🧠 **Logika singkat:** file dibuka dengan `reset` di antara `{$I-}` dan `{$I+}`, lalu `IOResult = 0` berarti file ada. Data dibaca dengan `while not eof` sampai habis. Untuk menyimpan, file dibuka dengan `rewrite` lalu setiap transaksi ditulis satu per satu.

---

## 📸 Tangkapan Layar

Hasil jalannya program (ganti nama file sesuai tangkapan layar milik kelompok, simpan di folder `screenshots/`).

| Menu Utama | Catat Pemasukan |
|:-:|:-:|
| ![Menu Utama](screenshots/menu.png) | ![Catat Pemasukan](screenshots/pemasukan.png) |

| Catat Pengeluaran dan Peringatan | Ringkasan Bulanan |
|:-:|:-:|
| ![Pengeluaran](screenshots/pengeluaran.png) | ![Ringkasan](screenshots/ringkasan.png) |

| Laporan Bulanan (`laporan_bulan.txt`) |
|:-:|
| ![Laporan](screenshots/laporan.png) |

---

## 🖥️ Contoh Tampilan

**Menu utama**

```text
=========== DOMPETKOS ===========
 1. Catat pemasukan
 2. Catat pengeluaran
 3. Lihat ringkasan
 4. Cetak laporan
 5. Keluar
=================================
Pilih menu (1-5):
```

**Peringatan saat pengeluaran mencapai 80 persen anggaran**

```text
Pengeluaran tersimpan.
PERINGATAN: pengeluaran sudah 85 persen dari anggaran!
```

**Ringkasan bulanan**

```text
------------------------------------------------
 RINGKASAN Oktober 2026
------------------------------------------------
 Anggaran        : Rp 1000000
 Total pemasukan : Rp 2000000
 Total keluar    : Rp 850000
 Sisa saldo      : Rp 1150000
------------------------------------------------
 Pengeluaran per kategori:
  Makan      Rp     600000  (70%)
  Transport  Rp     250000  (29%)
  Kuota      Rp          0  (0%)
  Fotokopi   Rp          0  (0%)
  Lainnya    Rp          0  (0%)
------------------------------------------------
 Jatah per hari (sisa 16 hari): Rp 71875
------------------------------------------------
```

---

## 🏆 Tujuan Pembuatan

- 🛑 **Solusi anti-defisit.** Membantu mahasiswa melihat pengeluaran sejak dini dan berhenti sebelum saldo habis.
- 🤖 **Otomatisasi keuangan personal.** Total, sisa saldo, persentase, dan jatah harian dihitung otomatis.
- 🧼 **Penerapan clean code.** Setiap tugas dipisah menjadi `procedure` atau `function`, memakai konstanta bernama, dan validasi input lewat satu fungsi `InputAngka`.

---

## ⚙️ Cara Menjalankan Program

### 1️⃣ Pasang Free Pascal Compiler

| Sistem | Cara pasang |
|---|---|
| 🪟 **Windows** | Unduh installer dari [freepascal.org](https://www.freepascal.org/download.html) |
| 🐧 **Linux** | `sudo apt install fpc` |
| 🍎 **macOS** | `brew install fpc` |

### 2️⃣ Kompilasi

Buka terminal di folder yang berisi `DoMas.pas`, lalu jalankan:

```bash
fpc DoMas.pas
```

### 3️⃣ Jalankan

**🪟 Windows**

```bat
DoMas.exe
```

**🐧 Linux dan 🍎 macOS**

```bash
./DoMas
```

> [!TIP]
> Saat pertama dijalankan, DoMas meminta **anggaran bulanan**. Setelah itu data tersimpan otomatis dan dimuat lagi pada pemakaian berikutnya.

> [!NOTE]
> Jalankan program dari folder yang sama setiap kali, karena `dompetkos.dat` dan `anggaran.dat` dibuat di folder kerja saat ini.

---

<div align="center">

### 🌱 *"Uang yang dicatat adalah uang yang terjaga."*

Proyek Lab Dasar Pemrograman, dibuat dengan Pascal. 💙

</div>
