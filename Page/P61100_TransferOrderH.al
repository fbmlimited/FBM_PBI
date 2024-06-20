page 61100 FBM_TransferOrderHPost_PBI
{
    Caption = 'Transfer Order Header  Post WS';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'TOHpost';
    EntityName = 'TOHPost';
    APIVersion = 'v2.0', 'v1.0';
    UsageCategory = Lists;
    SourceTable = "Transfer Header";
    DelayedInsert = true;
    MultipleNewLines = true;
    AutoSplitKey = false;
    Description = '14.2';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No"; Rec."No.")
                {
                    Caption = 'No.';

                }
                field("FromCode"; Rec."Transfer-from Code")
                {
                    Caption = 'From';

                }
                field(ToCode; Rec."Transfer-to Code")
                {
                    Caption = 'To';

                }
                field(PostingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';

                }
                field(ShipDate; Rec."Shipment Date")
                {
                    Caption = 'Shipment Date';

                }
                field(ReceiptDate; Rec."Receipt Date")
                {
                    Caption = 'Receipt Date';

                }

                field(SiteFrom; Rec.FBM_SiteFrom)
                {
                    Caption = 'Site From';

                }
                field(SiteTo; Rec.FBM_SiteTo)
                {
                    Caption = 'Site To';

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