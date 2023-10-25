query 61101 FBM_BankLedgerdetail_PBI
{
    QueryType = API;
    Caption = 'BankLE';
    APIPublisher = 'FBMGroup';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'BankLE';
    EntitySetName = 'BankLE';

    elements
    {
        dataitem(BankAccountLedgerEntry; "Bank Account Ledger Entry")
        {
            column(Document_No; "Document No.")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Bank_Account_No; "Bank Account No.")
            {
            }
            column(Description; Description)
            {
            }
            dataitem(GLEntry; "G/L Entry")
            {
                DataItemLink = "Document No." = BankAccountLedgerEntry."Document No.",
"Posting Date" = BankAccountLedgerEntry."Posting Date";
                column(G_L_Account_No; "G/L Account No.")
                {
                }
                column(Sum_Amount; Amount)
                {
                    Method = Sum;
                }
            }
        }
    }
}

