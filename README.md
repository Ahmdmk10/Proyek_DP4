<div align="center">

# ==========================================================
#                      Ｄｏｍｐｅｔ Ｍａｈａｓｉｓｗａ (ＤｏＭａｓ)
# ==========================================================
### **Terminal-Based Financial Tracking System sebagai Solusi Praktis Pengendalian Pengeluaran Harian Mahasiswa**

<p align="center">
  <img src="https://img.shields.io/badge/Language-Pascal-blue?style=for-the-badge&logo=codeproject&logoColor=white" alt="Pascal">
  <img src="https://img.shields.io/badge/Platform-CLI%20%2F%20Terminal-orange?style=for-the-badge&logo=windows-terminal&logoColor=white" alt="CLI">
  <img src="https://img.shields.io/badge/Status-Active-success?style=for-the-badge" alt="Status">
</p>

</div>

---

## 📖 Latar Belakang

Bagi sebagian besar mahasiswa—terutama yang merantau dan tinggal di kos—mengatur keuangan bulanan adalah tantangan yang pelik. Sering kali kiriman atau uang saku bulanan habis sebelum waktunya akibat pencatatan keuangan yang manual, tidak terstruktur, atau bahkan diabaikan begitu saja. 

Ketiadaan kontrol terhadap pengeluaran harian sering memicu masalah finansial di pertengahan hingga akhir bulan (defisit anggaran). Berangkat dari keresahan tersebut, **DoMas (Dompet Mahasiswa)** dikembangkan sebagai solusi cerdas berbasis teknologi konsol yang ringan, cepat, dan mudah diakses untuk membantu mahasiswa mengambil kendali penuh atas keuangan mereka secara mandiri.

---

## 🚀 Tentang DoMas

**DoMas** adalah aplikasi pencatatan dan manajemen keuangan pribadi berbasis teks (*Command Line Interface* / CLI) yang dirancang khusus untuk mahasiswa. Program ini dibangun menggunakan bahasa pemrograman Pascal dengan pendekatan pemrograman modular yang menerapkan konsep *procedure*, *function*, rekaman (*record*), array terstruktur, dan manajemen file biner.

Aplikasi ini tidak hanya mencatat uang masuk dan keluar, tetapi juga memproyeksikan jatah harian otomatis berdasarkan kalender sistem serta memberikan peringatan dini ketika pengeluaran mendekati batas anggaran.

---

## ✨ Fitur & Fungsi Utama

Berdasarkan arsitektur kodenya, **DoMas** dilengkapi dengan berbagai fitur fungsional berikut:

1. **Pencatatan Pemasukan (`CatatPemasukan`)**
   * Memfasilitasi input uang masuk ke dalam dompet lengkap dengan tanggal aktif, nominal, keterangan, dan batasan kapasitas sistem hingga 200 transaksi.
   * Data langsung diamankan secara permanen ke media penyimpanan file biner.

2. **Pencatatan Pengeluaran & Validasi Saldo (`CatatPengeluaran`)**
   * Mencatat pengeluaran harian berdasarkan 5 kategori utama: *Makan, Transport, Kuota, Fotokopi,* dan *Lainnya*.
   * **Validasi Keamanan Saldo:** Sistem secara otomatis menolak transaksi pengeluaran jika nominalnya melebihi sisa saldo aktif, mencegah saldo bernilai minus.
   * **Peringatan Anggaran Dini (*Budget Warning*):** Memberikan notifikasi otomatis jika total pengeluaran telah mencapai atau melewati batas aman ($80\%$ dari total anggaran bulanan).

3. **Ringkasan Keuangan Bulanan (`TampilRingkasan`)**
   * Menyajikan rekapitulasi finansial secara instan di terminal (total anggaran, total pemasukan, total pengeluaran, dan sisa saldo).
   * Menampilkan rincian pengeluaran per kategori beserta persentasenya.
   * **Kalkulator Jatah Harian:** Menghitung sisa jatah uang harian secara otomatis berdasarkan sisa hari efektif hingga akhir bulan.

4. **Ekspor Laporan Bulanan (`CetakLaporan`)**
   * Memiliki fitur cetak laporan otomatis yang merangkum ringkasan keuangan dan daftar riwayat transaksi ke dalam file teks eksternal (`laporan_bulan.txt`).

5. **Manajemen File & Tanggal Otomatis**
   * **Persistence Storage:** Menyimpan dan memuat data transaksi serta anggaran secara otomatis melalui file biner (`dompetkos.dat` dan `anggaran.dat`) dengan penanganan error I/O (*error handling*).
   * **Integrasi Sistem (`GetDate`):** Mengambil informasi tanggal, bulan, dan tahun secara otomatis dari sistem operasi komputer saat program dijalankan.

---

## 🎯 Tujuan Pembuatan

* **Solusi Anti-Defisit:** Membantu mahasiswa menghindari krisis keuangan di akhir bulan melalui perencanaan dan pengawasan anggaran yang disiplin.
* **Otomatisasi Keuangan Personal:** Menggantikan catatan dompet konvensional atau *spreadsheet* yang rumit dengan aplikasi terminal yang cepat dan efisien.
* **Penerapan *Clean Code* & Modularitas:** Menjadi wadah implementasi konsep logika pemrograman terstruktur dalam dunia nyata.

---

## 🛠️ Cara Menjalankan Program

1. Pastikan Anda memiliki compiler Pascal (seperti **Free Pascal / FPC** atau **Lazarus**) terinstal di komputer Anda.
2. Unduh atau *clone* repositori ini[span_0](start_span)[span_0](end_span).
3. Buka terminal atau command prompt pada direktori file, lalu kompilasi program:
   ```bash
   fpc DoMas.pas
