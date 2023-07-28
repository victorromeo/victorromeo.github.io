---
layout: post
title: "Cloud Providers"
date: 2020-01-02
tags: cloud aws azure gcs
image: https://images.unsplash.com/photo-1569428034239-f9565e32e224?ixlib=rb-1.2.1
thumb: https://images.unsplash.com/photo-1569428034239-f9565e32e224?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@dianamia
type: article
---

Cloud providers AWS, Azure and Google Cloud Services all seem to offer similar functionality.  The differences however are typically found when implementation commences.

<style>
table {
  border-collapse: collapse;
}

table, th, td {
  border: 1px solid lightgray;
}

th, td {
  padding: 15px;
  text-align: left;
}

tr:hover {
  background-color: #f5f5f5;
}
</style>

## Overview

Summary of the equivalent services provided by three major cloud service providers: Google Cloud Services, Amazon Web Services (AWS), and Microsoft Azure. Please note that offerings and services may have changed or expanded since then, so it's always best to refer to their official websites for the most up-to-date information.

Compute Services:

Google Cloud Services: Compute Engine (Virtual Machines), Kubernetes Engine (Managed Kubernetes), App Engine (Platform-as-a-Service), Cloud Functions (Serverless computing).
AWS: Amazon EC2 (Elastic Compute Cloud), Amazon EKS (Elastic Kubernetes Service), AWS Elastic Beanstalk (Platform-as-a-Service), AWS Lambda (Serverless computing).
Azure: Azure Virtual Machines, Azure Kubernetes Service (AKS), Azure App Service (Platform-as-a-Service), Azure Functions (Serverless computing).

Storage Services:

Google Cloud Services: Cloud Storage, Persistent Disk (Block storage), Cloud Filestore (Managed file storage), Cloud Storage Nearline/Coldline (Archival storage).
AWS: Amazon S3 (Simple Storage Service), Amazon EBS (Elastic Block Store), Amazon EFS (Elastic File System), Amazon Glacier (Archival storage).
Azure: Azure Blob Storage, Azure Managed Disks, Azure Files, Azure Archive Storage.

Database Services:

Google Cloud Services: Cloud SQL (Managed MySQL, PostgreSQL, and SQL Server), Cloud Firestore (NoSQL), Cloud Spanner (Horizontally-scalable relational database), Bigtable (NoSQL Big Data).
AWS: Amazon RDS (Relational Database Service), Amazon DynamoDB (NoSQL), Amazon Redshift (Data warehouse), Amazon Neptune (Graph database).
Azure: Azure SQL Database, Azure Cosmos DB (NoSQL), Azure Database for PostgreSQL/MySQL/MariaDB, Azure Synapse Analytics (Data warehouse).

Networking Services:

Google Cloud Services: Virtual Private Cloud (VPC), Cloud Load Balancing, Cloud CDN (Content Delivery Network), Cloud DNS (Domain Name System).
AWS: Amazon VPC, Elastic Load Balancing, Amazon CloudFront (Content Delivery Network), Amazon Route 53 (Domain Name System).
Azure: Azure Virtual Network (VNet), Azure Load Balancer, Azure Content Delivery Network, Azure DNS.

AI and Machine Learning Services:

Google Cloud Services: AI Platform, Cloud Machine Learning Engine, Vision AI, Natural Language API, Translation API, AutoML, etc.
AWS: Amazon SageMaker, AWS AI/ML Services, Rekognition (Image and Video analysis), Polly (Text-to-Speech), Lex (Chatbots), etc.
Azure: Azure Machine Learning, Azure Cognitive Services, Computer Vision, Speech Services, Language Understanding (LUIS), etc.

Identity and Access Management (IAM):

Google Cloud Services: Identity Platform, Cloud IAM.
AWS: AWS Identity and Access Management (IAM).
Azure: Azure Active Directory, Azure RBAC.

Analytics and Big Data:

Google Cloud Services: BigQuery (Data warehousing and analytics), Dataflow (Real-time data processing), Dataproc (Managed Hadoop/Spark), Pub/Sub (Messaging).
AWS: Amazon EMR (Managed Hadoop/Spark), Amazon Redshift (Data warehouse), Amazon Kinesis (Real-time data streaming), Amazon SNS (Messaging).
Azure: Azure HDInsight (Managed Hadoop/Spark), Azure Data Lake Analytics, Azure Stream Analytics, Azure Event Hubs (Event streaming).

Internet of Things (IoT):

Google Cloud Services: Cloud IoT Core.
AWS: AWS IoT Core.
Azure: Azure IoT Hub.
Please be aware that the three providers also offer numerous other specialized services for specific use cases and industries. The above summary covers some of the core services provided by each platform. Always refer to the respective provider's official documentation for the latest and most comprehensive information on their services.

## Details

|                        | AWS                                                                                                                                                                    | Azure                                                                                      | GCP                                                                                        |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| **Object storage**     | Amazon Simple Storage Services (Amazon S3)                                                                                                                             | Blob Storage                                                                               | Google Cloud Storage                                                                       |
| **VM disk storage**    | Amazon Elastic Block Store (Amazon EBS)                                                                                                                                | Azure Managed Disks	Persistent Disk (both HDD and SSD)                                     | -                                                                                          |
| **File storage**       | Amazon Elastic File System (Amazon EFS)                                                                                                                                | Azure Files                                                                                | Cloud Filestore                                                                            |
| **Disaster recovery**  | Provides a set of cloud-based disaster recovery services                                                                                                               | Site Recovery (DRaaS)                                                                      | Does not provide out-of-the-box DR or backup services                                      |
| **Backup**             | Amazon S3 is often used for secondary backup storage                                                                                                                   | Backup (built into the Azure platform)                                                     | -                                                                                          |
| **Archive storage**    | - S3 One Zone-Infrequent Access <br> - Amazon Glacier, with data querying capabilities                                                                                 | Azure Long-Term Storage - Cool Blob Storage <br>  - Archive Storage (offline blob storage) | Archival Cloud Storage: <br> - Nearline (low frequency) <br> - Coldline (lowest frequency) |
| **Bulk data transfer** | - AWS Import/Export Disk: Shipping disk drives <br> - AWS Snowball (device-based) <br> - AWS SnowMobile: Exabyte-scale data transfer via ruggedized shipping container | Azure Import/Export service - Shipping disk drives <br> - Azure Data Box Disk service      | Storage Transfer Service                                                                   |
| **Hybrid support**     | AWS Storage Gateway: Provides a managed virtual tape infrastructure across hybrid environments                                                                         | StorSimple: Enterprise-grade hybrid cloud storage                                          | Relies on partners such as Egnyte                                                          |

## Summary of Services

<style>
img {
    max-width: 32px;
}

table {
    width: 100%;
}

</style>

### Compute

#### AWS 

|                                                                                         | Service Name      | Full Service Name                 |
| --------------------------------------------------------------------------------------- | ----------------- | --------------------------------- |
| ![](/images/icons/AWS-icons/PNG_Light/Compute/Amazon-EC2@4x.png)                        | EC2               | Amazon Elastic Compute Cloud      |
| ![](/images/icons/AWS-icons/PNG_Light/Compute/Amazon-Elastic-Container-Service@4x.png)  | ECS               | Amazon Elastic Container Service  |
| ![](/images/icons/AWS-icons/PNG_Light/Compute/Amazon-Elastic-Kubernetes-Service@4x.png) | EKS               | Amazon Elastic Kubernetes Service |
| ![](/images/icons/AWS-icons/PNG_Light/Compute/Amazon-Lightsail@4x.png)                  | Lightsail         | Amazon Lightsail                  |
| ![](/images/icons/AWS-icons/PNG_Light/Compute/AWS-Batch@4x.png)                         | Batch             | AWS Batch                         |
| ![](/images/icons/AWS-icons/PNG_Light/Compute/AWS-Elastic-Beanstalk@4x.png)             | Elastic Beanstalk | AWS Elastic Beanstalk             |
| ![](/images/icons/AWS-icons/PNG_Light/Compute/AWS-Fargate@4x.png)                       | Fargate           | AWS Fargate                       |
| ![](/images/icons/AWS-icons/PNG_Light/Compute/AWS-Lambda@4x.png)                        | Lambda            | AWS Lambda                        |
| ![](/images/icons/AWS-icons/PNG_Light/Compute/AWS-Outposts@4x.png)                      | Outpost           | AWS Outpost                       |

#### GCP

|                                                                                | Service Name    | Full Service Name      |
| ------------------------------------------------------------------------------ | --------------- | ---------------------- |
| ![](/images/icons/GCP-icons/Products_and_services/Compute/App_Engine.svg)      | App Engine      | Google App Engine      |
| ![](/images/icons/GCP-icons/Products_and_services/Compute/Cloud_Functions.svg) | Cloud Functions | Google Cloud Functions |
| ![](/images/icons/GCP-icons/Products_and_services/Compute/Cloud_Run.svg)       | Cloud Run       | Google Cloud Run       |
| ![](/images/icons/GCP-icons/Products_and_services/Compute/Compute_Engine.svg)  | Compute Engine  | Google Compute Engine  |


### Networking, Routing, Load Balancing

#### AWS

|                                                                                                    | Service Name | Full Service Name             |
| -------------------------------------------------------------------------------------------------- | ------------ | ----------------------------- |
| ![](/images/icons/AWS-icons/PNG_Light/Networking___Content_Delivery/Amazon-API-Gateway@4x.png)     | API Gateway  | Amazon API Gateway            |
| ![](/images/icons/AWS-icons/PNG_Light/Networking___Content_Delivery/Amazon-CloudFront@4x.png)      | CloudFront   | Amazon CloudFront             |
| ![](/images/icons/AWS-icons/PNG_Light/Networking___Content_Delivery/Amazon-Route-53@4x.png)        | Route 53     | Amazon Route 53               |
| ![](/images/icons/AWS-icons/PNG_Light/Networking___Content_Delivery/Amazon-VPC@4x.png)             | VPC          | Amazon Virtual Private Cloud  |
| ![](/images/icons/AWS-icons/PNG_Light/Networking___Content_Delivery/Elastic-Load-Balancing@4x.png) | ELB          | Amazon Elastic Load Balancing |

#### GCP

|                                                                                               | Service Name           | Full Service Name                  |
| --------------------------------------------------------------------------------------------- | ---------------------- | ---------------------------------- |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Cloud_Armor.svg)                 | Cloud Armour           | Google Cloud Armour                |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Cloud_CDN.svg)                   | CDN                    | Google Content Delivery Network    |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Cloud_External_IP_Addresses.svg) | External IP            | Google External IP Addresses       |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Cloud_Firewall_Rules.svg)        | Firewall               | Google Firewall Rules              |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Cloud_Load_Balancing.svg)        | Load Balancing         | Google Load Balancing              |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Cloud_NAT.svg)                   | NAT                    | Google Network Address Translation |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Cloud_Network.svg)               | Network                | Google Network                     |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Cloud_Router.svg)                | Router                 | Google Router                      |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Cloud_Routes.svg)                | Routes                 | Google Routes                      |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Cloud_VPN.svg)                   | VPN                    | Google Virtual Private Network     |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Dedicated_Interconnect.svg)      | Dedicated Interconnect | Google Dedicated Interconnect      |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Standard_Network_Tier.svg)       | Standard Network Tier  | Google Standard Network Tier       |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Premium_Network_Tier.svg)        | Premium Network Tier   | Google Premium Network Tier        |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Traffic_Director.svg)            | Traffic Director       | Google Traffic Director            |
| ![](/images/icons/GCP-icons/Products_and_services/Networking/Virtual_Private_Cloud.svg)       | VPC                    | Google Virtual Private Cloud       |


### Database 

### AWS

|                                                                                                     | Service Name            | Full Service Name                            |
| --------------------------------------------------------------------------------------------------- | ----------------------- | -------------------------------------------- |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-Aurora@4x.png)                                | Aurora                  | Amazon Aurora                                |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-DocumentDB-with-MongoDB-compatibility@4x.png) | DocumentDB              | Amazon DocumentDB with MongoDB compatibility |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-DynamoDB@4x.png)                              | DynamoDB                | Amazon DynamoDB                              |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-ElastiCache@4x.png)                           | Elasticache             | Amazon Elasticache                           |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-ElastiCache_For-Memcached_light-bg@4x.png)    | Elasticache (Memcached) | Amazon Elasticache for Memcached             |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-ElastiCache_For-Redis_light-bg@4x.png)        | Elasticache (Redis)     | Amazon Elasticache for Redis                 |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-Neptune@4x.png)                               | Neptune                 | Amazon Neptune                               |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-Quantum-Ledger-Database_QLDB@4x.png)          | Quantum Ledger Database | Amazon Quantum Ledger Database               |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-RDS@4x.png)                                   | RDS                     | Amazon Relational Database Service           |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-RDS_MariaDB_instance_light-bg@4x.png)         | Maria                   | Amazon RDS Maria                             |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-RDS_MySQL_instance_light-bg@4x.png)           | MySQL                   | Amazon RDS MySQL                             |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-RDS_Oracle_instance_light-bg@4x.png)          | Oracle                  | Amazon RDS Oracle                            |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-RDS_PostgreSQL_instance_light-bg@4x.png)      | PostgreSQL              | Amazon RDS PostgreSQL                        |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-RDS_SQL-Server_instance_light-bg@4x.png)      | SQL Server              | Amazon RDS SQL Server                        |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-Redshift@4x.png)                              | Redshift                | Amazon Redshift                              |
| ![](/images/icons/AWS-icons/PNG_Light/Database/Amazon-Timestream@4x.png)                            | Timestream              | Amazon Timestream                            |

