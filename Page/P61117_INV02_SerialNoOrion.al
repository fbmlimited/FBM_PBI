page 61117 FBM_SerialNo_PBI
{
    Caption = 'SerialNoWS';
    PageType = api;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'SerialNo';
    EntityName = 'SerialNo';
    APIVersion = 'v2.0', 'v1.0';
    UsageCategory = Lists;
    SourceTable = "Reservation Entry";
    SourceTableTemporary = true;
    DelayedInsert = true;



    layout
    {
        area(Content)
        {
            repeater(SerialNo)
            {
                field(No; Rec."Item No.")
                {
                    Caption = 'No.';

                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';

                }
                field(Serial_No; Rec."Serial No.")
                {
                    Caption = 'Serial no.';

                }
                field(Location_Code; Rec."Location Code")
                {
                    Caption = 'Location Code';

                }
                field(Technician; Rec.FBM_BinCode)
                {
                    Caption = 'Technician Code';

                }
                field(Site; Rec.FBM_Site)
                {
                    Caption = 'Site Code';

                }
                field(Pedimento; Rec.FBM_Pedimento)
                {
                    Caption = 'Pedimento';

                }





            }
        }
    }
    trigger
    OnOpenPage()
    var
        ile: record "Item Ledger Entry";
        ile2: record "Item Ledger Entry";
        csite: record FBM_CustomerSite_C;
        loc: record Location;
        serial: code[50];
        i: integer;
        rese: record "Reservation Entry";
    begin
        i := 1;
        // from ILE : serial no, location, site
        if csite.FindFirst() then
            repeat
                ile.SetRange(FBM_Site, csite."Site Code");
                ile.CalcSums(Quantity);
                if (ile.Quantity <> 0) and (ile.findfirst) then
                    repeat
                        ile2.SetRange("Item No.", ile."Item No.");
                        ile2.SetRange(FBM_Site, csite."Site Code");
                        ile2.SetRange("Serial No.", ile."Serial No.");
                        ile2.SetRange("Location Code", ile."Location Code");
                        if ile2.FindFirst() then begin

                            rec.Init();
                            rec."Entry No." := i;
                            rec."Item No." := ile."Item No.";
                            rec.Description := ile.Description;
                            rec."Serial No." := ile."Serial No.";
                            rec.FBM_Site := csite."Site Code";
                            rec."Location Code" := ile."Location Code";
                            rec.FBM_Pedimento := ile.FBM_Pedimento;
                            if rese.FindFirst() then
                                rec.FBM_BinCode := rese.FBM_BinCode;
                            ile2.CalcSums(Quantity);
                            if (ile2.Quantity <> 0) and (ile."Serial No." <> '') and (csite."Site Code" <> '') then begin
                                rec.Quantity := ile2.Quantity;
                                if rec.Insert() then begin i += 1; end;
                            end;
                        end;
                    until ile.Next() = 0;
            until csite.next = 0;
        ile.Reset();
        ile2.Reset();
        if loc.FindFirst() then
            repeat

                ile.SetRange("Location Code", loc.Code);
                ile.CalcSums(Quantity);
                if (ile.Quantity <> 0) and (ile.FindFirst()) then
                    repeat
                        ile2.SetRange("Item No.", ile."Item No.");
                        ile2.SetRange("Location Code", loc.Code);
                        ile2.SetRange("Serial No.", ile."Serial No.");
                        if ile2.FindFirst() then begin
                            rese.SetRange("Item Ledger Entry No.", ile."Entry No.");
                            rec.Init();
                            rec."Entry No." := i;
                            rec."Item No." := ile."Item No.";
                            rec.Description := ile.Description;
                            rec."Serial No." := ile."Serial No.";
                            rec."Location Code" := loc.Code;
                            rec.FBM_Pedimento := ile.FBM_Pedimento;
                            ile2.CalcSums(Quantity);
                            if (ile2.Quantity <> 0) and (ile."Serial No." <> '') then begin


                                rec.Quantity := ile2.Quantity;
                                if rese.FindFirst() then
                                    rec.FBM_BinCode := rese.FBM_BinCode;
                                if rec.Insert() then begin i += 1; end;
                            end;
                        end;
                    until ile.Next() = 0;
            until loc.next = 0;

        //from Q7300: serial no, bin

    end;



}