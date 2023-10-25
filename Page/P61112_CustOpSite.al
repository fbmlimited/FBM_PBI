page 61112 FBM_CustOpSite_PBI
{
    PageType = API;
    Caption = 'CustOpSite';
    APIPublisher = 'FBMGroup';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'CustOpSite';
    EntitySetName = 'CustOpSite';
    SourceTable = FBM_CustOpSite;
    DelayedInsert = true;
    InsertAllowed = false;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Subsidiary; rec.Subsidiary)
                {
                    ApplicationArea = all;
                }


                field(Site_Loc_Code; rec."Site Loc Code")
                {
                    ApplicationArea = all;
                }
                field(Site_GR_Code; Rec."Site Code")
                {
                    ApplicationArea = all;
                }
                field(Site_Name; SiteName)
                {
                    ApplicationArea = all;
                }
                field(GroupCodeCu; rec."Customer No.")
                {
                    ApplicationArea = all;
                }

                field(NameCu; CustName)
                {
                    Caption = 'Cust. Name';
                }
                field(Cust_Loc_Code; rec."Cust Loc Code")
                {
                    ApplicationArea = all;
                }
                field(GroupCodeOp; rec."Operator No.")
                {
                    ApplicationArea = all;
                }
                field(NameOp; opName)
                {
                    ApplicationArea = all;
                }
                field(Op_Loc_Code; rec."Op Loc Code")
                {
                    ApplicationArea = all;
                }
                field(StatusF; rec.Status)
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status.AsInteger())
                {
                    ApplicationArea = all;
                }
                field(Valid_From; rec."Valid From")
                {
                    ApplicationArea = all;
                }
                field(Valid_To; rec."Valid To")
                {
                    ApplicationArea = all;
                }
                field(IsActive; rec.IsActive)
                {
                    ApplicationArea = all;

                }
                field(SystemModifiedAt; rec.FBM_Sma)
                {
                    ApplicationArea = all;
                }
                field(SystemCreatedAt; rec.FBM_Sca)
                {
                    ApplicationArea = all;
                }

            }
        }
    }
    trigger
    OnAfterGetCurrRecord()
    begin
        site.SetRange("Site Code", rec."Site Code");
        site.Setrange(ActiveRec, true);
        if site.FindFirst() then
            if site2.get(rec."Site Code", site.Version, true) then
                SiteName := site2."Site Name";
        customer.SetRange("No.", rec."Customer No.");
        customer.Setrange(ActiveRec, true);
        if customer.FindFirst() then
            if customer2.get(rec."Customer No.", customer.Version, true) then
                CustName := customer2.Name;
        operator.SetRange("No.", rec."Operator No.");
        operator.Setrange(ActiveRec, true);
        if operator.FindFirst() then
            if operator2.get(rec."Operator No.", operator.Version, true) then
                opName := operator2.Name;

    end;

    var
        SiteName: text[100];
        site: record FBM_Site;
        site2: record FBM_Site;
        CustName: text[100];
        customer: record FBM_Customer;
        customer2: record FBM_Customer;
        opName: text[100];
        operator: record FBM_Customer;
        operator2: record FBM_Customer;

}