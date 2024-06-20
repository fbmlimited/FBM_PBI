page 61116 FBM_FADetail_PBI
{
    Caption = 'Fixed Asset Detail WS';
    PageType = api;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'FADetail';
    EntityName = 'FADetail';
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
                field(No; Rec."No.")
                {
                    Caption = 'No.';

                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';//D

                }
                field(FA_No; Rec."Description 2")
                {
                    Caption = 'FA no.';

                }
                field(FA_Class_Code; Rec."FA Class Code")
                {
                    Caption = 'Class Code';

                }
                field(FA_Subclass_Code; Rec."FA Subclass Code")
                {
                    Caption = 'SubClass Code';

                }

                field(Serial_No; Rec."Serial No.")
                {
                    Caption = 'Serial No.';//B

                }
                field(Brand; Rec.FBM_Brand)
                {
                    Caption = 'Brand';

                }
                field(Lessee; Rec.FBM_Lessee)
                {
                    Caption = 'Lessee';

                }
                field(Site_Gr_Code_Location; Rec.FBM_Site)
                {
                    Caption = 'Site Gr. Code';

                }
                field(site_Loc_code; siteloc + rec."FA Location Code")
                {
                    Caption = 'Site Loc. Code/Location';//E

                }
                field(site_loc_name; sitename + locname)
                {
                    Caption = 'Site/Location Name';//F

                }
                field(Cust_Gr_Code; custgr)
                {
                    Caption = 'Cust. Gr. Code';

                }
                field(Cust_Loc_Code; custloc)
                {
                    Caption = 'Cust. Loc. Code';//J

                }
                field(Cust_Name; custname)
                {
                    Caption = 'Cust. Name';

                }
                field(StatusF; rec.FBM_Status)
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.FBM_Status.AsInteger)
                {
                    Caption = 'Status';

                }

                field(Acquisition_Date; acqdate)
                {
                    Caption = 'Acquisition Date';//A

                }
                field(Acquisition_Cost; acqcost)
                {
                    Caption = 'Acquisition Cost';//I

                }
                field(Depreciation_Date; datedepr)
                {
                    Caption = 'Start Depreciation Date';//C

                }

                field(netbook; netbook)
                {
                    Caption = 'Net Book Value';

                }
                field(Subsidiary; Rec.FBM_Subsidiary)
                {
                    Caption = 'Subsidiary';

                }
                field(Model; Rec.FBM_Model)
                {
                    Caption = 'Model';//K

                }
                field(Segment; Rec.FBM_Segment2)
                {
                    Caption = 'Segment';//L

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
                fa.SetRange(FBM_IsEGM, true);

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
                                rec."Description 2" := fa."No.";

                                rec.FBM_Lessee := fa.FBM_Lessee;
                                rec.FBM_Status := fa.FBM_Status;
                                rec.Description := fa.Description;
                                rec."FA Class Code" := fa."FA Class Code";
                                rec."FA Subclass Code" := fa."FA Subclass Code";
                                rec.FBM_IsEGM := fa.FBM_IsEGM;





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
        repeat
            csite.Reset();
            csite.ChangeCompany(company.Name);
            compinfo.ChangeCompany(company.Name);
            customer.ChangeCompany(company.Name);
            company2.FindFirst();
            repeat
                compinfo2.ChangeCompany(company2.Name);
                compinfo2.get();
                if compinfo2."Custom System Indicator Text" = rec.FBM_Lessee then begin

                    csite.ChangeCompany(company2.Name);
                    customer.ChangeCompany(company2.Name);
                end;
                if compinfo2."Custom System Indicator Text" = rec.FBM_EGM_Property then begin
                    FALE.ChangeCompany(Company2.Name);
                end;
            until company2.Next() = 0;
            compinfo.get();
            if csite.FindFirst() then begin
                siteloc := '';
                csite.Reset();
                //if (rec.FBM_Site <> '') and (compinfo."Custom System Indicator Text" = rec.FBM_Lessee) then begin
                csite.SetRange(SiteGrCode, rec.FBM_Site);
                if csite.FindFirst() then begin
                    sitename := '';
                    custloc := '';
                    custgr := '';
                    custname := '';
                    acqdate := 0D;
                    acqcost := 0;
                    datedepr := 0D;
                    netbook := 0;
                    locname := '';
                    if loc.get(rec."FA Location Code") then
                        locname := loc.Name;

                    siteloc := csite."Site Code";
                    csite.CalcFields("Site Name_FF");
                    sitename := csite."Site Name_FF";
                    custloc := csite."Customer No.";
                    customer.Reset();
                    if customer.get(csite."Customer No.") then begin
                        custgr := customer.FBM_GrCode;
                        custname := customer.Name;
                        fale.Reset();
                        fale.SetRange("FA No.", rec."Description 2");
                        fale.SetRange("FA Posting Type", fale."FA Posting Type"::"Acquisition Cost");
                        if fale.findfirst then begin
                            acqdate := fale."Posting Date";

                        end;



                        fale.SetRange("FA Posting Type", fale."FA Posting Type"::Depreciation);
                        if fale.findfirst then
                            datedepr := fale."Posting Date";
                        fale.Reset();
                        fale.SetRange("FA No.", rec."Description 2");
                        fale.CalcSums(Amount);
                        netbook := fale.Amount;
                        fale.Reset();
                        fale.SetRange("FA No.", rec."Description 2");
                        fale.SetRange("FA Posting Type", fale."FA Posting Type"::"Acquisition Cost");
                        fale.CalcSums(Amount);
                        acqcost := fale.Amount;
                    end;

                end;
                //end;
            end;
        until company.Next() = 0;
    end;


    var
        company: record Company;
        company2: record Company;
        compinfo: Record "Company Information";
        compinfo2: Record "Company Information";
        fa: record "Fixed Asset";
        fasc: record "FA Subclass";
        country: record "Country/Region";
        subsidiary: text;
        siteloc: code[20];
        sitename: text[100];
        locname: text[100];
        customer: record customer;

        custloc: code[20];
        custgr: code[20];
        custname: text[100];
        acqdate: date;
        FALE: record "FA Ledger Entry";
        datedepr: date;
        acqcost: Decimal;
        netbook: Decimal;
        loc: record Location;


}