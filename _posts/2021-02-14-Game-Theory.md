---
layout: post
title: "Game Theory"
date: 2021-01-14
tags: Game Theory strategy logic payoff advantage gain loss
image: https://images.unsplash.com/photo-1523875194681-bedd468c58bf
thumb: https://images.unsplash.com/photo-1523875194681-bedd468c58bf?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjJ8fGNoZXNzfGVufDB8fDB8&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@jeshoots
type: article
---

Game Theory is the general name given to a collection of mathematical proofs to assess possible strategies for players in competitive and cooperative scenarios

<style>
    .cell {
        border: solid 1px black;
    }

    .none {
        border: none;
    }
</style>

## Normal Form Games

All normal form games:
- There is a **finite set** of $N$ players
- Each player must select a **single strategy**, from which all players may choose
- An **action profile** $A$ is used to represent the collection of single decisions of all players, for a single instance of a game
- There is a known **payoff** $u$ (also called *utility*) for each possible action profile
- Payoffs are fully known, complete information is known

$$(N, A, u)$$

## Cooperative Games vs. Competitive Games

- Cooperative Games are those where selected strategies result in a global improved gain or global reduced loss, and where individual results are less important than the combined result

- Competitive Games are those where it is advantageous to select strategies which result in one or more players receiving improved gains or reduced losses, to the detriment of other players

- Most games include a combination of competitive and cooperative games

## Common Pay-off vs. Zero Sum Pay-off

- Common Payoff games result in all players receiving the same payoff. Ie. Communal outcomes

- Zero Sum (or more correctly constant sum) games result in the same payoff being shared amongst all players regardless of the strategies each select. I.e. individual gains are at the expense of other players losses

## Strategies

### Strategies for Normal Form Games

- Pure Strategy is when a single player selects and plays a single strategy

- Mixed Strategy is when a single player selects and plays a single strategy, selected randomly (based on a probability distribution) from possible strategies

## Other terms

- We sometimes call a player an **agent** in the context of Game Theory, (partly to dehumanize the parties which may make choices).  In this case Multi Agent games typically involve $3 \text{ (or more)}$ players or agents, *not to be confused with multi-agent systems which describes a collection of autonomous independent systems which interact within an environment*

- **Support** means the set of pure strategies which, when chosen randomly by probability distribution, where each strategy in the set has a positive probability of being selected.

- A **Strategy Profile** is the Cartesian Product of individual strategies

- Cartesian Product *(general mathematical term)*

    A simple example of a Cartesian Product follows, where

    $$\text{if } A = \{x,y,z\} \text{ and }B = \{1,2,3\}$$

    then formally

    $$A \times B = \{(a,b) | a \in A \text{ and } b \in B\}$$

    or more simply, 
    
    $$A \times B = \{ (x,1),(x,2),(x,3),(y,1),(y,2),(y,3),(z,1),(z,2),(z,3)\}$$

    We can also represent this as a matrix, (so long as we remember that the Cartesian Product is the full matrix, treated as a set, which we read in order)

    <table>
    <tr><td class="none"></td><td class="none">1</td><td class="none">2</td><td class="none">3</td></tr>
    <tr><td class="none">x</td><td class="cell">(x,1)</td><td class="cell">(x,2)</td><td class="cell">(x,3)</td></tr>
    <tr><td class="none">y</td><td class="cell">(y,1)</td><td class="cell">(y,2)</td><td class="cell">(y,3)</td></tr>
    <tr><td class="none">z</td><td class="cell">(z,1)</td><td class="cell">(z,2)</td><td class="cell">(z,3)</td></tr>
    </table>


## Examples

### Two vehicles on a Road (Chicken)

Type: Normal Form Common Payoff Cooperative Game

If two vehicles, approaching one another on the same section of road, choose which side of the road to use, they will either collide or pass one another.

<table>
<tr><td class="none"></td><td class="none">Left</td><td class="none">Right</td></tr>
<tr><td class="none">Left</td><td class="cell">(1,1)</td><td class="cell">(0,0)</td></tr>
<tr><td class="none">Right</td><td class="cell">(0,0)</td><td class="cell">(1,1)</td></tr>
</table>

### Prisoners Dilemma

Type: Normal Form Cooperative Game

<table>
<tr><td class="none"></td><td class="none">Silence</td><td class="none">Confess</td></tr>
<tr><td class="none">Silence</td><td class="cell">(-1,-1)</td><td class="cell">(-4,0)</td></tr>
<tr><td class="none">Confess</td><td class="cell">(0,-4)</td><td class="cell">(-3,-3)</td></tr>
</table>

Generally, if $c > a > d > b$ means always a Prisoners Dilemma game 

<table>
<tr><td class="none"></td><td class="none">Option A</td><td class="none">Option B</td></tr>
<tr><td class="none">Option A</td><td class="cell">(a,a)</td><td class="cell">(b,c)</td></tr>
<tr><td class="none">Option B</td><td class="cell">(c,b)</td><td class="cell">(d,d)</td></tr>
</table>

### Rock Paper Scissors

<table>
<tr><td class="none"></td><td class="none">Rock</td><td class="none">Paper</td><td class="none">Scissors</td></tr>
<tr><td class="none">Rock</td><td class="cell">(0,0)</td><td class="cell">(-1,1)</td><td class="cell">(1,-1)</td></tr>
<tr><td class="none">Paper</td><td class="cell">(1,-1)</td><td class="cell">(0,0)</td><td class="cell">(-1,1)</td></tr>
<tr><td class="none">Scissors</td><td class="cell">(-1,1)</td><td class="cell">(1,-1)</td><td class="cell">(0,0)</td></tr>
</table>

## Optimal Strategies

- A concept of optimal strategy exists outcomes whenever a strategy may be selected to derive an advantage for any player
- Obviously whenever an optimal strategy is played, there also exists a non-optimal strategy and failure to chose the optimal strategy results in the loss of advantage

### Pareto Domination

Whenever a player may select an optimal *Strategy Profile* $s$ without negatively impacting other players, then the *Strategy Profile* $s$ **Pareto Dominates** other *Strategy Profiles* $s'$

Using Pareto Domination we can sort some of our choices, to select better choices

### Pareto Optimization

Whenever a Strategy Profile *Pareto Dominates* **all** other Strategy Profiles, it is considered **Pareto Optimized**

This is not just about Action Profile optimization but Strategy Profile optimization of the game.

### Nash Equilibrium

If a competitive game is considered from a single player's perspective, then we can see that the player, who can reason, will attempt to use opportunities to gain advantage.

If a player **has perfect information and knows what other players strategies will be**, then the player may select the best strategy to maximize payoff.

If **all** players select the best strategy *given they know the strategies of other players*, then an equilibrium is achieved *(i.e. no player is playing a non-optimal strategy)*.  

This is known as a **Nash Equilibrium**, and it is accepted that players would always select a best strategy determined by Nash Equilibrium, as it will result in the best outcome for the individual.

Sometimes, there isn't a **single strategy** which a player may select to ensure a best response to a game.  Whenever this occurs, the strategy profile is called a **Weak Nash**.  A **Weak Nash** equilibrium exists whenever several optimal strategies exist and the payoff is equal to other optimal strategies

A **Strict Nash** equilibrium exists whenever only a single best strategy can be selected by all players.

*Note: A Nash Equilibrium exists for any game with a finite set of players and finite set of actions*

### MaxMin Strategy

When a player is playing defensively, a player may protect themselves from aggressive opponents *(whose goal it is to maximize loss to opponents)*, by selecting the maximum payoff in a worst case scenario, or the *best minimum guaranteed payoff* 

*Note: Whenever a player moves first, the MaxMin strategy is always the best strategy for that player, given other players can respond to the strategy*

### MinMax Strategy

Whenever a player is playing in a dominant position, they can ensure their opponents receive the least payoff possible, before considering the payoff to themselves.

*Note: Opponent players may then select to play a strategy to minimize their loss in a worst case scenario.*

### Minimax Strategy

In a Zero Sum game, MinMax and MaxMin strategies are the same subset of possible strategies, and for this reason, they're called Minimax Strategies 

### Regret

Regret is the formal term given to the loss that a player has incurred as a result of playing the incorrect strategy given the strategy played by other players.

It is pretty easy to calculate for player $i$, after a game, knowing the strategy of other players as follows:

$$\text{Regret }_i = \text{Best Payoff }_i - \text{ Actual Payoff}_i$$

Precalculating *regret* helps select the *strategy* to minimize *regret*, ahead of time.

### Minimax Regret Action

Minimax Regret Action is the action which results in the smallest maximum regret

### Dominant and Dominated Strategies 

Strategies which are better than others are dominant.  Strategies which are worse than others, are dominated.

- *Strictly* dominant strategies are better than all other strategies.
- *Weak* dominant strategies are better than some strategies, but not the best strategy
- *Very Weak* dominant strategies are better than at least one other strategy.

#### Iterative removal of strictly dominated strategies

During analysis of a game, if players take turns to eliminate strategies over and over again, which are dominated for themselves, they will arrive at a smaller set of options which are better.

Iterated removal of strictly dominated strategies preserves Nash equilibria. However the result of reducing the strategies may not full remove all options *(Ie. consider the Prisoner's Dilemma, which cannot be further reduced)*.

Here's an example (where players are maximizing their own gains, before minimizing their opponents gains), considered where $Player_{col}$ actions are assessed first.

- Step 0 : Original game strategy profile

    <table>
    <tr><td class="none"></td><td class="none">Left</td><td class="none">Centre</td><td class="none">Right</td><td class="none"><i>Sum</i></td></tr>
    <tr><td class="none">Upper</td><td class="cell">(3,2)</td><td class="cell">(1,0)</td><td class="cell">(2,6)</td><td class="cell"><i>(6,8)</i></td></tr>
    <tr><td class="none">Middle</td><td class="cell">(4,2)</td><td class="cell">(2,0)</td><td class="cell">(3,1)</td><td class="cell"><i>(9,3)</i></td></tr>
    <tr><td class="none">Lower</td><td class="cell">(1,5)</td><td class="cell">(4,0)</td><td class="cell">(2,1)</td><td class="cell"><i>(7,6)</i></td></tr>
    <tr><td class="none"><i>Sum</i></td><td class="cell"><i>(8,9)</i></td><td class="cell"><i>(7,0)</i></td><td class="cell"><i>(7,8)</i></td><td class="none"></td></tr>
    </table>

- Step 1 : $Player_{col}$ removes dominated strategy **Centre** to maximize gain

    <table>
    <tr><td class="none"></td><td class="none">Left</td><td class="none">Right</td><td class="none"><i>Sum</i></td></tr>
    <tr><td class="none">Upper</td><td class="cell">(3,2)</td><td class="cell">(2,6)</td><td class="cell"><i>(5,8)</i></td></tr>
    <tr><td class="none">Middle</td><td class="cell">(4,2)</td><td class="cell">(3,1)</td><td class="cell"><i>(7,3)</i></td></tr>
    <tr><td class="none">Lower</td><td class="cell">(1,5)</td><td class="cell">(2,1)</td><td class="cell"><i>(3,6)</i></td></tr>
    <tr><td class="none"><i>Sum</i></td><td class="cell"><i>(8,9)</i></td><td class="cell"><i>(7,8)</i></td><td class="none"></td></tr>
    </table>

- Step 2 : $Player_{row}$ removes dominated strategy **Lower** to maximize gain

    <table>
    <tr><td class="none"></td><td class="none">Left</td><td class="none">Right</td><td class="none"><i>Sum</i></td></tr>
    <tr><td class="none">Upper</td><td class="cell">(3,2)</td><td class="cell">(2,6)</td><td class="cell"><i>(5,8)</i></td></tr>
    <tr><td class="none">Middle</td><td class="cell">(4,2)</td><td class="cell">(3,1)</td><td class="cell"><i>(7,3)</i></td></tr>    
    <tr><td class="none"><i>Sum</i></td><td class="cell"><i>(7,4)</i></td><td class="cell"><i>(5,7)</i></td><td class="none"></td></tr>
    </table>

- Step 3 : $Player_{col}$ removes dominated strategy **Left** to maximize gain

    <table>
    <tr><td class="none"></td><td class="none">Right</td><td class="none"><i>Sum</i></td></tr>
    <tr><td class="none">Upper</td><td class="cell">(2,6)</td><td class="cell"><i>(2,6)</i></td></tr>
    <tr><td class="none">Middle</td><td class="cell">(3,1)</td><td class="cell"><i>(3,1)</i></td></tr>    
    <tr><td class="none"><i>Sum</i></td><td class="cell"><i>(5,7)</i></td><td class="none"></td></tr>
    </table>

- Step 4 : $Player_{row}$ removes dominated strategy **Upper** to maximize gain

    <table>
    <tr><td class="none"></td><td class="none">Right</td><td class="none"><i>Sum</i></td></tr>
    <tr><td class="none">Middle</td><td class="cell">(3,1)</td><td class="cell"><i>(3,1)</i></td></tr>    
    <tr><td class="none"><i>Sum</i></td><td class="cell"><i>(3,1)</i></td><td class="none"></td></tr>
    </table>

- Nash Equilibrium : **(Middle, Right)**

Let's repeat where $Player_{row}$ is considered first.

- Step 1 : $Player_{row}$ removes dominated strategy **Upper** to maximize gain

    <table>
    <tr><td class="none"></td><td class="none">Left</td><td class="none">Centre</td><td class="none">Right</td><td class="none"><i>Sum</i></td></tr>
    <tr><td class="none">Middle</td><td class="cell">(4,2)</td><td class="cell">(2,0)</td><td class="cell">(3,1)</td><td class="cell"><i>(9,3)</i></td></tr>
    <tr><td class="none">Lower</td><td class="cell">(1,5)</td><td class="cell">(4,0)</td><td class="cell">(2,1)</td><td class="cell"><i>(7,6)</i></td></tr>
    <tr><td class="none"><i>Sum</i></td><td class="cell"><i>(5,7)</i></td><td class="cell"><i>(6,0)</i></td><td class="cell"><i>(5,2)</i></td><td class="none"></td></tr>
    </table>

- Step 2 : $Player_{col}$ removes dominated strategy **Centre** to maximize gain

    <table>
    <tr><td class="none"></td><td class="none">Left</td><td class="none">Right</td><td class="none"><i>Sum</i></td></tr>
    <tr><td class="none">Middle</td><td class="cell">(4,2)</td><td class="cell">(3,1)</td><td class="cell"><i>(7,3)</i></td></tr>
    <tr><td class="none">Lower</td><td class="cell">(1,5)</td><td class="cell">(2,1)</td><td class="cell"><i>(3,6)</i></td></tr>
    <tr><td class="none"><i>Sum</i></td><td class="cell"><i>(5,7)</i></td><td class="cell"><i>(5,2)</i></td><td class="none"></td></tr>
    </table>

- Step 3 : $Player_{row}$ removes dominated strategy **Lower** to maximize gain

    <table>
    <tr><td class="none"></td><td class="none">Left</td><td class="none">Right</td><td class="none"><i>Sum</i></td></tr>
    <tr><td class="none">Middle</td><td class="cell">(4,2)</td><td class="cell">(3,1)</td><td class="cell"><i>(7,3)</i></td></tr>
    <tr><td class="none"><i>Sum</i></td><td class="cell"><i>(4,2)</i></td><td class="cell"><i>(3,1)</i></td><td class="none"></td></tr>
    </table>

- Step 4 : $Player_{row}$ removes dominated strategy **Lower** to maximize gain

    <table>
    <tr><td class="none"></td><td class="none">Left</td><td class="none"><i>Sum</i></td></tr>
    <tr><td class="none">Middle</td><td class="cell">(4,2)</td><td class="cell"><i>(4,2)</i></td></tr>
    <tr><td class="none"><i>Sum</i></td><td class="cell"><i>(4,2)</i></td><td class="none"></td></tr>
    </table>

- Nash Equilibrium : **(Middle, Left)**

In Summary: 

For $Player_{row}$ playing **Middle** is strictly dominant, as there are no choices which are result in a better outcome

For $Player_{col}$ playing **Left** is strictly dominant, but playing **Right** is weakly dominant

Interestingly in this game, when comparing the results (3,1) and (4,2), the relative difference is (+2, +0) for either, so anytime this game is played following the optimal Nash strategy approach, $Player_{row}$ will gain more than $Player_{col}$.

In a competitive market, where ultimately one player remains, $Player_{col}$ will lose out while the payoffs remain constant, and therefore must they adapt or modify the market environment, changing payoffs such that advantage is modified back in their favour to remain competitive.

## Rational players

Its important to note that the above approach is only suitable when a game is considered between players who can consider the importance of gains and losses and therefore rationalize which is better.  Adopting some strategies against opponent players who are playing randomly or consistently using poor strategies may result in reduced gains or excessive and increased losses.
