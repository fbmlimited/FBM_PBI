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
    MultipleNewLines = true;

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
                field(Location_Code; Rec.F10)
                {
                    Caption = 'Location Code';

                }
                field(Model; Rec.F11)
                {
                    Caption = 'Model';

                }
                field(Segment; Rec.F12)
                {
                    Caption = 'Segment';

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
                fa.CalcFields(FBM_IsEGM);
                fa.SetRange("Serial No.", rec.F04);
                fa.SetFilter(FBM_Status, '<>%1', fa.FBM_Status::"I. Sold");
                fa.SetRange(FBM_IsEGM, true);
                if fa.FindFirst() then
                    if fa.IsActive then begin
                        case rec.F05 of
                            '4':
                                fa.FBM_Status := FA.FBM_Status::"D. Installed Op.";
                            '5':
                                FA.FBM_Status := FA.FBM_Status::"E. Installed Non-Op.";
                            '6':
                                fa.FBM_Status := fa.FBM_Status::"F. Under Maintenance";
                            '7':
                                fa.FBM_Status := fa.FBM_Status::"G. For Disposal";
                            '8':
                                fa.FBM_Status := fa.FBM_Status::"H. Scrapped";
                            '9':
                                fa.FBM_Status := fa.FBM_Status::"I. Sold";

                            else
                                fa.FBM_Status := fa.FBM_Status;



                        end;
                        fa.FBM_Lessee := rec.F07;
                        csite.setrange("Site Code", rec.F06);
                        if csite.FindFirst() then
                            fa.FBM_Site := csite.SiteGrCode;
                        fa."FA Location Code" := rec.F10;
                        fa.FBM_Model := rec.F11;
                        evaluate(fa.FBM_Segment2, rec.F12);
                        fa.Modify();
                    end;

            until comp.Next() = 0;
        rec.Imported := true;

    end;


}



