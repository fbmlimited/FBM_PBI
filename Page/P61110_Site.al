page 61110 FBM_Site_PBI
{
    PageType = API;
    Caption = 'Site';
    APIPublisher = 'FBMGroup';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'Site';
    EntitySetName = 'Site';
    SourceTable = FBM_Site;
    DelayedInsert = true;
    InsertAllowed = false;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Site_Code; rec."Site Code")
                {
                    ApplicationArea = all;

                }
                field(Site_Name; rec."Site Name")
                {
                    ApplicationArea = all;

                }
                field(Address; rec.Address)
                {
                    ApplicationArea = all;
                }
                field(Address_2; rec."Address 2")
                {
                    ApplicationArea = all;
                }
                field(City; rec.City)
                {
                    ApplicationArea = all;
                }
                field(Post_Code; rec."Post Code")
                {
                    ApplicationArea = all;
                }
                field(County; rec.County)
                {
                    ApplicationArea = all;
                }
                field(Country_Region_Code; rec."Country/Region Code")
                {
                    ApplicationArea = all;
                }

                field(Vat_Number; rec."Vat Number")
                {
                    ApplicationArea = all;
                }

                field(Valid_From; rec."Valid From")
                {
                    ApplicationArea = all;
                }
                field(Valid_To; rec."Valid To")
                {
                    ApplicationArea = all;
                }
                field(Record_Owner; rec."Record Owner")
                {
                    ApplicationArea = all;
                }
                field(Change_Note; rec."Change Note")
                {
                    ApplicationArea = all;
                }
                field(SystemModifiedAt; rec.SystemModifiedAt)
                {
                    ApplicationArea = all;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = all;
                }
                field(Company1; Rec.Company1)
                {
                    Caption = 'Company 1';
                    ApplicationArea = all;
                }
                field(Company2; Rec.Company2)
                {
                    Caption = 'Company 2';
                    ApplicationArea = all;
                }
                field(Company3; Rec.Company3)
                {
                    Caption = 'Company 3';
                    ApplicationArea = all;
                }
            }
        }
    }
    trigger
    OnOpenPage()
    begin
        rec.setrange(ActiveRec, true)
    end;
}