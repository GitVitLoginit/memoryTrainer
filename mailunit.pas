unit mailunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  ExtCtrls, StdCtrls;

type
  TFormBegining = class(TForm)
    editlogin: TEdit;
    EditPass: TEdit;
    ButtonEnter: TButton;
    ButtonRegistr: TButton;
    Button1: TButton;
    Imagebegining: TImage;
    procedure ButtonRegistrClick(Sender: TObject);
    procedure ButtonEnterClick(Sender: TObject);
    procedure editloginClick(Sender: TObject);
    procedure EditPassClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBegining: TFormBegining;



implementation

uses registr, gamemenu;


{$R *.dfm}

function spacedelete(var s:string):string;
var
i,len:integer;
begin
s:=trim(s) ;
len:=length(s);
for i:=len downto 1 do begin
if s[i]=' ' then delete(s,i,1);
end;
spacedelete :=s;
end;

procedure TFormBegining.ButtonRegistrClick(Sender: TObject);
begin
formregistr.showmodal;
end;

procedure TFormBegining.ButtonEnterClick(Sender: TObject);

var
savetxt:tstringlist;
iterintcount:integer;
logandpass,log,pass:string;
enter:boolean;
begin
savetxt:=tstringlist.Create;
savetxt.LoadFromFile(extractfilepath(application.ExeName)+'regedit.txt');
log:=editlogin.text;
log:=spacedelete(log);
pass:= editpass.text;
pass:= spacedelete(pass);
logandpass:=log+' '+pass ;
enter:=false;
  for iterintcount:= 0 to savetxt.count-1 do

  begin
      if (logandpass=savetxt[iterintcount]) then
         begin
         showmessage('Вход подтверждён!') ;
         user:=log;
         enter:=true;
         formgame_menu.show;
         break;
         end;
  end;
if enter=false then
showmessage('Вы ввели неверный логин и/или пароль! Проверьте правильность написания или зарегистрируйтесь.') ;
end;
procedure TFormBegining.editloginClick(Sender: TObject);
begin
editlogin.Text:='';
end;

procedure TFormBegining.EditPassClick(Sender: TObject);
begin
EditPass.text:='';
end;

procedure TFormBegining.Button1Click(Sender: TObject);
begin
close;
end;




procedure TFormBegining.FormActivate(Sender: TObject);
begin
editlogin.text:='Введите ваш логин';
EditPass.text:='Введите ваш пароль';
end;



end.
