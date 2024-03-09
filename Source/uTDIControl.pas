unit uTDIControl;

interface

uses
  Classes, Forms, Contnrs, SysUtils, Dialogs, cxPC, ActnList;

type
  TTDIPage = class(TCollectionItem)
  private
    { Private declarations }
    FPage: TcxTabSheet;
    FForm: TForm;
    FFormClass: string;
    FCreated: Boolean;
    FOnClickFavorite: TNotifyEvent;
    FAction: TAction;
    FPageType: string;
  public
    { Public declarations }
    procedure CreateForm(APageControl: TcxPageControl; AAction: string);
    procedure Close;

    property TabSheet: TcxTabSheet read FPage write FPage;
    property Form: TForm read FForm write FForm;
    property FormClass: string read FFormClass write FFormClass;
    property Created: Boolean read FCreated;
    property Action: TAction read FAction write FAction;
    property PageType: string read FPageType write FPageType;
  end;

  TTDIPages = class(TCollection)
  private
    { Private declarations }
    function GetItem(Index: Integer): TTDIPage;
  public
    { Public declarations }
    function Add: TTDIPage;
    function GetByFormClass(AFormClass: string): TTDIPage;
    function GetByAction(AAction: TAction): TTDIPage;

    property Items[Index: Integer]: TTDIPage read GetItem;
  end;

  TTDIControl = class(TComponent)
  private
    { Private declarations }
    FPageControl: TcxPageControl;
    FPages: TTDIPages;
    FActivePage: TTDIPage;

    procedure SetPageControl(const Value: TcxPageControl);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure AddForm(AAction: TAction; AFormClass: string);

    procedure ShowForm(AFormClass: string); overload;
    procedure ShowForm(AAction: TAction); overload;

    procedure ShowForm(AFormClass, AAction: string); overload;
    procedure CloseForm(AAction: TAction);

    procedure cxPageControlCanClose(Sender: TObject; var ACanClose: Boolean);
    procedure cxPageControlChange(Sender: TObject);

    property PageControl: TcxPageControl read FPageControl write SetPageControl;
    property ActivePage: TTDIPage read FActivePage write FActivePage;
    property Pages: TTDIPages read FPages;
  end;

implementation

{ TTDIControl }

constructor TTDIControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FPages := TTDIPages.Create(TTDIPage);
end;

destructor TTDIControl.Destroy;
begin
  FreeAndNil(FPages);
  inherited;
end;

procedure TTDIControl.SetPageControl(const Value: TcxPageControl);
begin
  FPageControl := Value;
  FPageControl.OnCanClose := cxPageControlCanClose;
  FPageControl.OnChange := cxPageControlChange;
end;

procedure TTDIControl.cxPageControlCanClose(Sender: TObject; var ACanClose: Boolean);
begin
  ActivePage.Close;
end;

procedure TTDIControl.cxPageControlChange(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Pages.Count - 1 do
  begin
    if Pages.Items[i].TabSheet = PageControl.ActivePage then
    begin
      ActivePage := Pages.Items[i];
      Exit;
    end;
  end;
end;

procedure TTDIControl.AddForm(AAction: TAction; AFormClass: string);
var
  Page: TTDIPage;
begin
  Page := Pages.Add;
  Page.FormClass := AFormClass;
  Page.Action := AAction;
end;

procedure TTDIControl.CloseForm(AAction: TAction);
var
  Page: TTDIPage;
begin
  Page := Pages.GetByAction(AAction);

  if Page.Form <> nil then
  begin
    Page.TabSheet.PageControl.CloseTab(Page.TabSheet.TabIndex);
    Page.Close;
  end;
end;

procedure TTDIControl.ShowForm(AFormClass: string);
var
  Page: TTDIPage;
begin
  Page := Pages.GetByFormClass(AFormClass);
  Page.CreateForm(PageControl, Page.Action.Name);

  ActivePage := Page;
end;

procedure TTDIControl.ShowForm(AFormClass, AAction: string);
var
  Page: TTDIPage;
begin
  Page := Pages.GetByFormClass(AFormClass);
  Page.CreateForm(PageControl, AAction);

  ActivePage := Page;
end;

procedure TTDIControl.ShowForm(AAction: TAction);
var
  Page: TTDIPage;
begin
  Page := Pages.GetByAction(AAction);
  Page.CreateForm(PageControl, AAction.Name);

  ActivePage := Page;
end;

{ TTDIPages }

function TTDIPages.Add: TTDIPage;
begin
  result := inherited Add as TTDIPage;
end;

function TTDIPages.GetByAction(AAction: TAction): TTDIPage;
var
  i: Integer;
begin
  result := nil;

  for i := 0 to Count - 1 do
    if Items[i].Action = AAction then
    begin
      result := Items[i];
      Exit;
    end;
end;

function TTDIPages.GetByFormClass(AFormClass: string): TTDIPage;
var
  i: Integer;
begin
  result := nil;

  for i := 0 to Count - 1 do
    if Items[i].FormClass = AFormClass then
    begin
      result := Items[i];
      Exit;
    end;
end;

function TTDIPages.GetItem(Index: Integer): TTDIPage;
begin
  result := inherited Items[Index] as TTDIPage;
end;

{ TTDIPage }

procedure TTDIPage.Close;
begin
  FCreated := False;

  if Assigned(Form) then
  begin
    Form.Close;
    Form.Release;
  end
end;

procedure TTDIPage.CreateForm(APageControl: TcxPageControl; AAction: string);
var
  Classe: TFormClass;
begin
  if not Created then
  begin
    Classe := TFormClass(FindClass(FormClass));

    Form := TForm(Classe.Create(nil));
    //Form.Action := AAction;

    TabSheet := TcxTabSheet.Create(APageControl);
    TabSheet.PageControl := APageControl;
    TabSheet.Caption := Form.Caption;
    FCreated := True;

    Form.Parent := TabSheet;
    Form.WindowState := wsMaximized;
    Form.BorderStyle := bsNone;
    Form.Show;
  end;

  APageControl.ActivePage := TabSheet;
end;

end.
