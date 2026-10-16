<div align="center">

![Status](https://img.shields.io/badge/Status-Active-2ea44f?style=for-the-badge&logo=checkmarx&logoColor=white)
![Bahasa](https://img.shields.io/badge/Bahasa-Pascal-E3A21A?style=for-the-badge&logo=delphi&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-CLI%20%2F%20Terminal-1f6feb?style=for-the-badge&logo=gnometerminal&logoColor=white)
![Lisensi](https://img.shields.io/badge/Lisensi-MIT-8957e5?style=for-the-badge&logo=opensourceinitiative&logoColor=white)

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

![Free Pascal](https://img.shields.io/badge/Free%20Pascal-3.2.2-orange?style=flat-square)
![Platform OS](https://img.shields.io/badge/Windows%20%7C%20Linux%20%7C%20macOS-supported-blue?style=flat-square)
![Tipe](https://img.shields.io/badge/Tipe-Proyek%20Praktikum-ff69b4?style=flat-square)

</div>

---

<details>
<summary><b>📑 Daftar Isi (klik untuk membuka)</b></summary>

<br>

1. [📖 Latar Belakang](#-latar-belakang)
2. [🎯 Tentang DoMas](#-tentang-domas)
3. [🚀 Fitur dan Fungsi Utama](#-fitur-dan-fungsi-utama)
4. [🖥️ Contoh Tampilan](#️-contoh-tampilan)
5. [🏆 Tujuan Pembuatan](#-tujuan-pembuatan)
6. [🧱 Struktur Proyek](#-struktur-proyek)
7. [⚙️ Cara Menjalankan Program](#️-cara-menjalankan-program)
8. [🔮 Rencana Pengembangan](#-rencana-pengembangan)
9. [📄 Lisensi](#-lisensi)

</details>

---

## 📖 Latar Belakang

Hidup sebagai mahasiswa perantau atau anak kos berarti mengatur uang sendiri untuk pertama kalinya. Uang bulanan datang sekaligus di awal bulan, sementara pengeluaran datang sedikit demi sedikit setiap hari: makan, ongkos, kuota internet, fotokopi tugas, dan banyak hal kecil lainnya.

Masalahnya, banyak mahasiswa mencatat keuangan secara **manual** atau tidak mencatat sama sekali. Akibatnya:

- 😵 Tidak tahu uang habis ke mana.
- 📉 Pengeluaran kecil menumpuk tanpa terasa.
- 🚨 Di minggu terakhir bulan, saldo menipis dan terjadi **defisit anggaran**.
- 🍜 Terpaksa berhemat berlebihan atau meminjam uang teman.

DoMas hadir untuk menutup celah ini dengan cara yang sederhana: catat cepat lewat terminal, hitung otomatis, dan beri peringatan **sebelum** uang benar-benar habis.

---

## 🎯 Tentang DoMas

**DoMas (Dompet Mahasiswa)** adalah aplikasi pencatat keuangan berbasis **Command Line Interface (CLI)** yang ditulis dengan bahasa **Pascal**. Program berjalan di terminal dengan menu angka yang mudah dipakai.

Proyek ini dibangun dengan konsep **pemrograman modular**:

| 🧩 Konsep | 📌 Dipakai untuk |
|---|---|
| `procedure` dan `function` | Memecah program menjadi tugas kecil yang bisa dipakai ulang |
| `record` | Menyimpan satu catatan transaksi (tanggal, jenis, kategori, nominal, keterangan) |
| Array terstruktur | Menampung hingga 200 transaksi dan total per kategori |
| Tipe terenumerasi dan subrentang | Membatasi nilai jenis transaksi dan nomor kategori |
| File biner (*typed file*) | Menyimpan data agar tidak hilang saat program ditutup |
| Penanganan error I/O | Program tidak berhenti saat file belum ada (`{$I-}`, `{$I+}`, `IOResult`) |

---

## 🚀 Fitur dan Fungsi Utama

### 1. 📥 Pencatatan Pemasukan (`CatatPemasukan`)

Mencatat uang masuk seperti kiriman orang tua, beasiswa, atau gaji kerja paruh waktu.

- Input tanggal dibatasi sesuai jumlah hari di bulan berjalan (tahun kabisat ikut dihitung).
- Input nominal dan keterangan (maksimal 40 karakter).
- Kapasitas penyimpanan **maksimal 200 transaksi**. Kalau penuh, program memberi pesan dan data lama tetap aman.

### 2. 📤 Pencatatan Pengeluaran dan Validasi Saldo (`CatatPengeluaran`)

Mencatat uang keluar dengan **5 kategori**:

| No | Kategori | Contoh |
|:-:|---|---|
| 1 | 🍛 Makan | Makan siang, galon, belanja dapur |
| 2 | 🚌 Transport | Ojek, bensin, angkot |
| 3 | 📶 Kuota | Paket data, pulsa |
| 4 | 🖨️ Fotokopi | Print dan fotokopi tugas |
| 5 | 📦 Lainnya | Kebutuhan di luar kategori di atas |

Dua perlindungan penting:

- 🛡️ **Validasi sisa saldo.** Pengeluaran yang lebih besar dari sisa saldo ditolak, jadi saldo tidak pernah minus.
- ⚠️ **Peringatan dini anggaran (*budget warning*).** Begitu pengeluaran mencapai **80 persen** dari anggaran, program langsung menampilkan peringatan beserta persentasenya.

### 3. 📊 Ringkasan Keuangan Bulanan (`TampilRingkasan`)

Menampilkan gambaran bulan berjalan dalam satu layar:

- Anggaran, total pemasukan, total pengeluaran, dan sisa saldo.
- Pengeluaran per kategori beserta persentasenya.
- 🧮 **Kalkulator jatah harian otomatis:** sisa saldo dibagi sisa hari di bulan itu, jadi kamu tahu batas aman belanja per hari.

### 4. 📝 Ekspor Laporan Bulanan (`CetakLaporan`)

Menulis laporan lengkap bulan berjalan ke file teks eksternal **`laporan_bulan.txt`**, berisi ringkasan, total per kategori, dan daftar semua transaksi bulan itu. File ini bisa dibuka di editor teks apa pun atau dicetak.

### 5. 💾 Manajemen File dan Tanggal Otomatis

- 📅 **Tanggal otomatis.** Program membaca tanggal komputer lewat `GetDate` (unit `dos`), jadi bulan dan tahun aktif tidak perlu diisi manual.
- 🗃️ **File biner `dompetkos.dat`** menyimpan semua transaksi (`MuatData` dan `SimpanData`).
- 🗃️ **File biner `anggaran.dat`** menyimpan anggaran bulanan (`MuatAnggaran` dan `SimpanAnggaran`).
- 🔒 **Error handling I/O.** Saat pertama kali dijalankan, file belum ada. Program mendeteksinya lewat `IOResult`, lalu meminta anggaran awal tanpa berhenti karena error.

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

**Peringatan dini saat pengeluaran mencapai 80 persen anggaran**

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
- 🤖 **Otomatisasi keuangan personal.** Total, sisa saldo, persentase kategori, dan jatah harian dihitung otomatis, tanpa kalkulator dan buku catatan.
- 🧼 **Penerapan clean code.** Setiap tugas dipisah menjadi `procedure` atau `function` dengan satu tanggung jawab, memakai konstanta bernama (bukan angka sembarang), dan validasi input yang konsisten lewat satu fungsi `InputAngka`.
- 🎓 **Latihan konsep dasar pemrograman.** Record, array, perulangan, percabangan, modularisasi, dan pengolahan file dalam satu proyek utuh.

---

## 🧱 Struktur Proyek

```text
DoMas/
├── DoMas.pas            # Kode sumber utama
├── README.md            # Dokumentasi ini
├── LICENSE              # Lisensi MIT
│
└── (dibuat otomatis saat program berjalan)
    ├── dompetkos.dat        # Database transaksi (file biner)
    ├── anggaran.dat         # Anggaran bulanan (file biner)
    └── laporan_bulan.txt    # Hasil cetak laporan
```

Urutan modul di dalam `DoMas.pas`:

| Bagian | Isi |
|---|---|
| 🔧 Fungsi Bantu | `InputAngka`, `Kabisat`, `HariDalamBulan`, `Garis` |
| 💾 Manajemen File | `MuatData`, `SimpanData`, `MuatAnggaran`, `SimpanAnggaran` |
| 🧮 Perhitungan Keuangan | `TotalPemasukan`, `TotalPengeluaran`, `SisaSaldo`, `HitungPerKategori` |
| ✍️ Input Transaksi | `CatatPemasukan`, `CatatPengeluaran` |
| 🖼️ Tampilan | `TampilMenu`, `TampilRingkasan`, `CetakLaporan` |

---

## ⚙️ Cara Menjalankan Program

### 1️⃣ Pasang Free Pascal Compiler

| Sistem | Cara pasang |
|---|---|
| 🪟 **Windows** | Unduh installer dari [freepascal.org](https://www.freepascal.org/download.html), lalu ikuti petunjuk instalasi |
| 🐧 **Linux (Debian/Ubuntu)** | `sudo apt install fpc` |
| 🍎 **macOS** | `brew install fpc` |

Cek instalasi dengan perintah `fpc -iV`.

### 2️⃣ Unduh proyek

```bash
git clone https://github.com/USERNAME/DoMas.git
cd DoMas
```

### 3️⃣ Kompilasi

```bash
fpc DoMas.pas
```

Kalau berhasil, akan muncul file hasil kompilasi di folder yang sama.

### 4️⃣ Jalankan

**🪟 Windows (Command Prompt atau PowerShell)**

```bat
DoMas.exe
```

**🐧 Linux dan 🍎 macOS (Terminal)**

```bash
./DoMas
```

> [!TIP]
> Saat pertama kali dijalankan, DoMas akan meminta **anggaran bulanan**. Setelah itu data tersimpan otomatis dan akan dimuat lagi pada pemakaian berikutnya.

> [!NOTE]
> Jalankan program dari folder yang sama setiap kali, karena file `dompetkos.dat` dan `anggaran.dat` dibuat di folder kerja saat ini.

---

## 🔮 Rencana Pengembangan

- [ ] Menu hapus dan ubah transaksi
- [ ] Memilih bulan dan tahun yang ingin dilihat
- [ ] Anggaran terpisah untuk tiap kategori
- [ ] Ekspor laporan dalam format CSV
- [ ] Peningkatan kapasitas transaksi

---

## 📄 Lisensi

Proyek ini dirilis di bawah lisensi **MIT**. Silakan dipakai, dipelajari, dan dikembangkan lebih lanjut.

---

<div align="center">

### 🌱 *"Uang yang dicatat adalah uang yang terjaga. Mulai dari catatan kecil hari ini, raih kebebasan finansial di masa depan."*

Dibuat dengan ❤️ dan secangkir kopi oleh mahasiswa, untuk mahasiswa.

![Pengunjung](https://komarev.com/ghpvc/?username=USERNAME&label=Pengunjung&color=blueviolet&style=for-the-badge)

⭐ Kalau proyek ini membantu, jangan lupa beri bintang di repositori ini.

</div>
