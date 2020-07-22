
# Security baseline on Azure hands-on lab step-by-step

## Abstract and learning objectives

In this hands-on lab, you will implement many of the Azure Security Center features to secure their cloud-based Azure infrastructure (IaaS) and applications (PaaS). Specifically, you will ensure that any internet exposed resources have been properly secured and any non-required internet access disabled. Additionally, you will implement a “jump machine” for administrators with Application Security enabled to prevent those same administrators from installing non-approved software and potentially exposing cloud resources. You will then utilize custom alerts to monitor for TCP/IP Port Scans to fire alerts.

At the end of this hands-on lab, you will be better able to design and build secure cloud-based architectures, and to improve the security of existing applications hosted within Azure.

## Overview

Contoso is a multinational corporation, headquartered in the United States that provides insurance solutions worldwide. Its products include accident and health insurance, life insurance, travel, home, and auto coverage. Contoso manages data collection services by sending mobile agents directly to the insured to gather information as part of the data collection process for claims from an insured individual. These mobile agents are based all over the world and are residents of the region in which they work. Mobile agents are managed remotely, and each regional corporate office has a support staff responsible for scheduling their time based on requests that arrive to the system.

They are migrating many of their applications via Lift and Shift to Azure and would like to ensure that they can implement the same type of security controls and mechanisms they currently have. They would like to be able to demonstrate their ability to meet compliance guidelines required in the various countries/regions they do business. They have already migrated a web application and database server to their Azure instance and would like to enable various logging and security best practices for administrator logins, SQL Databases, and virtual network design.

## Solution architecture

Contoso administrators recently learned about the Azure Security Center and have decided to implement many of its features to secure their cloud-based Azure infrastructure (IaaS) and applications (PaaS). Specifically, they want to ensure that any internet exposed resources have been property secured and any non-required internet access disabled. They also decided that implementing a "jump machine" for admins with Application Security was also important as they have had instances of admins installing non-approved software on their machines and then accessing cloud resources. Additionally, they want the ability to be alerted when TCP/IP Port Scans are detected, and fire alerts based on those attacks.

![This diagram shows external access to Azure resources where Just In Time is utilize to lock down the Jump Machine. Azure Log Analytics with Azure Sentinel is then used to monitor the deny events on the network security groups.](images/Hands-onlabstep-bystep-Azuresecurityprivacyandcomplianceimages/media/image2.png)

The solution begins by creating a jump machine. This jump machine is used to access the virtual machines and other resources in the resource group. All other access is disabled via multiple **virtual networks**. More than one virtual network is required as having a single **virtual network** would cause all resource to be accessible based on the default currently un-customizable security group rules. Resources are organized into these virtual networks. **Azure Center Security** is utilized to do **Just-In-Time** access to the jump machine. This ensures that all access is audited to the jump machine and that only authorized IP-addressed are allowed access, this prevents random attacks on the virtual machines from bad internet actors. Additionally, applications are not allowed to be installed on the jump machine to ensure that malware never becomes an issue. Each of the virtual network and corresponding **network security groups** have logging enabled to record deny events to **Azure Logging**. These events are then monitored by a **custom alert rule** in **Azure Sentinel** to fire **custom alerts**. Once the solution is in place, the **Compliance Manager** tool is utilized to ensure that all GDPR based technical and business controls are implemented and maintained to ensure GDPR compliance.

## Requirements

1. Microsoft Azure subscription must be pay-as-you-go or MSDN.

    - Trial subscriptions will not work.

2. A machine with the following software installed:

    - Visual Studio 2019
    - SQL Management Studio
    - Power BI Desktop
