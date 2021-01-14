---
layout: post
title: "Algorithms"
date: 2021-01-07
tags: algorithm sort search graph set array index quick heuristic prune cluster compress encrypt
image: https://images.unsplash.com/photo-1547223487-c0bbe3535bb7
thumb: https://images.unsplash.com/photo-1547223487-c0bbe3535bb7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fG1hemV8ZW58MHx8MHw%3D&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@victor_g
type: article
---

Algorithm efficiency dramatically effects software success. This guide assists in selecting the correct algorithm for a task.

- [Data Storage considerations](#data-storage-considerations)
  - [Mutable vs Immutable](#mutable-vs-immutable)
  - [Stack vs Heap](#stack-vs-heap)
  - [Arrays](#arrays)
  - [Sets](#sets)
  - [Queues](#queues)
    - [FIFO - First In First Out](#fifo---first-in-first-out)
    - [LIFO - Last In First Out](#lifo---last-in-first-out)
  - [Dictionaries](#dictionaries)
  - [Trees](#trees)
    - [Binary Search Tree](#binary-search-tree)
    - [Red Black Tree](#red-black-tree)
- [Sorting algorithms](#sorting-algorithms)
  - [Insert Sort](#insert-sort)
  - [Selection Sort](#selection-sort)
  - [Bubble Sort](#bubble-sort)
  - [Quick Sort](#quick-sort)
  - [Heap Sort](#heap-sort)
  - [Merge Sort](#merge-sort)
- [Searching algorithms](#searching-algorithms)
  - [Indexes](#indexes)
    - [Forward Indexes](#forward-indexes)
    - [Inverted Index](#inverted-index)
    - [Reverse Index](#reverse-index)
  - [Database Pages](#database-pages)
  - [Search Algorithm concepts](#search-algorithm-concepts)
    - [Brute Force Search (No Knowledge)](#brute-force-search-no-knowledge)
    - [Backward Induction Search](#backward-induction-search)
    - [Heuristics Search (Partial Knowledge))](#heuristics-search-partial-knowledge)
    - [Local Consistency and Constraint Propagation](#local-consistency-and-constraint-propagation)
  - [Combinatorial Search](#combinatorial-search)
    - [Alpha-Beta Pruning](#alpha-beta-pruning)
    - [Branch and Bound](#branch-and-bound)
    - [MinMax](#minmax)
- [Graphs)](#graphs)
  - [Graph Search](#graph-search)
    - [Breadth First Search](#breadth-first-search)
    - [Depth First Search](#depth-first-search)
    - [A* Star Search](#a-star-search)
- [Genetic Algorithms](#genetic-algorithms)
- [Constraint Satisfaction Problems](#constraint-satisfaction-problems)
  - [CSP Example using Sudoku](#csp-example-using-sudoku)
  - [CSP solutions](#csp-solutions)
- [Clustering Algorithms](#clustering-algorithms)
  - [K-Means Clustering](#k-means-clustering)
  - [K-Nearest Neighbor Clustering](#k-nearest-neighbor-clustering)
  - [Means Shift](#means-shift)
  - [Density Based Spatial Clustering (DBSCAN)](#density-based-spatial-clustering-dbscan)
  - [Expectation Maximization Clustering using Gaussian Mixture Models (GMMs)](#expectation-maximization-clustering-using-gaussian-mixture-models-gmms)
  - [Agglomerative Hierarchical Clustering](#agglomerative-hierarchical-clustering)
- [Compression Algorithms](#compression-algorithms)
- [Encryption Algorithms](#encryption-algorithms)
- [Algorithm libraries](#algorithm-libraries)

## Data Storage considerations

### Mutable vs Immutable

Mutable data can be modified, whereas immutable data cannot.  

Instead of modifying the content of an immutable data storage container, create a new data storage container with the desired content, as the original content cannot be modified once defined.

### Stack vs Heap

| Feature                | Stack                                         | Heap                                   |
| ---------------------- | --------------------------------------------- | -------------------------------------- |
| Type                   | Linear data structure                         | Hierarchical data structure            |
| Access Speed           | Faster                                        | Slower                                 |
| Timing                 | On function call                              | On execution of instruction            |
| Management             | OS managed to avoid fragmentation             | App managed, so may become fragmented  |
| Size Limit             | OS defined limit                              | No specific limit                      |
| Allocation             | Items added in contiguous block               | Items stored in no specific order      |
| Deallocation           | Items removed automatically. Implicit         | Items removed by application. Explicit |
| Resize                 | Items cannot be resized (due to allocation)   | Items can be resized                   |
| Typical Implementation | Simple arrays, dynamic memory, or linked list | Arrays or Trees                        |
| Main Issues            | Memory limitations                            | Fragmentation                          |


*Note:*  Higher level languages which support flexible data containers typically store the container data in the heap.  When a container is passed as a parameter on a function call, a reference to the container (not the whole container) is stored on the stack, as part of the reserved memory allocated for the function call.  By passing the reference to the array, your defining where in the heap the array data can be found.

### Arrays

An array is a sequence of zero or more values.  In an array, the order of the values is important.

Accessing an array quickly typically requires that all elements in the array to have the same data type, as this results in items which have the same size.

```c#
// Returns the item at the specified position 
T Index[int position];

// Inserts an item at the specified position 
void Add(int position, T value);
```

### Sets

A set is a storage type which contains zero or more values, where the order is typically not important. 

Sets are typically used for logical assessment of values based on combinations and subsets.

*Note: In Python a set has a different meaning which means a immutable collection of values*

```c#
// Returns true where value is in set
bool Exists<T>(Set<T> set, T value); 

// Returns Items in either set1 or set2
Set<T> Union(Set<T> set1, Set<T> set2); 

// Returns Items strictly in both set1 and set2
Set<T> Intersection(Set<T> set1, Set<T> set2); 
```
### Queues

Queues are a useful data storage type when processing data in sequence.  Queues aid the processing of data in parallel, as data is typically removed from the queue before processing commences.

```csharp
// Adds an item to the back of the queue (Enqueue)
void Push<T>(T value);

// Removes an item from the front of the queue (Dequeue)
T Pop<T>();
```

#### FIFO - First In First Out

Items in the queue are processed in the insert order sequence, ensuring that the oldest items in the queue are the next items to be processed.  E.g. service at a checkout register while shopping

![FIFO](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Fifo_queue.png/350px-Fifo_queue.png)

#### LIFO - Last In First Out

Items in the queue are processed, such that the most recent added items are the first to be processed. E.g. A todo tray on a desk, where the top item is processed first

![LIFO](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Lifo_stack.png/350px-Lifo_stack.png)

### Dictionaries

Dictionaries are a type of associated array composed of  `key` + `value` pairs, where the location of the `value`, is determined by the `key`.  Use of dictionaries are great, when the key is a scalar data type, such as integer or a simple string.

Typically insert time into a dictionary is fast, and retrieval time is fast.

Accessing the value, typically requires the key to be a known value, but searching all values for presence of specific content is slow.

```csharp
// Adds an item 
void Set(TKey key, TValue value);

// Returns the item with the specified key
TValue Get(TKey key);

// Returns true where the key is present
bool Exists(TKey key);
```

Dictionaries can be implemented in a number of different ways, including hash tables, self-balancing binary search trees, unbalanced binary search trees and a sequential container of key value pairs.

### Trees

Trees are an important data structure which aids rapid data access and search algorithms.  The trade off for these benefits is insert and delete time, which modifies the structure of the tree.

#### Binary Search Tree

A binary search tree is a rooted binary tree, whose internal nodes each store a key (and optionally, an associated value), and each has two distinguished sub-trees, commonly denoted *left* and *right*.

![Binaryt Search Tree](https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Binary_search_tree.svg/180px-Binary_search_tree.svg.png)

#### Red Black Tree

A Red Black Tree is a specialization of the Binary Search Tree, where the leaf nodes do not contain data.

1. All nodes have an attribute flag of red or black
2. The root is black
3. All leaves (non-populated endpoints of the tree) are black
4. All children of red items are black
5. All paths from a given node to a descendent leaf (NIL) go through the same number of black nodes

![Red Black Tree](https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Red-black_tree_example.svg/500px-Red-black_tree_example.svg.png)

## Sorting algorithms

### [Insert Sort](https://en.wikipedia.org/wiki/Insertion_sort)

Insertion sort is a simple sorting algorithm that is relatively efficient for small lists and mostly sorted lists. It works by taking elements from the list one by one and inserting them in their correct position into a new sorted list.

### Selection Sort

Selection sort is an in-place comparison sort. It has O(n2) complexity, making it inefficient on large lists, and generally performs worse than the similar insertion sort. Selection sort is noted for its simplicity, and also has performance advantages over more complicated algorithms in certain situations.

![Selection Sort](https://upload.wikimedia.org/wikipedia/commons/9/94/Selection-Sort-Animation.gif)

### [Bubble Sort](https://en.wikipedia.org/wiki/Bubble_sort)

Bubble sort is a simple sorting algorithm. The algorithm starts at the beginning of the data set. It compares the first two elements, and if the first is greater than the second, it swaps them. It continues doing this for each pair of adjacent elements to the end of the data set. It then starts again with the first two elements, repeating until no swaps have occurred on the last pass.

![Bubble Sort](https://upload.wikimedia.org/wikipedia/commons/c/c8/Bubble-sort-example-300px.gif)

### [Quick Sort](https://en.wikipedia.org/wiki/Quicksort)

Quicksort is a divide and conquer algorithm which relies on a partition operation: to partition an array, an element called a pivot is selected. All elements smaller than the pivot are moved before it and all greater elements are moved after it. This can be done efficiently in linear time and in-place. The lesser and greater sublists are then recursively sorted. This yields average time complexity of O(n log n), with low overhead, and thus this is a popular algorithm. Efficient implementations of quicksort (with in-place partitioning) are typically unstable sorts and somewhat complex, but are among the fastest sorting algorithms in practice. Together with its modest O(log n) space usage, quicksort is one of the most popular sorting algorithms and is available in many standard programming libraries.

![Quick Sort](https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Sorting_quicksort_anim.gif/220px-Sorting_quicksort_anim.gif)

### [Heap Sort](https://en.wikipedia.org/wiki/Heapsort)

Heapsort is a much more efficient version of selection sort. It also works by determining the largest (or smallest) element of the list, placing that at the end (or beginning) of the list, then continuing with the rest of the list, but accomplishes this task efficiently by using a data structure called a heap, a special type of binary tree. Once the data list has been made into a heap, the root node is guaranteed to be the largest (or smallest) element. When it is removed and placed at the end of the list, the heap is rearranged so the largest element remaining moves to the root. Using the heap, finding the next largest element takes O(log n) time, instead of O(n) for a linear scan as in simple selection sort. This allows Heapsort to run in O(n log n) time, and this is also the worst case complexity.

![Heap Sort](https://upload.wikimedia.org/wikipedia/commons/4/4d/Heapsort-example.gif)

### [Merge Sort](https://en.wikipedia.org/wiki/Merge_sort)

Merge sort takes advantage of the ease of merging already sorted lists into a new sorted list. It starts by comparing every two elements (i.e., 1 with 2, then 3 with 4...) and swapping them if the first should come after the second. It then merges each of the resulting lists of two into lists of four, then merges those lists of four, and so on; until at last two lists are merged into the final sorted list. Of the algorithms described here, this is the first that scales well to very large lists, because its worst-case running time is O(n log n). It is also easily applied to lists, not only arrays, as it only requires sequential access, not random access. However, it has additional O(n) space complexity, and involves a large number of copies in simple implementations.

![Merge Sort](https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Merge-sort-example-300px.gif/220px-Merge-sort-example-300px.gif)

## [Searching algorithms](https://en.wikipedia.org/wiki/Search_algorithm)

Searching algorithms typically attempt to achieve efficiency within a defined problem domain, either in discrete or continuous data.

Searching algorithms are also highly dependent on the data types being stored and the data structure containing the data, and the order of the data within the structure.

### [Indexes](https://en.wikipedia.org/wiki/Search_engine_indexing#The_forward_index)

Indexes are used to quickly access data stored within a data set.

#### [Forward Indexes](https://en.wikipedia.org/wiki/Search_engine_indexing#The_forward_index)

At a library, forward indexes are used in catalogs to help visitors find books based on a set of key words:

- Title
- Author
- Genre
- ISBN

These indexes however do very little to help the library visitor assess the content of the books on the shelves quickly.  

Example of a Forward Index

| Document   | Words                            |
| ---------- | -------------------------------- |
| Document 1 | the,cow,says,moo                 |
| Document 2 | the,cat,and,the,hat              |
| Document 3 | the,dish,ran,away,with,the,spoon |

*Note: in the above forward index case the Words cannot be determined without first providing the Document*

#### [Inverted Index](https://en.wikipedia.org/wiki/Inverted_index)

In computer science, an inverted index (also referred to as a postings file or inverted file) is a database index storing a mapping from content, such as words or numbers, to its locations in a table, or in a document or a set of documents (named in contrast to a forward index, which maps from documents to content). The purpose of an inverted index is to allow fast full-text searches, at a cost of increased processing when a document is added to the database. The inverted file may be the database file itself, rather than its index. It is the most popular data structure used in document retrieval systems, used on a large scale for example in search engines. Additionally, several significant general-purpose mainframe-based database management systems have used inverted list architectures, including ADABAS, DATACOM/DB, and Model 204.

Example of an Inverted Index

| Word | Documents                                                  |
| ---- | ---------------------------------------------------------- |
| the  | Document 1, Document 3, Document 4, Document 5, Document 7 |
| cow  | Document 2, Document 3, Document 4                         |
| says | Document 5                                                 |
| moo  | Document 7                                                 |

There are two main variants of inverted indexes: 
- A record-level inverted index (or inverted file index or just inverted file) contains a list of references to documents for each word. 
- A word-level inverted index (or full inverted index or inverted list) additionally contains the positions of each word within a document. The latter form offers more functionality (like phrase searches), but needs more processing power and space to be created.

#### [Reverse Index](https://en.wikipedia.org/wiki/Reverse_index)

Reverse Indexes are used to reverse the digits or characters in a dictionary storage key to avoid contention in busy transactional data storage systems.

### Database Pages

In relational databases, table data is typically stored in a set of sequential records spread over several Pages.  When defining a table, the database configuration and table creation statements instruct how full each Page will be maintained.  Pages which are mostly empty utilize excessive disk space, whereas pages which are mostly full suffer from fragmentation issues and modification delays.

Inside each Page, data is stored sequentially in contiguous blocks of memory.

Typically Pages are used to calculate hint statistics and metadata which aids as a high level search index to find the first item in each Page.

### Search Algorithm concepts

#### [Brute Force Search (No Knowledge)](https://en.wikipedia.org/wiki/Brute-force_search)

A naive and simplistic exhaustive search where every element in a data structure is assessed for suitability against a search condition. This type of search is known to be exceptionally slow in unstructured and unsorted data.

#### [Backward Induction Search](https://en.wikipedia.org/wiki/Backward_induction)

Backward induction is the process of reasoning backwards in time, from the end of a problem or situation, to determine a sequence of optimal actions. It proceeds by examining the last point at which a decision is to be made and then identifying what action would be most optimal at that moment. Using this information, one can then determine what to do at the second-to-last time of decision. This process continues backwards until one has determined the best action for every possible situation (i.e. for every possible information set) at every point in time.

- In the mathematical optimization method of dynamic programming, backward induction is one of the main methods for solving the Bellman equation.
- In game theory, backward induction is a method used to compute sub-game perfect equilibria in sequential games.

#### [Heuristics Search (Partial Knowledge)](https://en.wikipedia.org/wiki/Heuristic_(computer_science))

In mathematical optimization and computer science, heuristic (from Greek εὑρίσκω "I find, discover") is a technique designed for solving a problem more quickly when classic methods are too slow, or for finding an approximate solution when classic methods fail to find any exact solution. This is achieved by trading optimality, completeness, accuracy, or precision for speed. In a way, it can be considered a shortcut.

A heuristic function, also called simply a heuristic, is a function that ranks alternatives in search algorithms at each branching step based on available information to decide which branch to follow. For example, it may approximate the exact solution.

#### [Local Consistency and Constraint Propagation](https://en.wikipedia.org/wiki/Local_consistency)

In constraint satisfaction, local consistency conditions are properties of constraint satisfaction problems related to the consistency of subsets of variables or constraints. They can be used to reduce the search space and make the problem easier to solve. Various kinds of local consistency conditions are leveraged, including node consistency, arc consistency, and path consistency.

Every local consistency condition can be enforced by a transformation that changes the problem without changing its solutions. Such a transformation is called constraint propagation. Constraint propagation works by reducing domains of variables, strengthening constraints, or creating new ones. This leads to a reduction of the search space, making the problem easier to solve by some algorithms. Constraint propagation can also be used as an unsatisfiability checker, incomplete in general but complete in some particular cases.

### [Combinatorial Search](https://en.wikipedia.org/wiki/Combinatorial_search)

In computer science and artificial intelligence, combinatorial search studies search algorithms for solving instances of problems that are believed to be hard in general, by efficiently exploring the usually large solution space of these instances. Combinatorial search algorithms achieve this efficiency by reducing the effective size of the search space or employing heuristics

Lookahead constraints in combinatorial searches are used to limit the depth of search, as traditionally hard search domains quickly exhaust computing resources.

#### [Alpha-Beta Pruning](https://en.wikipedia.org/wiki/Alpha%E2%80%93beta_pruning)

Alpha–beta pruning is a search algorithm that seeks to decrease the number of nodes that are evaluated by the minimax algorithm in its search tree. It is an adversarial search algorithm used commonly for machine playing of two-player games (Tic-tac-toe, Chess, Go, etc.). It stops evaluating a move when at least one possibility has been found that proves the move to be worse than a previously examined move. Such moves need not be evaluated further. When applied to a standard minimax tree, it returns the same move as minimax would, but prunes away branches that cannot possibly influence the final decision.

#### [Branch and Bound](https://en.wikipedia.org/wiki/Branch_and_bound)

Branch and bound (BB, B&B, or BnB) is an algorithm design paradigm for discrete and combinatorial optimization problems, as well as mathematical optimization. A branch-and-bound algorithm consists of a systematic enumeration of candidate solutions by means of state space search: the set of candidate solutions is thought of as forming a rooted tree with the full set at the root. The algorithm explores branches of this tree, which represent subsets of the solution set. Before enumerating the candidate solutions of a branch, the branch is checked against upper and lower estimated bounds on the optimal solution, and is discarded if it cannot produce a better solution than the best one found so far by the algorithm.

The algorithm depends on efficient estimation of the lower and upper bounds of regions/branches of the search space. If no bounds are available, the algorithm degenerates to an exhaustive search.

#### [MinMax](https://en.wikipedia.org/wiki/Minimax)

Minimax (sometimes MinMax, MM] or saddle point) is a decision rule used in artificial intelligence, decision theory, game theory, statistics, and philosophy for minimizing the possible loss for a worst case (maximum loss) scenario. When dealing with gains, it is referred to as "maximin"—to maximize the minimum gain. Originally formulated for n-player zero-sum game theory, covering both the cases where players take alternate moves and those where they make simultaneous moves, it has also been extended to more complex games and to general decision-making in the presence of uncertainty.

## [Graphs](https://en.wikipedia.org/wiki/Graph_(abstract_data_type))

### Graph Search

#### [Breadth First Search](https://en.wikipedia.org/wiki/Breadth-first_search)

Breadth-first search (BFS) is an algorithm for traversing or searching tree or graph data structures. It starts at the tree root (or some arbitrary node of a graph, sometimes referred to as a 'search key'), and explores all of the neighbor nodes at the present depth prior to moving on to the nodes at the next depth level.

Breadth-first search is excellent at reducing the problem domain scope, when combined with pruning.

![BFS](https://upload.wikimedia.org/wikipedia/commons/4/46/Animated_BFS.gif)

Pseudocode

```
procedure BFS(G, root) is
  let Q be a queue
  label root as discovered
  Q.enqueue(root)
  while Q is not empty do
    v := Q.dequeue()
    if v is the goal then
      return v
    for all edges from v to w in G.adjacentEdges(v) do
      if w is not labeled as discovered then
        label w as discovered
        Q.enqueue(w)
```

#### [Depth First Search](https://en.wikipedia.org/wiki/Depth-first_search)

Depth-first search (DFS) is an algorithm for traversing or searching tree or graph data structures. The algorithm starts at the root node (selecting some arbitrary node as the root node in the case of a graph) and explores as far as possible along each branch before backtracking.

Due to the nature of exhaustive evaluation of a branch before backtracking, it is a natural search algorithm which pairs with recursive functions.

![DFS](https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Depth-First-Search.gif/220px-Depth-First-Search.gif)

```
procedure DFS_iterative(G, v) is
    let S be a stack
    S.push(v)
    while S is not empty do
        v = S.pop()
        if v is not labeled as discovered then
            label v as discovered
            for all edges from v to w in G.adjacentEdges(v) do 
                S.push(w)
```

#### [A* Star Search](https://en.wikipedia.org/wiki/A*_search_algorithm)

A* is an informed search algorithm, or a best-first search, meaning that it is formulated in terms of weighted graphs: starting from a specific starting node of a graph, it aims to find a path to the given goal node having the smallest cost (least distance travelled, shortest time, etc.). It does this by maintaining a tree of paths originating at the start node and extending those paths one edge at a time until its termination criterion is satisfied.

![A*](https://upload.wikimedia.org/wikipedia/commons/5/5d/Astar_progress_animation.gif)

[Further Reading for Goal Oriented Action Planning](/search?query=GOAP)

## Genetic Algorithms

Genetic Algorithms are derived from traditional biological processes of genetic mixing, through instruction and variable selection, crossover, and mutation.  Due to their ability to solve traditionally hard problems, without using human deductive reasoning, they are often used when other techniques have failed to achieve an appropriate solution.  Conceptually, in this domain, programs are able to write themselves, as a satisfactory measure is inbuilt to determine when a solution achieves a goal.  In addition, genetic algorithms are only really practical when operating in parallel with a pool simultaneous algorithms competing to solve the solution.

## Constraint Satisfaction Problems

Constraint Satisfaction Problems (CSPs) are a broad strategy to define the conditions under which a problem can be deemed solved.

- Variables - The contextual players of the problem, 
- Domains - The contextual options which govern the players
- Constraints - The contextual limitations placed upon the players and domain, which must be satisfied to achieve a solution to the problem

### CSP Example using Sudoku

In classic sudoku, the objective is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3 subgrids that compose the grid (also called "boxes", "blocks", or "regions") contain all of the digits from 1 to 9. The puzzle setter provides a partially completed grid, which for a well-posed puzzle has a single solution.

Variables 
- The 81 cells within the 9x9 grid
Domain 
- The numbers from 1 to 9, and empty
- The 9 rows
- The 9 columns
- The 9 3x3 sub-grids
Constraints
- That each row must contain the numbers 1 through 9
- That each column must contain the numbers 1 through 9
- That each 3x3 sub-grid must contain the numbers 1 through 9
- That any cell already containing a value in the supplied partially completed grid, is fixed
- That all 81 cells must contain a value (redundant as covered already by the above constraints)

Note: It is intentional to word the constraints all in positive language, however it is possible to write the constraints in negative constraints also.  By writing them all as either positive conditions, or negative conditions, the implementation is more consistent.

### CSP solutions

The primary problem is finding the state of a set of variables within the domains which satisfy the constraints.

Options to tackle CSPs typically require a couple of core features.
- Data structures to store the lists of variables, domains (and probably constraints also)
- Operations which iterate over possible solutions, but stop when solution is solved
- Operations which evaluate each and all of the constraints, for a given set of variables and domain
- Optimizations
  - Operations which recognize when a path to seek a solution is a dead end (Back tracking)
  - Operations which can forward search for easy solutions when nearly complete (Look ahead)

## Clustering Algorithms

Clustering algorithms attempt to detect similarity between values within data sets, such that automated grouping can be achieved.  Clustering algorithms are used extensively in machine learning, particularly in unsupervised learning or data set inspection.

Clustering algorithm are useful for classifying groups of points, and also for finding outliers in the data set.

### [K-Means Clustering](https://en.wikipedia.org/wiki/K-means_clustering)

K-Means is one of the most trivial clustering algorithms and is easy to implement.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/K-means_convergence.gif/220px-K-means_convergence.gif)

1. Select K random points as centroids in the data set range
2. For each data set point, assign the data set point to the nearest centroid (using the squared Euclidean distance)
3. Update the centroid position, such that the new position is in the mean of the assigned data points
4. Repeat steps 2 and 3 until convergence occurs and the centroids no longer move

Issues: 
- Not guaranteed to find optimum solution
- Performance dependent on 
  - the number of K
  - the number of data set points
  - initial position of starting points
  - the rate of movement into convergence locations
  - the detection of convergence

### K-Nearest Neighbor Clustering

1. Load the data
2. Initialize K to your chosen number of neighbors
3. For each example in the data
    1. Calculate the distance between the query example and the current example from the data.
        i.e. Distance each point between neighbors.
    2. Add the distance and the index of the example to an ordered collection
4. Sort the ordered collection of distances and indices from smallest to largest (in ascending order) by the distances
5. Pick the first K entries from the sorted collection
6. Get the labels of the selected K entries
7. If regression, return the mean of the K labels
8. If classification, return the mode of the K labels

Issues: 
- Slow as the number of points increases
- Improvements can be made by limiting the range of search to find neighbors

### Means Shift

Means Shift algorithm is used to achieve clustering in a non-circular solution.

When using means shift, each data point slowly progresses over a gradient toward local means.

![](https://media.geeksforgeeks.org/wp-content/uploads/20190508162515/anigif.gif)
![](https://miro.medium.com/max/432/1*vyz94J_76dsVToaa4VG1Zg.gif)

1. First, calculate the Kernel Density Estimate for the data points.
2. Shift each point toward the local maxima, from the KDE.

Benefits:
- Highly resilient to outliers in the data set
- Great at deducing the number of clusters

Issues:
- Not guaranteed to result in an optimum result
- Calculating the KDE can be costly

### Density Based Spatial Clustering (DBSCAN)

### Expectation Maximization Clustering using Gaussian Mixture Models (GMMs)

![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/ClusterAnalysis_Mouse.svg/450px-ClusterAnalysis_Mouse.svg.png)

### Agglomerative Hierarchical Clustering 

## Compression Algorithms

## Encryption Algorithms

## Algorithm libraries

- C/C++
  - [Boost](https://www.boost.org/) - *[Documentation 1.75.0](https://www.boost.org/doc/libs/1_75_0/)*
  - [CGAL](https://www.cgal.org/) - *[Documentation](https://doc.cgal.org/latest/Manual/packages.html)*
  - [LEDA](https://www.algorithmic-solutions.com/index.php/products/leda-for-c) - *[Documentation](http://www.algorithmic-solutions.info/leda_manual/MANUAL.html)*
  - [ALGLIB](https://www.alglib.net/) - *[Documentation](https://www.alglib.net/docs.php)*
  - [MLPack Machine Learning algorithms](https://mlpack.org/) 
  - [Algorithm list on cppreference.com](https://en.cppreference.com/w/cpp/algorithm)
  - [C++ STL examples on GeeksforGeeks.org](https://www.geeksforgeeks.org/algorithms-library-c-stl/)
  - [C++ STL articles on fluentcpp.com](http://www.fluentcpp.com/STL/)