# Networking Notes

## Basic Vocab:
* AWS VPC
  * Virtual Private Cloud
  * Able to provision a logically isolated section of AWS Cloud to launch resources in a virtual network
  * Resources available include creation of subnets, configuration of route tables, and configuration of network gateways
* Subnet
* Route Table
* Network Gateways
* Security Group
* IPv4 Address
  * Breakdown each section
  * Info after IP Address (e.g. slash-0: 0.0.0.0/0)
  * IP range meanings
* IPv6 Address
* AMI
* Hardware layers
* First letter instance types in AWS
* Down to the pack what is going on in chrome
* Route 53
  * What does the 53 mean? (UPD port 53?)
* Netmask
* SSL/TLS
  
## Differences
* Public vs Private Cloud
* IPv4 vs IPv6 Address
* TCP vs UDP Ports
* x86 vs ARM Server Type
* Docker vs K8S
* VM vs container
* URL vs URI

## REST API Vocab:
* Primary verbs
  * GET - Safe, Idempotent
  * POST - Not-Safe, Not-Idempotent
  * PUT - Not-Safe, Idempotent
  * DELETE - Not-Safe, Idempotent
* Secondary verbs
  * HEAD - Safe, Idempotent
  * CONNECT - ?, ?
  * OPTIONS - Safe, Idempotent
  * TRACE - ?, ?
  * PATCH - Not-Safe, Non-Idempotent
* Common Response Codes - https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
  * 200 OK - Requested action has been completed with relevant information returned
  * 202 Accepted - Request has been received, though processing is still in progress
  * 301 Moved Permanently - All requests should be directed to new URL given in response
  * 400 Bad request - Unable to process request due to poor request by client (user).
  * 500 Internal Server Error - Unable to process request due to server-side error
  * TODO: Fill in more of the relevant response codes
  

## Python Vocab:
* List Comprehension
* Generator
* Lambda
* Yield
* @ symbol above method definition

## Python Katas:
* See all vocab
* More examples

## Advanced Security Terms:
* Yubi Keys

## Common UPD/TCP Ports
* 22 SSH - TCP? - Secure login to remote system - describe more
* 53 DNS - UDP - Set up DNS, Route53 - describe more
* 67 DHCP - UDP
* 111 RCP
* 80 HTTP
* 118 SQL
* 443 HTTPS
* 3478, 3479 Zoom Calls - UDP - Primary ports used for zoom video calls for video, audio, and screen share
