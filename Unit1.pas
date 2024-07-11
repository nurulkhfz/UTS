unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    edt2: TEdit;
    edt1: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    dbgrd1: TDBGrid;
    lbl3: TLabel;
    edt3: TEdit;
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure edt3Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a : string;

implementation
uses Unit2;

{$R *.dfm}

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
begin
edt1.Text:= DataModule2.Zsatuan.Fields[1].AsString;
edt2.Text:= DataModule2.Zsatuan.Fields[2].AsString;
a:= DataModule2.Zsatuan.Fields[0].AsString;
end;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
DataModule2.Zsatuan.SQL.Clear;
DataModule2.Zsatuan.SQL.Add('insert into satuan values (null,"'+edt1.Text+'","'+edt2.Text+'")');
DataModule2.Zsatuan.ExecSQL;

DataModule2.Zsatuan.SQL.Clear;
DataModule2.Zsatuan.SQL.Add('select * from satuan');
DataModule2.Zsatuan.Open;
ShowMessage('Data Berhasil Disimpan');
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
with DataModule2.Zsatuan do
begin
SQL.Clear;
SQL.Add('update satuan set name ="'+edt1.Text+'", deskripsi ="'+edt2.Text+'" where id="'+a+'"');
ExecSQL ;

SQL.Clear;
SQL.Add('Select * from satuan');
Open;
end;
ShowMessage('Data Berhasil Diupdate');
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
with DataModule2.Zsatuan do
begin
  SQL.clear;
  SQL.Add('delete from satuan where id="'+a+'"');
  ExecSQL;

  SQL.clear;
  SQL.Add('select * from satuan');
  Open;
  edt1.Text := '';
  edt2.Text := '';
end;
ShowMessage('Data Berhasil DiDelete!');
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
edt1.Text := '';
edt2.Text := '';
end;


procedure TForm1.btn5Click(Sender: TObject);
begin
with DataModule2.Zsatuan do
begin
  SQL.clear;
  SQL.Add('select * from satuan where name like'+QuotedStr('%'+edt3.Text+'%'));
  ExecSQL;
  Open;
end;
end;

procedure TForm1.edt3Change(Sender: TObject);
begin
with DataModule2.Zsatuan do
begin
  SQL.clear;
  SQL.Add('select * from satuan where name like'+QuotedStr('%'+edt3.Text+'%'));
  ExecSQL;
  Open;
end;
end;

end.
