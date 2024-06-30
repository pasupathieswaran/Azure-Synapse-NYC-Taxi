USE nyc_taxi_discovery;

SELECT
    *
FROM
    OPENROWSET(
        BULK 'trip_type.tsv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        FIELDTERMINATOR = '\t',
        HEADER_ROW = TRUE,
        PARSER_VERSION = '2.0'

    ) AS trip_type