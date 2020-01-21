---
layout: post
title: "Object Oriented Programming"
date: 2020-01-02
tags: design software pattern
image: https://images.unsplash.com/photo-1506718468845-7578aa47670b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9
thumb: https://images.unsplash.com/photo-1506718468845-7578aa47670b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@martinsanchez
type: concept
---

The four major principles of Object Oriented Programming assist in the  consolidation of an application's functional and logical boundaries into units known as objects, which encourage atomicity, reuse and extensibility

## Encapsulation

Encapsulation is the concept of creating a defined set of functional and logical members of an object.

When designing an object, typically the questions asked include

1. _"What is this object meant to represent?"_
2. _"Which actor/user/capability is this object supporting?"_ 
3. _"What information does this object convey?"_
4. _"What behaviors does this object exhibit?"_
5. _"How is this object different from other objects?"_

## Abstraction

Abstraction is the principle of expressing the intent of an object, through a minimal contract which consumers of the object interact.

When considering the abstraction requirements of an object it is common to ask

1. _"What is the minimum set of features which are needed to represent the information and behaviors of this object?"_
2. _"Which features of this object are logically internal and/or logically external to the consumers of this object?"_
3. _"What level of complexity is appropriate to understand the use of and the interaction with this object?"_
4. _"What complexity can I hide from consumers of this object, and why is this a benefit to the consumers?"_

There are benefits to abstraction which include
- Simplification of an object, into its minimal set of information and behaviors
- Better functional security by ensuring that some behaviors are forced, while unnecessary functional behaviors are identified and removed
- Smaller information storage requirements as data is minimized.  Unnecessary data members are typically identified during an abstraction review of an object and removed
- Obscuring the underlying complexity of an object from the consumers of the object helps its use within a large project and encourages reuse

## Inheritance

Inheritance is the principle of defining relationships between similar types with related purpose.  The concepts of inheritance ensure that some features of base types are automatically accessible to derived types because they are made from the base type, but have additional behaviors and information which extend above the base type and its capabilities.

A trivial example of three levels of inheritance:
- An **Animal**    <= Base Type - Most General
  - A **Feline**    <= Derived Type (_'Is-A'_ Animal)
    - A **Tiger**     <=  Derived Type - Most Specific (_'Is-A'_ Feline)

Questions asked when reviewing the inheritance design for objects include
1. _"Is this a general type or a specific type of an object?"_
2. _"How is this object similar to other objects in this system?"_
3. _"Is this information or behavior on this object needed by a more general or more specific object type?"_
4. _"Can I get this behavior or information already from this object's base type?"_

There are other concepts which are worth considering also when reviewing inheritance
- _"Don't repeat yourself"_ known also by hte acronym 'DRY' is a mantra which encourages reuse of existing capabilities
  - Repeated code is a waste of time, maintenance, project size, complexity, and also results in larger memory requirements to store the associated data
  - Refactoring a code-base to remove repeated code also improves its potential for inheritance
- An Object which _"Has-A"_ feature potentially will help separate logical membership from logical inheritance.  
  - e.g. 1) A `car` _'has-a'_ motor and a `powerboat` _'has-a'_ motor, so if all we collect all objects which are similar (cars, powerboats, motorcycles, trucks) we can identify a base type _`vehicle`_ from which all these objects may derive

  <div class="mermaid m1">
    classDiagram
        class vehicle
            vehicle: engine
            vehicle: passengers
            vehicle: start()
            vehicle: stop()

        class car
            car: tyreSize
            car: bootSize

        class powerboat
            powerboat: propellerSize

        vehicle <|-- car
        vehicle <|-- powerboat
  </div>

  - e.g. 2) A `car mechanic workshop` _'has-a'_ collection of `vehicles`.  The `car mechanic workshop` does not have the features of a vehicle, (engine, etc.) and so it does not derive from a vehicle.  It does however contain vehicles, which are being repaired, so a relationship still exists between the two objects.

In general relationships between objects are typically
- **Inheritance** - Parent to Child (a `cat` is a type of `pet`)
- **Composition** - Object is made from parts (a `cat` has a `tail`)
- **Aggregation** - Object is made from parts, but can be separated (a `classroom` has many `student`). In this case, removing the `classroom` does not remove the `student` or vice versa.
- **Association** - Objects are not directly receiving behaviors or information from each other, but are accessible from one to the other.  (An `owner` feeds a `pet`, and a `pet` lives with an `owner`)
- **Link** a general relationship where the specifics of the relationship are not specified.  The relationship may be inheritance, composition, aggregation or association

## Polymorphism

Polymorphism is the principle of an objects behaviors and information being determined by the specific instance of the type.

A trivial example follows:
- _"What noise does a `cat` make?"_ ==> 'meow'
- _"What noise does a `cow` make?"_ ==> 'moo'
- _"What noise does a `dog` make?"_ ==> 'bark'
- _"What noise does a `angry dog` make?"_ ==> 'grrr'

In the above example the behavior of the animal is determined by the type of animal, and the instance of the animal.  

The benefits of Polymorphism include
- a consistent approach to access information and invoking behaviors on an object
- an opportunity to separate the concerns of objects within the system, encouraging loose coupling
- specificity is implemented on the instance and type which implements the behaviors and data

Polymorphism is achieved through overloading and overriding
- Overloading (static polymorphism) - multiple methods have the same name but have different arguments
- Overriding (dynamic polymorphism) - two methods have the same name and take the same arguments, but due to inheritance, the base type implementation is replaced with the derived type implementation, unless the base implementation is explicitly requested  