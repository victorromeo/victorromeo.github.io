---
layout: post
title: "Design Patterns - Abstract Factory"
date: 2019-11-15
tags: design pattern
image: https://images.unsplash.com/photo-1547518717-52a1971c2c96?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9
thumb: https://images.unsplash.com/photo-1547518717-52a1971c2c96?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@sutton91
type: concept
---

The Abstract Factory pattern helps objects create and interact with general types, leaving the actual concrete implementation of types and their members business logic to concrete types.  This aids decoupling general behaviors from specific case behaviors

<!-- markdownlint-disable MD033 -->

## Goal

Often applications use types which behave similar.  These types have general behaviors which lend themselves to be defined in a base type, leaving the unique behaviors to be defined in the child types.

The problem is however making applications which create specialist concrete types can itself be result in sections of code which are full of repetition.

The alternative, is to split general types and specialist types up, both the General Product types from Concrete Product types and General Factory types from Concrete Factory types.

<style>
    @mixin aggregation {
        fill: none;
        stroke: none none dashed;
        stroke-width: 0.6;
    }
</style>

<div class="mermaid">
    classDiagram
        AbstractProductA <|-- ProductA1
        AbstractProductA <|-- ProductA2
        AbstractProductB <|-- ProductB1
        AbstractProductB <|-- ProductB2
        AbstractFactory <|-- ConcreteFactory1
        AbstractFactory <|-- ConcreteFactory2
        ProductA1 <-- ConcreteFactory1
        ProductB1 <-- ConcreteFactory1
        ProductA2 <-- ConcreteFactory2
        ProductB2 <-- ConcreteFactory2
        Client --* AbstractProductA
        Client --* AbstractProductB
        Client --* AbstractFactory

</div>

## Implementation

```csharp

class Client {
    AbstractProductA productA;
    AbstractProductB productB;
    AbstractFactory factory;

    Client(AbstractFactory factory) {
        this.factory = factory;
        this.productA = factory.CreateProductA();
        this.productB = factory.CreateProductB();
    }

    public string Process() {
        return $"{productA.Value} + {productB.Value}";
    }
}

public class AbstractProductA {
    abstract string Value;
}

public class AbstractProductB {
    abstract string Value;
}

public class ConcreteProductA1 {
    public override string Value = "ConcreteProductA1";
}

public class ConcreteProductA2 {
    public override string Value = "ConcreteProductA2";
}

public class ConcreteProductB1 {
    public override string Value = "ConcreteProductB1";
}

public class ConcreteProductB2 {
    public override string Value = "ConcreteProductB2";
}

public abstract class AbstractFactory {
    abstract AbstractProductA CreateProductA();
    abstract AbstractProductB CreateProductB();
}

public class ConcreteFactory1 : AbstractFactory {
    public override AbstractFactoryA CreateProductA() {
        return new ConcreteProductA1();
    }

    public override AbstractFactoryB CreateProductB() {
        return new ConcreteProductB1();
    }
}

public class ConcreteFactory2 : AbstractFactory {
    public override AbstractFactoryA CreateProductA() {
        return new ConcreteProductA2();
    }

    public override AbstractFactoryB CreateProductB() {
        return new ConcreteProductB2();
    }
}

```

Benefits:

- The core client code is ignorant of the specific details in either the concrete factory or concrete product types
- The specific details are encapsulated in bespoke types which are adhering to a common standard interface

## Use

```csharp

var client1 = new Client(new ConcreteFactory1());
var client2 = new Client(new ConcreteFactory2());

```
