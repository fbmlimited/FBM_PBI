query 61113 FBM_CustOp_PBI
{
    QueryType = API;
    Caption = 'CustOp';
    APIPublisher = 'FBMGroup';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'CustOp';
    EntitySetName = 'CustOp';
    TopNumberOfRows = 1;
    OrderBy = ascending(GroupCode);

    elements
    {
        dataitem(FBM_Customer; FBM_Customer)
        {
            column(GroupCode; "No.") { }
            column(Name; Name) { }
            column(Address; Address) { }
            column(Address_2; "Address 2") { }
            column(City; City) { }
            column(Post_Code; "Post Code") { }
            column(County; County) { }
            column(Country_Region_Code; "Country/Region Code") { }
            column(FBM_Group; FBM_Group) { }
            column(FBM_SubGroup; FBM_SubGroup) { }
            column(Valid_From; "Valid From") { }
            column(Valid_To; "Valid To") { }
            column(Record_Owner; "Record Owner") { }
            column(Change_Note; "Change Note") { }
            column(SystemModifiedAt; SystemModifiedAt) { }

        }
    }
}