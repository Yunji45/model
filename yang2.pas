Program insert;
uses crt;

type
  data = record
    nim : string[10];
    nama : string[20];
    nilai : string[3];
end;

var
  pilihmenu : string;
  jumlahdata, i, j, x : integer;
  q : string;
  jumlaharray : array [1..15] of data;

procedure inputdata(jumlahdata : integer);
begin
  writeln();
 for i := 1 to jumlahdata do begin
    writeln('Masukkan data ke-',i:2);

    begin
       write('NIM   : '); readln(jumlaharray[i].nim);
       write('Nama  : '); readln(jumlaharray[i].nama);
       write('Nilai : '); readln(jumlaharray[i].nilai);
    end;
      
    writeln;
  end;
  clrscr;
end;

procedure tampildata(jumlahdata : integer);
  begin
  writeln();
    writeln('Daftar Tabel Awal');
    writeln('===================================');
    writeln('No    NIM     NAMA          NILAI');
    writeln('===================================');

      for i := 1 to jumlahdata do begin
          write(i:3);
          write(jumlaharray[i].nim:7);
          write(jumlaharray[i].nama:10);
          write(jumlaharray[i].nilai:8);
          writeln;
        end;

    writeln('===================================');
end;

procedure tampilnodata(jumlahdata : integer);
  begin
  writeln();
    writeln('===================================  ||  ===================================');
    writeln('No    NIM     NAMA          NILAI    ||  No    NIM     NAMA          NILAI'  );
    writeln('===================================  ||  ===================================');

      for i := 1 to jumlahdata do begin
          write(i:3);
          write(jumlaharray[i].nim:7);
          write(jumlaharray[i].nama:10);
          write(jumlaharray[i].nilai:8);
          write('||':11);

          write('Belum diimplementasikan...':30);
          writeln;
        end;

    writeln('===================================  ||  ===================================');
end;

procedure NaturalInsertionSort(jumlahdata : integer);
var i, j : integer;
var index : array [1..15] of string;
var dataarray : array [1..15] of data;

begin
  for i := 1 to jumlahdata do
  begin
    dataarray[i].nim := jumlaharray[i].nim;
    dataarray[i].nama := jumlaharray[i].nama;
    dataarray[i].nilai := jumlaharray[i].nilai;
  end;

  for i := 2 to jumlahdata do
  begin
    index[1] := dataarray[i].nim;
    index[2] := dataarray[i].nama;
    index[3] := dataarray[i].nilai;

    j := i;

    while ((j > 1) AND (dataarray[j-1].nim > index[1])) do
    begin
      dataarray[j].nim := dataarray[j-1].nim;
      dataarray[j].nama := dataarray[j-1].nama;
      dataarray[j].nilai := dataarray[j-1].nilai;

      j := j - 1;
    end;

    dataarray[j].nim := index[1];
    dataarray[j].nama := index[2];
    dataarray[j].nilai := index[3];
  end;

  begin
  writeln();
    writeln('Daftar Tabel Awal                        Natural Insertion-Sort');
    writeln('===================================  ||  ===================================');
    writeln('No    NIM     NAMA          NILAI    ||  No    NIM     NAMA          NILAI'  );
    writeln('===================================  ||  ===================================');

      for i := 1 to jumlahdata do begin
          write(i:3);
          write(jumlaharray[i].nim:7);
          write(jumlaharray[i].nama:10);
          write(jumlaharray[i].nilai:8);
          write('||':11);

          write(i:5);
          write(dataarray[i].nim:7);
          write(dataarray[i].nama:10);
          write(dataarray[i].nilai:8);
          writeln;
        end;

    writeln('===================================  ||  ===================================');
end;end;

procedure NaturalSelectionSort(jumlahdata : integer);
var i, j, min : integer;
var index : array [1..15] of string;
var dataarray2 : array [1..15] of data;

begin
  for i := 1 to jumlahdata do
  begin
    dataarray2[i].nim := jumlaharray[i].nim;
    dataarray2[i].nama := jumlaharray[i].nama;
    dataarray2[i].nilai := jumlaharray[i].nilai;
  end;

  for i := 1 to jumlahdata-1 do
  begin
    index[1] := dataarray2[i].nim;
    index[2] := dataarray2[i].nama;
    index[3] := dataarray2[i].nilai;

    min := i;
    for j := i+1 to jumlahdata do
      begin
        if dataarray2[j].nim < dataarray2[min].nim then
          min := j;
        end;

      index[1] := dataarray2[min].nim;
      dataarray2[min].nim := dataarray2[i].nim;
      dataarray2[i].nim := index[1];

      index[2] := dataarray2[min].nama;
      dataarray2[min].nama := dataarray2[i].nama;
      dataarray2[i].nama := index[2];

      index[3] := dataarray2[min].nilai;
      dataarray2[min].nilai := dataarray2[i].nilai;
      dataarray2[i].nilai := index[3];
  end;

begin
  writeln();
    writeln('Daftar Tabel Awal                        Natural Selection-Sort');
    writeln('===================================  ||  ===================================');
    writeln('No    NIM     NAMA          NILAI    ||  No    NIM     NAMA          NILAI'  );
    writeln('===================================  ||  ===================================');

      for i := 1 to jumlahdata do begin
          write(i:3);
          write(jumlaharray[i].nim:7);
          write(jumlaharray[i].nama:10);
          write(jumlaharray[i].nilai:8);
          write('||':11);

          write(i:5);
          write(dataarray2[i].nim:7);
          write(dataarray2[i].nama:10);
          write(dataarray2[i].nilai:8);
          writeln;
        end;

    writeln('===================================  ||  ===================================');
end;end;

procedure tukar(var a, b : string);
  var c : string;
  begin
    c := a;
    a := b;
    b := c;
  end;

procedure NaturalBubbleExchangeSort(jumlahdata : integer);
var i, j : integer;
var dataarray3 : array [1..15] of data;

begin
  for i := 1 to jumlahdata do
  begin
    dataarray3[i].nim := jumlaharray[i].nim;
    dataarray3[i].nama := jumlaharray[i].nama;
    dataarray3[i].nilai := jumlaharray[i].nilai;
  end;

  for i := 1 to jumlahdata do
    begin
      for j := jumlahdata downto i+1 do
      begin
        if (dataarray3[j].nim < dataarray3[j-1].nim) then
          tukar(dataarray3[j].nim, dataarray3[j-1].nim);
          tukar(dataarray3[j].nama, dataarray3[j-1].nama);
          tukar(dataarray3[j].nilai, dataarray3[j-1].nilai);
      end;
    
    end;

    begin
    writeln();
    writeln('Daftar Tabel Awal                        Natural Bubble Exchange-Sort');
    writeln('===================================  ||  ===================================');
    writeln('No    NIM     NAMA          NILAI    ||  No    NIM     NAMA          NILAI'  );
    writeln('===================================  ||  ===================================');

      for i := 1 to jumlahdata do begin
          write(i:3);
          write(jumlaharray[i].nim:7);
          write(jumlaharray[i].nama:10);
          write(jumlaharray[i].nilai:8);
          write('||':11);

          write(i:5);
          write(dataarray3[i].nim:7);
          write(dataarray3[i].nama:10);
          write(dataarray3[i].nilai:8);
          writeln;
        end;

    writeln('===================================  ||  ===================================');
end;end;

begin
  q := 'q';
  while  q = 'q' do
  begin
   clrscr;
    writeln('========================================');
    writeln('|     MENU METODE INTERNAL-SORTING     |');
    writeln('========================================');
    writeln('| [1]. Menyiapkan Tabel data dari File |');
    writeln('| ---- << METODE COUNTING SORT >>      |');
    writeln('| [2]. Counting Sort                   |');
    writeln('| ---- << METODE INSERTION SORT >>     |');
    writeln('| [3]. Natural Insertion-Sort          |');
    writeln('| [4]. Binary Insertion-Sort           |');
    writeln('| [5]. Shell Insertion-Sort            |');
    writeln('| ---- << METODE SELECTION SORT >>     |');
    writeln('| [6]. Natural Selection-Sort          |');
    writeln('| [7]. Heap Selection-Sort             |');
    writeln('| ---- << METODE EXCHANGE SORT >>      |');
    writeln('| [8]. Natural Bubble Exchange-Sort    |');
    writeln('| [9]. Optimal Bubble Exchange-Sort    |');
    writeln('| [A]. Flag Bubble Exchange-Sort       |');
    writeln('| [B]. Shaker Exchange-Sort            |');
    writeln('| [C]. Quick Exchange-Sort             |');
    writeln('| [D]. Radix Exchange-Sort             |');
    writeln('| [E]. Merge Exchange-Sort             |');
    writeln('|        0 --> Selesai                 |');
    writeln('========================================');
    write('>>> Pilih Menu Nomor : '); readln(pilihmenu);

    case pilihmenu of
    '1' : begin
          clrscr;
          writeln('Setting dulu ...');
          writeln('================');
          writeln();

          write('Jumlah Indeks Array  ? '); readln(jumlahdata);
          write('Maksimum = 15');
          writeln();

          inputdata(jumlahdata);

          tampildata(jumlahdata);

          writeln();
          write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
      end;

    '2' : begin
        clrscr;
          writeln('Daftar Tabel Awal                        Counting Sort');
          tampilnodata(jumlahdata);

          writeln();
          write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
        end;

    '3' : begin
        clrscr;
        
        NaturalInsertionSort(jumlahdata);

        writeln();
        write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
      end;

    '4' : begin
        clrscr;
          writeln('Daftar Tabel Awal                        Binary Insertion-Sort');
          tampilnodata(jumlahdata);

          writeln();
          write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
        end;

    '5' : begin
        clrscr;
          writeln('Daftar Tabel Awal                        Shell Insertion-Sort');
          tampilnodata(jumlahdata);

          writeln();
          write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
        end;
    
    '6' : begin
        clrscr;
        
        NaturalSelectionSort(jumlahdata);
        
        writeln();
        write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
      end;

    '7' : begin
        clrscr;
          writeln('Daftar Tabel Awal                        Heap Selection-Sort');
          tampilnodata(jumlahdata);

          writeln();
          write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
        end;

    '8' : begin
        clrscr;

        NaturalBubbleExchangeSort(jumlahdata);
        
        writeln();
        write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
      end;

    '9' : begin
        clrscr;
          writeln('Daftar Tabel Awal                        Optimal Bubble Exchange-Sort');
          tampilnodata(jumlahdata);

          writeln();
          write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
        end;

    'A' : begin
        clrscr;
          writeln('Daftar Tabel Awal                        Flag Bubble Exchange-Sort');
          tampilnodata(jumlahdata);

          writeln();
          write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
        end;

    'B' : begin
        clrscr;
          writeln('Daftar Tabel Awal                        Shaker Exchange-Sort');
          tampilnodata(jumlahdata);

          writeln();
          write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
        end;

      'C' : begin
        clrscr;
          writeln('Daftar Tabel Awal                        Quick Exchange-Sort');
          tampilnodata(jumlahdata);

          writeln();
          write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
        end;

      'D' : begin
        clrscr;
          writeln('Daftar Tabel Awal                        Radix Exchange-Sort');
          tampilnodata(jumlahdata);

          writeln();
          write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
        end;

      'E' : begin
        clrscr;
          writeln('Daftar Tabel Awal                        Merge Exchange-Sort');
          tampilnodata(jumlahdata);

          writeln();
          write('ketik (q) back to menu / (x) to exit : '); readln(q);
          if q = 'x' then
          begin
          exit;
          end;
        end;

    '0' : begin
        exit;
      end;

  end;
 end;
  readln;
end.

