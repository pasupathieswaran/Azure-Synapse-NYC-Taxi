USE nyc_taxi_discovery

SELECT
    locationID,
    COUNT(1) AS number_of_records
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
GROUP BY locationID
HAVING COUNT(1) > 1

SELECT
    borough,
    COUNT(1) AS number_of_records
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
GROUP BY borough
HAVING COUNT(1) > 1

