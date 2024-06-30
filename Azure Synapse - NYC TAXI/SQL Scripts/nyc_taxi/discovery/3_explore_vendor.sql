USE nyc_taxi_discovery;

SELECT
    *
FROM
    OPENROWSET(
        BULK 'vendor_unquoted.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
        PARSER_VERSION = '2.0'

    ) AS vendor

-- escape char

SELECT
    *
FROM
    OPENROWSET(
        BULK 'vendor_escaped.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
        PARSER_VERSION = '2.0',
        ESCAPECHAR = '\\'

    ) AS vendor


-- fieldquote

SELECT
    *
FROM
    OPENROWSET(
        BULK 'vendor.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
        PARSER_VERSION = '2.0',
        FIELDQUOTE = '"'

    ) AS vendor