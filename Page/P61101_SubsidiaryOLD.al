page 61191 FBM_SubsidiaryOLD_PBI
{
    Caption = 'Subsidiary';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Company;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(CompanyName; rname)
                {

                    ApplicationArea = All;
                }
                field(SubsidiaryName; rdispname)
                {
                    Caption = 'Subsidiary Name';
                    ApplicationArea = All;
                }
                field(Subsidiary; acro)
                {
                    Caption = 'Subsidiary';
                    ApplicationArea = All;
                }
            }
        }

    }

    trigger
    OnAfterGetRecord()
    begin
        compinfo.ChangeCompany(rec.Name);
        compinfo.get;
        if compinfo.FBM_EnableWS then begin
            rname := rec.Name;
            rdispname := rec."Display Name";
            acro := compinfo."Custom System Indicator Text";
        end
        else begin
            rname := '';
            rdispname := '';
            acro := '';
        end;

    end;


    var
        compinfo: Record "Company Information";
        rname: Text[30];
        rdispname: text[250];
        acro: text[250];
}