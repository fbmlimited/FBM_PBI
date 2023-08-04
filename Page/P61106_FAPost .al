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
                // field(Site_GR_Code; rec.F06)
                // {
                //     Caption = 'Site_GR_Code';

                // }
                field(Site_LOC_code; rec.F06)
                {
                    Caption = 'Site_LOC_code';

                }

                field(Lessee; rec.F07)
                {
                    Caption = 'Lessee';

                }

                field(Update_Date; Rec.F08)
                {
                    Caption = 'Update Date';

                }
                field(Update_Time; Rec.F09)
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
        fa: record "Fixed Asset";
        comp: record Company;
        csite: record FBM_CustomerSite_C;
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
        rec.WS := 'FA';
        rec.DateTrans := Today;
        rec.TimeTrans := Time;
        rec.F01 := 'FA';
        rec.F02 := format(Today);
        rec.F03 := format(Time);
        rec.BatchNo := numbatch;
        buffer.Reset();
        if buffer.FindLast() then
            rec.EntryNo := buffer.EntryNo + 1 else
            rec.entryNo := 1;
        if comp.FindFirst() then
            repeat
                fa.ChangeCompany(comp.Name);
                fa.SetRange("Serial No.", rec.F04);
                if fa.FindFirst() and fa.IsActive then
                    case rec.F05 of
                        '4':
                            fa.FBM_Status := FA.FBM_Status::"D. Installed Op.";
                        '5':
                            FA.FBM_Status := FA.FBM_Status::"E. Installed Non-Op.";
                        '6':
                            fa.FBM_Status := fa.FBM_Status::"F. Non Installed";
                        '7':
                            fa.FBM_Status := fa.FBM_Status::"G. Kill";
                        '8':
                            fa.FBM_Status := fa.FBM_Status::"H. Killed";
                        else
                            fa.FBM_Status := fa.FBM_Status;



                    end;
                fa.FBM_Lessee := rec.F07;
                csite.setrange("Site Code", rec.F06);
                if csite.FindFirst() then
                    fa.FBM_Site := csite.SiteGrCode;

                fa.Modify();

            until comp.Next() = 0;
        rec.Imported := true;
        rec.Modify();
    end;


}



