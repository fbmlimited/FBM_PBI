page 61101 FBM_TransferOrderLPost_PBI
{
    Caption = 'Transfer Order Line  Post WS';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'TOLpost';
    EntityName = 'TOLPost';
    APIVersion = 'v2.0', 'v1.0';
    UsageCategory = Lists;
    SourceTable = "Transfer Line";
    DelayedInsert = true;
    MultipleNewLines = true;
    Description = '14.2';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(TransferNo; Rec."Document No.")
                {
                    Caption = 'Document No.';

                }
                field(LineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';

                }
                field(ItemNo; Rec."Item No.")
                {
                    Caption = 'Item';

                }
                field(SerialNo; Rec.FBM_SerialNo)
                {
                    Caption = 'Serial Nr.';


                }
                field(UOM; Rec."Unit of Measure Code")
                {
                    Caption = 'UOM';

                }
                field(Quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';

                }
                field(SiteFrom; Rec.FBM_SiteFrom)
                {
                    Caption = 'Site From';

                }
                field(SiteTo; Rec.FBM_SiteTo)
                {
                    Caption = 'Site To';

                }
                field(BinFrom; Rec."Transfer-from Bin Code")
                {
                    Caption = 'Bin From';

                }
                field(BinTo; Rec."Transfer-To Bin Code")
                {
                    Caption = 'Bin To';

                }
            }

        }
    }
    trigger
    OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        rec."Direct Transfer" := true;
        rec.FBM_FromOrion := true;
    end;

}