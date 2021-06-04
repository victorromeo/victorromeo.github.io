---
layout: post
title: "OSI 7 Layer model"
date: 2021-06-04
tags: OSI Network standards
image: https://images.unsplash.com/photo-1586232715274-bab43b7e84fb
thumb: https://images.unsplash.com/photo-1586232715274-bab43b7e84fb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fGxheWVyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@gpthree
type: article
---

The OSI 7 Layer Model describes the responsibilities of the different layers used for standardized communication over a network

## Overview

When communicating over a network, devices need to adhere to a basic standard, so that information sent and received is controlled, timely and meaningful.

The Open System Interconnection model defines this standard, and is a easy design to enforce and extend.

The seven layers are as follows:

- Application
- Presentation
- Session
- Transport
- Network
- Data Link
- Physical

### (7) Application

The user's perspective of the OSI model, the Application layer determines what is sent, and creates what is sent, consumes and displays as needed what is received

- Resource Sharing
- Remote file access
- Remote printer access
- Directory services
- Network management

### (6) Presentation

Control of the data format and its syntax, compression and encryption is assigned to the Presentation layer

- Character set translation
- Data Conversion
- Data Compression
- Data Encryption

### (5) Session

Control of session lifetime is managed by the Session layer, and this enforces the context over which multiple messages are logically connected and interpreted

- Session support
- Session Creation
- Session Termination
- Name and credential authentication
- Logging

### (4) Transport

The Transport layer ensures that messages are delivered in order, error-free, without loss or duplication of information

  - Message Segmentation
  - Message Acknowledgement
  - Message Traffic Control
  - Session Multiplexing

Protocols which support the layer include:
- TCP (Transport Communication Protocol)
- SPX (Sequence Packet Exchange)
- UDP (User Data Protocol)

### (3) Network

The Network layer controls how data packets are routed, split up and recombined (Frame Fragmentation), as well as managing the logical to physical address mapping 

- Packets
  - Routing
  - Subnet traffic control
  - Frame fragmentation
  - Logical/Physical address mapping

Network assets which support the layer include:
- Routers

Protocols which support the layer include:
- IP
- IPX
- ICMP

### (2) Data Link

The Data Link layer establishes and terminates logical links between nodes within the network, performs Frame traffic control, Frame sequencing, Frame delimiting and Frame error control

The Data Link layer is actually made up of two layers:

- the MAC layer, which controls how a computer gains access to the data, and the permission to transmit it over a network
- the Logical Link Control layer, which controls frame synchronization, flow control and error checking

Main components include:
- Frames
  - MAC address 
  - Frame traffic control
  - Frame acknowledgement
  - Frame delimiting
  - Frame error control
  - Media access control

Devices supporting this layer include:
- Switches
- Bridges
- Wireless Access Points

### (1) Physical

Physical assets and their physical capabilities are describe the Physical layer, and determine how the data is transmitted and received as electrical impulses 

Physical assets supporting the layer include:
- Cables (Fibre optic, copper, air)
- Hubs
- Repeaters