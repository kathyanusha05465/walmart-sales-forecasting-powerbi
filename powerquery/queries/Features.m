let
    Source = Csv.Document(
        Web.Contents("https://raw.githubusercontent.com/kathyanusha05465/walmart-sales-forecasting-powerbi/refs/heads/main/Data/features.csv"),
        [Delimiter=",", Columns=12, Encoding=65001, QuoteStyle=QuoteStyle.None]
    ),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",
        {{"Store", Int64.Type}, {"Date", type date}, {"Temperature", type number}, {"Fuel_Price", type number},
         {"MarkDown1", type text}, {"MarkDown2", type text}, {"MarkDown3", type text}, {"MarkDown4", type text}, {"MarkDown5", type text},
         {"CPI", type text}, {"Unemployment", type text}, {"IsHoliday", type logical}}),
    #"Replaced Value"  = Table.ReplaceValue(#"Changed Type","NA", null, Replacer.ReplaceValue, {"MarkDown1"}),
    #"Replaced Value1" = Table.ReplaceValue(#"Replaced Value","NA", null, Replacer.ReplaceValue, {"MarkDown2"}),
    #"Replaced Value2" = Table.ReplaceValue(#"Replaced Value1","NA", null, Replacer.ReplaceValue, {"MarkDown3"}),
    #"Replaced Value3" = Table.ReplaceValue(#"Replaced Value2","NA", null, Replacer.ReplaceValue, {"MarkDown4"}),
    #"Replaced Value4" = Table.ReplaceValue(#"Replaced Value3","NA", null, Replacer.ReplaceValue, {"MarkDown5"}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Replaced Value4",
        {{"MarkDown1", type number}, {"MarkDown2", type number}, {"MarkDown3", type number}, {"MarkDown4", type number}, {"MarkDown5", type number}}),

    // NEW: ensure numeric types for KPI columns
    #"Typed KPI Columns" = Table.TransformColumnTypes(#"Changed Type1",
        {{"CPI", type number}, {"Unemployment", type number}})
in
    #"Typed KPI Columns"
