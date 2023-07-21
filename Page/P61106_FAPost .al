page 61106 FBM_FAPost_PBI
{
    Caption = 'Fixed Asset Post WS';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'FAPost';
    EntityName = 'FAPost';
    APIVersion = 'v2.0', 'v1.0';
    UsageCategory = Lists;
    SourceTable = FBM_WSBuffer;
    SourceTableTemporary = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(FA)
            {
                field("Serial_No"; Rec.F04)
                {
                    Caption = 'Serial No.';

                }
                field(Status; rec.F05)
                {
                    Caption = 'Status';

                }
                field(Site_GR_Code; rec.F06)
                {
                    Caption = 'Site_GR_Code';

                }
                field(Site_LOC_code; rec.F07)
                {
                    Caption = 'Site_LOC_code';

                }
                field(Cust_GR_Code; rec.F08)
                {
                    Caption = 'Cust_GR_Code';

                }
                field(Cust_LOC_code; rec.F09)
                {
                    Caption = 'Cust_LOC_code';

                }
                field(Op_GR_Code; rec.F10)
                {
                    Caption = 'Op_GR_Code';

                }
                field(Op_LOC_code; rec.F11)
                {
                    Caption = 'Op_LOC_code';

                }
                field(Lessee; rec.F12)
                {
                    Caption = 'Lessee';

                }
                field(Adquired_Date; Rec.F13)
                {
                    Caption = 'Adquired Date';

                }
                field(Update_Date; Rec.F14)
                {
                    Caption = 'Update Date';

                }
                field(Update_Time; Rec.F15)
                {
                    Caption = 'Update Time';

                }


            }
        }
    }
    trigger
   OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        buffer: record FBM_WSBuffer;
        numbatch: integer;
        maxbatch: Integer;
    begin
        buffer.SetRange(Imported, true);
        if buffer.FindLast() then
            maxbatch := buffer.BatchNo;
        buffer.Reset();
        buffer.SetRange(Imported, false);
        if buffer.FindFirst() then
            numbatch := buffer.BatchNo
        else
            numbatch := maxbatch + 1;
        rec.F01 := 'FA';
        rec.F02 := format(Today);
        rec.F03 := format(Time);
        rec.BatchNo := numbatch;


    end;


}



