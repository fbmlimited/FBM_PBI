page 61105 FBM_FA_PBI
{
    Caption = 'Fixed Asset WS';
    PageType = api;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'FAList';
    EntityName = 'FAList';
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
                field(StatusF; rec.FBM_Status)
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.FBM_Status.AsInteger)
                {
                    Caption = 'Status';

                }
                // field(Site_GR_Code; Rec.FBM_Site)
                // {
                //     Caption = 'Site_GR_Code';

                field(Description; Rec.Description)
                {
                    Caption = 'Description';

                }                // }
                field(site_loc_code; siteloc)
                {
                    Caption = 'Site_loc_code';

                }
                field(Property; Rec.FBM_EGM_Property)
                {
                    Caption = 'Property';

                }
                field(Lessee; Rec.FBM_Lessee)
                {
                    Caption = 'Lessee';

                }
                field(Subsidiary; Rec.FBM_Subsidiary)
                {
                    Caption = 'Subsidiary';

                }
                // field(IsActive; Rec.IsActive)
                // {
                //     Caption = 'Is Active';

                // }
                field(SystemModifiedAt; rec.FBM_Sma)
                {
                    Caption = 'Last Modified At';
                    ApplicationArea = all;
                }
                field(SystemCreatedAt; rec.FBM_Sca)
                {
                    Caption = 'Created At';
                    ApplicationArea = all;
                }


            }
        }
    }
    trigger
    OnOpenPage()
    var
        site: record FBM_Site;
        country: record "Country/Region";

    begin
        if company.FindFirst() then
            repeat
                compinfo.ChangeCompany(company.Name);
                compinfo.get;
                fa.ChangeCompany(company.Name);
                fasc.ChangeCompany(company.Name);

                if fa.FindFirst() then
                    repeat
                        if fasc.get(fa."FA Subclass Code") then
                            if fasc.FBM_EGM then begin
                                rec.Init();
                                rec."No." := compinfo."Custom System Indicator Text" + fa."No.";
                                rec."Serial No." := fa."Serial No.";
                                rec.FBM_EGM_Property := compinfo."Custom System Indicator Text";
                                rec.Description := fa.Description;
                                rec.FBM_Site := fa.FBM_Site;

                                rec.FBM_Lessee := fa.FBM_Lessee;
                                rec.FBM_Status := fa.FBM_Status;





                                rec.FBM_Subsidiary := fa.FBM_Subsidiary;


                                rec.IsActive := fa.IsActive;
                                rec.FBM_Sma := fa.SystemModifiedAt;
                                rec.FBM_Sca := fa.SystemCreatedAt;
                                //if fa.IsActive then
                                rec.Insert();

                            end;
                    until fa.Next() = 0;
            until company.Next() = 0;

    end;

    trigger
    OnAfterGetRecord()
    var
        csite: record FBM_CustomerSite_C;
        compinfo: record "Company Information";

    begin
        company.FindFirst();
        siteloc := '';
        repeat
            csite.Reset();
            csite.ChangeCompany(company.Name);
            compinfo.ChangeCompany(company.Name);
            compinfo.get();
            if csite.FindFirst() then begin

                if (rec.FBM_Site <> '') and (compinfo."Custom System Indicator Text" = rec.FBM_Lessee) then begin
                    csite.SetRange(SiteGrCode, rec.FBM_Site);
                    csite.SetRange(ActiveRec, true);
                    if csite.FindFirst() then
                        siteloc := csite."Site Code";
                end;
            end;
        until company.Next() = 0;
    end;


    var
        company: record Company;
        compinfo: Record "Company Information";
        fa: record "Fixed Asset";
        fasc: record "FA Subclass";
        country: record "Country/Region";
        subsidiary: text;
        siteloc: code[20];
}