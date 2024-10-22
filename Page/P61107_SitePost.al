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
        cos: record FBM_CustOpSite;
        cinfo: record "Company Information";
    begin
        buffer.SetRange(Imported, true);
        if buffer.FindLast() then
            maxbatch := buffer.BatchNo;

        buffer.Reset();
        buffer.SetRange(Imported, false);
        if buffer.FindLast() then
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
                cinfo.ChangeCompany(comp.Name);
                csite.ChangeCompany(comp.Name);
                csite.SetRange("Site Code", rec.F04);
                csite.SetRange(ActiveRec, true);
                if csite.FindFirst() then begin
                    cos.setrange("Cust Loc Code", csite."Customer No.");
                    cos.SetRange("Site Loc Code", csite."Site Code");
                    cos.SetRange(Subsidiary, cinfo.FBM_FALessee + '*');
                    if cos.FindFirst() then
                        case rec.F05 of
                            '1':
                                begin
                                    if csite.Status <> csite.Status::"STOP OPERATION" then begin // don't change if STOP OPERATION (preserve FBM records)
                                        csite.validate(Status, csite.Status::OPERATIONAL);
                                        cos.IsActive := true;
                                    end;
                                end;
                            '2':
                                begin
                                    if csite.Status <> csite.Status::"STOP OPERATION" then begin
                                        csite.Validate(Status, csite.Status::"HOLD OPERATION");
                                        cos.IsActive := true;
                                    end;
                                end;
                            '3':
                                begin

                                    csite.Validate(Status, csite.Status::"STOP OPERATION");
                                    cos.IsActive := false;
                                end;
                            '4':
                                begin
                                    if csite.Status <> csite.Status::"STOP OPERATION" then begin
                                        csite.Validate(Status, csite.Status::"PRE-OPENING ");
                                        cos.IsActive := false;
                                    end;
                                end;

                            else begin
                                if csite.Status <> csite.Status::"STOP OPERATION" then begin
                                    csite.Validate(Status, csite.Status::"DBC ADMIN");
                                    cos.IsActive := false;
                                end;
                            end;


                        end;


                    csite.Modify();
                end;

            until comp.Next() = 0;
        rec.Imported := true;



    end;


}



