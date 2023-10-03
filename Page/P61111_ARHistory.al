page 61111 FBM_ARHistory_PBI
{
    PageType = list;
    Caption = 'AR History';
    // APIPublisher = 'FBMGroup';
    // APIGroup = 'app1';
    // APIVersion = 'v2.0', 'v1.0';
    // EntityName = 'ARHistory';
    // EntitySetName = 'ARHistory';
    SourceTable = FBM_CustLE;
    DelayedInsert = true;
    InsertAllowed = false;
    SourceTableTemporary = true;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(DocType; Rec.FBM_DocType)
                {
                    ApplicationArea = all;

                }
                field(DocNo; Rec.FBM_DocNo)
                {
                    ApplicationArea = all;

                }
                field(DocDate; Rec.FBM_DocDate)
                {
                    ApplicationArea = all;

                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = all;

                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;

                }
                field(Group; Rec.FBM_Group)
                {
                    ApplicationArea = all;

                }
                field(GroupDesc; Rec.FBM_GroupDesc)
                {
                    ApplicationArea = all;

                }
                field(SubGroupdesc; Rec.FBM_SubGroupdesc)
                {
                    ApplicationArea = all;

                }
                field(SubGroup; Rec.FBM_SubGroup)
                {
                    ApplicationArea = all;

                }
                field(Document_Type; Rec."Document Type")
                {
                    ApplicationArea = all;

                }
                field(Document_Date; Rec."Document Date")
                {
                    ApplicationArea = all;

                }
                field(Document_No; rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field(DocCurr; Rec.FBM_DocCurr)
                {
                    ApplicationArea = all;

                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;

                }
                field(Amount_LCY; Rec."Amount (LCY)")
                {
                    ApplicationArea = all;

                }
            }
        }
    }

    trigger
    OnOpenPage()
    begin
        custLE.SetFilter("Document Type", '%1|%2', custle."Document Type"::Invoice, custLE."Document Type"::"Credit Memo");
        if custle.FindFirst() then
            repeat
                custLE.CalcFields(Amount, "Amount (LCY)");
                docno := custLE."Document No.";
                docdate := custle."Document Date";
                doctype := custle."Document Type";
                rec.Init();
                rec."Entry No." := custLE."Entry No.";
                rec.FBM_DocDate := docdate;
                rec.FBM_DocNo := docno;
                rec.FBM_DocType := doctype;
                rec."Customer No." := cle."Customer No.";

                if customer.get(cle."Customer No.") then begin
                    rec.FBM_Group := customer.FBM_Group;
                    rec.FBM_SubGroup := customer.FBM_SubGroup;
                    rec."Customer Name" := customer.Name;
                    if cgr.get(customer.FBM_Group, customer.FBM_SubGroup) then begin
                        rec.FBM_GroupDesc := cgr."Group Name";
                        rec.FBM_SubGroupdesc := cgr."SubGroup Name";
                    end;
                end;
                rec."Document Date" := custle."Document Date";
                rec."Posting Date" := custle."Posting Date";
                rec."Document No." := custle."Document No.";
                rec."Document Type" := custle."Document Type";
                rec.FBM_DocCurr := custle."Currency Code";
                rec.Amount := custle.Amount;
                rec."Amount (LCY)" := custle."Amount (LCY)";
                rec.Insert();
                if custLE."Entry No." <> 0 then begin
                    CreateCustLedgEntry := custLE;

                    Heading := Format(CreateCustLedgEntry."Document Type");
                    Heading := Heading + ' ' + CreateCustLedgEntry."Document No.";
                    cle := custLE;
                    FindApplnEntriesDtldtLedgEntry(cle);

                    cle.SetCurrentKey("Entry No.");
                    cle.SetRange("Entry No.");

                    if CreateCustLedgEntry."Closed by Entry No." <> 0 then begin
                        cle."Entry No." := CreateCustLedgEntry."Closed by Entry No.";
                        cle.Mark(true);
                    end;

                    cle.SetCurrentKey("Closed by Entry No.");
                    cle.SetRange("Closed by Entry No.", CreateCustLedgEntry."Entry No.");
                    if cle.Find('-') then
                        repeat
                            cle.Mark(true);
                        until cle.Next() = 0;

                    cle.SetCurrentKey("Entry No.");
                    cle.SetRange("Closed by Entry No.");
                end;

                cle.MarkedOnly(true);

                if cle.FindFirst() then begin
                    i := 0;
                    repeat
                        cle.CalcFields(Amount, "Amount (LCY)");
                        i += 1;
                        rec.Init();
                        rec.FBM_DocDate := docdate;
                        rec.FBM_DocNo := docno;
                        rec.FBM_DocType := doctype;
                        rec."Entry No." := cle."Entry No." + (i * 1000000);
                        rec."Document Date" := cle."Document Date";
                        rec."Posting Date" := cle."Posting Date";
                        rec."Document No." := cle."Document No." + '/' + docno;
                        rec."Customer No." := cle."Customer No.";

                        if customer.get(cle."Customer No.") then begin
                            rec.FBM_Group := customer.FBM_Group;
                            rec.FBM_SubGroup := customer.FBM_SubGroup;
                            rec."Customer Name" := customer.Name;
                            if cgr.get(customer.FBM_Group, customer.FBM_SubGroup) then begin
                                rec.FBM_GroupDesc := cgr."Group Name";
                                rec.FBM_SubGroupdesc := cgr."SubGroup Name";
                            end;
                        end;
                        rec."Document Type" := cle."Document Type";
                        rec.FBM_DocCurr := custle."Currency Code";
                        rec.Amount := cle.Amount;
                        rec."Amount (LCY)" := cle."Amount (LCY)";
                        if cle."Entry No." <> CreateCustLedgEntry."Entry No." then
                            rec.Insert();
                    until cle.Next() = 0;
                end;
                cle.ClearMarks();
                clear(cle);
            until custle.Next() = 0;

    end;

    var
        cle: record "Cust. Ledger Entry";
        custLE: record "Cust. Ledger Entry";
        docno: code[20];
        docdate: date;
        doctype: Enum "Gen. Journal Document Type";
        CreateCustLedgEntry: record "Cust. Ledger Entry";
        Heading: Text[50];
        i: Integer;
        customer: record customer;
        cgr: record FBM_CustGroup;

    local procedure FindApplnEntriesDtldtLedgEntry(var cLE: record "Cust. Ledger Entry")
    var
        DtldCustLedgEntry1: Record "Detailed Cust. Ledg. Entry";
        DtldCustLedgEntry2: Record "Detailed Cust. Ledg. Entry";
    begin
        DtldCustLedgEntry1.SetCurrentKey("Cust. Ledger Entry No.");
        DtldCustLedgEntry1.SetRange("Cust. Ledger Entry No.", CreateCustLedgEntry."Entry No.");
        DtldCustLedgEntry1.SetRange(Unapplied, false);
        if DtldCustLedgEntry1.Find('-') then
            repeat
                if DtldCustLedgEntry1."Cust. Ledger Entry No." =
                   DtldCustLedgEntry1."Applied Cust. Ledger Entry No."
                then begin
                    DtldCustLedgEntry2.Init();
                    DtldCustLedgEntry2.SetCurrentKey("Applied Cust. Ledger Entry No.", "Entry Type");
                    DtldCustLedgEntry2.SetRange(
                      "Applied Cust. Ledger Entry No.", DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                    DtldCustLedgEntry2.SetRange("Entry Type", DtldCustLedgEntry2."Entry Type"::Application);
                    DtldCustLedgEntry2.SetRange(Unapplied, false);
                    if DtldCustLedgEntry2.Find('-') then
                        repeat
                            if DtldCustLedgEntry2."Cust. Ledger Entry No." <>
                               DtldCustLedgEntry2."Applied Cust. Ledger Entry No."
                            then begin
                                cle.SetCurrentKey("Entry No.");
                                cle.SetRange("Entry No.", DtldCustLedgEntry2."Cust. Ledger Entry No.");
                                if cle.Find('-') then
                                    cle.Mark(true);
                            end;
                        until DtldCustLedgEntry2.Next() = 0;
                end else begin
                    cle.SetCurrentKey("Entry No.");
                    cle.SetRange("Entry No.", DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                    if cle.Find('-') then
                        cle.Mark(true);
                end;
            until DtldCustLedgEntry1.Next() = 0;
    end;

}