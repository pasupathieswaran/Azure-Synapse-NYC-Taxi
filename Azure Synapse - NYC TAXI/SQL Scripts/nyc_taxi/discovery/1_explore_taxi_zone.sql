-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://synapsecoursedlj.dfs.core.windows.net/nyc-taxi-data/raw/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0'
    ) AS [result]

SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@synapsecoursedlj.dfs.core.windows.net/raw/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n'
    ) AS [result]

--examine data types for columns
EXEC sp_describe_first_result_set N'SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK ''abfss://nyc-taxi-data@synapsecoursedlj.dfs.core.windows.net/raw/taxi_zone.csv'',
        FORMAT = ''CSV'',
        PARSER_VERSION = ''2.0'',
        HEADER_ROW = TRUE
    ) AS [result]'


SELECT
    MAX(LEN(LocationID)) AS len_LocationId,
    MAX(LEN(Borough)) AS len_Borough,
    MAX(LEN(Zone)) AS len_Zone,
    MAX(LEN(service_zone)) AS len_service_zone
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@synapsecoursedlj.dfs.core.windows.net/raw/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n'
    ) AS [result]

-- use WITH Clause to provide explicit data types

SELECT
    *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@synapsecoursedlj.dfs.core.windows.net/raw/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n'
    )
    WITH (
        LocationID SMALLINT,
        Borough VARCHAR(15),
        Zone VARCHAR(50),
        service_zone VARCHAR(15)
    ) AS [result]

EXEC sp_describe_first_result_set N'SELECT
    *
FROM
    OPENROWSET(
        BULK ''abfss://nyc-taxi-data@synapsecoursedlj.dfs.core.windows.net/raw/taxi_zone.csv'',
        FORMAT = ''CSV'',
        PARSER_VERSION = ''2.0'',
        HEADER_ROW = TRUE,
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n''
    )
    WITH (
        LocationID SMALLINT,
        Borough VARCHAR(15),
        Zone VARCHAR(50),
        service_zone VARCHAR(15)
    ) AS [result]'

SELECT name, collation_name FROM sys.databases;

-- specify UTF-8 collation for VARCHAR columns
SELECT
    *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@synapsecoursedlj.dfs.core.windows.net/raw/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n'
    )
    WITH (
        LocationID SMALLINT,
        Borough VARCHAR(15) COLLATE Latin1_General_100_CI_AI_SC_UTF8,
        Zone VARCHAR(50) COLLATE Latin1_General_100_CI_AI_SC_UTF8,
        service_zone VARCHAR(15) COLLATE Latin1_General_100_CI_AI_SC_UTF8
    ) AS [result] 


CREATE DATABASE nyc_taxi_discovery;

USE nyc_taxi_discovery;

ALTER DATABASE nyc_taxi_discovery COLLATE Latin1_General_100_CI_AI_SC_UTF8;

-- query subset of columns

SELECT
    *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@synapsecoursedlj.dfs.core.windows.net/raw/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n'
    ) WITH (
        Borough VARCHAR(15),
        Zone VARCHAR(50)
    ) AS [result]

-- read data from a file without a header

SELECT
    *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@synapsecoursedlj.dfs.core.windows.net/raw/taxi_zone_without_header.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n'
    ) WITH (
        Zone VARCHAR(50) 3,
        Borough VARCHAR(15) 2
    ) AS [result]


-- fix column names

SELECT
    *
FROM
    OPENROWSET(
        BULK 'abfss://nyc-taxi-data@synapsecoursedlj.dfs.core.windows.net/raw/taxi_zone.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n'
    )
    WITH (
        locationID SMALLINT 1,
        borough VARCHAR(15) 2,
        zone VARCHAR(50) 3,
        service_zone VARCHAR(15) 4
    ) AS [result]

-- Create External Data Source

CREATE EXTERNAL DATA SOURCE nyc_taxi_data
WITH (
    LOCATION = 'abfss://nyc-taxi-data@synapsecoursedlj.dfs.core.windows.net/'
)

CREATE EXTERNAL DATA SOURCE nyc_taxi_data_raw
WITH (
    LOCATION = 'abfss://nyc-taxi-data@synapsecoursedlj.dfs.core.windows.net/raw'
)

SELECT
    *
FROM
    OPENROWSET(
        BULK 'raw/taxi_zone.csv',
        DATA_SOURCE = 'nyc_taxi_data',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n'
    )
    WITH (
        locationID SMALLINT 1,
        borough VARCHAR(15) 2,
        zone VARCHAR(50) 3,
        service_zone VARCHAR(15) 4
    ) AS [result]

    SELECT
    *
FROM
    OPENROWSET(
        BULK '/taxi_zone.csv',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n'
    )
    WITH (
        locationID SMALLINT 1,
        borough VARCHAR(15) 2,
        zone VARCHAR(50) 3,
        service_zone VARCHAR(15) 4
    ) AS [result]


DROP EXTERNAL DATA SOURCE nyc_taxi_data;

SELECT name, location FROM sys.external_data_sources;