unit gamemenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  Buttons, ExtCtrls ;

type
  Tformgame_menu = class(TForm)
    buttontest: TBitBtn;
    buttonexit: TBitBtn;
    buttonex2: TBitBtn;
    buttonex1: TBitBtn;
    procedure buttonexitClick(Sender: TObject);
    procedure buttonex1Click(Sender: TObject);
    procedure buttonex2Click(Sender: TObject);
    procedure buttontestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formgame_menu: Tformgame_menu;

implementation

uses Unit1, Unit2, profile;

{$R *.dfm}

procedure Tformgame_menu.buttonexitClick(Sender: TObject);

begin
close;

end;

procedure Tformgame_menu.buttonex1Click(Sender: TObject);
begin

Formlevel1.showmodal ;
end;




procedure Tformgame_menu.buttonex2Click(Sender: TObject);
begin

formlevel2.showmodal;
end;

procedure Tformgame_menu.buttontestClick(Sender: TObject);
begin
yourstate.showmodal
end;

end.
