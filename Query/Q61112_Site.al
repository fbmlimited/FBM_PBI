query 61112 FBM_Site_PBI
{
    QueryType = API;
    Caption = 'Site';
    APIPublisher = 'FBMGroup';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'Site';
    EntitySetName = 'Site';

    elements
    {

        dataitem(FBM_Site; FBM_Site)
        {
            column(Site_Code; "Site Code")
            {

            }
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

            column(Vat_Number; "Vat Number")
            {

            }
            // column(Contract_Code; "Contract Code")
            // {

            // }
            // column(Status; Status)
            // {


            // }


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
            column(SystemModifiedAt; SystemModifiedAt)
            {

            }


        }
    }
}