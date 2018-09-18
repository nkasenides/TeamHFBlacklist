unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMember = Record
  Name:String[255];
  Teamkill:Boolean;
  Language:Boolean;
  Cheating:Boolean;
  Fraud1:Boolean;
  Fraud2:Boolean;
  Spamming:Boolean;
  Negligence:Boolean;
  AmmoTheft:Boolean;
  Pts:Integer;
  End; {of Record}

  Counter = Integer;

Const
  ArrayMax = 10000;

var
  Form1: TForm1;
  Members:Array[1..ArrayMax] of TMember;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i:Integer;
    CF:File of TMember;
    Filepath:String;
begin
  Filepath:='BLData.nicx';
  If FileExists(Filepath) Then
    Begin
    AssignFile(CF,Filepath);
    Reset(CF);
       For i:=1 To ArrayMax Do
         Begin
            Read(CF,Members[i]);
            Members[i].Name:=Lowercase(Members[i].Name);
         End;
    Closefile(CF);
    AssignFile(CF,Filepath);
    Rewrite(CF);

       For i:=1 To ArrayMax Do
         Begin
          Write(CF,Members[i]);
         End;
    CloseFile(CF);
    End
  Else
    Begin
      Showmessage('File not found');
      Application.Terminate;
    End;

end;

end.
