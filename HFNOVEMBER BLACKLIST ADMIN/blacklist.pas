unit blacklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtActns, ComCtrls, StdCtrls, ExtCtrls, jpeg, clean, found;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    CheckBox1: TCheckBox;
    Button4: TButton;
    Panel1: TPanel;
    Edit1: TEdit;
    Label2: TLabel;
    Button6: TButton;
    Label3: TLabel;
    Panel2: TPanel;
    Button7: TButton;
    Button8: TButton;
    Button10: TButton;
    Button11: TButton;
    Label4: TLabel;
    Button12: TButton;
    butt13: TButton;
    Panel3: TPanel;
    ListBox2: TListBox;
    Combo: TComboBox;
    Label5: TLabel;
    Button13: TButton;
    Image1: TImage;
    ProgressBar1: TProgressBar;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboChange(Sender: TObject);
    procedure Button13Click(Sender: TObject);
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
  
  MemberExistsVar:Boolean;
  CurrentEmptySlot:Integer;
  CheckBoxValidationVar:Boolean;
  PositionOfMEmber:Integer=0;

  CF:File of TMember;
  CFT:Textfile;
  FilepathText:String='Blacklist.txt';
  FilepathList:String='BLData.nicx';

  ID:Integer;

implementation

uses addnewmember;

{******************************************************************************}
Procedure Initialize;
  Var
    i:Counter;
  Begin
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
      End;
  End;
{******************************************************************************}
Procedure MemberExists(MemberName:String);
  Var
    i:Counter;
    Found:Boolean;
  Begin
    i:=1;
    Found:=False;
    MemberExistsVar:=False;
    While (i<=ArrayMax) and (Found=False) Do
      Begin
        If Members[i].Name=MemberName Then
          Begin
            Found:=True;
            PositionOfMember:=i;
          End
        Else
          Begin
            Found:=False;
            i:=i+1;
            PositionOfMember:=0;
          End; {If}
      End; {While}
    If Found=True Then MemberExistsVar:=True;
    If Found=False Then MemberExistsVar:=False;
  End; {MemberExists}
{******************************************************************************}
Procedure FindEmptySlot;
  Var
    i:Counter;
    Found:Boolean;
  Begin
    i:=1;
    Found:=False;
    CurrentEmptySlot:=0;
    While (i<=ArrayMax) and (Found=False) Do
      Begin
        If Members[i].Name='' Then
          Begin
            Found:=True;
            CurrentEmptySlot:=i;
          End
        Else
          Begin
            Found:=False;
            CurrentEmptySlot:=0;
            i:=i+1;
          End; {if}
      End; {While}
  End; {FindEmptySlot}
{******************************************************************************}
Procedure ShowMembers;
  Var
    i:Counter;
  Begin
    Form1.Listbox1.Clear;
    For i:=1 To ArrayMax do
      If Members[i].Name<>'' Then
        Form1.ListBox1.Items.Add(Members[i].Name);
  End;
{******************************************************************************}
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
{******************************************************************************}
Procedure SaveToText;
  Var
    i:Counter;
  Begin
    AssignFile(CFT,FilepathText);
    Rewrite(CFT);
    Writeln(CFT,'HF-NOVEMBER BLACKLIST:');
    writeln(CFT);
    For i:=1 To ArrayMax Do
      WriteLn(CFT,i,'. ',Members[i].Name,', ',IntToStr(Members[i].Pts));
    CloseFile(CFT);
  End;
{******************************************************************************}
Procedure UpdateProgress;
  Var
    i:Counter;
    O:Integer;
    A:Integer;
  Begin
  Form1.ProgressBar1.Max:=ArrayMax;
    O:=0;
    For i:=1 to ArrayMax Do
      If Members[i].Name<>'' Then
        begin
        O:=O+1;
        End;
    Form1.ProgressBar1.Position:=O;
    A:=ArrayMax-O;
    Form1.Label6.caption:=IntToStr(O)+'/'+IntToStr(ArrayMax);
  End;

Procedure Load;
  Var
    i:Counter;
  Begin
    AssignFile(CF,FilepathList);
    Reset(CF);
    For i:=1 To ArrayMax Do
      Read(CF,Members[i]);
    CloseFile(CF);
  End;
{******************************************************************************}
Procedure Delete;
  Var
    Index:integer;
    STRIND:String;
begin
    Index:=Form1.listbox1.ItemIndex;
     If Index=-1 Then
      ShowMessage('Nothing found')
    Else Begin
    STRIND:=Form1.ListBox1.Items.Strings[index];
    MemberExists(STRIND);
    If PositionOfMEmber<1 Then
      ShowMessage('Not Found')
    Else
      Begin

    If Form1.CheckBox1.Checked=True Then
      Begin
        Members[PositionOfMember].Name:='';
        Members[POsitionOfMember].Teamkill:=False;
        Members[POsitionOfMember].Language:=False;
        Members[POsitionOfMember].Cheating:=False;
        Members[POsitionOfMember].Fraud1:=False;
        Members[POsitionOfMember].Fraud2:=False;
        Members[POsitionOfMember].Spamming:=False;
        Members[POsitionOfMember].Negligence:=False;
        Members[POsitionOfMember].AmmoTheft:=False;
        Members[POsitionOfMember].Pts:=0;
        ShowMembers;
        Form1.CheckBox1.Checked:=False;
        End
      Else
        ShowMessage('If you are sure about this, check the box');
      End;
    If Form1.Listbox1.ItemIndex=-1 then
      Form1.Button4.Enabled:=false;
    If Form1.Listbox1.ItemIndex<>-1 Then
      Form1.Button4.Enabled:=true;
  End;
  UpdateProgress;

end;
      

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
begin
 Form2.Visible:=True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Initialize;
Load;
ShowMembers;
ListBox2.Items:=Listbox1.items;
UpdateProgress;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 savetofile;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 SaveToText;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
delete;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Load;
Showmembers;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
 begin
 ID:=ListBox1.ItemIndex;
 If Listbox1.ItemIndex=-1 then
      Button4.Enabled:=false;
    If Listbox1.ItemIndex<>-1 Then
      Button4.Enabled:=true;
 end;

Procedure Quicksearch;
  Var
    i:Counter;
    Str:String;
    Found:Boolean;
    Plc:Integer;
    S:String;
  Begin
  S:='';
  Plc:=0;
  If Form1.Edit1.Text='' Then
    Showmessage('Please enter a name to find!')
  Else
  Begin
  Str:=Lowercase(Form1.Edit1.Text);
    Found:=False;
    i:=1;
    While (Found=False) and (i<=ArrayMax) Do
      Begin
        if Lowercase(Members[i].Name)=Str Then
          Begin
            Found:=True;
            Plc:=i;
          End
        Else
          Begin
            Found:=False;
            i:=i+1;
          End;
      End;
    If Found=True Then
      Begin
        Form4.Visible:=true;
        if Members[plc].Teamkill=true then S:=S+'| Teamkill |';
        if Members[plc].Language=true then S:=S+'| Language |';
        if Members[plc].Cheating=true then S:=S+'| Cheating |';
        if Members[plc].Fraud1=true then S:=S+'| 1st Degree Fraud |';
        if Members[plc].Fraud2=true then S:=S+'| 2nd Degree Fraud |';
        if Members[plc].Spamming=true then S:=S+'| Spamming |';
        if Members[plc].Negligence=true then S:=S+'| Negligence |';
        if Members[plc].AmmoTheft=true then S:=S+'| Ammo Theft |';
        Form4.Label2.Caption:=S;
      End;
    If Found=False Then Form3.visible:=True;
 End; {IF}

  End;


procedure TForm1.Button6Click(Sender: TObject);
begin
quicksearch;
end;

Procedure GetTK;
  var
    i:Counter;
    N:Integer;
  Begin
    N:=0;
    For i:=1 to ArrayMax Do
      If Members[i].Teamkill=True then
        N:=N+1;
    ShowMessage('NUMBER OF TEAMKILLERS: '+IntToStr(N));
  End;

Procedure GetC;
  var
    i:Counter;
    N:Integer;
  Begin
    N:=0;
    For i:=1 to ArrayMax Do
      If Members[i].Cheating=True then
        N:=N+1;
    ShowMessage('NUMBER OF CHEATERS: '+IntToStr(N));
  End;

Procedure GetF;
  var
    i:Counter;
    N:Integer;
  Begin
    N:=0;
    For i:=1 to ArrayMax Do
      If (Members[i].Fraud1=True) or (Members[i].Fraud2=True) Then
        N:=N+1;
    ShowMessage('NUMBER OF FRAUD ACCOUNTS: '+IntToStr(N));
  End;

Procedure GetS;
  var
    i:Counter;
    N:Integer;
  Begin
    N:=0;
    For i:=1 to ArrayMax Do
      If Members[i].Spamming=True then
        N:=N+1;
    ShowMessage('NUMBER OF SPAMMERS: '+IntToStr(N));
  End;

Procedure GetT;
  var
    i:Counter;
    N:Integer;
  Begin
    N:=0;
    For i:=1 to ArrayMax Do
      If Members[i].AmmoTheft=True then
        N:=N+1;
    ShowMessage('NUMBER OF AMMO THIEVES: '+IntToStr(N));
  End;

Procedure GetP;
  var
    i:Counter;
    N:Integer;
  Begin
    N:=0;
    For i:=1 to ArrayMax Do
      If Members[i].Pts>=13 then
        N:=N+1;
    ShowMessage('NUMBER OF PERMANENT BANS: '+IntToStr(N));
  End;

Procedure GetL;
  var
    i:Counter;
    N:Integer;
  Begin
    N:=0;
    For i:=1 to ArrayMax Do
      If Members[i].Language=True then
        N:=N+1;
    ShowMessage('NUMBER OF BAD LANGUAGE: '+IntToStr(N));
  End;

procedure TForm1.Button7Click(Sender: TObject);
begin
GetTK;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
GetL;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
GetF;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
GetS;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
GetT;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
GetP;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SaveToFile;
application.terminate;
end;

procedure TForm1.ComboChange(Sender: TObject);
var i:integer;
begin

 i:=0;
 If Combo.itemindex=0 Then
 Begin
  ListBox2.Clear;
  For i:=1 To ArrayMax Do
    If Members[i].Pts>=13 Then
      Listbox2.Items.Add(Members[i].Name);
  End;

 i:=0;
 If Combo.itemindex=1 Then
 Begin
  ListBox2.Clear;
  For i:=1 To ArrayMax Do
    If Members[i].Teamkill=True Then
      Listbox2.Items.Add(Members[i].Name);
  End;

 i:=0;
 If Combo.itemindex=2 Then
 Begin
  ListBox2.Clear;
  For i:=1 To ArrayMax Do
    If Members[i].Language=True Then
      Listbox2.Items.Add(Members[i].Name);
  End;

 i:=0;
 If Combo.itemindex=3 Then
 Begin
  ListBox2.Clear;
  For i:=1 To ArrayMax Do
    If Members[i].Cheating=True Then
      Listbox2.Items.Add(Members[i].Name);
  End;

 i:=0;
 If Combo.itemindex=4 Then
 Begin
  ListBox2.Clear;
  For i:=1 To ArrayMax Do
    If Members[i].Fraud1=True Then
      Listbox2.Items.Add(Members[i].Name);
  End;

 i:=0;
 If Combo.itemindex=5 Then
 Begin
  ListBox2.Clear;
  For i:=1 To ArrayMax Do
    If Members[i].Fraud2=True Then
      Listbox2.Items.Add(Members[i].Name);
  End;

 i:=0;
 If Combo.itemindex=6 Then
 Begin
  ListBox2.Clear;
  For i:=1 To ArrayMax Do
    If Members[i].Spamming=True Then
      Listbox2.Items.Add(Members[i].Name);
  End;

 i:=0;
 If Combo.itemindex=7 Then
 Begin
  ListBox2.Clear;
  For i:=1 To ArrayMax Do
    If Members[i].Negligence=True Then
      Listbox2.Items.Add(Members[i].Name);
  End;

  i:=0;
 If Combo.itemindex=8 Then
 Begin
  ListBox2.Clear;
  For i:=1 To ArrayMax Do
    If Members[i].AmmoTheft=True Then
      Listbox2.Items.Add(Members[i].Name);
  End;

 If Combo.itemindex=9 Then
  Begin
  Listbox2.Clear;
  For i:=1 To ArrayMax Do
    Listbox2.Items.Add(Members[i].name)
  End;

 If (Combo.Text<>'Teamkill') and (Combo.Text<>'Language') and (Combo.Text<>'Cheating')
 and (Combo.Text<>'1st Degree Fraud') and (Combo.Text<>'2nd Degree Fraud')
 and (Combo.Text<>'Spam') and (Combo.Text<>'Negligence') and (Combo.Text<>'Ammo Theft')
 and (Combo.Text<>'Permanent Bans') and (Combo.Text<>'All') Then
  Begin
    ShowMessage('Invalid Option.');
    Combo.text:='All';
    Listbox2.Items:=Listbox1.Items;
  End;
End;

procedure TForm1.Button13Click(Sender: TObject);
begin
GetC;
end;

end.
