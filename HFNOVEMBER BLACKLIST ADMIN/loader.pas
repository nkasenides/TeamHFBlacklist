unit loader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Blacklist;

type
  TForm4 = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    ProgressBar2: TProgressBar;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
  Amax = 10000;

var
  Form4: TForm4;
  done:boolean=false;

implementation

procedure init;
  Var
    i:Counter;
  Begin
  Form4.label1.Caption:='Initializing...';
    For i:=1 to ArrayMax Do
      Begin
        Members[i].Name:='';
        Members[i].Teamkill:=False;
        Members[i].Language:=False;
        Members[i].Cheating:=False;
        Members[i].Fraud1:=False;
        Members[i].Fraud2:=False;
        Members[i].Spamming:=False;
        Members[i].Negligence:=False;
        Members[i].AmmoTheft:=False;
        Members[i].Pts:=0;
        Form4.ProgressBar1.Position:=i;
      End;
  End;

Procedure LoadX;
  Var
    i:Counter;
  Begin
  Form4.label1.caption:='Loading...';
    AssignFile(CF,FilepathList);
    Reset(CF);
    For i:=1 To ArrayMax Do
      Begin
        Read(CF,Members[i]);
        Form4.ProgressBar2.Position:=i;
      End;
    CloseFile(CF);
  End;

Procedure SaveToFile;
  Var
    i:Counter;
  Begin
    AssignFile(CF,FilepathList);
    Rewrite(CF);               
    For i:=1 To  ArrayMax Do
      write(CF,Members[i]);

    CloseFile(CF);
  End;


{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
form4.Visible:=True;
 init;
 loadx;
Application.CreateForm(TForm1,Form1);
Form4.Visible:=False;
end;

end.
