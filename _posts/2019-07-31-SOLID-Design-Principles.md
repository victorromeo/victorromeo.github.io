---
layout: post
title: "SOLID Design Principles"
date: 2019-07-31
---
## SOLID Application Practices are well defined principles which increase an object oriented application's flexibility and extensibility.

- [Single Responsibility Principle](#single-responsibility-principle)
- [Open Closed Principle](#open-closed-principle)
- [Liskov Substitution Principle](#liskov-substitution-principle)
- [Interface Segregation Principle](#interface-segregation-principle)
- [Dependency Inversion Principle](#dependency-inversion-principle)

### Single Responsibility Principle
**Do one thing - Do it well**

Applications are regularly made up of a large number of objects with attributes and behaviours.  The smaller these objects each are, the easier they are to understand and to maintain.  Complexity is not the friend of the happy software engineer, as complexity typically obscures the details which are most important, and commonly hides defects.

Being forced to consider what each object is trying to achieve is a healthy way to undertake critical thinking when reading source code.  Objects which are large in file size, have long lines of code or excessive number of functions and attributes are great candidates to be scrutinized.

The engineers undertaking the review should consider the objects motivations for belonging to the entire solution, their interactions and inheritance relationships, and then consider dividing the object into smaller components.

In the following code snippet, the School class is attempting to manage School Subjects and Students.

{% highlight csharp %}
public class School {
  public string SchoolName { get; set; }
  public Address SchoolAddress { get; set; }
  public IList GetSubjects() { ... }
  public int AddSubject(string subjectName, string subjectDescription) { ... }
  public void UpdateSubject(int subjectId, string subjectName,string subjectDescription) { ... }
  public void RemoveSubject(int subjectId) { ... }
  public void AddStudent(int subjectId, int studentId) { ... }
  public void RemoveStudent(int subjectId, int studentId) { ... } 
  public IList GetStudents(int subjectId) { ... }
  public void UpdateStudentName(Student student) { ... }
  public void AddUpdateSchoolToDatabase() { ... }
  public void AddUpdateSubjectToDatabase() { ... }
  public void AddUpdateStudentToDatabase() { ... }
  public void AddUpdateStudentSubjectEnrollmentToDatabase() { ... }
  ...
}
{% endhighlight %}

Instead, using the Single Responsibility Principle, this would be broken up into several classes which are each responsible for a single small domain.  Let's assume the domain entities are School, Subject and Student which are being divided out.  Also, lets separate the concepts of businss logic from data access logic.

{% highlight csharp %}

// Entities
public class School {
  public int SchoolId { get;set; }
  public string Name { get; set; }
}

public class Subject {
  public int SubjectId { get; set; }
  public string Name { get;set; }
  public string Description { get;set; }
}

public class Student {
  public int StudentId { get; set; }
  public string Name { get; set; }
}

// Entity Relationships

public class SchoolSubject  {
  public int SchoolId { get; set; }
  public int SubjectId { get; set; }
  ...
}

pubic class SubjectStudent {
  public int SubjectId { get; set; }
  public int StudentId { get; set; }
  ...
}

// Business Logic 

public class SubjectEnrollment {
  public bool CanEnroll(int studentId, int subjectId)  { ... }
  public CanDisenroll(int studentId, int subjectId)  { ... }
  public Enroll(Student student, Subject subject) { ... }
  public Disenroll(int studentId, int subjectId)  { ... }
}

// Data Access Logic

public class SchoolDataAccessLayer {
  public int Add(School school) { ... }
  public int Update(School school) { ... }
  public bool Delete(int schoolId) { ... }
}

public class SubjectDataAccessLayer {
  ....
}

public class StudentDataAccessLayer {
  ...
}

{% endhighlight %}

In the above example, using the principle,

- Entities, relationships, logic and data storage and persistence are each separated, creating several smaller classes which each provide a single aspect of the functional application
- The School object is responsible for only managing the high level collections of Subjects, and Students
- The Subject object is responsible for Students which are enrolled in the class
- The Student object is only responsible for representing the identity of the Student

### Open Closed Principle
**Open for extension - Closed for modification**

An application which changes often, can break easily when the underlying behaviour of components is allowed to deviate dramatically.  Application resilience is the responsibility of the software engineer as they attempt to maintain each application component.  This becomes particularly important when working within a team scenario.

In the code scenario posed directly below, a simple publish subscription message bus broker is working well.

Objects can call an instance to subscribe to topics and be notified when an event occurs
Objects can call an instance to emit a MessageBusEvent, notifying the subscribers

{% highlight csharp %}
public class MessageBus {
  public subcriptionId Subscribe(string topic, Func topicEventCallback) { ... }
  public void Publish(string topic, MessageBusEvent messageBusEvent) { ... }
}
{% endhighlight %}

When maintaining this piece of code, we need to ensure that both the Subscribe and Publish operations continue to behave as expected.  Subscribe has a responsibility to record the subscription and issue a subscriptionId to the caller.  Publish has a responsibility to call all the subscriptions in turn, notifying them of the event.

Now let's extend the scenario, adding code to Unsubscribe to a topic.

{% highlight csharp %}
public class MessageBus {
  public subscriptionId Subscribe(string topic, Func topicEventCallback) { ... }
  public void Unsubscribe(string topic, int subscriptionId) { ... }
  public void Publish(string topic, MessageBusEvent messageBusEvent) { ... }
}
{% endhighlight %}

Assuming the change has not modified the behaviour of the Subscribe and Publish operations, this change is fine, considering the Open-Closed Principle, as the class has been extended.

Typically, the Open-Closed Principle is enforced through inheritance, rather than direct class modification as above.

In the following scenario, rather than modifying the Animal object directly, a child class ExtendedAnimal inherits the Animal objects traits.

{% highlight csharp %}
public class Animal {
  public string Name { get; set; }
}

public class ExtendedAnimal : Animal {
  public string ScientificName { get; set; }
}
{% endhighlight %}

The ExtendedAnimal has not modified the traits of the Animal object, for example the Name property.  As a result, classes can use instances of ExtendedAnimals as if they are Animals, and not be impaired by the inheritance.

### Liskov Substitution Principle
**If it looks like a duck and behaves like a duck, its a duck**

One type can be substituted for another, if the object behaves in an identical manner.  To the greater application structure, there is no noticeable difference by the substitution.

In the scenario below, the MessageBusSlow has been behaving poorly, taking a long time to transmit messages to the subscribers.  As a result, MessageBusFast has been created, and it has the same interface implementation with additional performance improvements.

public interface IMessageBus {
  int Subscribe(string topic, Func callback);
  void Publish(string topic, MessageBusEvent messageBusEvent)
}

public class MessageBusSlow : IMessageBus {
  public int Subscribe(string topic, Func callback) { ... }
  public void Publish(string topic, MessageBusEvent messageBusEvent) { ... }
}

public class MessageBusFast : IMessageBus {
  public int Subscribe(string topic, Func callback) { ... }
  public void Unsubscribe(string topic, int subscriptionId) { ... }
  public void Publish(string topic, MessageBusEvent messageBusEvent) { ... }
}

MessageBusFast and MessageBusSlow are both doing the same thing, but the fast implementation is more suitable for the organisation, so they can use the Liskov Substitution Principle to swap out the slow implementation.

Having additional functionality in the MessageBusFast implementation is also fine, as this has not modified the behaviour of the Subscribe and Unsubscribe operations.

### Interface Segregation Principle
**Minimize interface members, so implementing them requires less effort**

Interfaces attempt to define the signatures of attributes and operations an object will exhibit when invoked.  When the number of attributes and behaviours is large, the number of opeations and attributes which need to be created and maintained is also large.  Simplifying large interfaces after they are used in production is also difficult, as this is contrary to the Open-Closed Principle outlined above.

Typically, software engineers will avoid undue complexity wherever and whenever possible.  The scenario below demonstrates an interface definition which has already failed the Single Responsibility Principle, as the interface is requesting the engineer to maintain details of the vehicle but also the vehicles dealership.  The Single Responsibility Principle would recommend splitting the interface into parts which treat the Vehicle and Vehicle's Dealership as separate entities.

{% highlight csharp %}
public interface IVehicle {
  int Id { get; set; }
  string Make { get; set; }
  string Model { get; set; }
  ...
  ... 
  int GetDealerId();
  string GetDealerAddress();
  void SetDealerAddress(string dealerAddress);
}
{% endhighlight %}

The Interface Segregation Principle is similar, in that it attempts to reduce complexity of the solution. Its purpose, however, is different as the intent is to reduce implementation complexity, not the number of domains.

If the IVehicle interface, above, had 50 attributes and operations, then the implementation of the IVehicle object, would require at least 50 attributes and operations to be implemented in the object.  In addition, any interface which inherits from the IVehicle also would need to implement the original 50 members, as well as any new members.

The result is an interface which is complex to implement, to extend and to replace.

Following the Interface Segregation Principle, a responsible software engineer would reduce the interface down to its most minimal form.  This ensures that any derivative work on the implementation or its extension is easier.

### Dependency Inversion Principle
**Applications are fragile when they dependent on their dependencies**

Applications are typically utilize the features of parts which have already been created, by both external third-parties and internal team members.  These parts are typically called dependencies.  Dependency Inversion Principle directs a responsible software engineer to ensure that any dependencies which may be used within an application are requested by the objects which use them, rather than defining them directly.

{% highlight csharp %}
public class VehicleRepository {
  private string _connectionString;
  public VehicleRepository(string connectionString) {
    _connectionString = connectionString;
  }
  public IList GetVehicles() { 
    using (SqlConnection connection = new SqlConnection(_connectionString)) {
      ... 
      ...
    }
  }
  public Vehicle GetVehicle(int vehicleId) { ... }
  public void AddVehicle(Vehicle vehicle) { ... }
  public void UpdateVehicle(Vehicle vehicle) { ... }
}
{% endhighlight %}


The code above is dependent on the SqlConnection type, and incorrectly is stipulating that the SqlConnection should be used to connect to a database to store and retrieve Vehicles.  This means that any application which attempts to replace the database from an Microsoft SQL Server to another type of database server would need to modify the VehicleRepository class.

Alternatively, the VehicleRepository should be written to request the connection provider.  Furthermore, types which rely on the VehicleRepository should be provided an instance of the VehicleRepository when required.  This can be achieved through either a Factory or a constructor argument or Inversion of Control library.

{% highlight csharp %}
public class VehicleRepository {
  private DbConnection _dbConnection;
  public VehicleRepository(DbConnection dbConnection) {
    _dbConnection = dbConnection;
  } 

  public IList GetVehicles() {
    ...
  }
}
{% endhighlight %}

Using the technique above, the DbConnection is available when the VehicleRepository requires it, however:

- the DbConnection can be any suitable type, including an SQLConnection, or OracleConnection
- the DbConnection can be reused for multiple operations, speeding up database connections
- the DbConnection connection lifetime is managed external to the Vehicle Repository

{% highlight csharp %}
public interface IVehicleRepository {
  ...
}

public class VehicleRepository : IVehicleRepository {
  ...
}

public static class VehicleRepositoryFactory {
  public static IVehicleRepository GetVehicleRepository() { ... }
}

public class VehicleOrchestrator {
  public IVehicleRepository _vehicleRepository;
  public VehicleOrchestrator(IVehicleRepository vehicleRepository)
  public IList GetVehicles() {
    return VehicleRepositoryFactory.GetVehicleRepository().GetVehicles();
  }
}
{% endhighlight %}

The technique shown above uses a Factory to retrieve a VehicleRepository instance as required.  The Factory technique ensures that the lifetime of the VehicleRepository is managed centrally.  Whilst the VehicleRepositoryFactory is suitable for getting an instance of the VehicleRepository instance, if this were to be generalised to get a large number of types then the maintenance of several factories may be onerous. Instead an Inversion of Control container may be used. 

Popular IoC containers include:

- Unity
- StructureMap
- Castle Windsor
- Ninject
- Autofac

Each container has a range of features to assist in managing dependencies, have varying speed considerations and become dependencies of the application themselves when used.  Swapping out one IoC container, for an alternative is just another case of Dependency Inversion which should be considered.