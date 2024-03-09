unit uDataSetHelper;

interface

uses
  Data.DB, FireDAC.Stan.Option, FireDac.Comp.Client, System.SysUtils;

type
  TDataSetHelper = class helper for TDataset
  private
    function GetField(const Field: string): TField;
  public
    property Field[const Field: string]: TField read GetField; default;
    procedure RemoveFieldsDataPacket(Fields: TArray<String>); overload;
    procedure RemoveFieldsDataPacket(Fields: TArray<String>; ProviderFlag, ReadOnly, Required: Boolean); overload;
  end;

implementation

function TDataSetHelper.GetField(const Field: string): TField;
begin
  Result := Self.FieldByName(Field);
end;

procedure TDataSetHelper.RemoveFieldsDataPacket(Fields: TArray<String>);
begin
  RemoveFieldsDataPacket(Fields, True, True, True);
end;

procedure TDataSetHelper.RemoveFieldsDataPacket(Fields: TArray<String>; ProviderFlag, ReadOnly, Required: Boolean);
var
  Field: TField;
  FieldName: String;
begin
  if Length(Fields) > 0 then
  begin
    for FieldName in Fields do
    begin
      if (not FieldName.Trim.IsEmpty) then
      begin
        Field := Self.FindField(FieldName);

        if Assigned(Field) then
        begin
          if ProviderFlag then
            Field.ProviderFlags := [];

          if ReadOnly then
            Field.ReadOnly := False;

          if Required then
            Field.Required := False;
        end;
      end;
    end;
  end;

end;


end.
