page 61128 FBM_SiteMastMX_PBI
{
    Caption = 'Site Master MX WS';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'SiteMastMX';
    EntityName = 'SiteMastMX';
    APIVersion = 'v2.0', 'v1.0', 'v2.1';
    //UsageCategory = Lists;
    SourceTable = FBM_Site;
    DelayedInsert = true;
    MultipleNewLines = true;
    AutoSplitKey = false;
    Description = '17.0';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(SiteCode; Rec."Site Code")
                {
                    Caption = 'No.';
                }
                field(Version; Rec.Version)
                {
                    Caption = 'Version';
                }
                field(Name; Rec."Site Name")
                {
                    Caption = 'Name';
                }
                field(Name2; Rec."Site Name 2")
                {
                    Caption = 'Name 2';
                }
                field(Address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(Address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                }
                field(City; Rec.City)
                {
                    Caption = 'City';
                }
                field(PostCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(County; Rec.County)
                {
                    Caption = 'County';
                }
                field(CountryRegion; Rec."Country/Region Code")
                {
                    Caption = 'Country';
                }
                field(VatNumber; Rec."Vat Number")
                {
                    Caption = 'VAT Reg No';
                }
                field(Valid_From; Rec."Valid From")
                {
                    Caption = 'Valid From';
                }
                field(Valid_To; Rec."Valid To")
                {
                    Caption = 'Valid To';
                }
                field(Record_Owner; Rec."Record Owner")
                {
                    Caption = 'Record Owner';
                }
                field(Change_Note; Rec."Change Note")
                {
                    Caption = 'Change Note';
                }

            }
        }
    }

    trigger
    OnOpenPage()
    begin
        rec.SetRange(ActiveRec, true);
        rec.SetRange("Country/Region Code", 'MX');
    end;

}