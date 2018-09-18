program blacklistprj;

uses
  Forms,
  blacklist in 'blacklist.pas' {Form1},
  addnewmember in 'addnewmember.pas' {Form2},
  clean in 'clean.pas' {Form3},
  found in 'found.pas' {Form4},
  pass in 'pass.pas' {Form5};

{$R *.res}
 Begin
  Application.Initialize;
  Application.Title := 'HF-NOVEMBER BLACKLIST';
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
  end.
