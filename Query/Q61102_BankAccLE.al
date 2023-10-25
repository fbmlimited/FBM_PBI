query 61102 FBM_BankAccLE_PBI
{
    QueryType = API;
    Caption = 'BankAccLE';
    APIPublisher = 'FBMGroup';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'BankAccLE';
    EntitySetName = 'BankAccLE';

    elements
    {
        dataitem(QueryElement1; "Bank Account Ledger Entry")
        {
            column(Bank_Account_No; "Bank Account No.")
            {
            }
            column(Transaction_No; "Transaction No.")
            {
            }
            column(External_Document_No; "External Document No.")
            {
            }
            column(Dimension_Set_ID; "Dimension Set ID")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Document_Type; "Document Type")
            {
            }
            column(Document_No; "Document No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Currency_Code; "Currency Code")
            {
            }
            column(Amount; Amount)
            {
            }
            column(Amount_LCY; "Amount (LCY)")
            {
            }
            column(User_ID; "User ID")
            {
            }
            column(Reversed; Reversed)
            { }
        }
    }
}

