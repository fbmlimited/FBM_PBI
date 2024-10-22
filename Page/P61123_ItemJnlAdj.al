page 61123 FBM_OtemJnlPost
{
    Caption = 'Item Jnl Adj';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'ItemJnlPost';
    EntityName = 'ItemJnlPost';
    APIVersion = 'v2.0', 'v1.0';
    //UsageCategory = Lists;
    SourceTable = "Item Journal Line";

    DelayedInsert = true;
    Description = '16.0';
    layout
    {
        area(Content)
        {
            repeater(ItemJnl)
            {
                field(DocumentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';

                }
                field(LineNo; Rec."Line No.")
                {
                    Caption = 'Item No.';

                }
                field(ItemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';

                }

                field(sign; sign)
                {
                    Caption = 'Adj. Sign';

                }
                field(Location; Rec."Location Code")
                {
                    Caption = 'UOM';

                }
                field(SerialNo; Rec."Serial No.")
                {
                    Caption = '\serial No.';

                }
                field(UOM; Rec."Unit of Measure Code")
                {
                    Caption = 'UOM';

                }
                field(Quantity; Rec.Quantity)
                {
                    Caption = 'Serial No.';
                    trigger
                    OnValidate()
                    begin
                        if (rec."Serial No." <> '') and (rec.Quantity <> 1) then
                            error('Quantity must be 1. Item=%1', rec."Item No.");
                    end;

                }
                field(Site; Rec.FBM_Site)
                {
                    Caption = 'site';

                }
                field(Bin; Rec."Bin Code")
                {
                    Caption = 'Bin';

                }




            }
        }
    }
    trigger
    OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        invsetup.Get();
        if sign = -1 then
            rec."Entry Type" := rec."Entry Type"::"Negative Adjmt."
        else
            rec."Entry Type" := rec."Entry Type"::"Positive Adjmt.";
        rec."Journal Template Name" := invsetup.FBM_InvAdjTemplate;
        rec."Journal Batch Name" := invsetup.FBM_InvAdjBatch;
        rec."Posting Date" := Today;
    end;

    var
        sign: Integer;
        invsetup: record "Inventory Setup";
}