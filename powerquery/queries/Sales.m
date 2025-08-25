let
    Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/kathyanusha05465/walmart-sales-forecasting-powerbi/refs/heads/main/Data/train.csv"),[Delimiter=",", Columns=5, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Store", Int64.Type}, {"Dept", Int64.Type}, {"Date", type date}, {"Weekly_Sales", type number}, {"IsHoliday", type logical}})
in
    #"Changed Type"