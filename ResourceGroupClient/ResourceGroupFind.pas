unit ResourceGroupFind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.FileCtrl,
  Vcl.ComCtrls, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, System.Actions,
  Vcl.ActnList, Datasnap.DBClient, Datasnap.Provider;

type
  TfResGrpSearch = class(TForm)
    panelFind: TPanel;
    panelControl: TPanel;
    panelResults: TPanel;
    lblFind: TLabel;
    tglCloseOnGo: TCheckBox;
    btnGo: TButton;
    btnClose: TButton;
    btnSearch: TButton;
    cbxFindBy: TComboBox;
    cbxFindCondition: TComboBox;
    ComboBox1: TComboBox;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    dsRES_GRP_MSTR: TDataSource;
    DBGrid1: TDBGrid;
    dspRES_GRP_MSTR: TDataSetProvider;
    cdsRES_GRP_MSTR: TClientDataSet;
    dsRES_GRP_MSTR_cds: TDataSource;
    ActionList1: TActionList;
    actSearch: TAction;
    actGo: TAction;
    actClose: TAction;
    procedure btnCloseClick(Sender: TObject);
   //procedure FormCreate(Sender: TObject);
    procedure cbxFindByClick(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actGoExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fResGrpSearch: TfResGrpSearch;

implementation
{$R *.dfm}

procedure TfResGrpSearch.actCloseExecute(Sender: TObject);
begin
   fResGrpSearch.Close;
end;

procedure TfResGrpSearch.actGoExecute(Sender: TObject);
begin
   ShowMessage('go to the selected records in the main screen');
   if tglCloseOnGo.Checked = TRUE then fResGrpSearch.Close;
end;

procedure TfResGrpSearch.actSearchExecute(Sender: TObject);
begin
   dsRES_GRP_MSTR_cds.Enabled := TRUE;
end;

procedure TfResGrpSearch.btnCloseClick(Sender: TObject);
begin
   fResGrpSearch.Close;
end;

procedure TfResGrpSearch.cbxFindByClick(Sender: TObject);
begin
   //Adding items to the combo box
  //cbxFindBy.AddItem('Name', nil);
  //cbxFindBy.AddItem('Description', nil);

  //Setting the default value
  //cbxFindBy.ItemIndex := 1;
end;

{procedure TfResGrpSearch.FormCreate(Sender: TObject);
begin
  //Initialize the combo box.
  cbxFindBy := TComboBox.Create(Self);
  cbxFindBy.Parent := Self;

  //Visual options
  cbxFindBy.Align := alLeft;
  cbxFindBy.DoubleBuffered := true;
  cbxFindBy.AutoComplete := true;

  //Adding items to the combo box
  cbxFindBy.AddItem('Name', nil);
  cbxFindBy.AddItem('Description', nil);

  //Setting the default value
  cbxFindBy.ItemIndex := 1;
end; }


end.
