program DompetKos;
const
  MAKS_TRANSAKSI    = 200;                 { kapasitas array transaksi }
  JML_KATEGORI      = 5;                   { jumlah kategori pengeluaran }
  BATAS_PERINGATAN  = 0.8;                 { 80 persen dari anggaran }
  NAMA_FILE_DATA    = 'dompetkos.dat';     { database transaksi }
  NAMA_FILE_ANGGARAN = 'anggaran.dat';     { menyimpan anggaran bulanan }
  NAMA_FILE_LAPORAN = 'laporan_bulan.txt'; { hasil cetak laporan }

  NAMA_KATEGORI: array[1..JML_KATEGORI] of string =
    ('Makan', 'Transport', 'Kuota', 'Fotokopi', 'Lainnya');

  NAMA_BULAN: array[1..12] of string =
    ('Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
     'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember');

{ ====================== TYPE ===================== }
type
  TJenis    = (Pemasukan, Pengeluaran);
  TKategori = 1..JML_KATEGORI;

  TTanggal = record
    Hari  : 1..31;
    Bulan : 1..12;
    Tahun : integer;
  end;

  TTransaksi = record
    Tanggal    : TTanggal;
    Jenis      : TJenis;
    Kategori   : TKategori;      { diisi 1 untuk pemasukan, tidak dipakai }
    Nominal    : longint;
    Keterangan : string[40];
  end;

  TDaftarTransaksi = array[1..MAKS_TRANSAKSI] of TTransaksi;
  TTotalKategori   = array[TKategori] of longint;


var
  Transaksi  : TDaftarTransaksi;   { semua catatan transaksi }
  JmlTrans   : integer;            { jumlah transaksi yang terisi }
  Anggaran   : longint;            { batas pengeluaran bulan ini }
  BulanAktif : 1..12;              { bulan yang sedang dilihat }
  TahunAktif : integer;            { tahun yang sedang dilihat }

  FileData     : file of TTransaksi;  { file database transaksi }
  FileAnggaran : file of longint;     { file anggaran }

  Pilihan : integer;               { pilihan menu }
  Selesai : boolean;               { penanda keluar dari loop menu }
