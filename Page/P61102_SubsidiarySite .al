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

                field("SubsidiaryName"; rname)
                {
                    Caption = 'Subsidiary Name';
                    ApplicationArea = All;
                }
                field(Acronym; acro)
                {
                    Caption = 'Acronym';
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
        if compinfo.FBM_EnableSiteWS then begin
            rname := rec.Name;
            acro := compinfo."Custom System Indicator Text"
        end else begin
            rname := '';
            acro := '';
        end;

    end;



    var
        compinfo: Record "Company Information";
        rname: Text[30];
        acro: text[250];
}