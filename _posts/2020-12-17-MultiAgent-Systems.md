---
layout: post
title: "MultiAgent System concepts"
date: 2020-12-17
tags: autonomous algorithm distributed agent
image: https://images.unsplash.com/photo-1499334758287-dc8133b315e9
thumb: https://images.unsplash.com/photo-1499334758287-dc8133b315e9?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8Njh8fG1hbnl8ZW58MHx8MHw%3D&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@andreuuuw
type: article
---

MultiAgent Systems are autonomous actors which assist a systems users achieve specific goals, but do so by understanding the users requirements without external direction from the user.

<!-- markdownlint-disable MD033 -->

<style>
    table {
        width:100%;
        margin-left: 30px;
    }
    table th:first-of-type {
        width:40%;
    }
</style>

## Intelligent Agents

An agent is a computer aided system which is considered enclosed within an environment upon which it can interact
An expert system is similar, however cannot directly interact with the environment. Typically expert systems guide users to make decisions, which interact with the system instead

- Agents are autonomous
  - This means they may act without awaiting external direction to do so
  - This also means they may also act, by making an action of not acting
  - The agent will continue to act to fulfill its objectives, while conditions permit it to do so
  - Autonomy indicates that a system requires inputs and outputs to interact with an environment
  - The degree of autonomy may be externally controlled depending on the significance of the impact of the action to be undertaken

- Agents make decisions
  - Decisions require choices
  - Choices require an ability to score options such that a preference can result in a decision being selected and acted upon
  - The results of making a decisions, is to perform zero or more actions, which will result in zero or more changes to the environment
  - Choices may be trivial or complex, depending on the complexity of the system and environment. 
    - Trivial systems typically have predetermined thresholds which when met result in a predetermined action occurring.
    - Complex systems may require external feedback and specialist sensors to gather sufficient inputs before creating a tailored action to produce an effect on an environment

- Agents act within environments
  - Environments are typically considered Accessible if an agent has an unlimited ability to gather information about the environment
  - Environments are deterministic if any and all specific individual actions result in a known outcome to the environment
  - Environments are static if they remain unmodified unless acted upon by an agent, otherwise these environments are considered dynamic
  - Environments are continuous if there is no known constraint to the quantity or durations of actions an agent may perform
  - As an agent acts within an environment, an agent may ***react*** in response to a condition of the environment. 
  
- Agents may co-habit an environment
  - Agents may react with one another
  - Agents may compete or colaborate with one another, typically depending on the predetermined behaviours of the agents
    - Collaborating relationships between agents needs not be expressly known or planned, but may result from collective gain resulting from the actions of multiple agents
    - Competitive relationships may be planned to intentionally determine the outcome when populations of agents bias one action and therefore outcome over another.  Alternatively competitive relationships may be unplanned and therefore result in a form of natural entropy which retards and constrains an environment from the actions taken within it
  - Co-habitation results in social study scenarios
    - Environments which include competitive agents are typically have less change and may result in aggressive or defensive behavioural traits 
    - Environments which include coorperatative agents are typically subject to higher degrees of change in the environment

- Agents lifecycles
  - Agents may be removed from an environment
  - Agents may be added into an environment
  - The result of this is a temporal effect which influences the result agent populations are modified over time

- Agents perform actions
  - Preconditions are the input conditions which must be met before an action may be taken
  - Effect is the outcome of perfoming the action
  - Postconditions are the output conditions which indicate that the effect was successful
  - An action is taken to produce an effect to achieve a goal

- Agents may be coded with intent and belief
  - Agents may reason and act based upon a belief, when information which is unavailable to the agent
  - This means that some agents may be designed to predict an environmental state is true currently or in the future, despite there not being sufficient input evidence available to the agent
  - Intentional systems are described in levels
    - First order systems contain beliefs and desires, but no beliefs or desires *about* beliefs and desires
    - Second order systems contain beliefs and desires, *and* beliefs or desires *about* beliefs and desires
  - Free will is considered to be derived from outcomes of belief and desire

- Agents may act on an understanding of physical cause and effect
  - Cause and effect are not the same as belief and desire, as cause and effect may be coded into an agent's behaviour despite the effect not being observable in historical evidence

- Agents may learn or not learn
  - When agents learn, agents may act differently when environments change, outcomes change, collaboration and cooperation outcomes result in outcomes which differ from expectation
  - When agents do not learn, they may exhibit sub-optimal behaviours despite historical evidence or alternatively may perform optimal behaviours despite historical evidence of suboptimal environmental conditions
