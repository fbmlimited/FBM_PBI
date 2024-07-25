page 61104 FBM_Subsidiary_PBI
{
    Caption = 'Subsidiary';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'Subsidiary';
    EntityName = 'Subsidiary';
    APIVersion = 'v2.0', 'v1.0';
    SourceTable = FBM_Subsidiary;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Country; Rec.Country)
                {
                    Caption = 'Country';

                }
                field(Lessee; Rec.Lessee)
                {
                    Caption = 'Lesssee';

                }
                field(EGM_Property; Rec.EGM_Property)
                {
                    Caption = 'EGM Property';

                }
                field(Brand; Rec.Brand)
                {
                    Caption = 'Brand';

                }
                field(Subsidiary; Subsidiary)
                {
                    Caption = 'Subsidiary';

                }

                field(SystemModifiedAt; rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified At';
                    ApplicationArea = all;
                }
            }
        }
    }
    trigger
    OnAfterGetRecord()
    begin

        Subsidiary := (Rec.Lessee) + ' ' + rec.Country;

    end;

    var
        Subsidiary: text[20];

}