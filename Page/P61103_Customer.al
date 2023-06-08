page 61103 FBM_CustomerOp_PBI
{
    PageType = API;
    Caption = 'CustomerOperator';
    APIPublisher = 'FBMGroup';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'CustomerOperator';
    EntitySetName = 'CustomerOperator';
    SourceTable = FBM_Customer;
    DelayedInsert = true;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("GroupCode"; rec."No.")
                {
                    Caption = 'Group Code';
                    ApplicationArea = all;
                }


                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    ApplicationArea = all;
                }
                field(Address; Rec.Address)
                {
                    Caption = 'Address';
                    ApplicationArea = all;
                }
                field("Address2"; Rec."Address 2")
                {
                    Caption = 'Adress 2';
                    ApplicationArea = all;
                }
                field(City; Rec.City)
                {
                    Caption = 'City';
                    ApplicationArea = all;
                }
                field("PostCode"; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ApplicationArea = all;
                }
                field(County; Rec.County)
                {
                    Caption = 'County';
                    ApplicationArea = all;
                }
                field("CountryRegionCode"; Rec."Country/Region Code")
                {
                    Caption = 'Country';
                    ApplicationArea = all;
                }
                field(FBM_Group; Rec.FBM_Group)
                {
                    Caption = 'Group';
                    ApplicationArea = all;
                }
                field(FBM_SubGroup; Rec.FBM_SubGroup)
                {
                    Caption = 'SubGroup';
                    ApplicationArea = all;
                }
                field("Valid_From"; Rec."Valid From")
                {
                    Caption = 'Valid From';
                    ApplicationArea = all;
                }
                field("Valid_To"; Rec."Valid To")
                {
                    Caption = 'Valid To';
                    ApplicationArea = all;
                }
                field("Record_Owner"; Rec."Record Owner")
                {
                    Caption = 'Record Owner';
                    ApplicationArea = all;
                }
                field("Change_Note"; Rec."Change Note")
                {
                    Caption = 'Change Note';
                    ApplicationArea = all;
                }


            }
        }
    }
    trigger
    OnOpenPage()
    begin
        if compinfo.get then
            Subsidiary := compinfo."Custom System Indicator Text";
    end;

    var
        Subsidiary: text[250];
        compinfo: record "Company Information";
}