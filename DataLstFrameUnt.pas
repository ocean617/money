unit DataLstFrameUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, RzBckgnd, DBGridEhGrouping, RzPanel, ExtCtrls, GridsEh,
  DBGridEh, se_image, RzButton, StdCtrls, Buttons,ZAbstractRODataset,ZAbstractDataset, ZDataset;

type
  TdataLstFrame = class(TFrame)
    bg: TRzBackground;
    seImage1: TseImage;
    RzPanel1: TRzPanel;
    RzStatusBar1: TRzStatusBar;
    Bevel1: TBevel;
    grid: TDBGridEh;
    Label1: TLabel;
    stxt: TStaticText;
    RzToolbarButton1: TRzToolbarButton;
    RzToolbarButton2: TRzToolbarButton;
    RzToolbarButton3: TRzToolbarButton;
    procedure gridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TdataLstFrame.gridTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var
sortstring:string; //≈≈–Ú¡–
begin
//Ω¯––≈≈–Ú
with Column do
begin
if FieldName = '' then
  Exit;

case Title.SortMarker of
  smNoneEh:
  begin
      Title.SortMarker := smUpEh;
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortedFields:=Column.FieldName;
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortType:=stAscending;
  end;
  smDownEh:
  begin
      Title.SortMarker := smUpEh; 
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortedFields:=Column.FieldName;
      ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortType:=stAscending;
  end;
  smUpEh:
  begin
     Title.SortMarker := smDownEh;
     ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortedFields:=Column.FieldName;
     ((sender as TDbgridEh).DataSource.DataSet as TZquery).SortType:=stDescending;
  end;

end;
end;

end;

end.
