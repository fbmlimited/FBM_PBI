page 61114 FBM_GetILE_PBI
{
    Caption = 'Get ILE';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'GetILE';
    EntityName = 'GetILE';
    APIVersion = 'v2.0', 'v1.0';
    //UsageCategory = Lists;
    SourceTable = "Item Ledger Entry";
    DelayedInsert = true;
    MultipleNewLines = true;
    Description = '16.1';
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ItemNo; Rec."Item No.")
                {
                    ApplicationArea = all;
                }
                field(itemdesc; itemdesc)
                {
                    ApplicationArea = all;
                }
                field(SerialNo; Rec."Serial No.")
                {
                    ApplicationArea = all;
                }
                field(DocumentNo; Rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field(LocationCode; Rec."Location Code")
                {
                    ApplicationArea = all;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field(Site; Rec.FBM_Site)
                {
                    ApplicationArea = all;
                }
                field(PostingDate; Rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field(DocumentDate; Rec."Document Date")
                {
                    ApplicationArea = all;
                }
                field(OrderNo; Rec."Order No.")
                {
                    ApplicationArea = all;
                }


            }
        }
    }
    trigger
    OnAfterGetRecord()
    begin
        itemdesc := '';
        if item.get(rec."Item No.") then
            itemdesc := rec.Description;
    end;

    var
        itemdesc: text[100];
        item: record Item;
}