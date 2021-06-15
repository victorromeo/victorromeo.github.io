---
layout: post
title: "Design Patterns"
date: 2021-06-15
tags: design pattern
image: https://images.unsplash.com/photo-1499540633125-484965b60031
thumb: https://images.unsplash.com/photo-1499540633125-484965b60031?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8dGVhbXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@nataliepedigo
type: article
---

A simple overview of coding Design Patterns, described originally by the Gang of Four, which support better code quality through the use of well-defined purpose driven components

## 1. CREATION [Abstract Factory](https://www.dofactory.com/net/abstract-factory-design-pattern)
Used to create concrete instances of specific types, via context, without directly accessing a specific factory type

![Abstract Factory](https://www.dofactory.com/img/diagrams/net/abstract.gif)

## 2. STRUCTURE [Adapter](https://www.dofactory.com/net/adapter-design-pattern)

The implementation of consistent interfaces to support classes to interact, which otherwise implement incompatible interfaces

![Adapter](https://www.dofactory.com/img/diagrams/net/adapter.gif)

## 3. CREATION [Builder](https://www.dofactory.com/net/builder-design-pattern)
Enforces separation of concerns by separating the code responsible for building a type, from the implementation of the type

![Builder](https://www.dofactory.com/img/diagrams/net/builder.gif)

## 4. STRUCTURE [Bridge](https://www.dofactory.com/net/bridge-design-pattern)
A structural separation of an object's definition (interface) from its implementation

![Bridge](https://www.dofactory.com/img/diagrams/net/bridge.gif)

## 5. BEHAVIOR [Chain of Responsibility](https://www.dofactory.com/net/chain-of-responsibility-design-pattern)
A structure which supports decoupling the receiver from the requester by permitting a series of types determine in sequence which receiver should handle a message request

![Chain of Responsibility](https://www.dofactory.com/img/diagrams/net/chain.gif)

## 6. STRUCTURE [Composite](https://www.dofactory.com/net/composite-design-pattern)
A structure pattern which permits the uniform treatment of a type, or a collection of types, such that the knowledge of the number of type instances being managed is irrelevant to the calling manager

![Composite](https://www.dofactory.com/img/diagrams/net/composite.gif)

## 7. BEHAVIOR [Command](https://www.dofactory.com/net/command-design-pattern)
A messaging pattern which allows all individual requests to be treated as objects, and thereby permit the storage, execution, and reversal of execution of command requests to be implemented

![Command](https://www.dofactory.com/img/diagrams/net/command.gif)

## 8. STRUCTURE [Decorator](https://www.dofactory.com/net/decorator-design-pattern)
A mechanism by which dynamic features and behaviors are added to an existing type

![Decorator](https://www.dofactory.com/img/diagrams/net/decorator.gif)

## 9. STRUCTURE [Facade](https://www.dofactory.com/net/facade-design-pattern)
A type which obscures and abstracts the complexity of the underlying subsystem, so to enforce use of the facade rather than the subsystem

![Facade](https://www.dofactory.com/img/diagrams/net/facade.gif)

## 10. STRUCTURE [Factory Method](https://www.dofactory.com/net/factory-method-design-pattern)
Support the creation of objects using a well defined interface, but defer the implementation to specific concrete subclasses, which create specific type instances

![Factory Method](https://www.dofactory.com/img/diagrams/net/factory.gif)

## 11. STRUCTURE [Flyweight](https://www.dofactory.com/net/flyweight-design-pattern)
A type which is purpose built to be shared, containing the minimum members to represent the types in its specific shared use case

![Flyweight](https://www.dofactory.com/img/diagrams/net/flyweight.gif)

## 12. BEHAVIOR [Interpreter](https://www.dofactory.com/net/interpreter-design-pattern)
A lexical grammar of expressions which form a language and the support to parse expressions which conform to the language

![Interpreter](https://www.dofactory.com/img/diagrams/net/interpreter.gif)

## 13. BEHAVIOR [Iterator](https://www.dofactory.com/net/iterator-design-pattern)
A means to sequentially access and interpret members of a collection, generically without needing to understand the type

![Iterator](https://www.dofactory.com/img/diagrams/net/iterator.gif)

## 14. BEHAVIOR [Mediator](https://www.dofactory.com/net/mediator-design-pattern)
Decouples types from one another, by using a intermediary type through which communication is invoked

![Mediator](https://www.dofactory.com/img/diagrams/net/mediator.gif)

## 15. BEHAVIOR [Memento](https://www.dofactory.com/net/memento-design-pattern)
A type which is designed to store state, as a sufficient representation of another type such that the type to be represented can be recovered as required

![Memento](https://www.dofactory.com/img/diagrams/net/memento.gif)

## 16. BEHAVIOR [Observer](https://www.dofactory.com/net/observer-design-pattern)
A communication pattern which distributes a signal from a single type to an arbitrary number of related types, when the original type instance is modified, so that the related types can react to the change 

![Observer](https://www.dofactory.com/img/diagrams/net/observer.gif)

## 17. CREATION [Prototype]()
A means to create fully-implemented duplicates of concrete types, of the same type and internal state

![Prototype](https://www.dofactory.com/img/diagrams/net/prototype.gif)

## 18. STRUCTURE [Proxy](https://www.dofactory.com/net/proxy-design-pattern)
A type which has the member data and requisite permission set to act on behalf of another type

![Proxy](https://www.dofactory.com/img/diagrams/net/proxy.gif)


## 19. BEHAVIOR [State](https://www.dofactory.com/net/state-design-pattern)
A behavior pattern which allows the behavior of a type externally determined by the internal state of the instance type

![State](https://www.dofactory.com/img/diagrams/net/state.gif)

## 20. BEHAVIOR [Strategy](https://www.dofactory.com/net/strategy-design-pattern)
A pattern which supports many alternative implementations of an interface, to permit choice in the implementation and thereby select its desired behavior

![Strategy](https://www.dofactory.com/img/diagrams/net/strategy.gif)

## 21. CREATION [Singleton](https://www.dofactory.com/net/singleton-design-pattern)
A mechanism to enforce the reuse of a single instance of a type

![Singleton](https://www.dofactory.com/img/diagrams/net/singleton.gif)

## 22. BEHAVIOR [Template Method](https://www.dofactory.com/net/template-method-design-pattern)
A pattern whereby an algorithm is defined, but the implementation of the algorithm's steps may be redefined and extended, without changing the original algorithms structure

![Template Method](https://www.dofactory.com/img/diagrams/net/template.gif)

## 23. BEHAVIOR [Visitor](https://www.dofactory.com/net/visitor-design-pattern)
An object type which iterates over a collection, performing the same operation on each item in the collection

![Visitor](https://www.dofactory.com/img/diagrams/net/visitor.gif)

[Acknowledgements](https://www.dofactory.com)