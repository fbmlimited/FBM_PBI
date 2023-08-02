page 61109 FBM_BufferWS_PBI
{
    Caption = 'BufferWS';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = FBM_WSBuffer;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = All;
                }
                field(WS; Rec.WS)
                {
                    ApplicationArea = All;
                }
                field(DateTrans; Rec.DateTrans)
                {
                    ApplicationArea = All;
                }
                field(TimeTrans; Rec.TimeTrans)
                {
                    ApplicationArea = All;
                }
                field(BatchNo; Rec.BatchNo)
                {
                    ApplicationArea = All;
                }
                field(F01; Rec.F01)
                {
                    ApplicationArea = All;
                }
                field(F02; Rec.F02)
                {
                    ApplicationArea = All;
                }
                field(F03; Rec.F03)
                {
                    ApplicationArea = All;
                }

                field(F04; Rec.F04)
                {
                    ApplicationArea = All;
                }
                field(F05; Rec.F05)
                {
                    ApplicationArea = All;
                }
                field(F06; Rec.F06)
                {
                    ApplicationArea = All;
                }

                field(F07; Rec.F07)
                {
                    ApplicationArea = All;
                }
                field(F08; Rec.F08)
                {
                    ApplicationArea = All;
                }
                field(F09; Rec.F09)
                {
                    ApplicationArea = All;
                }
                field(F10; Rec.F10)
                {
                    ApplicationArea = All;
                }
                field(F11; Rec.F11)
                {
                    ApplicationArea = All;
                }
                field(F12; Rec.F12)
                {
                    ApplicationArea = All;
                }
                field(F13; Rec.F13)
                {
                    ApplicationArea = All;
                }
                field(F14; Rec.F14)
                {
                    ApplicationArea = All;
                }
                field(F15; Rec.F15)
                {
                    ApplicationArea = All;
                }
                field(F16; Rec.F16)
                {
                    ApplicationArea = All;
                }
                field(F17; Rec.F17)
                {
                    ApplicationArea = All;
                }
                field(F18; Rec.F18)
                {
                    ApplicationArea = All;
                }
                field(F19; Rec.F19)
                {
                    ApplicationArea = All;
                }
                field(F20; Rec.F20)
                {
                    ApplicationArea = All;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}