USE nyc_taxi_discovery
-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'trip_data_green_parquet/year=2020/month=01/',
        FORMAT = 'PARQUET',
        DATA_SOURCE = 'nyc_taxi_data_raw'
    ) AS [result]

EXEC sp_describe_first_result_set N'
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK ''trip_data_green_parquet/year=2020/month=01/'',
        FORMAT = ''PARQUET'',
        DATA_SOURCE = ''nyc_taxi_data_raw''
    ) AS [result]'

-- Define Columns and data types
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'trip_data_green_parquet/year=2020/month=01/',
        FORMAT = 'PARQUET',
        DATA_SOURCE = 'nyc_taxi_data_raw'
    )  
    WITH (
      VendorID INT,
        lpep_pickup_datetime datetime2(7),
        lpep_dropoff_datetime datetime2(7),
        store_and_fwd_flag CHAR(1),
        RatecodeID INT,
        PULocationID INT,
        DOLocationID INT,
        passenger_count INT,
        trip_distance FLOAT,
        fare_amount FLOAT,
        extra FLOAT,
        mta_tax FLOAT,
        tip_amount FLOAT,
        tolls_amount FLOAT,
        ehail_fee INT,
        improvement_surcharge FLOAT,
        total_amount FLOAT,
        payment_type INT,
        trip_type INT,
        congestion_surcharge FLOAT
  ) AS [result]


SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'trip_data_green_parquet/year=2020/month=01/',
        FORMAT = 'PARQUET',
        DATA_SOURCE = 'nyc_taxi_data_raw'
    )  
    WITH (
      
        tip_amount FLOAT,
        trip_type INT
  ) AS [result]


  -- query from folders using wildcard characters

SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'trip_data_green_parquet/year=*/month=*/',
        FORMAT = 'PARQUET',
        DATA_SOURCE = 'nyc_taxi_data_raw'
    ) AS [result]

-- use filname function
SELECT
    result.filename() AS file_name,
    COUNT (1) AS record_count

FROM
    OPENROWSET(
        BULK 'trip_data_green_parquet/year=*/month=*/',
        FORMAT = 'PARQUET',
        DATA_SOURCE = 'nyc_taxi_data_raw'
    ) AS [result]
GROUP BY result.filename()
ORDER BY result.filename();


-- query from subfolders
SELECT
    result.filepath() AS file_path,
    result.*

FROM
    OPENROWSET(
        BULK 'trip_data_green_parquet/**',
        FORMAT = 'PARQUET',
        DATA_SOURCE = 'nyc_taxi_data_raw'
    ) AS [result]

--use filepath to target partitions

SELECT
    result.filepath(1) AS year,
    result.filepath(2) AS month,
    COUNT(1) AS record_count

FROM
    OPENROWSET(
        BULK 'trip_data_green_parquet/year=*/month=*/*.parquet',
        FORMAT = 'PARQUET',
        DATA_SOURCE = 'nyc_taxi_data_raw'
    ) AS result
WHERE result.filepath(1)='2020'
AND result.filepath(2) IN ('06','07','08')
GROUP BY result.filepath(1), result.filepath(2)
ORDER BY result.filepath(1),result.filepath(2)
