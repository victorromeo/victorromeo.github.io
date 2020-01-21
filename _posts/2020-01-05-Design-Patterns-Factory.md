---
layout: post
title: "Design Patterns - Factory"
date: 2019-11-15
tags: design pattern
image: https://images.unsplash.com/photo-1567789884554-0b844b597180?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9
thumb: https://images.unsplash.com/photo-1567789884554-0b844b597180?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@lennykuhne
type: concept
---

The Factory design pattern assists the creation of an object, but defers the decision about which class to instantiate to subclasses which were built with the job of making those decisions.

<!-- markdownlint-disable MD033 -->

## Goal

There is a common problem in software, particularly complex applications where objects need to create and access instances of other types.

```csharp

UserConfigurationService service = new UserConfigurationService(argument1, argument2,...);

```

Creating applications which hard code the choice of which type to make are typically rigid, and are harder to enhance and maintain in the long term.  For this reason, this anti-pattern is considered a code smell.

The reason developers try to avoid this hard decision becomes most apparent when we decide to replace the instantiation operation with an alternative type.  In this case the new type may require completely different arguments, whilst the old class may be used extensively throughout the application in its old form.  The challenge becomes one of a round peg in a square hole.

The decision to take this approach when the application was being architectured, was not one which aided the developer.

<style>
    @mixin aggregation {
        fill: none;
        stroke-dashedarray: 4 2 4 2;
        stroke-width: 0.6;
    }
</style>

<div class="mermaid">
    classDiagram
        Product <|-- ConcreteProduct
        Creator <|-- ConcreteCreator
        ConcreteProduct <-- ConcreteCreator
        Creator : +FactoryMethod() // Abstract
        ConcreteCreator : +FactoryMethod() // Implementation
</div>

- `Product`
  - This is the signature of what could be created
  - Defines the interface of the objects which are created
- `ConcreteProduct`
  - These are the objects which are being created
  - Implements the `Product` interface on actual non-abstract types
- `Creator`
  - This is the signature, and base implementation of the Factory which creates objects upon request
- `ConcreteCreator`
  - This is the actual implementation of the Factory which has been purpose built to create a specific type of object, by overriding the `Creator` base Factory class with necessary build up activities, for the concrete product instance
  - Overrides the factory method to return an instance of a `ConcreteProduct`

## Implementation

```csharp

abstract class Product {
}

class ConcreteProduct : Product {
}

abstract class Creator {
    public abstract Product FactoryMethod();
}

class ConcreteCreator {
    public override Product FactoryMethod() {
        return new ConcreteProduct();
    }
}

```

Benefits:

- The `ConcreteProduct` type can be replaced easily with an alternate which implements the `Product` interface
- The complexity of the creation of the `ConcreteProduct` is encapsulated in a purpose built class


## Use

```csharp

{
    ...
    var product = new ConcreteCreator();
    ...
}

```
