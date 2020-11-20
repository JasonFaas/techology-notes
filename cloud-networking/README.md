# Networking Notes

## Basic Vocab:
* AWS VPC
  * Virtual Private Cloud
  * Able to provision a logically isolated section of AWS Cloud to launch resources in a virtual network
  * Resources available include creation of subnets, configuration of route tables, and configuration of network gateways
* Subnet
  * Subnetting allows reduction of devices on network (see Class A - C networks) to speed up finding other devices
  * Routers utilize "subnet mask" to sort subnetworks
  * Subnet mask is like an IP address, though only for internal usage inside a network
* Route Table
* Network Gateways
* Security Group
* IPv4 Address
  * Breakdown each section
  * Number after Trailing Slash
    * Number of bits assigned to network
    * Implies network mask values
    * 8 means Class A
    * 16 means Class B
    * 24 means Class C 
  * IP range meanings
  * 4 parts of address (e.g. 202.0.112.111)
    * For a class A network
      * 202 is the network, the trailing 0.112.111 parts are the device
      * Can connect to million of devices
      * Used by ISPs and giant corporations
    * For a class B network
      * 202.0 is the network, the trailing 112.111 parts are the device
      * Can connect to fewer devices than Class A, let's say 10,000's
    * For a class C network
      * 202.0.112 is the network, the trailing 111 part is the device
      * Can connect to fewer devices than Class B, let's say 100s of devices
      * Used for tiny networks
* IPv6 Address
* AMI
* Hardware layers
* First letter instance types in AWS
* Down to the pack what is going on in chrome
* Route 53
  * What does the 53 mean? (UPD port 53?)
* Netmask
  * Binary mask to divide an IP address into subnets and specify the networks available hosts
  * Class A Networks
    * Netmask length is 8 bits
    * \# of networks is 126
    * \# of hosts is 16,000,000
    * Value is 255.0.0.0
  * Class B Networks
    * Netmask length is 16 bits
    * \# of networks is 16,000
    * \# of hosts is 65,000
    * Value is 255.255.0.0
  * Class C Networks
    * Netmask length is 24 bits
    * \# of networks is 2,000,000
    * \# of hosts is 254
    * Value is 255.255.255.0
* SSL/TLS
* Multi-Tenant
* Proxy Server
* Reverse Proxy
* TCP/IP Model
  * Functional model of data transmission originally created by DoD
    * AKA
      * Internet Model
      * DoD Model
  * Fewer layers
    * OSI 1 & 2 collapsed to Network Access Layer (OSI names are Physical Layer and Data Link Layer)
      * e.g. Ethernet, Wi-Fi, Token Ring, Frame Relay, DSL, ISDN
    * OSI 3 is same as Internet Layer (OSI name is Network Layer)
      * e.g. IPv4, IPv6, ICMP (typically for error messages)
    * OSI 4 is same as Transport Layer (same name)
      * TCP and UDP
    * OSI 5, 6, & 7 collapsed to Application layer (OSI Names are Session Layer, Presentation Layer, and Application Layer)
      * HTTP, SMTP, FTP, DNS, SSH
* OSI Model
  * Basic network model to show communication over a network
    * TCP/IP is standard is closer to reality, but OSI Model is still widely used for discussion 
  * Layers
    * 1 - Physical
      * Transmission of raw bits on the medium
      * Typically an electric cable or wireless
      * Transmits raw data in 0's and 1's
    * 2 - Data Link Layer
      * Defines the format of data on the network
      * Establishes and terminates connections between 2 physically connected devices.
      * Breaks up packets into frames and sends to destination
      * 2 main parts
        * Logic Link Controller
          * identifies network protocols
          * performs error checking
          * synchronization of frames
        * MAC (Media Access Control)
          * uses MAC addresses to connect devices and define permissions to transmit and receive data
    * 3 - Network Layer
      * Decides the physical path to take
      * Breaking up Transport Layer segments into packets, reassembling into segments when received. 
      * Also, discovers best path, typically utilizing IP address protocol
    * 4 - Transport Layer
      * Transmits data using transmission protocols including TCP and UDP
      * Breaks down data into segmented parts, especially in regards to size, and verifies data was received
    * 5 - Session Layer
      * Maintains connection and is responsible for controlling ports and sessions
      * Opens sessions, verifies sessions stay open, sets checkpoints for restarting failed transmissions
    * 6 - Presentation
      * Ensures data is in usable format. Layer where encryption and compression occurs
      * Prepares data from Application Layer for Session Layer
    * 7 - Application
      * Human-computer interaction layer. Where applications can access the network
      * e.g. HTTP, FTP, DNS, SMTP
* Messages Queuing
  * Form of asynchronous service-to-service communication used in serverless and microservice architecture
  * Messages are stored in queue until they are processed or deleted
  * Each message is processed once
  * Used to decouple heavyweight processing, buffer or batch work, and to smooth workloads
  * SQS is primary example
    * Not to be confused with SNS (more info needed, I believe this is more of a notification service that is 1 to many, like broadcast to those listening)
  
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

## Advanced Security Terms:
* Yubi Keys

## Common UPD/TCP Ports
* 22 SSH - TCP? - Secure login to remote system - describe more
* 53 DNS - UDP - Set up DNS, Route53 - describe more
* 67 DHCP - UDP
* 111 RCP
* 80 HTTP
* 443 HTTPS
* 3478, 3479 Zoom Calls - UDP - Primary ports used for zoom video calls for video, audio, and screen share
* TODO: get info from email sent for discussion


## Data Exchange Protocols
* SOAP
* JSON
* GraphQL

