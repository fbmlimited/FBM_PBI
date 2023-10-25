query 61103 FBM_CurrExchRate_PBI
{
    QueryType = API;
    Caption = 'CurrExchRate';
    APIPublisher = 'FBMGroup';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'CurrExchRate';
    EntitySetName = 'CurrExchRate';

    elements
    {
        dataitem(QueryElement1; "Currency Exchange Rate")
        {
            column(Starting_Date; "Starting Date")
            {
            }
            column(Currency_Code; "Currency Code")
            {
            }
            column(Exchange_Rate_Amount; "Exchange Rate Amount")
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
        }
    }
}

