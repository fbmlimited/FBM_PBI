page 61124 FBM_VendorList_PBI
{
    Caption = 'Vendor List WS';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'VendorList';
    EntityName = 'VendorList';
    APIVersion = 'v2.0', 'v1.0', 'v2.1';
    //UsageCategory = Lists;
    SourceTable = Vendor;
    DelayedInsert = true;
    MultipleNewLines = true;
    AutoSplitKey = false;
    Description = '16.4';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(No; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field(Name2; Rec."Name 2")
                {
                    ApplicationArea = All;
                }
                field(SearchName; Rec."Search Name")
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field(Address2; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field(PostCode; Rec."Post Code")
                {
                    ApplicationArea = All;
                }
                field(Province; Rec.County)
                {
                    ApplicationArea = All;
                }
                field(Country; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field(Phone; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field(EMail; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field(Website; Rec."Home Page")
                {
                    ApplicationArea = All;
                }
                field(VATRegistrationNo; Rec."VAT Registration No.")
                {
                    ApplicationArea = All;
                }
                field(Currency; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field(PaymentMethod; Rec."Payment Method Code")
                {
                    ApplicationArea = All;
                }
                field(PaymentTerms; Rec."Payment Terms Code")
                {
                    ApplicationArea = All;
                }

                field(VendorPostingGroup; Rec."Vendor Posting Group")
                {
                    ApplicationArea = All;
                }
                field(GenBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field(VATBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}