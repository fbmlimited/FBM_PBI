page 61119 FBM_LocList_PBI
{
    Caption = 'LocListWS';
    PageType = api;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'FADetail';
    EntityName = 'FADetail';
    APIVersion = 'v2.0', 'v1.0';
    UsageCategory = Lists;
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

                }
                field(Loc_Name; rec.Name)
                {
                    Caption = 'Name';

                }






            }
        }
    }
    trigger
    OnOpenPage()
    begin
        rec.SetFilter(Code, '<>%1 & <>%2', 'TEC*', 'SITE*');
    end;




}