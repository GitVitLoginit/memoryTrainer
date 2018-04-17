unit unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,registr,mailunit,math;

type
  Tformlevel1 = class(TForm)
    Timerlevel1: TTimer;
    labeltime: TLabel;
    Labellogin: TLabel;
    Labelnumber: TLabel;
    EditInPut: TEdit;
    Buttoninput: TButton;
    Labelhint: TLabel;
    Buttonrepeat: TButton;
    Buttonback: TButton;
    Labelright: TLabel;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Timerlevel1Timer(Sender: TObject);
    procedure EditInPutClick(Sender: TObject);
    procedure ButtoninputClick(Sender: TObject);
    procedure ButtonrepeatClick(Sender: TObject);
    procedure ButtonbackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);




  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formlevel1: Tformlevel1;

function videleniegamedata(choice:string;width:integer):string;
function searchinggamedata(var gamenumber:integer):string;
function simplevideleniegamedata(s,choice:string; width2:integer):string;
procedure changinggamedata(var s:string; newvalue:string);
function videlenieusera(s:string):string;
implementation

{$R *.dfm}
var countdown ,gamenumber:integer;
rightanswer:string;


function videlenieusera(s:string):string;
var
i,len:integer;
begin
len:=length(s);
for i:=1 to len do begin
if s[i]=' 'then begin
delete(s,i,len-i+1);
break;
end;
end;
videlenieusera:=s;
end;



function searchinggamedata(var gamenumber:integer):string;//находим строку в которой хранится
var                                                //игровая информация пользователя
iterintcount:integer;
gamelist:tstringlist;
begin
//showmessage(user);
gamelist:=tstringlist.Create;
gamelist.LoadFromFile(extractfilepath(application.ExeName)+'game.txt');
for iterintcount:= 0 to gamelist.count-1 do
begin
if user=videlenieusera( gamelist[iterintcount])  then    begin
searchinggamedata:=gamelist[iterintcount] ;
gamenumber:= iterintcount;
break;
end;
end;
end;

function videleniegamedata(choice:string;width:integer):string;      //проходим по строке инфы пользователя
var i,len:integer;                                     //и ищем нужную инфу
b:boolean;                                             //например уровень пользователя
data:string;
begin
data:=searchinggamedata(gamenumber);

len:=length(data);
i:=1;
b:=true;
while (i<=len)  and (b=true) do begin
if data[i]=choice then begin
videleniegamedata:=copy(data,i+1,width);
b:=false;
end;
i:=i+1;
end;
end;

function simplevideleniegamedata(s,choice:string; width2:integer):string;      //эта процедура используется когда
var i,len:integer;                                     // обычное выдел мы использовали
b:boolean;                                             // и у нас уже есть номер пользователя                                           //с которым мы работаем
begin                                                    //и остается только изменить игровые данные
len:=length(s);
i:=1;
b:=true;
while (i<=len)  and (b=true) do begin
if s[i]=choice then begin
simplevideleniegamedata:=copy(s,i+1,width2);      //копируют в строке с нужную инфу
b:=false;
end;
i:=i+1;
end;
end;

procedure changinggamedata(var s:string; newvalue:string);  // в строке с меняем след послe символ
var i,len:integer;                                    // символ на новое значение
b:boolean;
begin
len:=length(s);
i:=1;
b:=true;
while (i<=len)  and (b=true) do begin
if s[i]='/' then begin
s[i+1]:=newvalue[1];
b:=false;
end;
i:=i+1;
end;
end;

procedure changinggamedata2(var s:string; newvalue:string);  // в строке с меняем след  2 послe символ
var i,len:integer;                                    // символа на новое значение
b:boolean;
begin
len:=length(s);
i:=1;
b:=true;
while (i<=len)  and (b=true) do begin
if s[i]=':' then begin
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

procedure changegamedata;   //суть в том что выполняем эту процедуру когда пользователь
//прошел задание и эта процедура решит нужно ли усложнять
var
s:string;
times,numbers:integer;
gamelist:tstringlist;
begin
gamelist:=tstringlist.Create;
gamelist.LoadFromFile(extractfilepath(application.ExeName)+'game.txt');
s:=gamelist[gamenumber];
times:=strtoint(simplevideleniegamedata(s,'/',1));
numbers:= strtoint(simplevideleniegamedata(s,':',2));
if times=2 then   begin
changinggamedata(s,'0')  ;
changinggamedata2(s,inttostr(numbers+1))
end
else changinggamedata(s,inttostr(times+1));
gamelist[gamenumber]:=s;
gamelist.savetoFile(extractfilepath(application.ExeName)+'game.txt');
end;

function numbergeneration:string;
const
n=10;
var
infint,i:integer;
infst,generatestring:string;
begin
randomize;
infst:=videleniegamedata(':',2);
infint:=strtoint(infst);
generatestring:='';
for i :=1 to infint do begin
infst:=inttostr(random(10)) ;
generatestring:=generatestring+infst;
end;
numbergeneration:=(generatestring);
end;

procedure Tformlevel1.FormShow(Sender: TObject);
begin
showmessage ('Ваша задача: за отведенное время ТОЧНО запомнить все цифры в верной последовательности');
countdown:=21;
Timerlevel1.Enabled:=true;
Buttoninput.enabled:=false;
Labelnumber.Caption:=( numbergeneration);
rightanswer:= Labelnumber.Caption;
EditInPut.Text:='';
EditInPut.ReadOnly:=true;

labellogin.Caption:=('Your login: '+user);



end;





procedure Tformlevel1.Timerlevel1Timer(Sender: TObject);
begin
dec(countdown);
if     countdown>=0 then
labeltime.caption:='  Осталось секунд:    '+inttostr(countdown) else  begin
countdown:=0;
Timerlevel1.enabled:=false;
Labelnumber.Caption:='';
Buttoninput.enabled:=true;
EditInPut.Text:='Введите сюда цифры';

EditInPut.ReadOnly:=false;


end;
end;






procedure Tformlevel1.EditInPutClick(Sender: TObject);
begin
EditInPut.ReadOnly:=false;
EditInPut.Text:='';
Labelnumber.Caption:='';
Timerlevel1.enabled:=false;
labeltime.caption:='0';
Buttoninput.enabled:=true;
end;





procedure Tformlevel1.ButtoninputClick(Sender: TObject);
begin
if Timerlevel1.enabled=true then showmessage ('повторите цифры в окне ввода!')else
if  ( EditInPut.Text= rightanswer) then begin
Labelright.caption:='Верно';
changegamedata;
end
else if (EditInPut.Text<>rightanswer )  then begin
Labelright.caption:='Неверно';
end;
Buttoninput.enabled:=false;
buttonrepeat.enabled:=true;
end;


procedure Tformlevel1.ButtonrepeatClick(Sender: TObject);
begin
Buttonrepeat.enabled:=false;
countdown:=21;
Timerlevel1.Enabled:=true;
Labelnumber.Caption:=( numbergeneration);
rightanswer:= Labelnumber.Caption;
EditInPut.Text:='';
Labelright.caption:='';
EditInPut.ReadOnly:=true;
end;

procedure Tformlevel1.ButtonbackClick(Sender: TObject);
begin
Labelright.caption:='';
Formlevel1.Close;
end;



procedure Tformlevel1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Timerlevel1.Enabled:=false;
labeltime.caption:='';
end;

end.
