query 61111 FBM_CustOpSite_PBI
{
    QueryType = API;
    Caption = 'CustOpSite';
    APIPublisher = 'FBMGroup';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'CustOpSite';
    EntitySetName = 'CustOpSite';


    elements
    {


        dataitem(FBM_CustOpSite; FBM_CustOpSite)
        {
            column(Subsidiary; Subsidiary)
            {

            }
            column(Site_Loc_Code; "Site Loc Code")
            {

            }
            column(Cust_Loc_Code; "Cust Loc Code")
            {

            }
            column(Op_Loc_Code; "Op Loc Code")
            {

            }
            column(Status; Status)
            {

            }
            column(Valid_From; "Valid From")
            {

            }
            column(Valid_To; "Valid To")
            {

            }
            column(IsActive; IsActive)
            {


            }
            column(SystemModifiedAt; FBM_Sma)
            {

            }
            column(SystemCreatedAt; FBM_Sca)
            {

            }

            dataitem(Customer; FBM_Customer)
            {
                DataItemLink = "No." = FBM_CustOpSite."Customer No.";
                column(GroupCodeCu; "No.")
                {
                    Caption = 'Cust. Group Code';
                }

                column(NameCu; Name)
                {
                    Caption = 'Cust. Name';
                }
                dataitem(FBM_Operator; FBM_Customer)
                {
                    DataItemLink = "No." = FBM_CustOpSite."Operator No.";
                    column(GroupCodeOp; "No.")
                    {
                        Caption = 'Operator Group Code';
                    }
                    column(NameOp; Name)
                    {
                        Caption = 'Operator Name';
                    }


                    dataitem(FBM_Site; FBM_Site)
                    {
                        DataItemLink = "Site Code" = FBM_CustOpSite."Site Code";
                        DataItemTableFilter = ActiveRec = const(true);
                        column(Site_GR_Code; "Site Code")
                        {

                        }
                        column(Site_Name; "Site Name")
                        {

                        }

                    }



                }
            }
        }

    }


}