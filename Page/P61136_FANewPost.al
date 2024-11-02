page 61136 FBM_FANewPost_PBI
{
    Caption = 'Fixed Asset New Post WS';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'FANewPost';
    EntityName = 'FANewPost';
    APIVersion = 'v2.0', 'v1.0';
    UsageCategory = Lists;
    SourceTable = "Fixed Asset";
    DelayedInsert = true;
    MultipleNewLines = true;
    AutoSplitKey = false;

    layout
    {
        area(Content)
        {
            repeater(FA)
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
                    Caption = 'Class code';

                }

                field(FASubclassCode; Rec."FA Subclass Code")
                {
                    Caption = 'Subclass code';

                }
                field(ReplicaStatus; Rec.FBM_ReplicaStatus2)
                {
                    Caption = 'ReplicaStatus';

                }



            }
        }
    }
    trigger
    OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        REC.FBM_ReplicaStatus2 := REC.FBM_ReplicaStatus2::Sent;
    end;




}



