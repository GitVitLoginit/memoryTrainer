unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls,mailunit,registr,unit1, CheckLst;

type
  TFormlevel2 = class(TForm)
    Timerlevel2: TTimer;
    Labeltime2: TLabel;
    Labellogin2: TLabel;
    Imagelevel2: TImage;
    CheckBox11: TCheckBox;
    Labelquestion1: TLabel;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    Labelquestion2: TLabel;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    Labelquestion3: TLabel;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox33: TCheckBox;
    Buttonsendresults: TButton;
    Labelanswers: TLabel;
    Buttonback2: TButton;
    Buttonnextphoto: TButton;
    LabelHint: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Timerlevel2Timer(Sender: TObject);
    procedure ButtonsendresultsClick(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox21Click(Sender: TObject);
    procedure CheckBox22Click(Sender: TObject);
    procedure CheckBox23Click(Sender: TObject);
    procedure CheckBox31Click(Sender: TObject);
    procedure CheckBox32Click(Sender: TObject);
    procedure CheckBox33Click(Sender: TObject);
    procedure Buttonback2Click(Sender: TObject);
    procedure ButtonnextphotoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formlevel2: TFormlevel2;


implementation
const
n=36;
maxlength=50;
type
tquestion=record
vopros,answer1,answer2,answer3:string[maxlength];
rightanswer:string[maxlength];
end;

tmas=array [1..n]of tquestion;

var
zapis1: tquestion;
arrayquestions:tmas;
fileq:file of  tquestion;
countdown2:integer;
rightanswer1,rightanswer2,rightanswer3,gamenumber2:integer;

{$R *.dfm}


procedure addnewzapis;     // при добавлении фото в папку вызвать 1 раз эту процедуру  и записать вопросы в файл!
begin
// 1 вопрос к фото
arrayquestions[filesize(fileq)+1].vopros:='Сколько цветков с тремя лепестками изображено на рисунке?';
arrayquestions[filesize(fileq)+1].answer1:='2';
arrayquestions[filesize(fileq)+1].answer2:='3';
arrayquestions[filesize(fileq)+1].answer3:='4';
arrayquestions[filesize(fileq)+1].rightanswer:='3';
// 2 вопрос к фото
arrayquestions[filesize(fileq)+2].vopros:='Есть ли одиновые цветки?';
arrayquestions[filesize(fileq)+2].answer1:='нету';
arrayquestions[filesize(fileq)+2].answer2:='есть пары одинаковых цветков';
arrayquestions[filesize(fileq)+2].answer3:='есть тройка и пары одинаковых цветков ';
arrayquestions[filesize(fileq)+2].rightanswer:='3';
// 3 вопрос к фото
arrayquestions[filesize(fileq)+3].vopros:='Сколько цветков с пятью лепестками изображено на рисунке?';
arrayquestions[filesize(fileq)+3].answer1:='4';
arrayquestions[filesize(fileq)+3].answer2:='5';
arrayquestions[filesize(fileq)+3].answer3:='6';
arrayquestions[filesize(fileq)+3].rightanswer:='3';
end;


procedure createmassiveofzapis(var arrayquestions:tmas);
var        // при добавлении фото в папку вызвать 1 раз эту процедуру  и записать вопросы в файл!
i,size:integer;
begin
if fileexists('questions.txt') =false then
rewrite(fileq,extractfilepath(application.ExeName)+'questions.txt');
assignfile (fileq,extractfilepath(application.ExeName)+'questions.txt');
reset(fileq);
//showmessage(inttostr(filesize(fileq))) ;
for i:=1 to filesize(fileq) do begin
read(fileq,zapis1);
arrayquestions[i].vopros:=zapis1.vopros;
arrayquestions[i].answer1:=zapis1.answer1;
arrayquestions[i].answer2:=zapis1.answer2;
arrayquestions[i].answer3:=zapis1.answer3;
arrayquestions[i].rightanswer:=zapis1.rightanswer;
end;
addnewzapis;
size:= filesize(fileq)+3;
rewrite (fileq);
reset (fileq);
for i:=1 to size do begin
write(fileq,arrayquestions[i]);
end;
 closefile(fileq);
end;





function chosingphoto:string;    //возвращает значение фото /ну тоесть номера задания
var
s:integer;
begin
s:=strtoint(videleniegamedata('^',2)) ;
chosingphoto:=   inttostr(s) ;
end;

procedure TFormlevel2.FormShow(Sender: TObject);
begin
//createmassiveofzapis(arrayquestions);
if  strtoint( chosingphoto)>n/3 then      begin
Buttonnextphoto.Enabled:=false;
Buttonsendresults.enabled:=false;
showmessage('Вы прошли все тесты на данный момент')
end else begin
showmessage ('Ваша задача: некоторое время запоминать как можно больше деталей на картинке и затем выполнить тест');
Buttonnextphoto.Enabled:=false;
Buttonsendresults.enabled:=false;
countdown2:=21;
Imagelevel2.Picture.LoadFromFile(extractfilepath(application.ExeName)+'level2/'+chosingphoto+'.jpg');
Timerlevel2.Enabled:=true;
labellogin2.Caption:=('Your login: '+user);
end;
end;

function showingquestions(choice:char):string;
var
number:integer;
begin
number:=strtoint(chosingphoto);
if fileexists('questions.txt') =false then
rewrite(fileq,extractfilepath(application.ExeName)+'questions.txt');
assignfile (fileq,extractfilepath(application.ExeName)+'questions.txt');
reset(fileq);
seek(fileq,3*(number-1));
read(fileq,zapis1) ;
case choice of
'1':
showingquestions:=zapis1.vopros;   //по вопросам попад нужно попытаться записать все заново
'q':                                //и подумать на счет прав ответа!
showingquestions:=zapis1.answer1;
'a':
showingquestions:=zapis1.answer2;
'z':
showingquestions:=zapis1.answer3;
'2':begin
seek(fileq,3*number-2);
read(fileq,zapis1) ;
showingquestions:=zapis1.vopros;
end;
'w':  begin
seek(fileq,3*number-2);
read(fileq,zapis1) ;
showingquestions:=zapis1.answer1;
end;
's':  begin
seek(fileq,3*number-2);
read(fileq,zapis1) ;
showingquestions:=zapis1.answer2;
end;
'x':    begin
seek(fileq,3*number-2);
read(fileq,zapis1) ;
showingquestions:=zapis1.answer3;
end;
'3':begin
seek(fileq,(3*number-1));
read(fileq,zapis1) ;
showingquestions:=zapis1.vopros;
end;
'e':     begin
seek(fileq,3*number-1);
read(fileq,zapis1) ;
showingquestions:=zapis1.answer1;
end;
'd':    begin
seek(fileq,3*number-1);
read(fileq,zapis1) ;
showingquestions:=zapis1.answer2;
end;
'c':    begin
seek(fileq,3*number-1);
read(fileq,zapis1) ;
showingquestions:=zapis1.answer3;
end;
'r':    begin
showingquestions:=zapis1.rightanswer;
end;
'f':    begin
seek(fileq,3*number-2);
read(fileq,zapis1) ;
showingquestions:=zapis1.rightanswer;
end;
'v':    begin
seek(fileq,3*number-1);
read(fileq,zapis1) ;
showingquestions:=zapis1.rightanswer;
end;
end;
end;


procedure changinggamedata3(var s:string; newvalue:string; symbol:char);  // в строке с меняем след  2 послe символ
var i,len:integer;                                    // символа на новое значение
b:boolean;
begin
len:=length(s);                           //эта процедура для изменения теста
i:=1;
b:=true;
while (i<=len)  and (b=true) do begin
if s[i]=symbol then begin
if (strtoint(newvalue)<=9) then s[i+2]:=newvalue[1]
else begin
s[i+1]:=newvalue[1];
s[i+2]:=newvalue[2];
end  ;
b:=false;
end;
i:=i+1;
end;
end;

procedure changinggamedata4(var s:string; newvalue:string; symbol:char);  // в строке с меняем след  2 послe символ
var i,len:integer;                                    // символа на новое значение
b:boolean;
begin
len:=length(s);                           //эта процедура для изменения среднего процента
i:=1;
b:=true;
while (i<=len)  and (b=true) do begin
if s[i]=symbol then begin
if (strtoint(newvalue)<=9) then s[i+2]:=newvalue[1]
else if
(strtoint(newvalue)>=10)   and (strtoint(newvalue)<=9)     then
 begin
s[i+1]:=newvalue[1];
s[i+2]:=newvalue[2];
end  else
begin
s[i+1]:=newvalue[1];
s[i+2]:=newvalue[2];
s[i+3]:=newvalue[3];
end;
b:=false;
end;
i:=i+1;
end;
end;



procedure statechange  (rights:integer);
var
picture,procent,midpr:integer;
gamelist:tstringlist;
middleprocent:real;
s:string;
begin
searchinggamedata(gamenumber2);// присвоили игровому номеру номер игрока в файле
gamelist:=tstringlist.Create;
gamelist.LoadFromFile(extractfilepath(application.ExeName)+'game.txt');
s:=gamelist[gamenumber2];      //строка с игровой игфой пользователя
picture:=strtoint(simplevideleniegamedata(s,'^',2));
middleprocent:= strtoint(simplevideleniegamedata(s,'?',3));

inc(picture);
changinggamedata3(s,inttostr(picture),'^');    ///поменяли пользователю каринку на след/
if rights=0 then  procent:=0;
if rights=1 then  procent:=50;
if rights=2 then  procent:=80;
if rights=3 then  procent:=100;

if picture =2 then   middleprocent:=procent else
middleprocent:=((middleprocent* (picture-2)+  procent )/(picture-1));
midpr:=round(middleprocent);     //новое среднее значение
changinggamedata4(s,inttostr(midpr),'?');
gamelist[gamenumber2]:=s;
gamelist.savetoFile(extractfilepath(application.ExeName)+'game.txt');
end;



procedure TFormlevel2.Timerlevel2Timer(Sender: TObject);
var
stepstring:string;
begin
dec(countdown2);
if     countdown2>=0 then
labeltime2.caption:='  Осталось секунд:    '+inttostr(countdown2) else  begin
countdown2:=0;
Timerlevel2.enabled:=false;
labeltime2.caption:='0' ;
Imagelevel2.visible:=false;
//createmassiveofzapis(arrayquestions);
//showmessage(stepstring);
Buttonsendresults.enabled:=true;
stepstring:=showingquestions('1');
Labelquestion1.Caption:=stepstring;        //заполняем форму тестом по картинке
stepstring:=showingquestions('q');
CheckBox11.Caption:=stepstring;
stepstring:=showingquestions('a');
CheckBox12.Caption:=stepstring;
stepstring:=showingquestions('z');
CheckBox13.Caption:=stepstring;
stepstring:=showingquestions('2');
 Labelquestion2.Caption:=stepstring;
stepstring:=showingquestions('w');
CheckBox21.Caption:=stepstring;
stepstring:=showingquestions('s');
CheckBox22.Caption:=stepstring;
stepstring:=showingquestions('x');
CheckBox23.Caption:=stepstring;
stepstring:=showingquestions('3');
 Labelquestion3.Caption:=stepstring;
stepstring:=showingquestions('e');
CheckBox31.Caption:=stepstring;
stepstring:=showingquestions('d');
CheckBox32.Caption:=stepstring;
stepstring:=showingquestions('c');
CheckBox33.Caption:=stepstring;

stepstring:=showingquestions('r');
rightanswer1 := strtoint(stepstring );
stepstring:=showingquestions('f');
rightanswer2 := strtoint(stepstring );
stepstring:=showingquestions('v');
rightanswer3 := strtoint(stepstring );
end;
end;
procedure TFormlevel2.ButtonsendresultsClick(Sender: TObject);
var
chosevariant1,chosevariant2,chosevariant3:integer;
numberofrights:integer;
begin
Buttonsendresults.Enabled:=false;
if    checkbox11.Checked then chosevariant1:=1;
if    checkbox12.Checked then chosevariant1:=2;
if    checkbox13.Checked then chosevariant1:=3;
if    checkbox21.Checked then chosevariant2:=1;
if    checkbox22.Checked then chosevariant2:=2;
if    checkbox23.Checked then chosevariant2:=3;
if    checkbox31.Checked then chosevariant3:=1;
if    checkbox32.Checked then chosevariant3:=2;
if    checkbox33.Checked then chosevariant3:=3;
numberofrights:=0;
if      chosevariant1=rightanswer1  then
numberofrights:=numberofrights+1;
if      chosevariant2=rightanswer2  then
numberofrights:=numberofrights+1;
if      chosevariant3=rightanswer3  then
numberofrights:=numberofrights+1;
Labelanswers.Caption:='Количество правильных ответов:'+inttostr(numberofrights);
statechange(numberofrights);
Buttonnextphoto.Enabled:=true;
end;

procedure TFormlevel2.CheckBox11Click(Sender: TObject);
begin
checkbox12.Checked:=false;
checkbox13.Checked:=false;
end;

procedure TFormlevel2.CheckBox12Click(Sender: TObject);
begin
checkbox11.Checked:=false;
checkbox13.Checked:=false;
end;

procedure TFormlevel2.CheckBox13Click(Sender: TObject);
begin
checkbox12.Checked:=false;
checkbox11.Checked:=false;
end;

procedure TFormlevel2.CheckBox21Click(Sender: TObject);
begin
checkbox22.Checked:=false;
checkbox23.Checked:=false;
end;

procedure TFormlevel2.CheckBox22Click(Sender: TObject);
begin
checkbox21.Checked:=false;
checkbox23.Checked:=false;
end;

procedure TFormlevel2.CheckBox23Click(Sender: TObject);
begin
checkbox22.Checked:=false;
checkbox21.Checked:=false;
end;

procedure TFormlevel2.CheckBox31Click(Sender: TObject);
begin
checkbox32.Checked:=false;
checkbox33.Checked:=false;
end;

procedure TFormlevel2.CheckBox32Click(Sender: TObject);
begin
checkbox31.Checked:=false;
checkbox33.Checked:=false;
end;

procedure TFormlevel2.CheckBox33Click(Sender: TObject);
begin
checkbox32.Checked:=false;
checkbox31.Checked:=false;
end;


procedure TFormlevel2.Buttonback2Click(Sender: TObject);
begin
Imagelevel2.visible:=true;
labeltime2.caption:='';
CheckBox11.Caption:='';
CheckBox12.Caption:='';
CheckBox13.Caption:='';
CheckBox21.Caption:='';
CheckBox22.Caption:='';
CheckBox23.Caption:='';
CheckBox31.Caption:='';
CheckBox32.Caption:='';
CheckBox33.Caption:='';
Labelquestion1.Caption:='';
Labelquestion2.Caption:='';
Labelquestion3.Caption:='';
Labelanswers.Caption:='';
countdown2:=21;
CheckBox11.Checked:=false;
CheckBox12.Checked:=false;
CheckBox13.Checked:=false;
CheckBox21.Checked:=false;
CheckBox22.Checked:=false;
CheckBox23.Checked:=false;
CheckBox31.Checked:=false;
CheckBox32.Checked:=false;
CheckBox33.Checked:=false;
Timerlevel2.Enabled:=false;
formlevel2.Close;
end;

procedure TFormlevel2.ButtonnextphotoClick(Sender: TObject);
begin
Imagelevel2.visible:=true;
labeltime2.caption:='';
CheckBox11.Caption:='';
CheckBox12.Caption:='';
CheckBox13.Caption:='';
CheckBox21.Caption:='';
CheckBox22.Caption:='';
CheckBox23.Caption:='';
CheckBox31.Caption:='';
CheckBox32.Caption:='';
CheckBox33.Caption:='';
Labelquestion1.Caption:='';
Labelquestion2.Caption:='';
Labelquestion3.Caption:='';
Labelanswers.Caption:='';
countdown2:=21;
CheckBox11.Checked:=false;
CheckBox12.Checked:=false;
CheckBox13.Checked:=false;
CheckBox21.Checked:=false;
CheckBox22.Checked:=false;
CheckBox23.Checked:=false;
CheckBox31.Checked:=false;
CheckBox32.Checked:=false;
CheckBox33.Checked:=false;
Buttonnextphoto.Enabled:=false;
Buttonsendresults.enabled:=false;
if  strtoint( chosingphoto)>n/3 then   showmessage('Вы прошли все тесты на данный момент') else begin
countdown2:=21;
Imagelevel2.Picture.LoadFromFile(extractfilepath(application.ExeName)+'level2/'+chosingphoto+'.jpg');
Timerlevel2.Enabled:=true;
labellogin2.Caption:=('Your login: '+user);
end;
end;

end.
