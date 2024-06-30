# Azure-Synapse-NYC-Taxi
### Cloud Data Platform for New York City Taxi Data Analysis and Reporting
This project involves building a robust Cloud Data Platform using Azure Synapse Analytics to handle the reporting and analysis of New York City Taxi data. The platform is designed to streamline data processing, ensure efficient data storage, and facilitate insightful reporting.

##### Key Components and Workflow:
##### Data Ingestion and Discovery (Bronze Layer):

* Utilize the Openrowset function provided by the Serverless SQL Pool in Azure Synapse for initial data discovery.
* This function allows for querying and analyzing raw data stored in the data lake without the need for prior data movement or transformation, enabling quick insights and understanding of the dataset.
##### Data Processing and Transformation (Silver Layer):

* The raw data is processed using Serverless SQL Pool, where necessary data transformations are applied.
* During this stage, the data is cleansed, validated, and structured according to the required schema.
* The processed data is then ingested into the Silver layer, stored in the efficient columnar Parquet format, ensuring optimized storage and query performance.
##### Data Aggregation and Business Logic Application:

* Perform the necessary data aggregations and calculations to meet specific business requirements.
* These aggregations help in summarizing the data and deriving key insights that are crucial for business decision-making.
##### Reporting and Visualization (Gold Layer):

* Integrate Power BI within Synapse Studio to create interactive and insightful reports.
* Power BI connects directly to the Gold layer, where the refined and aggregated data is stored, facilitating real-time reporting and visualization.
* These reports provide stakeholders with actionable insights, enabling data-driven decision-making.
![Taxi Demand Analysis](https://github.com/pasupathieswaran/Azure-Synapse-NYC-Taxi/assets/54660910/db6ea979-0738-4367-879a-961cbcebd813)
![Card Payment Campaign Analysis](https://github.com/pasupathieswaran/Azure-Synapse-NYC-Taxi/assets/54660910/8217cdb7-0a78-4605-a3eb-3262ae30ddd9)

##### Benefits and Outcomes:
* *Scalability*: The use of Azure Synapse ensures that the platform can scale seamlessly with the growing volume of NYC Taxi data.
* *Performance*: Storing data in the Parquet format and using Serverless SQL Pool enhances query performance and reduces latency.
* *Cost-Effectiveness*: Serverless architecture allows for cost savings by only charging for the compute resources used during query execution.
* *Ease of Use*: Integration with Power BI within Synapse Studio simplifies the reporting process, making it accessible to business users without deep technical expertise.

This Cloud Data Platform provides a comprehensive solution for managing, analyzing, and reporting on New York City Taxi data, leveraging the full power of Azure Synapse Analytics and Power BI.
