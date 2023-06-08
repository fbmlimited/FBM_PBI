page 61105 FBM_FA_PBI
{
    Caption = 'Fixed Asset WS';
    PageType = api;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'SubsSite';
    EntityName = 'SubsSite';
    APIVersion = 'v2.0', 'v1.0';
    UsageCategory = Lists;
    SourceTable = "Fixed Asset";
    SourceTableTemporary = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(FA)
            {
                field("Serial_No"; Rec."Serial No.")
                {
                    Caption = 'Serial No.';

                }
                field(FBM_EGM_Property; Rec.FBM_EGM_Property)
                {
                    Caption = 'Property';

                }
                field(FBM_Subsidiary; Rec.FBM_Subsidiary)
                {
                    Caption = 'Subsidiary';

                }
            }
        }
    }
    trigger
    OnOpenPage()
    begin
        if company.FindFirst() then
            repeat
                compinfo.ChangeCompany(company.Name);
                compinfo.get;
                fa.ChangeCompany(company.Name);
                fasc.ChangeCompany(company.Name);
                country.ChangeCompany(company.Name);
                if fa.FindFirst() then
                    repeat
                        if fasc.get(fa."FA Subclass Code") then
                            if fasc.FBM_EGM then begin
                                rec.Init();
                                rec."No." := compinfo."Custom System Indicator Text" + fa."No.";
                                rec."Serial No." := fa."Serial No.";
                                rec.FBM_EGM_Property := compinfo."Custom System Indicator Text";
                                if country.get(compinfo."Country/Region Code") then
                                    rec.FBM_Subsidiary := format(rec.Lessee) + ' ' + country.FBM_Country3;
                                rec.Insert();

                            end;
                    until fa.Next() = 0;
            until company.Next() = 0;

    end;



    var
        company: record Company;
        compinfo: Record "Company Information";
        fa: record "Fixed Asset";
        fasc: record "FA Subclass";
        country: record "Country/Region";
        subsidiary: text;
}