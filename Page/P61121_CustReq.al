page 61121 FBM_CustReq_PBI
{
    Caption = 'Cust Master Post WS';
    PageType = API;
    APIGroup = 'app1';
    APIPublisher = 'FBMGroup';
    EntitySetName = 'CustSitePostWS';
    EntityName = 'CustSitePostWS';
    APIVersion = 'v2.0', 'v1.0';
    UsageCategory = Lists;
    SourceTable = FBM_CustSiteReq;
    DelayedInsert = true;
    MultipleNewLines = true;
    Description = 'V015';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ReqType; Rec.ReqType)
                {
                    ApplicationArea = ALL;

                }
                field(CustSiteCode; Rec.CustSiteCode)
                {
                    ApplicationArea = ALL;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = ALL;

                }
                field(Name_2; Rec."Name 2")
                {
                    ApplicationArea = ALL;

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = ALL;

                }
                field(Address_2; Rec."Address 2")
                {
                    ApplicationArea = ALL;

                }
                field(City; Rec.City)
                {
                    ApplicationArea = ALL;

                }
                field(PostCode; Rec."Post Code")
                {
                    ApplicationArea = ALL;

                }
                field(County; Rec.County)
                {
                    ApplicationArea = ALL;

                }
                field(Country_RegionCode; Rec."Country/Region Code")
                {
                    ApplicationArea = ALL;

                }
                field(VATregistrationNo; Rec."VAT registration No.")
                {
                    ApplicationArea = ALL;

                }
                field(Group; Rec.FBM_Group)
                {
                    ApplicationArea = ALL;

                }
                field(Subgroup; Rec.FBM_Subgroup)
                {
                    ApplicationArea = ALL;

                }
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = ALL;

                }
                field(Sent; Rec.Sent)
                {
                    ApplicationArea = ALL;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = ALL;

                }
                field(Ori_EntryNo; Rec.Ori_EntryNo)
                {
                    ApplicationArea = ALL;

                }
                field(Rectype; Rec.Rectype)
                {
                    ApplicationArea = ALL;

                }
                field(companyReq; Rec.companyReq)
                {
                    ApplicationArea = ALL;

                }
            }
        }
    }
}