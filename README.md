<div align="center">

# 💸 **DoMas** *(Ｄｏｍｐｅｔ Ｍａｈａｓｉｓｗａ)* 💸
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

Ketiadaan kontrol terhadap pengeluaran harian sering memicu masalah finansial di pertengahan hingga akhir bulan. Berangkat dari keresahan tersebut, **DoMas (Dompet Mahasiswa)** dikembangkan sebagai solusi cerdas berbasis teknologi konsol yang ringan, cepat, dan mudah diakses untuk membantu mahasiswa mengambil kendali penuh atas keuangan mereka secara mandiri.

---

## 🚀 Tentang DoMas

**DoMas** adalah aplikasi pencatatan dan manajemen keuangan pribadi berbasis teks (*Command Line Interface* / CLI) yang dirancang khusus untuk mahasiswa. Program ini dibangun menggunakan bahasa pemrograman Pascal dengan pendekatan pemrograman modular (penerapan *procedure* dan *function* yang terstruktur rapi). 

Aplikasi ini tidak hanya mencatat uang masuk dan keluar, tetapi juga memproyeksikan jatah harian dan memberikan peringatan dini (*budget warning*) ketika pengeluaran mendekati batas maksimal anggaran.

---

## ✨ Fitur & Fungsi Utama

* 📥 **Pencatatan Pemasukan & Pengeluaran:** Memfasilitasi input transaksi harian lengkap dengan tanggal aktif, nominal, keterangan, dan kategori pengeluaran (Makan, Transport, Kuota, Fotokopi, Lainnya).
* 🛡️ **Validasi Keamanan Saldo:** Sistem secara otomatis menolak transaksi pengeluaran jika nominalnya melebihi sisa saldo aktif, mencegah saldo bernilai minus.
* ⚠️ **Peringatan Anggaran Dini (*Budget Warning*):** Memberikan notifikasi otomatis jika total pengeluaran telah mencapai atau melewati batas aman (80% dari total anggaran bulanan).
* 📅 **Kalkulator Jatah Harian:** Menghitung sisa jatah uang harian secara otomatis berdasarkan sisa hari efektif dalam bulan berjalan dan sisa saldo yang ada.
* 💾 **Penyimpanan Berbasis File Biner:** Data transaksi dan anggaran disimpan secara permanen ke dalam file eksternal (`dompetkos.dat` dan `anggaran.dat`) menggunakan sistem operasi file Pascal, sehingga data tidak hilang saat program ditutup.
* 📄 **Ekspor Laporan Bulanan:** Memiliki fitur cetak laporan otomatis yang merangkum ringkasan keuangan dan daftar transaksi ke dalam file teks (`laporan_bulan.txt`).

---

## 🎯 Tujuan Pembuatan

1. **Solusi Anti-Defisit:** Membantu mahasiswa menghindari krisis keuangan di akhir bulan melalui perencanaan dan pengawasan anggaran yang disiplin.
2. **Otomatisasi Keuangan Personal:** Menggantikan catatan dompet konvensional atau spreadsheet yang rumit dengan aplikasi terminal yang cepat dan efisien.
3. **Penerapan *Clean Code* & Modularitas:** Menjadi wadah implementasi konsep logika pemrograman terstruktur (rekaman, array, file biner, dan fungsi validasi rentang) dalam dunia nyata.

---

## 🛠️ Cara Menjalankan Program

1. Pastikan Anda memiliki compiler Pascal (seperti **Free Pascal / FPC** atau **Lazarus**) terinstal di komputer Anda.
2. Unduh atau *clone* repositori ini.
3. Buka terminal/command prompt pada direktori file, lalu kompilasi program:
   ```bash
   fpc DoMas.pas
