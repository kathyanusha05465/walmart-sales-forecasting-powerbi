let
    Source = Table.NestedJoin(Sales_Stores, {"Store", "Date"}, Features, {"Store", "Date"}, "Features", JoinKind.LeftOuter),
    #"Expanded Features" = Table.ExpandTableColumn(Source, "Features", {"Temperature", "Fuel_Price", "MarkDown1", "MarkDown2", "MarkDown3", "MarkDown4", "MarkDown5", "CPI", "Unemployment", "IsHoliday"}, {"Features.Temperature", "Features.Fuel_Price", "Features.MarkDown1", "Features.MarkDown2", "Features.MarkDown3", "Features.MarkDown4", "Features.MarkDown5", "Features.CPI", "Features.Unemployment", "Features.IsHoliday"}),
    #"Renamed Columns" = Table.RenameColumns(#"Expanded Features",{{"Features.Temperature", "Temperature"}, {"Stores.Type", "Type"}, {"Stores.Size", "Size"}, {"Features.Fuel_Price", "Fuel_Price"}, {"Features.MarkDown1", "MarkDown1"}, {"Features.MarkDown2", "MarkDown2"}, {"Features.MarkDown3", "MarkDown3"}, {"Features.MarkDown4", "MarkDown4"}, {"Features.MarkDown5", "MarkDown5"}, {"Features.Unemployment", "Unemployment"}}),
    #"Removed Columns" = Table.RemoveColumns(#"Renamed Columns",{"Features.IsHoliday"}),
    #"Renamed Columns1" = Table.RenameColumns(#"Removed Columns",{{"Type", "Store_Type"}})
in
    #"Renamed Columns1"