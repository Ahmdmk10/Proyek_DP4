program DompetKos;

uses dos;

{ ===================== CONST ===================== }
const
  MAKS_TRANSAKSI     = 200;
  JML_KATEGORI       = 5;
  BATAS_PERINGATAN   = 0.8;
  NAMA_FILE_DATA     = 'dompetkos.dat';
  NAMA_FILE_ANGGARAN = 'anggaran.dat';
  NAMA_FILE_LAPORAN  = 'laporan_bulan.txt';

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
    Kategori   : TKategori;
    Nominal    : longint;
    Keterangan : string[40];
  end;

  TDaftarTransaksi = array[1..MAKS_TRANSAKSI] of TTransaksi;
  TTotalKategori   = array[TKategori] of longint;

{ ======================= VAR ===================== }
var
  Transaksi    : TDaftarTransaksi;
  JmlTrans     : integer;
  Anggaran     : longint;
  BulanAktif   : 1..12;
  TahunAktif   : integer;
  HariIni      : integer;

  FileData     : file of TTransaksi;
  FileAnggaran : file of longint;

  Pilihan      : integer;
  Selesai      : boolean;

{ ================== FUNGSI BANTU ================== }

{ Baca angka dengan validasi rentang. Ulangi sampai benar. }
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

function Kabisat(Tahun: integer): boolean;
begin
  Kabisat := ((Tahun mod 4 = 0) and (Tahun mod 100 <> 0)) or (Tahun mod 400 = 0);
end;

function HariDalamBulan(Bulan, Tahun: integer): integer;
begin
  case Bulan of
    4, 6, 9, 11 : HariDalamBulan := 30;
    2           : if Kabisat(Tahun) then HariDalamBulan := 29
                  else HariDalamBulan := 28;
  else
    HariDalamBulan := 31;
  end;
end;

procedure Garis;
begin
  writeln('------------------------------------------------');
end;

{ ================== FILE ================== }

procedure MuatData;
begin
  JmlTrans := 0;
  assign(FileData, NAMA_FILE_DATA);
  {$I-} reset(FileData); {$I+}
  if IOResult = 0 then
  begin
    while (not eof(FileData)) and (JmlTrans < MAKS_TRANSAKSI) do
    begin
      inc(JmlTrans);
      read(FileData, Transaksi[JmlTrans]);
    end;
    close(FileData);
  end;
end;

procedure SimpanData;
var
  i : integer;
begin
  assign(FileData, NAMA_FILE_DATA);
  rewrite(FileData);
  for i := 1 to JmlTrans do
    write(FileData, Transaksi[i]);
  close(FileData);
end;

{ Kembalikan TRUE jika file anggaran ada }
function MuatAnggaran: boolean;
begin
  MuatAnggaran := false;
  assign(FileAnggaran, NAMA_FILE_ANGGARAN);
  {$I-} reset(FileAnggaran); {$I+}
  if IOResult = 0 then
  begin
    read(FileAnggaran, Anggaran);
    close(FileAnggaran);
    MuatAnggaran := true;
  end;
end;

procedure SimpanAnggaran;
begin
  assign(FileAnggaran, NAMA_FILE_ANGGARAN);
  rewrite(FileAnggaran);
  write(FileAnggaran, Anggaran);
  close(FileAnggaran);
end;

{ ================== PERHITUNGAN ================== }

function TotalPemasukan(Bulan, Tahun: integer): longint;
var
  i     : integer;
  Total : longint;
begin
  Total := 0;
  for i := 1 to JmlTrans do
    if (Transaksi[i].Jenis = Pemasukan) and
       (Transaksi[i].Tanggal.Bulan = Bulan) and
       (Transaksi[i].Tanggal.Tahun = Tahun) then
      Total := Total + Transaksi[i].Nominal;
  TotalPemasukan := Total;
end;

function TotalPengeluaran(Bulan, Tahun: integer): longint;
var
  i     : integer;
  Total : longint;
begin
  Total := 0;
  for i := 1 to JmlTrans do
    if (Transaksi[i].Jenis = Pengeluaran) and
       (Transaksi[i].Tanggal.Bulan = Bulan) and
       (Transaksi[i].Tanggal.Tahun = Tahun) then
      Total := Total + Transaksi[i].Nominal;
  TotalPengeluaran := Total;
end;

function SisaSaldo(Bulan, Tahun: integer): longint;
begin
  SisaSaldo := TotalPemasukan(Bulan, Tahun) - TotalPengeluaran(Bulan, Tahun);
end;

procedure HitungPerKategori(Bulan, Tahun: integer; var Hasil: TTotalKategori);
var
  i : integer;
  k : TKategori;
begin
  for k := 1 to JML_KATEGORI do
    Hasil[k] := 0;
  for i := 1 to JmlTrans do
    if (Transaksi[i].Jenis = Pengeluaran) and
       (Transaksi[i].Tanggal.Bulan = Bulan) and
       (Transaksi[i].Tanggal.Tahun = Tahun) then
      Hasil[Transaksi[i].Kategori] :=
        Hasil[Transaksi[i].Kategori] + Transaksi[i].Nominal;
end;

{ ================== INPUT TRANSAKSI ================== }

procedure CatatPemasukan;
var
  T : TTransaksi;
begin
  writeln;
  writeln('=== CATAT PEMASUKAN ===');
  if JmlTrans >= MAKS_TRANSAKSI then
  begin
    writeln('Data penuh, tidak bisa menambah transaksi.');
    exit;
  end;
  T.Tanggal.Hari  := InputAngka('Tanggal (1-31)   : ', 1, HariDalamBulan(BulanAktif, TahunAktif));
  T.Tanggal.Bulan := BulanAktif;
  T.Tanggal.Tahun := TahunAktif;
  T.Jenis    := Pemasukan;
  T.Kategori := 1;
  T.Nominal  := InputAngka('Nominal (Rp)     : ', 1, 100000000);
  write('Keterangan       : ');
  readln(T.Keterangan);

  inc(JmlTrans);
  Transaksi[JmlTrans] := T;
  SimpanData;
  writeln('Pemasukan tersimpan.');
end;

procedure CatatPengeluaran;
var
  T     : TTransaksi;
  i     : integer;
  Keluar: longint;
begin
  writeln;
  writeln('=== CATAT PENGELUARAN ===');
  if JmlTrans >= MAKS_TRANSAKSI then
  begin
    writeln('Data penuh, tidak bisa menambah transaksi.');
    exit;
  end;

  T.Tanggal.Hari  := InputAngka('Tanggal (1-31)   : ', 1, HariDalamBulan(BulanAktif, TahunAktif));
  T.Tanggal.Bulan := BulanAktif;
  T.Tanggal.Tahun := TahunAktif;
  T.Jenis := Pengeluaran;

  writeln('Kategori:');
  for i := 1 to JML_KATEGORI do
    writeln('  ', i, '. ', NAMA_KATEGORI[i]);
  T.Kategori := InputAngka('Pilih kategori   : ', 1, JML_KATEGORI);

  T.Nominal := InputAngka('Nominal (Rp)     : ', 1, 100000000);
  write('Keterangan       : ');
  readln(T.Keterangan);

  if T.Nominal > SisaSaldo(BulanAktif, TahunAktif) then
  begin
    writeln('Gagal: saldo tidak cukup. Sisa saldo Rp ',
            SisaSaldo(BulanAktif, TahunAktif));
    exit;
  end;

  inc(JmlTrans);
  Transaksi[JmlTrans] := T;
  SimpanData;
  writeln('Pengeluaran tersimpan.');

  Keluar := TotalPengeluaran(BulanAktif, TahunAktif);
  if (Anggaran > 0) and (Keluar >= BATAS_PERINGATAN * Anggaran) then
    writeln('PERINGATAN: pengeluaran sudah ', (Keluar * 100) div Anggaran,
            ' persen dari anggaran!');
end;

{ ================== TAMPILAN ================== }

procedure TampilRingkasan;
var
  Hasil   : TTotalKategori;
  k       : TKategori;
  Keluar  : longint;
  Sisa    : longint;
  SisaHari: integer;
begin
  HitungPerKategori(BulanAktif, TahunAktif, Hasil);
  Keluar := TotalPengeluaran(BulanAktif, TahunAktif);
  Sisa   := SisaSaldo(BulanAktif, TahunAktif);

  writeln;
  Garis;
  writeln(' RINGKASAN ', NAMA_BULAN[BulanAktif], ' ', TahunAktif);
  Garis;
  writeln(' Anggaran        : Rp ', Anggaran);
  writeln(' Total pemasukan : Rp ', TotalPemasukan(BulanAktif, TahunAktif));
  writeln(' Total keluar    : Rp ', Keluar);
  writeln(' Sisa saldo      : Rp ', Sisa);
  Garis;
  writeln(' Pengeluaran per kategori:');
  for k := 1 to JML_KATEGORI do
  begin
    write('  ', NAMA_KATEGORI[k], '':10 - length(NAMA_KATEGORI[k]), ' Rp ', Hasil[k]:10);
    if Keluar > 0 then
      write('  (', (Hasil[k] * 100) div Keluar, '%)');
    writeln;
  end;
  Garis;

  SisaHari := HariDalamBulan(BulanAktif, TahunAktif) - HariIni + 1;
  if SisaHari < 1 then SisaHari := 1;
  if Sisa > 0 then
    writeln(' Jatah per hari (sisa ', SisaHari, ' hari): Rp ', Sisa div SisaHari)
  else
    writeln(' Saldo habis. Tidak ada jatah harian.');
  if (Anggaran > 0) and (Keluar > Anggaran) then
    writeln(' PERINGATAN: pengeluaran melewati anggaran!');
  Garis;
end;

procedure CetakLaporan;
var
  F      : text;
  Hasil  : TTotalKategori;
  k      : TKategori;
  i      : integer;
begin
  HitungPerKategori(BulanAktif, TahunAktif, Hasil);
  assign(F, NAMA_FILE_LAPORAN);
  rewrite(F);
  writeln(F, 'LAPORAN KEUANGAN ', NAMA_BULAN[BulanAktif], ' ', TahunAktif);
  writeln(F, '================================================');
  writeln(F, 'Anggaran        : Rp ', Anggaran);
  writeln(F, 'Total pemasukan : Rp ', TotalPemasukan(BulanAktif, TahunAktif));
  writeln(F, 'Total keluar    : Rp ', TotalPengeluaran(BulanAktif, TahunAktif));
  writeln(F, 'Sisa saldo      : Rp ', SisaSaldo(BulanAktif, TahunAktif));
  writeln(F);
  writeln(F, 'Pengeluaran per kategori:');
  for k := 1 to JML_KATEGORI do
    writeln(F, '  ', NAMA_KATEGORI[k], '':10 - length(NAMA_KATEGORI[k]), ' Rp ', Hasil[k]:10);
  writeln(F);
  writeln(F, 'Daftar transaksi:');
  for i := 1 to JmlTrans do
    if (Transaksi[i].Tanggal.Bulan = BulanAktif) and
       (Transaksi[i].Tanggal.Tahun = TahunAktif) then
    begin
      write(F, '  ', Transaksi[i].Tanggal.Hari:2, '/',
            Transaksi[i].Tanggal.Bulan, '/', Transaksi[i].Tanggal.Tahun, '  ');
      if Transaksi[i].Jenis = Pemasukan then
        write(F, 'MASUK  ')
      else
        write(F, 'KELUAR ');
      writeln(F, Transaksi[i].Nominal:9, '  ', Transaksi[i].Keterangan);
    end;
  close(F);
  writeln('Laporan disimpan ke ', NAMA_FILE_LAPORAN);
end;

procedure TampilMenu;
begin
  writeln;
  writeln('=========== DOMPETKOS ===========');
  writeln(' 1. Catat pemasukan');
  writeln(' 2. Catat pengeluaran');
  writeln(' 3. Lihat ringkasan');
  writeln(' 4. Cetak laporan');
  writeln(' 5. Keluar');
  writeln('=================================');
end;

{ ================== PROGRAM UTAMA ================== }
var
  Th, Bl, Hr, Dw : word;

begin
  GetDate(Th, Bl, Hr, Dw);
  TahunAktif := Th;
  BulanAktif := Bl;
  HariIni    := Hr;

  MuatData;
  if not MuatAnggaran then
  begin
    writeln('Selamat datang di DompetKos!');
    Anggaran := InputAngka('Masukkan anggaran bulan ini (Rp): ', 1, 100000000);
    SimpanAnggaran;
  end;

  Selesai := false;
  repeat
    TampilMenu;
    Pilihan := InputAngka('Pilih menu (1-5): ', 1, 5);
    case Pilihan of
      1: CatatPemasukan;
      2: CatatPengeluaran;
      3: TampilRingkasan;
      4: CetakLaporan;
      5: Selesai := true;
    end;
  until Selesai;

  SimpanData;
  writeln('Sampai jumpa!');
end.