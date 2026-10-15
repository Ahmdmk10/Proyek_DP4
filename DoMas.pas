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

function InputAngka(Pesan: string; Min, Maks: longint): longint;
var
  S    : string;
  N    : longint;
  Kode : integer;
begin
  repeat
    write(Pesan);
    readln(S);
    val(S, N, Kode);
    if (Kode <> 0) or (N < Min) or (N > Maks) then
      writeln('  Input tidak valid. Isi angka ', Min, ' sampai ', Maks, '.');
  until (Kode = 0) and (N >= Min) and (N <= Maks);
  InputAngka := N;
end;

function kabisat(tahun : integer) : boolean;
begin
  kabisat := ((tahun mod 4 = 0)) and ((tahun mod 100 <> 0)) or ((tahun mod 400 = 0));
end;

function InputAngka(Pesan: string; Min, Maks: longint): longint;
var
  S    : string;
  N    : longint;
  Kode : integer;
begin
  repeat
    write(Pesan);
    readln(S);
    val(S, N, Kode);
    if (Kode <> 0) or (N < Min) or (N > Maks) then
      writeln('  Input tidak valid. Isi angka ', Min, ' sampai ', Maks, '.');
  until (Kode = 0) and (N >= Min) and (N <= Maks);
  InputAngka := N;
end;

procedure Garis;
begin
  writeln('--------------------------------');
end;


