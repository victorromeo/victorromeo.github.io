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

