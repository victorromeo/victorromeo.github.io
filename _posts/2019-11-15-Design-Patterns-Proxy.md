---
layout: post
title: "Design Patterns - Proxy"
date: 2019-11-15
tags: design pattern
image: https://images.unsplash.com/photo-1480732149909-d4e710a0f81c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@benwhitephotography
type: concept
---
An object which represents another object or data record, and by doing so, simplifies and abstract the application from the delegating object

## Goal

Often real world entities are complex, have significant overhead to retrieve and/or update.  The Proxy design pattern attempts to provide an alternate object which can be operated on, instead of the object with such constraints.  By performing operations on the Proxy object, unnecessary complexity is avoided. Access to the underlying object can be gained through the Proxy object, and the Proxy object may protect this access to implement security.

## Implementation

```csharp

public interface IEntity {
    void Save();
}

public class Entity : IEntity {
    public void Save() {
        ...
    }
}

public class Proxy : IEntity {
    private IEntity _entity;
    
    public void Save() {
        if (_entity != null) {
            _entity.Save();
        }
    }
}

```

## Use

An example here is a SocketManager, which can be implemented as a Singleton to prevent the accidental duplication of sockets when created, by separate functions which need a Socket.

```csharp 

public interface IImage {
    void Save();
    byte[] GetThumbnail();
    byte[] GetFullImage();
}

// Base image has no security, or caching capability
public class Image : IImage {
    private byte[] ImageBytes;

    void Save() {
        // Perform the save
    }

    byte[] GetFullImage() {
        // Get the image
        return ImageBytes; 
    }

    byte[] GetThumbnailImage() {
        // Downsize image
        return DownscaleImage(ImageBytes);
    }
}

// Secures access to the image, and caches the image to prevent unneccessary work to recreate it. 
public class ImageProxy : IImage {
    private IImage _image;
    private byte[] _thumbnailImage;

    public void Save() {
        if(CanSave()) {
            _entity.Save();
        }
    }

    byte[] GetFullImage() {
        if(_entity != null && CanView()) {
            return _entity.GetFullImage();
        }    
    }

    byte[] GetThumbnailImage() {
        if(_entity != null && CanView()) {

            if (_thumbnailImage == null) {
                _thumbnailImage = _entity.GetThumbnailImage();
            }

            return _thumbnailImage;
        } 
    }

    protected bool CanView() {
        // Validate that the user has the required permissions to view
    }

    protected bool CanSave() {
        // Validate that the user has the required permissions to save
    }
}
```