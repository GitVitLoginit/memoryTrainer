unit registr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,mailunit, ExtCtrls;

type
  TFormRegistr = class(TForm)
    ButtonSave: TButton;
    EditNewLogin: TEdit;
    EditNewPassword: TEdit;
    Image1: TImage;
    Buttonback: TButton;
    procedure ButtonSaveClick(Sender: TObject);
    procedure EditNewLoginClick(Sender: TObject);
    procedure EditNewPasswordClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonbackClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRegistr: TFormRegistr;
  user:string;

implementation

uses gamemenu;

function proverkaspace(s:string):boolean;
var
i,len:integer;
begin
len:=length(s);
proverkaspace:=false;
for i:= len downto 1 do begin
if s[i]=' 'then   begin
proverkaspace:=true ;
break;
end;
end;
end;



{$R *.dfm}
procedure addtogame(s:string);
var
addtogamelist:tstringlist;
log:string;
begin
addtogamelist:=tstringlist.Create;
addtogamelist.LoadFromFile(extractfilepath(application.ExeName)+'game.txt');
log:=s;
addtogamelist.Add(log+' :05/0^01?000');
addtogamelist.savetoFile(extractfilepath(application.ExeName)+'game.txt');
user:=log;
end;

function videlenielogina (s:string):string;
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
videlenielogina:=s;
end;

function proverkalogina(login:tedit ) :boolean;
var
log:string;
savetxt:tstringlist;
iterintcount:integer;
begin
savetxt:=tstringlist.Create;
savetxt.LoadFromFile(extractfilepath(application.ExeName)+'regedit.txt');
log:=login.Text;
proverkalogina:=false;
for iterintcount:= 0 to savetxt.count-1 do
begin
if log=videlenielogina( savetxt[iterintcount])  then    begin
proverkalogina:=true;
break;
end;
end;
end;

function invalidformat(editfield:tedit ):boolean;
var
s:string;
len,i:integer;
begin
invalidformat:=false;
s:=editfield.Text;
len:=length(s);
for i :=1 to len do begin
if (s[i]=':')  or  (s[i]='/') or   (s[i]='^')   or   (s[i]='?')   then
   begin
   invalidformat:=true;
   break;
   end;
end;







end;

procedure TFormRegistr.ButtonSaveClick(Sender: TObject);
var
savetxt:tstringlist;
loginusr,passusr:string;

begin
savetxt:=tstringlist.Create;
savetxt.LoadFromFile(extractfilepath(application.ExeName)+'regedit.txt');
if     (EditNewLogin.Text = '') or (EditNewPassword.Text = '')  then
 showmessage ('заполните все поля')   else
if (EditNewLogin.Text <> '') and (EditNewPassword.Text <> '') then
   begin
   if  proverkaspace(EditNewLogin.Text) = true   then
   showmessage ('Пароль и логин не должны содержать пробелов! Повторите ввод')
   else
   if    proverkaspace(EditNewPassword.Text) = true   then
   showmessage ('Пароль и логин не должны содержать пробелов! Повторите ввод')
   else
      if   proverkalogina (EditNewLogin)   =true then
    showmessage ('такой логин уже существует! придумайте новый')
    else
      if invalidformat(EditNewLogin) =true    then
    showmessage ('Неверный формат логина. Проверьте пожалуйста')
    else
         if invalidformat(EditNewpassword) =true    then
    showmessage ('Неверный формат пароля. Проверьте пожалуйста')
    else

         begin
   loginusr:=EditNewLogin.Text;
   passusr:=EditNewPassword.Text;
   savetxt.Add(loginusr+' '+passusr);
   savetxt.savetoFile(extractfilepath(application.ExeName)+'regedit.txt');
   addtogame(loginusr);
   showmessage('Регистрация прошла успешно!');
   formregistr.Close;
   formgame_menu.show;

    end;


   end;
end;

procedure TFormRegistr.EditNewLoginClick(Sender: TObject);
begin
EditNewLogin.Text:='';
end;

procedure TFormRegistr.EditNewPasswordClick(Sender: TObject);
begin
EditNewPassword.Text:='';
end;

procedure TFormRegistr.FormShow(Sender: TObject);
begin
EditNewLogin.text:='Придумайте логин';
EditNewPassword.Text:='Придумайте пароль';
end;

procedure TFormRegistr.ButtonbackClick(Sender: TObject);
begin
close;
end;

end.
