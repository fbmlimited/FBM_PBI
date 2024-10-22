page 61132 FBM_GetFA_PBI
{
    Caption = 'Fixed Asset WS';
    PageType = api;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'FA';
    EntityName = 'FA';
    APIVersion = 'v2.0', 'v1.0';
    //UsageCategory = Lists;
    SourceTable = "Fixed Asset";
    SourceTableTemporary = true;
    DelayedInsert = true;
    Description = '19.0';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(No; Rec."No.")
                {
                    Caption = 'No.';

                }
                field(SerialNo; Rec."Serial No.")
                {
                    Caption = 'Serial No.';

                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';

                }
                field(FAClassCode; Rec."FA Class Code")
                {
                    Caption = 'Class';

                }
                field(FASubclassCode; Rec."FA Subclass Code")
                {
                    Caption = 'SubClass';

                }
                field(FALocationCode; Rec."FA Location Code")
                {
                    Caption = 'FA Location';

                }
                field(FBM_Model; Rec.FBM_Model)
                {
                    Caption = 'Model';

                }
                field(FBM_Segment2; Rec.FBM_Segment2)
                {
                    Caption = 'Segment';

                }
                field(FBM_Brand; Rec.FBM_Brand)
                {
                    Caption = 'Brand';

                }
                field(FBM_Lessee; Rec.FBM_Lessee)
                {
                    Caption = 'Lessee';

                }
                field(FBM_Site; Rec.FBM_Site)
                {
                    Caption = 'Site';

                }
                field(FBM_Status; Rec.FBM_Status)
                {
                    Caption = 'Status';

                }
                field(FBM_DatePrepared; Rec.FBM_DatePrepared)
                {
                    Caption = 'Date Prepared';

                }

            }
        }

    }

}