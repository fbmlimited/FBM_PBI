page 61108 FBM_FinAttributes_PBI
{
    Caption = 'Financial Attributes';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'SubsSite';
    EntityName = 'SubsSite';
    APIVersion = 'v2.0', 'v1.0';
    SourceTable = FBM_FinAttributes;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = All;
                }
                field(Rectype; Rec.Rectype)
                {
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Segment; Rec.Segment)
                {
                    ApplicationArea = All;
                }
                field(Share; Rec.Share)
                {
                    ApplicationArea = All;
                }
                field(low; Rec.low)
                {
                    ApplicationArea = All;
                }
                field(high; Rec.high)
                {
                    ApplicationArea = All;
                }
                field(FranchiseTax; Rec.FranchiseTax)
                {
                    ApplicationArea = All;
                }
                field(WTHTax; Rec.WTHTax)
                {
                    ApplicationArea = All;
                }
                // field(Royalty; Rec.Royalty)
                // {
                //     ApplicationArea = All;
                // }
                field(InvInt; Rec.InvInt)
                {
                    ApplicationArea = All;
                }
                field(InvExt; Rec.InvExt)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}