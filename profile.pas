unit profile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,unit1,registr,mailunit;

type
  Tyourstate = class(TForm)
    Labelstate: TLabel;
    Buttonback: TButton;
    Labelstateofnumbers: TLabel;
    Labelstateoftests: TLabel;
    Labelstatelogin: TLabel;
    procedure ButtonbackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  yourstate: Tyourstate;

implementation

{$R *.dfm}

procedure Tyourstate.ButtonbackClick(Sender: TObject);
begin
close;
end;

procedure Tyourstate.FormShow(Sender: TObject);
var
profilenumber:integer;
s:string;
levelnumber,staticoftests,testnumber:integer;
begin
s:=searchinggamedata(profilenumber) ;     //вся игровая инфа о пользователе в этой строке
levelnumber:=strtoint(simplevideleniegamedata(s,':',2)) ;
staticoftests:= strtoint( simplevideleniegamedata(s,'?',3)) ;
testnumber := strtoint( simplevideleniegamedata(s,'^',2)) ;
labelstatelogin.Caption:=('Your login: '+user);
if   testnumber<4 then
Labelstateoftests.caption:='Для подсчета процента прохождения тестов нужно пройти 3 теста'
else  begin

Labelstateoftests.caption:= 'Ваш игровой процент прохождения тестов = '+inttostr(staticoftests)+'%';
if   (staticoftests>=65) and (staticoftests<=80) then
Labelstateoftests.caption:=Labelstateoftests.caption + '-ваш уровень средний.';
if   (staticoftests>=50) and (staticoftests<=64)
then Labelstateoftests.caption:=  Labelstateoftests.caption + '-ваш уровень ниже среднего.';
if   (staticoftests>80 ) and (staticoftests<=87)
then Labelstateoftests.caption:= Labelstateoftests.caption +  '-ваш уровень выше среднего.';
if (staticoftests>87)
then   Labelstateoftests.caption:=Labelstateoftests.caption+ '-ваш уровень высокий.';
if (staticoftests<50)
then   Labelstateoftests.caption:=Labelstateoftests.caption + '-ваш уровень низкий.';
end;


Labelstateofnumbers.caption:='Вы можете запомнить ' +inttostr(levelnumber-1)+ ' цифр(ы)';
if (levelnumber-1)<=5
then Labelstateofnumbers.caption:=  Labelstateofnumbers.caption+'. Ваш уровень низкий';
if ((levelnumber-1)>5) and ((levelnumber-1)<=6)
then Labelstateofnumbers.caption:=  Labelstateofnumbers.caption+'. Ваш уровень ниже среднего';
if ((levelnumber-1)>=7) and ((levelnumber-1)<=8)
then Labelstateofnumbers.caption:=  Labelstateofnumbers.caption+'. Ваш уровень средний';
if ((levelnumber-1)>8) and ((levelnumber-1)<=10)
then Labelstateofnumbers.caption:=  Labelstateofnumbers.caption+'. Ваш уровень выше среднего';
if (levelnumber-1)>10
then Labelstateofnumbers.caption:=  Labelstateofnumbers.caption+'. Ваш уровень высокий';

end;

end.
