page 61114 FBM_CustMaster_PBI
{
    PageType = API;
    Caption = 'CustMaster';
    APIPublisher = 'FBMGroup';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'CustMaster';
    EntitySetName = 'CustMaster';
    SourceTable = FBM_Customer;
    DelayedInsert = true;
    InsertAllowed = false;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(No; rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = all;
                }
                field(Name2; rec."Name 2")
                {
                    ApplicationArea = all;
                }
                field(Name3; rec."FBM_Name 3")
                {
                    ApplicationArea = all;
                }
                field(SearchName; rec."Search Name")
                {
                    ApplicationArea = all;
                }
                field(address; rec.Address)
                {
                    ApplicationArea = all;
                }
                field(address2; rec."Address 2")
                {
                    ApplicationArea = all;
                }
                field(city; rec.City)
                {
                    ApplicationArea = all;
                }
                field(contact; rec.Contact)
                {
                    ApplicationArea = all;
                }
                field(phone; rec."Phone No.")
                {
                    ApplicationArea = all;
                }
                field(company1; rec.FBM_Company1)
                {
                    ApplicationArea = all;
                }
                field(company2; rec.FBM_Company2)
                {
                    ApplicationArea = all;
                }
                field(company3; rec.FBM_Company3)
                {
                    ApplicationArea = all;
                }
                field(lastmodified; rec."Last Modified Date Time")
                {
                    ApplicationArea = all;
                }




            }
        }
    }
}