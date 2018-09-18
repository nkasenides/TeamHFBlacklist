unit pass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  PROCEED:BOolean=False;

implementation

uses blacklist;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
 if edit1.text='frogfoot@%7' Then
  begin
    Form1.Visible:=True;
    Form5.Visible:=False;

  End
 ELSE BEGIN
 SHOWMESSAGE('WRONG PASSWORD!');
 Edit1.Text:='';
 END;
end;

end.
