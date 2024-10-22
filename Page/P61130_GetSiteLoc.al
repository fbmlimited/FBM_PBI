page 61130 FBM_GetsiteLoc_PBI
{
    Caption = 'Get Local Site';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'SiteLoc';
    EntityName = 'SiteLoc';
    APIVersion = 'v2.0', 'v1.0';
    //UsageCategory = Lists;
    SourceTable = FBM_CustomerSite_C;
    SourceTableTemporary = true;
    DelayedInsert = true;
    ApplicationArea = all;
    Description = '18.2';




    layout
    {
        area(Content)
        {
            repeater(SerialNo)
            {

                field(gcust; gcust)
                {
                    Caption = 'Customer Group Code';
                    ApplicationArea = all;
                }
                field(SiteGrCode; Rec.SiteGrCode)
                {
                    Caption = 'Site Group Code';
                    ApplicationArea = all;

                }
                field(Version; Rec.Version)
                {
                    Caption = 'Version';
                    ApplicationArea = all;
                }

                field(Status; Rec.Status)
                {
                    Caption = 'Statua';
                    ApplicationArea = all;
                }
                field(Contract; Rec."Contract Code")
                {
                    Caption = 'Contract Code';
                    ApplicationArea = all;
                }
                field(Contract2; Rec."Contract Code2")
                {
                    Caption = 'Contract Code 2 (Spin)';
                    ApplicationArea = all;
                }
                field(Contact; Rec."Contact")
                {
                    Caption = 'Contact';
                    ApplicationArea = all;
                }
                field(VatNumber; Rec."Vat Number")
                {
                    Caption = 'VAT Number';
                    ApplicationArea = all;

                }
                field(Valid_From; Rec."Valid From")
                {
                    Caption = 'Valid From';
                    ApplicationArea = all;

                }
                field(Valid_To; Rec."Valid To")
                {
                    Caption = 'Valid To';
                    ApplicationArea = all;

                }
                field(Record_Owner; Rec."Record Owner")
                {
                    Caption = 'Record Owner';
                    ApplicationArea = all;

                }
                field(Change_Note; Rec."Change Note")
                {
                    Caption = 'Valid FromChange Note';
                    ApplicationArea = all;

                }









            }
        }
    }
    trigger
    OnOpenPage()
    begin
        rec.SetRange(ActiveRec, true);
    end;

    trigger
OnAfterGetRecord()
    begin
        if cust.get(rec."Customer No.") then
            gcust := cust.FBM_GrCode;

    end;

    var

        cust: record Customer;
        gcust: code[20];

}