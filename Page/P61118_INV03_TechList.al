page 61118 FBM_TechList_PBI
{
    Caption = 'TechListWS';
    PageType = api;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'TechListWS';
    EntityName = 'TechListWS';
    APIVersion = 'v2.0', 'v1.0';
    UsageCategory = Lists;
    SourceTable = Bin;
    DelayedInsert = true;



    layout
    {
        area(Content)
        {
            repeater(Tech)
            {
                field(Loc_code; Rec."Location Code")
                {
                    Caption = 'Location';

                }
                field(Technician; rec."Code")
                {
                    Caption = 'Technician';

                }
                field(Name; rec.Description)
                {
                    Caption = 'Technician name';

                }





            }
        }
    }
    trigger
    OnOpenPage()
    begin
        rec.SetFilter("Location Code", '%1', 'TEC*');
    end;




}