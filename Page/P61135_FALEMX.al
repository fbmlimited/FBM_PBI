page 61135 FBM_FALEMX_PBI
{
    Caption = 'Fixed Asset LE MX WS';
    PageType = api;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'FALEMXist';
    EntityName = 'FAMLEXList';
    APIVersion = 'v2.0', 'v1.0';
    UsageCategory = Lists;
    SourceTable = "FA Ledger Entry";
    SourceTableTemporary = true;
    DelayedInsert = true;
    Description = '20.0';

    layout
    {
        area(Content)
        {
            repeater(FA)
            {
                field(EntryNo; Rec."Entry No.")
                {
                    ApplicationArea = all;
                }
                field(FANo; Rec."FA No.")
                {
                    ApplicationArea = all;
                }
                field(PostingDate; Rec."Posting Date")
                {
                    Caption = 'Status';

                }
                field(FAPostingType; Rec."FA Posting Type")
                {
                    Caption = 'Site_GR_Code';
                }
                field(Amount; Rec.Amount)
                {
                    Caption = 'Description';

                }





            }
        }
    }
    trigger
    OnOpenPage()
    var
        site: record FBM_Site;
        country: record "Country/Region";

    begin
        rec.setrange("FA Posting Type", rec."FA Posting Type"::"Acquisition Cost");
        rec.SetRange("FA Subclass Code", 'EGM_MX');

    end;



}