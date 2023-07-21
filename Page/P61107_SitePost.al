page 61107 FBM_SitePost_PBI
{
    Caption = 'Site Post WS';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'SitePost';
    EntityName = 'SitePost';
    APIVersion = 'v2.0', 'v1.0';
    UsageCategory = Lists;
    SourceTable = FBM_WSBuffer;
    SourceTableTemporary = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(FA)
            {
                field(Site_GR_Code; Rec.F04)
                {
                    Caption = 'Site_GR_Code';

                }
                field(Site_LOC_code; rec.F05)
                {
                    Caption = 'Site_LOC_code';

                }
                field(Status; rec.F05)
                {
                    Caption = 'Status';

                }
                field(CStatus; rec.F06)
                {
                    Caption = 'CStatus';

                }

                field(Lessee; rec.F07)
                {
                    Caption = 'Lessee';

                }
                field(Adquired_Date; Rec.F08)
                {
                    Caption = 'Adquired Date';

                }
                field(Update_Date; Rec.F09)
                {
                    Caption = 'Update Date';

                }
                field(Update_Time; Rec.F10)
                {
                    Caption = 'Update Time';

                }


            }
        }
    }
    trigger
   OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        rec.F01 := 'SITE';
        rec.F02 := format(Today);
        rec.F03 := format(Time);

    end;


}



