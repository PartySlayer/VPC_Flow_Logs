!!WORK IN PROGRESS!!

*Currently I am paying attention to otherp projects and learning resources.
I will change the S3/Athena configuration for a smarter choice using Cloudwatch logs insights.
It will use a query to look up for the ip addresses with most rejected requests.
The live monitoring module has some variables issues and overall the infrastracture can be improved.

Network monitoring architecture, customizable for live alerts.
The full infrastructure is provisioned via terraform.


![Diagramma vpc flow logs](https://github.com/PartySlayer/VPC_Flow_Logs/assets/120326157/f32e8607-9047-49e2-a6bc-d80cd8accf8a)

VPC Setup:

The Virtual Private Cloud (VPC) for the network infrastructure.
Include 1 privet subnet within the VPC.

Subnet Configuration:

The subnet is created within the VPC to host an EC2 instance and an Elastic Network Interface (ENI).

Network Access Control Lists (NACLs):

NACLs are associated with subnets and act as stateless firewalls.
They control inbound and outbound traffic flow at the subnet level based on the rules discussed later on.

VPC Flow Logs:

Captures network traffic metadata within the VPC.
Logs can be sent to either S3 for analysis with Athena or CloudWatch for real-time monitoring.

Analysis and Monitoring:

If the goal is to reduce costs, would be better if Flow logs are stored in an S3 bucket for historical analysis.

If the goal is to reduce effort and make response faster, the suggested option would be sending Flow logs to CloudWatch for real-time monitoring.


In this architecture, as mentioned before, logs can take 2 paths:

First of all, VPC Flow Logs captures metadata about IP traffic within the VPC.

Logs are then directed either to S3 or CloudWatch Logs based on the configuration.

If implemented, the CloudWatch Alarms monitor flow log data and trigger SNS notifications to send an alert email (thus increasing responsiveness).

