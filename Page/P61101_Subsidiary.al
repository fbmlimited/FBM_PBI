page 61101 FBM_Subsidiary_PBI
{
    Caption = 'Subsidiary';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Company;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(rName; rname)
                {
                    ApplicationArea = All;
                }


            }
        }
        area(Factboxes)
        {

        }
    }

    trigger
    OnAfterGetRecord()
    begin
        compinfo.ChangeCompany(rec.Name);
        compinfo.get;
        if compinfo.FBM_EnWS then
            rname := rec.Name else
            rname := '';

    end;


    var
        compinfo: Record "Company Information";
        rname: Text[30];
}