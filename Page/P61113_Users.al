page 61113 FBM_Users_PBI
{
    PageType = API;
    Caption = 'Users';
    APIPublisher = 'FBMGroup';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'Users';
    EntitySetName = 'Users';
    SourceTable = User;
    DelayedInsert = true;
    InsertAllowed = false;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Email"; Rec."Authentication Email")
                {
                    ApplicationArea = all;

                }
                field(Full_Name; Rec."Full Name")
                {
                    ApplicationArea = all;

                }
                field(User_Name; Rec."User Name")
                {
                    ApplicationArea = all;

                }

            }
        }
    }
    trigger
    OnOpenPage()
    begin
        rec.setrange(state, rec.state::Enabled)
    end;
}