USE nyc_taxi_discovery

SELECT TOP 100 *
FROM 
    OPENROWSET(
        BULK 'calendar.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        HEADER_ROW = TRUE,
        PARSER_VERSION = '2.0',
        FORMAT = 'CSV',
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n'
    )
    WITH (
        date_key INT,
        date DATE,
        year SMALLINT,
        month TINYINT,
        day TINYINT,
        day_name VARCHAR(10),
        day_of_year SMALLINT,
        week_of_month TINYINT,
        week_of_year TINYINT,
        month_name VARCHAR(10),
        year_month INT,
        year_week INT

    ) AS cal;

-- Examine data types for the columns

EXEC sp_describe_first_result_set N'SELECT TOP 100 *
FROM 
    OPENROWSET(
        BULK ''calendar.csv'',
        DATA_SOURCE = ''nyc_taxi_data_raw'',
        HEADER_ROW = TRUE,
        PARSER_VERSION = ''2.0'',
        FORMAT = ''CSV'',
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n''

    ) AS cal'