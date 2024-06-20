page 61115 FBM_InventoryOrion_PBI
{
    PageType = API;
    Caption = 'InventoryOrion';
    APIPublisher = 'FBMGroup';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'InventoryOrion';
    EntitySetName = 'InventoryOrion';
    SourceTable = Item;

    DelayedInsert = true;
    InsertAllowed = false;
    Permissions = tabledata 32 = rimd;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Subsidiary; subsidiary)
                {
                    Caption = 'Subsidiary';
                    ApplicationArea = all;

                }
                field(No_; Rec."No.")
                {
                    Caption = 'Item No.';
                    ApplicationArea = all;

                }
                field(Description; Rec.Description)
                {
                    Caption = 'Item Desc';
                    ApplicationArea = all;

                }
                field("UOM"; Rec."Base Unit of Measure")
                {
                    Caption = 'UOM';
                    ApplicationArea = all;

                }
                field(Inventory_New; Inventory_New)
                {
                    Caption = 'New';
                    ApplicationArea = all;

                }
                field(Inventory_Used; Inventory_Used)
                {
                    Caption = 'Used';
                    ApplicationArea = all;

                }
                field(MinStock; Rec.FBM_MinStock)
                {
                    Caption = 'Min. Stock';
                    ApplicationArea = all;

                }
                field(Categories; Rec.FBM_MultiCat)
                {
                    Caption = 'Categories';
                    ApplicationArea = all;

                }
                field(tracking; rec."Item Tracking Code")
                {
                    Caption = 'Tracking Code';
                    ApplicationArea = all;

                }
            }
        }
    }
    trigger
    OnOpenPage()
    begin
        buftxt.DeleteAll();
        if itemle.FindFirst() then
            repeat
                country.Reset();
                if loc.get(itemle."Location Code") then begin
                    itemle.FBM_NewItem := loc.FBM_NewItem;
                    itemle.FBM_Country := loc."Country/Region Code";
                    itemle.Modify();
                    buftxt.reset;
                    buftxt.SetRange(name, loc."Country/Region Code");
                    if not buftxt.FindFirst() then begin
                        buftxt.Init();
                        id += 1;
                        buftxt.id := id;
                        buftxt.Name := loc."Country/Region Code";
                        if country.get(loc."Country/Region Code") then
                            buftxt.value := country.FBM_Country3;
                        buftxt.Insert();
                    end;

                end;
            until itemle.Next() = 0;

    end;

    trigger
    OnAfterGetRecord()
    begin
        cinfo.get;
        buftxt.FindFirst();
        repeat
            if country.get(buftxt.Name) then
                subsidiary := cinfo."Custom System Indicator Text" + ' ' + country.FBM_Country3;
            itemle.reset;
            itemle.SetRange(FBM_Country, buftxt.Name);
            itemle.SetRange("Item No.", rec."No.");
            itemle.SetRange(FBM_NewItem, true);
            itemle.CalcSums(Quantity);
            Inventory_New := itemle.Quantity;
            itemle.reset;
            itemle.SetRange(FBM_Country, buftxt.Name);
            itemle.SetRange("Item No.", rec."No.");
            itemle.SetRange(FBM_NewItem, false);
            itemle.CalcSums(Quantity);
            Inventory_Used := itemle.Quantity;
        until buftxt.next = 0;



    end;

    var
        id: Integer;
        itemle: record "Item Ledger Entry";
        loc: record Location;
        subsidiary: text[20];
        buftxt: record "Name/Value Buffer";
        country: record "Country/Region";
        Inventory_New: Decimal;
        Inventory_Used: Decimal;
        cinfo: record "Company Information";

}