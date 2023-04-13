/* query 61111 Site
{
    QueryType = Normal;

    elements
    {


        dataitem(FBM_CustOpSite; FBM_CustOpSite)
        {
            column(Subsidiary; Subsidiary)
            {

            }
            column(Customer_No_; "Customer No.")
            {

            }
            column(Operator_No_; "Operator No.")
            {

            }
            column(Site_Code; "Site Code")
            {

            }
            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = FBM_CustOpSite."Customer No.";
                column(No_; "No.")
                {
                    Caption = 'Cust. Company Code';
                }
                column(FBM_GrCode; FBM_GrCode)
                {
                    Caption = 'Cust. Group Code';
                }
                dataitem(FBM_Operator; FBM_Operator)
                {
                    DataItemLink = "No." = FBM_CustOpSite."Operator No.";
                    column(Name; Name)
                    {
                        Caption = 'Operator Name';
                    }

                    dataitem(FBM_Site; FBM_Site)
                    {
                        DataItemLink = "Site Code" = FBM_CustOpSite."Site Code";
                        column(Site_Name; "Site Name")
                        {

                        }
                        column(Address; Address)
                        {

                        }
                        column(Address_2; "Address 2")
                        {

                        }
                        column(City; City)
                        {

                        }
                        column(Post_Code; "Post Code")
                        {

                        }
                        column(County; County)
                        {

                        }
                        column(Country_Region_Code; "Country/Region Code")
                        {

                        }
                        column(Business_Name; "Business Name")
                        {

                        }
                        column(Vat_Number; "Vat Number")
                        {

                        }
                        column(Contract_Code; "Contract Code")
                        {

                        }
                        column(Status; Status)
                        {

                        }
                        column(Current_Status; "Current Status")
                        {

                        }
                        column(Category; Category)
                        {

                        }
                        column(Region; Region)
                        {

                        }
                        column("Area"; "Area")
                        {

                        }
                        column(Municipal; Municipal)
                        {

                        }
                        column(Cardinal_Points; "Cardinal Points")
                        {

                        }
                        column(Central_Place; "Central Place")
                        {

                        }
                        column(Group; Group)
                        {

                        }
                        column(SubGroup; SubGroup)
                        {

                        }
                        column(Anniversary; Anniversary)
                        {

                        }
                        column(Valid_From; "Valid From")
                        {

                        }
                        column(Valid_To; "Valid To")
                        {

                        }
                        column(Record_Owner; "Record Owner")
                        {

                        }
                        column(Change_Note; "Change Note")
                        {

                        }
                    }
                }
            }
        }

    }
} */