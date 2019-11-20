---
layout: post
title: "Realtime Decisions"
date: 2019-11-20
---

## Background
Most operations in a system typically require decisions to be made to ensure that logical execution flow is followed and that business policies are adhered with.

Decisions are choices which determine a course of actions and steer the outcome of a process toward a goal.  The faster compute and data access becomes, the faster decisions are being made.  Decisions don't always however result in achieving the desired result, at least not without further correction.

## Motivation
Typically decision making occurs by following a series of steps, and therefore lends itself to automation.  Generalization of these steps assists in reuse of the process for future decision making.

### Glossary

| Term | Description |
| ---- | ------ |
| *Problem* | The object state or condition upon which a decision must be made |
| *Choice* | The options which may be used to improve or maintain a state or condition |
| *Decision* | A single choice which may have several associated actions, which when implemented have the objective to improve or maintain a state or condition |
| *Action* | An operation performed as an outcome of a Decision, which modifies or maintains the current state or conditions of a system |
| *Problem Job* | The object which acts as the responsibility for resolving a Problem |
| *Problem Queue* | An ordered collection of Problems, sorted by typically by priority, severity and urgency |

### Modes

#### Type 1. Sequential Problem Solver

<div class="mermaid">
graph TD
    dp0(Start)
    dp1(Check State)
    dp2[Problem Queue]
    dp4[Scheduler]
    dp5[Resources]
    dp6[Runner]

    tp0[Problem Job]
    tp1(Analysis)
    tp2[Decision/s]
    tp3[Action/s]

    dp0 --> dp1

    subgraph Coordinate
    dp1 ==Update==> dp2
    dp6 --> dp1
    dp6 -.Create and Dispose.-> dp5
    dp4 --Schedule and Action--> dp6
    dp5 -.-> dp1
    end

    subgraph Job
    tp0 --> tp1
    dp2-->tp0
    tp1 -->tp2
    dp5 -.Availability.-> tp1
    dp4 -.Schedule.-> tp1
    tp2 --> tp3
    end

    tp3 --> dp4
</div>

#### Type 2. Parallel Problem Solver

<div class="mermaid">
graph TD
    dp0(Start)
    dp1(Check State)
    dp2[Problem Queue]
    dp3[Job Manager]
    dp4[Scheduler]
    dp5[Resources]
    dp6[Runner]

    tp0[Problem Job]
    tp1(Analysis)
    tp2[Decision/s]
    tp3[Action/s]

    dp0 --> dp1

    subgraph Coordinate
        dp1 ==> dp2
        dp2 ==> dp3
        dp4 --Schedule and Action--> dp6
        dp6 -.Create and Dispose.-> dp5
        dp6 --> dp1
        dp3 ==> dp1
        dp5 -.-> dp1
    end
 
    subgraph Job
        tp0 --> tp1
        tp1 --> tp2
        tp2 --> tp3
    end

    dp3 --> tp0
    tp3 --> dp4

    dp4 -.Schedule.-> tp1
    dp5 -.Availability.-> tp1
</div>

#### Generalization

<div class="mermaid">
graph LR
    Start --> State
    State --> Review
    Review --No Problem/s--> Stop
    Review --New Problem/s--> Problem
    Problem --> Analysis
    Analysis --> Goal
    Analysis --> Policies
    Analysis --> Choices
    Analysis --> Dependencies
    Analysis --> Sequence

    Goal --> Decision
    Policies --> Decision/s
    Choices --> Decision/s
    Dependencies --> Decision/s
    Sequence --> Decision/s

    Decision/s --> Action/s
    Action/s --> State

    Goal --> Review
    
</div>

_Important points to note:_

**State**
1. State can rapidly change, and this rate of change may further influence the rate at which
    - Analysis must be resolved
    - Decisions must be made
    - Actions must be taken
    - Outcomes must be measured
2. State may be very complex
    - Historical Problems, Decisions, Actions and Outcomes already implemented
    - Current Problems, Choices, Decisions, Actions yet to be acted upon or planned
    - External influences may prevent state from being fully known
    - Actions yet to be made may alter the state, and therefore Decisions already made may be impacted

**Problems**
1. Problems are always from a particular perspective, therefore
    - regularly reviewing how problems are detected will have a flow on benefit to ensure issues detected regularly
    - learning from failure to detect will improve problem detection in the future
    - perspectives are influenced by policy
2. While solving one Problem, a new Problem may be observed
3. Problems may be contributing positively to the current state as well as negatively 
4. Sometimes the Decisions may make the problem worse

**Goals**
1. Goals are normally designed from a single perspective
2. Multiple parties may benefit from a Goal being achieved and not all aspects of this may be desirable
2. Goals may change over time
3. Goals may be relevant within a specific window of conditions, or expire
4. A valid goal may be to have nothing happen

**Choice**
1. Choices made in the past may not be possible in future scenarios
2. Choices may be invalidated by the time they are implemented
3. Choices typically require resources to Action, therefore
    - resource contention must be managed
    - resource availability must be ensured before an Action commences, otherwise the Outcome will not be achieved
4. Choices may create products and by-products, and therefore
    - products need to be correctly managed
    - by-products need to be managed or disposed, to prevent further downstream problems being created
4. Choices typically 

**Decisions**
1. The objective of making Decisions is to improve (or at least maintain) a system
2. Decisions are never made to degrade the long-term outcome of a system, and therefore
    - the concept of time is relevant to the measure of success
    - to measure the success of an Action, a maximum time for an action to influence a system should be planned and capped
3. Decisions are made with respect to the available information, including state, historical activity and future goals
4. Decisions may sometimes need to be made before all Choices are known

**Actions**
1. Actions are not necessarily repeatable
2. Actions typically cannot be undone
3. Actions may not always achieve the same outcome when repeated

**Outcome**
1. Outcomes are not always permanent
2. Outcomes may not be deemed as positive at some later point in time

### Analysis

<div class="mermaid">
graph TD

        subgraph Problem Domain

            p[Problem]
            pd[Problem Domain]
            g0[Current State]
            g1[Goal State]
            m[Success Measure]
            l[Policies]
            m0[Problem Gap]

            pd --- p

            pd --- l
            p --> g0
            p --> g1
            m -.-> m0
            pd --- m

        end

    subgraph Analysis

        a --> al

        g0 --> m1
        g0 --> m0
        g1 --> m0
        m0 --> m2

        ac1 --> m1
        m -.-> m1

        subgraph Choice Domain
        
            al[Action/s]
            c[Choices]
            d[Decision/s]

            al ==> c 
            c ==> d

            l -.Constrains.-> d
        end

        subgraph Action Domain
            a[Action]
            ad[Action Definition]

            ac3[Sequence]
            ac4[Resources]
            ac5[Duration]
            ac0[Entry State]
            ac1[Exit State]
            ac2[Fail Conditions]



            ad --> ac3
            ad --> ac4
            ad --> ac5
            ad --> ac0
            ad --> ac1
            ad --> ac2

            m1[Action Gap]
            m2[Correction]
            m1 --> m2

            ac3 --> a
            ac4 --> a
            ac5 --> a
            ac0 --> a
            ac1 --> a
            ac2 --> a

            m2 -- Predicted Improvement --> a
        end

    end
</div>

### Analysis - A Mathematical Approach

Let,
- $S(t)$ be the state of the system at time t, where $S(0)$ is now.
- $A_{entry}(t)$ be the Action 'entry state' of the system at time t
- $A_{exit}(t)$ be the Action 'exit state' of the system at time t
- $n$ be the number of possible Actions
- $p$ be the number of possible Actions for a specific choice
- $q$ be the number of possible Choices

**Effect of change**

$$E_{change}(t) = A_{exit}(t) - S(t)$$

However, if no change has occurred since the action commences, this can be simplified

$$E_{change}(t) = A_{exit}(t) - A_{entry}(t)$$

Therefore where no Action occurs

$$E_{change}(t) = 0$$

**Selecting the optimum action**

The measure of success of a single Action can be determined as a function of the current state and the exit state of the Action.

$$m_{action}(t) = \lvert A_{exit}(t) - S(t) \rvert \\ = \lvert E_{change} \rvert$$

$$M_{action}(t) = 
\begin{cases}
0, \text{if t < 0} \\
m_{action}(t_{0}) - c,  \text{if t = 0} \\
\alpha (m_{action}(t_{0+x}) - c),  \text{if t > 0} \
\end{cases}$$

Where:
- $m_{action}(t)$ is an assessment made at some point in time, $t$
- $\alpha$ is a decay factor degrading the benefit of the change over time
- $c$ is an offset weight to encourage doing some action

Performing no Action reveals the current state is maintained, if c = 0:
- $M_{action}(0) = \lvert 0 - S(0) \rvert + 0 = S(0) $

Performing an Action, and assessing at an arbitrary point in the future,
- $M_{action}(t_{1}) = \alpha \lvert A_{exit}(t_{1}) - S(t_{0}) \rvert + c$

Our assessment of the outcome can be shown to be heavily influenced by the decay $ \alpha$.  
- A system which degrades quickly, (high $\alpha$) requires significant effort to maintain.
- A system which degrades slowly, requires minimal effort to maintain.

The selection of the optimum Action to take, can be found by finding the local maxima, for all possible Actions.

$$M_{MAX action}(t) = \max(\{M_{action_{0}}(t), ... , M_{action_{n-1}}(t)\})$$

**Selecting the optimum decision**

Typically a Choice will have more than one Action, associated with it.  The Runner will execute all Actions, not simply the best Action, as the system must be left in a stable and consistent state.

Let:
- $m_{choice}(t, a)$ be the measure of success of an Action, for a given choice, where the choice has several possible Actions
- $a$ be the selected Action

The measure of success of a single Choice can be determined as a sum of the related Actions of that Choice.  In short, each action effects the success, and the choice success can be measured as

$$M_{choice}(t) = \sum_{a=0}^{n-1} m_{choice}(t, a) \\ = \sum_{a=0}^{n-1} m_{action_{a}}(t)$$

The best Choice to make is therefore, the maximum for all possible Choices, $q$.

$$M_{MAX choice}(t) = \max(\{ M_{choice(0)}{1}(t), ... , M_{choice(q-1)}(t)\})$$

However, it should be noted that this is only true, if the measurement of success uses a consistent time $t$ and $\alpha$ and $c$ for all assessments.

In reality, some Actions may degrade faster than others, due to their impact on the system and the systems resistance to that change.

<script>
    var config = {
        startOnLoad:true,
        flowchart:{
            useMaxWidth:false,
            htmlLabels:true
        }
    };

    mermaid.initialize(config);
</script>
