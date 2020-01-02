---
layout: post
title: "Design Patterns - Singleton"
date: 2019-11-15
tags: design pattern
image: https://images.unsplash.com/photo-1488257471178-5b88b55899e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9
thumb: https://images.unsplash.com/photo-1488257471178-5b88b55899e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@lastly
type: concept
---
Ensuring only a single instance of a class type exists

## Goal

A singleton is a special type of class which assists the creation of a single instance of itself, and the access to that instance in such a way as to prevent the unneccessary creation of new instances.

## Implementation

```csharp
// Non-thread safe singleton example 

public class Singleton {

    private static Singleton _instance = null;

    public static Singleton Instance {
        get {
            if (_instance == null) {
                _instance = new Singleton();
            }

            return _instance;
        }
    }
}
```

## Use

An example here is a SocketManager, which can be implemented as a Singleton to prevent the accidental duplication of sockets when created, by separate functions which need a Socket.

```csharp 
// Simple thread-safe SocketManager
public class SocketManager {

    private static SocketManager _instance = null;
    private static object _instanceLock = new object();

    public static SocketManager Instance {
        get {
            if (_instance == null) {
                lock(_instanceLock) {
                    if (_instance == null) {
                        _instance = new SocketManager();
                    }
                }
            }

            return _instance;
        }
    }

    protected SocketManager() {
        // Called once, when the singleton instance is created
        ...
    }

    public Socket CreateSocket(IPAddress address, int port) {
        ...
    }
}

public class TokenServer {
    public void Open() {
        ...
        var socket = SocketManager.Instance.CreateSocket(ipAddress, port);
        ...
    }
}

```