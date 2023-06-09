page 61102 FBM_SubsidiarySite_PBI
{
    Caption = 'Subsidiary Site';
    PageType = API;
    APIPublisher = 'FBMGroup';
    EntitySetName = 'SubsSite';
    EntityName = 'SubsSite';
    APIVersion = 'v2.0', 'v1.0';

    APIGroup = 'app1';
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Company;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                field("CompanyName"; rname)
                {

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

        if compinfo.FBM_EnSiteWS then begin

            rname := rec.Name;
            rdispname := rec."Display Name";
            acro := compinfo."Custom System Indicator Text"
        end else begin
            rname := '';
            rdispname := '';
            acro := '';
        end;

    end;



    var
        compinfo: Record "Company Information";
        rname: Text[30];
        acro: text[250];
        rdispname: text[250];
}