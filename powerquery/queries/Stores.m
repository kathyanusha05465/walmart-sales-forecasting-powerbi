let
    Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/kathyanusha05465/walmart-sales-forecasting-powerbi/refs/heads/main/Data/stores.csv"),[Delimiter=",", Columns=3, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Store", Int64.Type}, {"Type", type text}, {"Size", Int64.Type}}),
    #"Renamed Columns" = Table.RenameColumns(#"Changed Type",{{"Type", "Store_Type"}, {"Store", "Store"}})
in
    #"Renamed Columns"