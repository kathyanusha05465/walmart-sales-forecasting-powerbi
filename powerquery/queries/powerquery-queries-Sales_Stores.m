let
    Source = Table.NestedJoin(Sales, {"Store"}, Stores, {"Store"}, "Stores", JoinKind.LeftOuter),
    #"Expanded Stores" = Table.ExpandTableColumn(Source, "Stores", {"Type", "Size"}, {"Stores.Type", "Stores.Size"})
in
    #"Expanded Stores"