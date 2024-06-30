IF (NOT EXISTS(SELECT * FROM sys.credentials WHERE name = 'synapse-course-cosmos-db-j'))
    
    CREATE CREDENTIAL [synapse-course-cosmos-db-j]
    WITH IDENTITY = 'SHARED ACCESS SIGNATURE', SECRET = 'FALSE_SECRET'
GO

SELECT TOP 100 *
FROM OPENROWSET(​PROVIDER = 'CosmosDB',
                CONNECTION = 'Account=synapse-course-cosmos-db-j;Database=nyctaxidb',
                OBJECT = 'Heartbeat',
                SERVER_CREDENTIAL = 'synapse-course-cosmos-db-j'
) AS [Heartbeat]
