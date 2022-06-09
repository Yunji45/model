program input;
uses crt;

var
   i, j, b : integer;
   k : array [1..50] of integer;

begin
     clrscr;
     write('Masukkan Jumlah Data : ');readln(b);
     i := 1;
     while i <= b do
           begin
                write('Masukkan Input Data ke ', i ,': '); readln(k[i]);
                for j := 1 to i do
                begin
                        if k[i] = k[1] then
                        begin
                                writeln('Data Tersimpan !');
                                i := i + 1;
                        end
                        else if k[i] = k[j] then
                        begin
                                writeln('Gagal');
                        end
                        else
                        begin
                                writeln('Data Tersimpan');
                                i := i + 1;
                        end;
                end
           end;
end.