page 61133 FBM_GetFAMX_PBI
{
    Caption = 'Fixed Asset MX WS';
    PageType = api;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'FAMX';
    EntityName = 'FAMX';
    APIVersion = 'v2.0', 'v1.0';
    //UsageCategory = Lists;
    SourceTable = "Fixed Asset";
    SourceTableTemporary = false;
    DelayedInsert = true;
    Description = '19.0';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(No; Rec."No.")
                {
                    Caption = 'No.';

                }
                field(SerialNo; Rec."Serial No.")
                {
                    Caption = 'Serial No.';

                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';

                }
                field(FAClassCode; Rec."FA Class Code")
                {
                    Caption = 'Class';

                }
                field(FASubclassCode; Rec."FA Subclass Code")
                {
                    Caption = 'SubClass';

                }
                field(FALocationCode; Rec."FA Location Code")
                {
                    Caption = 'FA Location';

                }
                field(Model; Rec.FBM_Model)
                {
                    Caption = 'Model';

                }
                field(Segment; format(Rec.FBM_Segment2))
                {
                    Caption = 'Segment';

                }
                field(Brand; format(Rec.FBM_Brand))
                {
                    Caption = 'Brand';

                }
                field(Lessee; Rec.FBM_Lessee)
                {
                    Caption = 'Lessee';

                }
                field(Site; Rec.FBM_Site)
                {
                    Caption = 'Site';

                }
                field(Status; format(Rec.FBM_Status))
                {
                    Caption = 'Status';

                }
                field(DatePrepared; Rec.FBM_DatePrepared)
                {
                    Caption = 'Date Prepared';

                }
                field(AcqCost; Rec.FBM_AcqCost)
                {


                }
                field(Acqdate; Rec.FBM_Acqdate)
                {


                }
                field(Deprdate; Rec.FBM_Deprdate)
                {


                }

            }
        }

    }
    trigger

    OnOpenPage()
    begin
        rec.SetRange("FA Subclass Code", 'EGM_MX');
    end;

    trigger
    OnAfterGetRecord()

    begin
        fah.SetRange(ActiveRec, true);
        fah.SetRange("No.", rec."No.");
        if fah.FindLast() then
            version := fah.Version;
        rec.CalcFields(FBM_AcqCost, FBM_Deprdate, FBM_Acqdate);
        rec.FBM_AcquisitionCost := rec.FBM_AcqCost;
        rec.FBM_AcquisitionDate := rec.FBM_Acqdate;
        rec.FBM_DepreciationDate := rec.FBM_Deprdate;
        rec.Modify();


    end;

    var
        fah: RECORD FBM_FAHistory_DD;
        version: Integer;

}