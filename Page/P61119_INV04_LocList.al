page 61119 FBM_LocList_PBI
{
    Caption = 'LocListWS';
    PageType = api;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'LocListWS';
    EntityName = 'LocListWS';
    APIVersion = 'v2.0', 'v1.0';
    //UsageCategory = Lists;
    SourceTable = Location;
    DelayedInsert = true;



    layout
    {
        area(Content)
        {
            repeater(Tech)
            {
                field(Loc_code; Rec.Code)
                {
                    Caption = 'Location';
                    ApplicationArea = all;

                }
                field(Loc_Name; rec.Name)
                {
                    Caption = 'Name';
                    ApplicationArea = all;
                }
                field(NewUsed; newused)
                {
                    Caption = 'New/Used';
                    ApplicationArea = all;
                }






            }
        }
    }
    trigger
    OnOpenPage()
    begin
        // rec.SetFilter(Code, '<>%1 & <>%2', 'TEC*', 'SITE*');
        // rec.FindFirst();
        // repeat
        //     if rec.FBM_NewItem or rec.FBM_UsedItem then rec.Mark(true);
        // until rec.Next() = 0;
        // rec.MarkedOnly(true);
    end;

    trigger
    OnAfterGetRecord()

    begin
        newused := '';
        if rec.FBM_NewItem then newused := 'New';
        if rec.FBM_UsedItem then newused := 'Used';

    end;

    var
        newused: text[10];





}