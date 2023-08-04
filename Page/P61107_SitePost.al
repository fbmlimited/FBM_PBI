page 61107 FBM_SitePost_PBI
{
    Caption = 'Site Post WS';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'SitePost';
    EntityName = 'SitePost';
    APIVersion = 'v2.0', 'v1.0';
    UsageCategory = Lists;
    SourceTable = FBM_WSBuffer;
    SourceTableTemporary = false;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(SITE)
            {
                // field(Site_GR_Code; Rec.F04)
                // {
                //     Caption = 'Site_GR_Code';

                // }
                field(Site_LOC_code; rec.F04)
                {
                    Caption = 'Site_LOC_code';

                }
                field(Status; rec.F05)
                {
                    Caption = 'Status';

                }



                field(Update_Date; Rec.F06)
                {
                    Caption = 'Update Date';

                }
                field(Update_Time; Rec.F07)
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
        comp: record Company;
        site: record FBM_Site;
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

        rec.WS := 'SITE';
        rec.DateTrans := Today;
        rec.TimeTrans := Time;
        rec.F01 := 'SITE';
        rec.F02 := format(Today);
        rec.F03 := format(Time);
        rec.BatchNo := numbatch;
        buffer.Reset();
        if buffer.FindLast() then
            rec.EntryNo := buffer.EntryNo + 1 else
            rec.entryNo := 1;
        if comp.FindFirst() then
            repeat
                csite.ChangeCompany(comp.Name);
                csite.SetRange("Site Code", rec.F04);
                if csite.FindFirst() then
                    site.SetRange("Site Code", csite.SiteGrCode);
                if site.FindFirst() then
                    case rec.F05 of
                        '1':
                            site.Status := site.Status::OPERATIONAL;
                        '2':
                            site.Status := site.Status::"HOLD OPERATION";
                        '3':
                            site.Status := site.Status::"STOP OPERATION";
                        '4':
                            site.Status := site.Status::"NOT YET";

                        else
                            site.Status := site.Status::" ";



                    end;


                site.Modify();

            until comp.Next() = 0;
        rec.Imported := true;
        rec.Modify();

    end;


}



