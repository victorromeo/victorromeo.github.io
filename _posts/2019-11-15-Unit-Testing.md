---
layout: post
title: "Unit Testing"
date: 2019-11-15
tags: agile testing
---
**Unit Testing is the process of validating small units of code, to confirm their expected behaviour within a larger application**

## What are Unit Tests

Unit tests are written typically as separate methods to the primary application source code.  The deployed release of an application would almost never contain unit test functions, unless it was appropriate in the domain to do so.

Unit Tests are typically grouped within classes to test related functionality, of a specific component of an application.

Unit Tests, when compiled and run by a Unit Test Runner intentionally exercise components of an application by using a set of pre-engineered and contrived inputs validate that expected outputs are received.  Functions which take no arguments and return no results can also be tested to ensure that the functions complete without failure, and that the internal state of the class achieves an expected outcome.

A very simple example might be to validate that a Calculator Add function, when given two numbers 1 and 2 returns the value 3.

{% highlight csharp %}

namespace Calculator.UnitTests {

    [TestFixture]
    public class CalculatorTests {

        [Test]
        public void Add_1plus2_Returns3() {
            // Arrange
            var calculator = new Calculator();
            var expected = 3;

            // Act
            var actual = calculator.Add(1,2);

            // Assert
            Assert.AreEqual(expected, actual);
        }

    }

}

{% endhighlight %}

In the above example, a Unit Test is validating a single input output scenario.  Following the above technique adding another input output scenario would require another unit test method.  In the real world, multiple combinations of inputs and outputs can be validated with a single method.  

In reality testing is typically much more complex than the above contrived example. However if you understand the core principles of unit testing, the more complex variations are easier to understand as functions which are attempting to achieve the same objective.  For a given input and/or input state, is the returned output and/or state as expected?

## Who writes Unit Tests

Typically a standard developer is responsible for the creation and maintenance of unit tests.

Sometimes however support technicians will write Unit Tests to validate error detection and resolution found within code.

Test Driven Development (TDD) typically uses Unit Testing to construct the Unit Tests before the functionality is created or modified.  Using this technique, a developer will take the minimal path to ensure that the test case passes, and thereby avoid over engineering the code base.

## Vocabulary

- **Test Case** - A single scenario which expresses that when an operation occurs, for a supplied input state, an output state should be achieved.  Test Cases are typically engineered to prevent overlap, and are designed as part of a larger test strategy.

- **Test Fixture** - A set of unit tests which validate related functions, and the associated activities to build up, tear down and clean up state before, after and between unit test execution.

- **Test Method** - A single unit test, whose inner instructions express how the test will be carried out

- **Test Run** - A single execution of one or more unit tests, at a point in time, for a specific release version of an application code base.

- **Assert** - An internal unit testing framework operation which checks a particular condition is met, throwing an exception or error if the condition is not met.

- **Test Report** - A statement which confirms the success or failure of a set of unit tests determined in their latest execution.  The Test Report is an important statement to provide Testers and possibly the customer to demonstrate what has been tested.

- **Specs** - A file containing JavaScript or TypeScript test fixtures, so called because of the '.spec' file extension

## How Unit Tests work

Unit Test Runners are typically either built directly into an IDE, (Integrated Development Environment), or can be executed easily from the console or shell terminal.  

By combining the build action with an immediate trigger to commence running the Unit Tests, a new build can be easily validated for readiness.

Continuous Integration assists the automatic build whenever code is commited back into source control, executing the unit tests to ensure that the code base has not been broken.

## Designing Unit Tests

Unit Tests should attempt to respect the current Test Strategy, and avoid introductng complexity.

Unit Tests should consider
- **Positive Use Cases**
    - Given reasonable user inputs, does the unit of code return a reasonable output 
- **Negative Use Cases** 
    - Given possible unexpected inputs or inputs which the function should not be expected to handle, does the unit of code gracefully handle and return an approprirate output
- **Abuse Cases**
   - Under what conditions could a user attempt to penetrate and exploit an application's functionality, security and data consistency to achieve an outcome which the product should defend

Unit Tests implement these above three primary concepts using
- **Simple Input Testing** 
    - These values are typical values which the value should expect to be provided regularly
    - *I.e. if a process validates the cost of an item, then an item cost of $1.00 is reasonable*
- **Input Boundary Testing**
    - These values are typically provided infrequently and challenge a function at designed thresholds or boundaries to validate that the function can handle these scenarios
    - *I.e. if a process validates the cost of an item, then an item of $0.00 may be unreasonable*
- **Random Value Testing**
    - Input values can be generated to potentially achieve scenarios which the developer and tester have not considered.
    - Such testing is only appropriate if the input is carefully recorded and that the scenario is not excessively contrived so as to never occur.
- **Heuristically Determined Value Testing**
    - Automated tooling can be used to validate an application's logic and construct a set of inputs which validate the alternative paths of an application thread within a unit of code
- **Error Induction Testing**
    - The developer intentionally supplies inputs into the unit test to force an exception to be generated, by the primary application code, and by doing so validates that the application will fail consistently under those conditions
    - This testing input can be used to ensure the application never handles particular scenarios, for instance more funds from a bank account than there are deposits.
    - Alternatively, this technique can be used to validate an observed error or support case.  By creating a unit test with the supplied inputs, the code base can be altered until the unit test no longer fails.  

## Unit Test structure

Well-written Unit Tests read like application documentation and can be used by developers to explain how the application should behave.  For this reason, test methods typically have a method names which describes
- What is under test
- How it is being tested
- What outcome should be returned

When the naming convention is consistently used, errors raised during a test run can be easily identified and the expected result compared against the actual outcome, without having need to dig through excessive source code.

Internally, within the Unit Test, the test method is written in a consistent way to ease interpretation, modification and extension as required.  Typically Unit Tests are written in the following order.

- **Arrange**
    - Prepare the system under test, including inputs and outputs 
- **Act**
    - Perform the operation which is under test
- **Assert**
    - Validate that the outcome is as expected

## Code dependencies

Often real world scenarios are complex and require aspects which have extensive dependencies.  Unit Tests should be written in such a way to avoid complexity, and so both the code base and the unit test may require additional work to avoid this complexity.

- **Fakes**
    - Minimal functional alternative implementations which can be used to shortcut a process and achieve the correct outcome
- **Stubs** 
    - Provide canned responses to a given input, and may have the ability to track activity which was requested for further analysis  
- **Mock**
    - An object which is either used by the unit test as input or returned from the system under test to verify correct behaviour  

## Avoiding Unit Test technical debt

Technical debt typically creeps into an application code base where the effort to maintain a component exceeds the payoff by correcting it.  Several techniques can be used to avoid technical debt

- Remove redundant code early
- Make small units of code, and keep file size small
- Avoid complexity within the code base and the unit tests
- Improve the payoff, by introducing additional incentives
- Expose the defects to demostrate what isn't working
- Regularly review the test strategy, and test cases

## Implementations

| Language | Unit Test Frameworks | Stub and Mock Framework | Test Runners |
| -------- | ---------- | -------------- | --------- |
| C#       | MSUnit, NUnit | Moq, RhinoMock | Visual Studio (vstest), JetBrains Resharper |
| Java     | JUnit | Mockito, Cucumber, Spring, Robot | Eclipse
| TypeScript, JavaScript | Jasmine, Mocha, Jest, Protractor (Angular io and AngularJs) |  JsMokito, TsMokito, typemoq | Web Browser 
| C | Unity, Automated Testing Framework | _typically included in base framework_ | gcc, gxx, g++ 
| C++ | Boost, CppUnit, CppTest  | _typically included in base framework_  | g++

For a more complete list see [Wikipedia - List of Unit Test Frameworks](https://en.wikipedia.org/wiki/List_of_unit_testing_frameworks)