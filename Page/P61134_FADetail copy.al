page 61134 FBM_FADetailCopy_PBI
{
    Caption = 'Fixed Asset Detail Page';
    PageType = List;
    ApplicationArea = all;

    UsageCategory = Lists;
    SourceTable = "Fixed Asset";
    SourceTableTemporary = true;
    DelayedInsert = true;
    Description = '19.2';


    layout
    {
        area(Content)
        {
            repeater(FA)
            {
                field(No; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = all;

                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';//D
                    ApplicationArea = all;

                }
                field(FA_No; Rec."Description 2")
                {
                    Caption = 'FA no.';
                    ApplicationArea = all;

                }
                field(FA_Class_Code; Rec."FA Class Code")
                {
                    Caption = 'Class Code';
                    ApplicationArea = all;

                }
                field(FA_Subclass_Code; Rec."FA Subclass Code")
                {
                    Caption = 'SubClass Code';
                    ApplicationArea = all;

                }

                field(Serial_No; Rec."Serial No.")
                {
                    Caption = 'Serial No.';//B
                    ApplicationArea = all;

                }
                field(Brand; Rec.FBM_Brand)
                {
                    Caption = 'Brand';
                    ApplicationArea = all;

                }
                field(Lessee; Rec.FBM_Lessee)
                {
                    Caption = 'Lessee';
                    ApplicationArea = all;

                }
                field(Site_Gr_Code_Location; Rec.FBM_Site)
                {
                    Caption = 'Site Gr. Code';
                    ApplicationArea = all;

                }
                field(site_Loc_code; siteloc + rec."FA Location Code")
                {
                    Caption = 'Site Loc. Code/Location';//E
                    ApplicationArea = all;

                }
                field(site_loc_name; sitename + locname)
                {
                    Caption = 'Site/Location Name';//F
                    ApplicationArea = all;

                }
                field(Cust_Gr_Code; custgr)
                {
                    Caption = 'Cust. Gr. Code';
                    ApplicationArea = all;

                }
                field(Cust_Loc_Code; custloc)
                {
                    Caption = 'Cust. Loc. Code';//J
                    ApplicationArea = all;

                }
                field(Cust_Name; custname)
                {
                    Caption = 'Cust. Name';
                    ApplicationArea = all;

                }
                field(StatusF; rec.FBM_Status)
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.FBM_Status.AsInteger)
                {
                    Caption = 'Status';
                    ApplicationArea = all;

                }

                field(Acquisition_Date; acqdate)
                {
                    Caption = 'Acquisition Date';//A
                    ApplicationArea = all;

                }
                field(Acquisition_Cost; acqcost)
                {
                    Caption = 'Acquisition Cost';//I
                    ApplicationArea = all;

                }
                field(Depreciation_Date; datedepr)
                {
                    Caption = 'Start Depreciation Date';//C
                    ApplicationArea = all;

                }

                field(netbook; netbook)
                {
                    Caption = 'Net Book Value';
                    ApplicationArea = all;

                }
                field(Subsidiary; Rec.FBM_Subsidiary)
                {
                    Caption = 'Subsidiary';
                    ApplicationArea = all;

                }
                field(Model; Rec.FBM_Model)
                {
                    Caption = 'Model';//K
                    ApplicationArea = all;

                }
                field(Segment; Rec.FBM_Segment2)
                {
                    Caption = 'Segment';//L
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
#if MAIN
        if company.FindFirst() then
#ENDIF
        repeat
#IF MAIN
                compinfo.ChangeCompany(company.Name);
#ENDIF
            compinfo.get;
#IF MAIN
            fa.ChangeCompany(company.Name);
            fasc.ChangeCompany(company.Name);
#ENDIF
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
                            rec.FBM_Site := fa.FBM_Site + REC."FA Location Code";
                            rec."Description 2" := fa."No.";
                            rec.FBM_Brand := fa.FBM_Brand;
                            rec.FBM_Model := fa.FBM_Model;
                            rec.FBM_Segment2 := fa.FBM_Segment2;
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
        site: record FBM_Site;
        csite: record FBM_CustomerSite_C;
        compinfo: record "Company Information";
        fa: record "Fixed Asset";
    begin
        company.FindFirst();
        repeat
            csite.Reset();


            sitename := '';
            custloc := '';
            custgr := '';
            custname := '';
            acqdate := 0D;
            acqcost := 0;
            datedepr := 0D;
            netbook := 0;
            locname := '';
            siteloc := '';
            compinfo.get();
            if csite.FindFirst() then begin
                site.SetRange("Site Code", rec.FBM_Site);
                site.SetRange(ActiveRec, true);
                csite.Reset();
#if MAIN
                if (rec.FBM_Site <> '') and (compinfo."Custom System Indicator Text" = rec.FBM_Lessee) then begin
#endif
                csite.SetRange(SiteGrCode, rec.FBM_Site);
                csite.SetRange(ActiveRec, true);
                if csite.FindFirst() then begin

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

                    end;
                end
                else if site.FindFirst() then begin
                    sitename := site."Site Name"

                end;

#if not JYM
                fa.get(rec."description 2");
                fale.Reset();
                fale.SetRange("FA No.", rec."Description 2");
                fale.SetRange("FA Posting Type", fale."FA Posting Type"::"Acquisition Cost");
                if fale.findfirst then begin
                    acqdate := fale."Posting Date";
                    fa.FBM_AcquisitionDate := fale."Posting Date";

                end;


                fale.SetRange("FA Posting Type", fale."FA Posting Type"::Depreciation);
                if fale.findfirst then
                    datedepr := fale."Posting Date";
                fa.FBM_DepreciationDate := fale."Posting Date";
                fale.Reset();

                fale.SetRange("FA No.", rec."Description 2");
                fale.CalcSums(Amount);
                netbook := fale.Amount;
                fale.Reset();
                fale.SetRange("FA No.", rec."Description 2");
                fale.SetRange("FA Posting Type", fale."FA Posting Type"::"Acquisition Cost");
                fale.CalcSums(Amount);
                acqcost := fale.Amount;
                fa.FBM_AcquisitionCost := fale.amount;
                fa.modify;

#endif
#if JYM
                fa.setrange("No.", rec."Description 2");
                if fa.findfirst then begin
                    acqdate := fa.fbm_AcquisitionDAte;
                    acqcost := fa.FBM_AcquisitionCost;
                    datedepr := fa.FBM_DepreciationDate;
                end;
#endif



#if MAIN
                end;
#endif
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
        loc: record "FA Location";


}