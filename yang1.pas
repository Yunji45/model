program kece;
uses crt;

type dateMhs = record
Nim,Nama,myFu : string;
Uts,Uas ,Na :double;
Hadir :integer;
dateMhsArray: array of dateMhs;
end;
Key=text;

var Dungu:Key;

function inputDate():dateMhs;
var myDate:dateMhs;
begin
    readln();
    write('Nim = ');readln(myDate.Nim);
    write('Nama = ');readln(myDate.Nama);
    write('Kehadiran = ');readln(myDate.Hadir);
    write('Uas = ');readln(myDate.Uas);
    write('Uts = ');readln(myDate.Uts);
    myDate.Na:=(myDate.Uts*0.4)+(myDate.Uas*0.6);
    if ((myDate.Hadir/16)<0.75) then
    begin
        myDate.Na:=0;
        myDate.myFu:='Present-';
        write('YES');
    end
    ELSE
    begin
        if ((100>=myDate.Na) and(myDate.Na>=85)) then
        myDate.myFu :='A'
        else if ((85>=myDate.Na) and(myDate.Na>=70)) then
        myDate.myFu :='B'
        else if ((70>=myDate.Na) and(myDate.Na>=55)) then
        myDate.myFu := 'C'
        else if ((55>=myDate.Na) and(myDate.Na>=40)) then
        myDate.myFu := 'D'
        else if ((40>=myDate.Na) and(myDate.Na>=0)) then
        myDate.myFu := 'E'
    end;
    inputDate:=myDate;
end;

//fungsinama
function generateName():string;
var result:string='-------';
var i:integer=0;
begin
    while i < 10 do
    begin
        result[i+1]:= chr(Random(25)+65);
        Inc(i);
    end;
    generateName:=result;
end;

//fungsinim
function generateIdnim():string;
var result:string='-----';
i:integer=0;
begin
    while i<5 do
    begin
        result [i+1]:=chr(Random(6)+48);
        Inc(i);
    end;
    generateIdnim:=result;
end;

//fungsiotomatis
function genrateOtomatis():dateMhs;
var myDate:dateMhs;
begin
    myDate.Nim:=generateIdnim();
    write('Nim: ');
    delay(400);
    writeln(myDate.Nim);

    myDate.Nama:=generateName();
    write('Nama: ');
    delay(400);
    writeln(myDate.Nama);

    myDate.Hadir:=Random(16);
    write('Kehadiran: ');
    delay(400);
    writeln(myDate.Hadir);

    myDate.Uts:=Random(100);
    write('Uts: ');
    delay(400);
    writeln(myDate.Uts:0:0);

    myDate.Uas:=Random(100);
    write('Uas: ');
    delay(400);
    writeln(myDate.Uas:0:0);

    delay(400);
    myDate.Na:=(myDate.Uts*0.4)+(myDate.Uas*0.6);
    if ((myDate.Hadir/16)<0.75) then
    begin
        myDate.Na:=0;
        myDate.myFu:='Present-';
        write('YES');
    end
    else
    begin
        if ((100>=myDate.Na) and(myDate.Na>=85)) then
        myDate.myFu :='A'
        else if ((85>=myDate.Na) and(myDate.Na>=70)) then
        myDate.myFu :='B'
        else if ((70>=myDate.Na) and(myDate.Na>=55)) then
        myDate.myFu := 'C'
        else if ((55>=myDate.Na) and(myDate.Na>=40)) then
        myDate.myFu := 'D'
        else if ((40>=myDate.Na) and(myDate.Na>=0)) then
        myDate.myFu := 'E'
    end;
    genrateOtomatis:=myDate;
end;

//main
var 
manuals,automs,files :array[1..15]of dateMhs;
manualInsection,autoInsection,fileInsection:boolean;
min,max,avg,myUts,myUas,myNa:double;
i,n,home,myHadir:integer;
myNums:dateMhs;
myDate:dateMhs;
myFile:text;
myName,myNim,myFu:string;

begin
    clrscr;
//     repeat
    repeat
    writeln('(Maksimum 15)');
    writeln('Jumlah index : ');
    read(n);
    clrScr;
    until n <= 15;
    repeat
        writeln('+--------------------------------------+');
        writeln('|      ////// MENU PILIHAN ///////      |');
        writeln('+--------------------------------------+');
        writeln('| 1. Input Data Keyboard Manual        |');
        writeln('| 2. Input Data Generator Otomatis     |');
        writeln('| 3. Input Data File Text Otomatis     |');
        writeln('| 4. Output Laporan Data Manual        |');
        writeln('| 5. Output Laporan Data Generator     |');
        writeln('| 6. Output Laporan Data File Text     |');
        writeln('| 0. Keluar                            |');
        writeln('+--------------------------------------+');
        writeln('| Pilihan Menu NO :                    |');
        writeln('+--------------------------------------+');
        gotoxy(24,10); read(menu);
        ClrScr;
        case (menu) of
          1 :
            begin
                for i:= 1 to n do
                begin
                    writeln('INPUT DATA KE-',i);
                    manuals[i] := inputDate();
                    ClrScr;
                end;
                manualInsection:=true;
            end;
          2 :
            begin
                for i:= 1 to n do
                begin
                    writeln('Input data -',i);
                    manuals[i] := genrateOtomatis();
                    clrScr;
                end;
                autoInsection:=true;
            end;
          3 : 
            begin
                assign(myFile, 'C:\FPC\3.2.2\bin\i386-win32\FILEDATA.txt');
                reset(myFile);
                i := 1;
                while not eof(myFile) do
                begin
                    if (i <= n) then
                    begin
                        writeln('INPUT DATA KE-',i);
                        readln(myFile, myNim);
                        myDate.Nim := myNim;
                        write('NIM : ');
                        Delay(400);
                        writeln(myDate.Nim);

                        readln(myFile, myName);
                        write('Nama : ');
                        Delay(400);
                        myDate.Nama := myName;
                        writeln(myDate.Nama);

                        readln(myFile, myHadir);
                        write('Kehadiran : ');
                        Delay(400);
                        myDate.Hadir := myHadir;
                        writeln(myDate.Hadir);

                        readln(myFile, myUts);
                        write('UTS : ');
                        Delay(400);
                        myDate.Uts := myUts;
                        writeln(myDate.Uts);

                        readln(myFile, myUas);
                        write('UAS : ');
                        Delay(400);
                        myDate.Uas := myUas;
                        writeln(myDate.Uas);

                        myDate.Na := (myDate.Uts*0.4)+(myDate.Uas*0.6);
                
                        if ((myDate.Hadir/16)<0.75) then
                            begin
                                myDate.Na := 0;
                                myDate.myFu := 'Pesent -';
                                write('YES');
                            end
                            else
                            begin
                                if ((100>=myDate.Na) and(myDate.Na>=85)) then
                                myDate.myFu :='A'
                                else if ((85>=myDate.Na) and(myDate.Na>=70)) then
                                myDate.myFu :='B'
                                else if ((70>=myDate.Na) and(myDate.Na>=55)) then
                                myDate.myFu := 'C'
                                else if ((55>=myDate.Na) and(myDate.Na>=40)) then
                                myDate.myFu := 'D'
                                else if ((40>=myDate.Na) and(myDate.Na>=0)) then
                                myDate.myFu := 'E'
                            end;

                        files[i]:=myDate;
                        i := i + 1;
                    end
                    else
                    begin
                        break;
                    end;
                end;
                close(myFile);
                clrScr;
                fileInsection:=true;

            end;
          4 :
            begin
                if(manualInsection)then
                begin
                    writeln('DAFTAR NILAI MAHASISWA HASIL INPUT MANUAL');
                    writeln('No':5,'NIM':10,'NAMA':20,'HADIR':8,'UTS':7,'UAS':7,'NA':7,'INDEX':10);
                    min := manuals[1].Na;
                    max := manuals[1].Na;
                    avg := 0;
                    for i:= 1 to n do
                    begin
                        writeln(i:5,manuals[i].Nim:10,[i].nama:20,manuals[i].Hadir:8,manuals[i].Uts:7:0,manuals[i].Uas:7:0,manuals[i].Na:7:0,manuals[i].myFu:10);
                        avg+=manuals[i].Na;
                        if(min>manuals[i].Na) then
                            min:=manuals[i].Na;
                        if(max<manuals[i].Na) then
                            max:=manuals[i].Na;
                    end;
                    avg/=n;
                    writeln('Rata-rata NA : ',avg:0:0,'Nilai NA Tertinggi : ':25,max:0:0,'Nilai NA Terendah : ':25,min:0:0);
                end
                else
                begin
                    writeln('INPUT MANUAL MASIH KOSONG');
                end;
                readln();
                readln();
            end;
          5 :
            begin
                if(autoInsection)then
                begin
                    writeln('DAFTAR NILAI MAHASISWA HASIL INPUT OTOMATIS');
                    writeln('No':5,'NIM':10,'NAMA':20,'HADIR':8,'UTS':7,'UAS':7,'NA':7,'INDEX':10);
                    min := automs[1].Na;
                    max := automs[1].Na;
                    avg := 0;
                    for i:= 1 to n do
                    begin
                        writeln(i:5,automs[i].Nim:10,automs[i].Nama:20,automs[i].Hadir:8,automs[i].Uts:7:0,automs[i].Uas:7:0,automs[i].Na:7:0,automs[i].myFu:10);
                        avg+=automs[i].Na;
                        if(min>automs[i].Na) then
                            min:=automs[i].Na;
                        if(max<automs[i].Na) then
                            max:=automs[i].Na;
                    end;
                    avg/=n;
                    writeln('Rata-rata NA : ',avg:0:0,'Nilai NA Tertinggi : ':25,max:0:0,'Nilai NA Terendah : ':25,min:0:0);
                end
                else
                begin
                    writeln('INPUT OTOMATIS MASIH KOSONG');
                end;
                readln();
                readln();
            end;
        6 : 
          begin
             if(fileInsection)then
                begin
                    writeln('DAFTAR NILAI MAHASISWA HASIL INPUT OTOMATIS');
                    writeln('No':5,'NIM':10,'NAMA':20,'HADIR':8,'UTS':7,'UAS':7,'NA':7,'INDEX':10);
                    min := files[1].Na;
                    max := files[1].Na;
                    avg := 0;
                    for i:= 1 to n do
                    begin
                        writeln(i:5,files[i].Nim:10,files[i].Nama:20,files[i].Hadir:8,files[i].Uts:7:0,files[i].Uas:7:0,files[i].Na:7:0,files[i].myFu:10);
                        avg+=files[i].Na;
                        if(min>files[i].Na) then
                            min:=files[i].Na;
                        if(max<files[i].Na) then
                            max:=files[i].Na;
                    end;
                    avg/=n;
                    writeln('Rata-rata NA : ',avg:0:0,'Nilai NA Tertinggi : ':25,max:0:0,'Nilai NA Terendah : ':25,min:0:0);
                end
                else
                begin
                    writeln('INPUT OTOMATIS MASIH KOSONG');
                end;
                readln();
                readln();
          end;
        end;
        ClrScr;
    until home = 0;
    writeln('SELESAI!!');
end.