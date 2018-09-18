unit addnewmember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Blacklist;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    editname: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    checkteamkill: TCheckBox;
    checklanguage: TCheckBox;
    checkcheating: TCheckBox;
    checkfraud1: TCheckBox;
    checkfraud2: TCheckBox;
    checkspamming: TCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    checknegligence: TCheckBox;
    checkammotheft: TCheckBox;
    Label10: TLabel;
    editpts: TEdit;
    Button1: TButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure editnameChange(Sender: TObject);
    procedure checkteamkillClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure checklanguageClick(Sender: TObject);
    procedure checkcheatingClick(Sender: TObject);
    procedure checkfraud1Click(Sender: TObject);
    procedure checkfraud2Click(Sender: TObject);
    procedure checkspammingClick(Sender: TObject);
    procedure checknegligenceClick(Sender: TObject);
    procedure checkammotheftClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

  CalculatePOintsVar:Integer=0;

implementation

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
          End
        Else
          Begin
            Found:=False;
            i:=i+1;
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
Procedure CalculatePoints;
  Var
    TempPts:Integer;
    TK,AL,C,F1,F2,S,N,AT:Boolean;
  Begin
    TempPts:=0;

    If Form2.checkTeamkill.checked=True Then
      TK:=True
    Else TK:=False;

    If Form2.checklanguage.checked=True Then
      AL:=True
    Else AL:=False;
    
    If Form2.checkcheating.checked=True Then
      C:=True
    Else C:=False;

    If Form2.checkfraud1.checked=True Then
      F1:=True
    Else F1:=False;

    If Form2.checkfraud2.checked=True Then
      F2:=True
    Else F2:=False;

    If Form2.checkspamming.checked=True Then
      S:=True
    Else S:=False;
    
    If Form2.checknegligence.checked=True Then
      N:=True
    Else N:=False;

    If Form2.checkammotheft.checked=True Then
      AT:=True
    Else AT:=False;

    If TK=True Then TempPts:=Temppts+12;
    If AL=True Then TempPts:=TEmppts+10;
    If C=TRue Then TEmpPts:=TempPts+8;
    If F1=TRue Then TempPts:=Temppts+7;
    If F2=True Then TEmppts:=Temppts+6;
    If S=True Then Temppts:=TEmppts+5;
    If N=True Then Temppts:=temppts+3;
    If AT=TRue Then Temppts:=Temppts+1;

    If TempPts>52 Then Showmessage('Epic Fail - Calculated Points wrongly');

    If (TempPts<=52) and (temppts>=0) Then
      CalculatePointsVar:=TempPts;

    If CalculatePointsVar>=13 Then
      Form2.Label11.Visible:=True
    Else Form2.Label11.Visible:=False;

  End;
{******************************************************************************}
Procedure ShowMembers;
  Var
    i:Counter;
  Begin
    Form1.ListBox1.Clear;
    For i:=1 To ArrayMax do
      If Members[i].Name<>'' Then
        Form1.ListBox1.Items.Add(Members[i].Name);
  End;
{******************************************************************************}
Procedure AddMember(MemberName:String);
  Begin
    MemberExists(Lowercase(MemberName));
    If MemberExistsVar=True Then
      ShowMessage('This member name already Exists!')
    Else
         Begin
         If StrToInt(Form2.editpts.Text)<=0 Then
              Showmessage('Points Cannot be 0!')
         Else
            Begin
               FindEmptySlot;
               Members[CurrentEmptySlot].Name:=Lowercase(Form2.editname.text);
               Members[CurrentEmptySlot].Teamkill:=Form2.checkteamkill.Checked;
               Members[CurrentEmptySlot].Language:=Form2.checklanguage.Checked;
               Members[CurrentEmptySlot].Cheating:=Form2.checkcheating.Checked;
               Members[CurrentEmptySlot].Fraud1:=Form2.checkfraud1.Checked;
               Members[CurrentEmptySlot].Fraud2:=Form2.checkfraud2.Checked;
               Members[CurrentEmptySlot].Spamming:=Form2.checkspamming.Checked;
               Members[CurrentEmptySlot].Negligence:=Form2.checknegligence.Checked;
               Members[CurrentEmptySlot].AmmoTheft:=Form2.checkammotheft.Checked;
               Members[CurrentEmptySlot].Pts:=StrToInt(Form2.editpts.Text);
            End;
        End; {if}
    ShowMembers;
    UpdateProgress;
  End; {addMember}
{******************************************************************************}

{$R *.dfm}

procedure TForm2.editnameChange(Sender: TObject);
begin
 Form2.Caption:='Add a New Member'+' - '+Editname.Text;
 CalculatePoints;
 Form2.editpts.Text:=IntToStr(CalculatePointsVar);
end;

procedure TForm2.checkteamkillClick(Sender: TObject);
begin
 CalculatePoints;
 Form2.editpts.Text:=IntToStr(CalculatePointsVar);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
 CalculatePoints;
 If Editname.Text<>'' Then
  Begin
  AddMember(Form2.editname.Text);
  Form2.editname.Text:='';
  Form2.checkteamkill.Checked:=False;
  Form2.checklanguage.Checked:=False;
  Form2.checkcheating.Checked:=False;
  Form2.checkfraud1.Checked:=False;
  Form2.checkfraud2.Checked:=False;
  Form2.checkspamming.Checked:=False;
  Form2.checknegligence.Checked:=False;
  Form2.checkammotheft.Checked:=False;
  Form2.editpts.Text:='';
  Form2.Visible:=False;
  End
 Else Showmessage('Member name cannot be empty!');

end;

procedure TForm2.checklanguageClick(Sender: TObject);
begin
 CalculatePoints;
 Form2.editpts.Text:=IntToStr(CalculatePointsVar);
end;

procedure TForm2.checkcheatingClick(Sender: TObject);
begin
 CalculatePoints;
 Form2.editpts.Text:=IntToStr(CalculatePointsVar);
end;

procedure TForm2.checkfraud1Click(Sender: TObject);
begin
 CalculatePoints;
 Form2.editpts.Text:=IntToStr(CalculatePointsVar);
end;

procedure TForm2.checkfraud2Click(Sender: TObject);
begin
 CalculatePoints;
 Form2.editpts.Text:=IntToStr(CalculatePointsVar);
end;

procedure TForm2.checkspammingClick(Sender: TObject);
begin
 CalculatePoints;
 Form2.editpts.Text:=IntToStr(CalculatePointsVar);
end;

procedure TForm2.checknegligenceClick(Sender: TObject);
begin
 CalculatePoints;
 Form2.editpts.Text:=IntToStr(CalculatePointsVar);
end;

procedure TForm2.checkammotheftClick(Sender: TObject);
begin
 CalculatePoints;
 Form2.editpts.Text:=IntToStr(CalculatePointsVar);
end;

end.
