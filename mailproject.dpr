program mailproject;

uses
  Forms,
  mailunit in 'mailunit.pas' {FormBegining},
  registr in 'registr.pas' {FormRegistr},
  gamemenu in 'gamemenu.pas' {formgame_menu},
  unit1 in 'unit1.pas' {formlevel1},
  Unit2 in 'Unit2.pas' {Formlevel2},
  profile in 'profile.pas' {yourstate};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormBegining, FormBegining);
  Application.CreateForm(TFormRegistr, FormRegistr);
  Application.CreateForm(Tformgame_menu, formgame_menu);
  Application.CreateForm(Tformlevel1, formlevel1);
  Application.CreateForm(TFormlevel2, Formlevel2);
  Application.CreateForm(Tyourstate, yourstate);
  Application.Run;
end.
