---
layout: post
title: "Compilers and Transpilers"
date: 2020-12-17
tags: compiler tree ast cst transpiler
image: https://images.unsplash.com/photo-1587654780291-39c9404d746b
thumb: https://images.unsplash.com/photo-1587654780291-39c9404d746b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8bGVnb3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@xavi_cabrera
type: article
---

A super brief summary of the really complex subject of compilers and transpilers

## Source Code vs Machine Code

Compilers are really about transforming source code from high level languages into low level instructions.  Compilation is therefore targeting a specific device or set of devices where the same instruction set is supported.

### High level languages

Typically, when a developer is approaching a software development task, they approach the work using a high level language.  These languages are:
- easy to read
- portable
- extensible
- scalable
- generic
- supports testing

When using these high level languages, developers are typically not concerned with: 
- stack and heap separation
- memory limitations
- garbage collection
- register allocation

### Low level languages 

Most computer hardware designers need a more specific targeted set of instructions, which are suitable for their specific.  In fact, modern computers utilise a large collection of different processor units which operate in parallel, and which each need vendor specific instruction sets.  

Low level languages excel at tasks which are:
- precision constrained, i.e. 8-bit, 32 bit, 64 bit architectures
- aware of vendor specific instruction sets
- aware of optimizations for vendor devices
- aware of memory limitations

Instruction sets express very low level operations which instruct a device which features and behaviors are required, and how to manage resources which are to be controlled.

## The Process of Compilers

1. Source Code
   
   Developers maintain the source code using a high level language

2. Lexical analysis
   
   A lexical analysis process interprets the source code, and splits the code into tokens

3. Tokenization
   
   Tokens are interpreted as keywords, operands, variable names, and other token types

4. Syntax analysis, semantic parsing and high level verification
   
    Syntax analysis interprets the sequence of tokens, to validate if the tokens make syntactical sense.  
    
    Semantic parsing interprets sequences of individual statements also called expressions to verify that lines of code, make contextual sense within the sequence of lines before and after.

    High level verification attempts to interpret the structure of operations within the context of the whole application.

5. Abstract Syntax Tree
   
    An outcome of the structural interpretation of an application is a Parse Tree, which represents what individual expressions look like.  Combining all expressions can be used to construct a Concrete Syntax Tree (CST).
    
    Abstract Syntax Trees (AST) contain the simplified information required for interpreting the source code text.  Typically, only significant aspects of expressions are represented in ASTs.

    Sometimes construction of a CST is skipped, to directly create AST representations of source code.

8. Optimization
   
    Optimization processes inspect expressions within the context of the target architecture and the syntax tree, thereby:
    
    - improve performance
    - managing resource constraints
    - modify the sequence of expressions to condense the tree

9.  Linking, pruning and generation
    
    Loads external dependencies in a process called linking.  Combines interdependent syntax trees to obtain a complete syntax tree.

    Converts the final syntax tree to create a set of binary instructions which are executed on the processing unit.

    Expressions not required are typically pruned, to reduce the size of the final binary product.

    The final binary product is then typically stored in a file. (i.e. file extensions such as .EXE, .DLL, .BIN, .LIB, .so or .o etc. are often used)

## Different types of compilers

- Native compiler

    Converts source code into a binary product suitable for the current platform architecture only.

- Cross compiler

    Converts source code into a binary product suitable for a platform, different to the current development platform. 

- Source-to-Source (Conversion) compiler

    Converts code from high level languages into lower level languages, often to achieve

    - Minification
    - Obfuscation
    - Encryption
    - Compression

## Transpilers

Transpilers are different to compilers.  The aim of a transpiler is to convert from one high level language into another representative language.  

i.e. converts from source code into another language at the same level of abstraction

The reason transpilers are required is because some applications support the runtime interpretation of source text, and will support the execution of features and behaviors on behalf of the trusted source.

Examples of transpilers include:

- Typescript -> Javascript
  
  Web Browsers can interpret JavaScript, but typically do not directly support TypeScript

- SASS / SCSS -> CSS

    Web Browsers typically do not support SASS or SCSS notation for stylesheets, relying instead on CSS, which has been generated from SASS or SCSS

## Interpreters

Process source code which can be executed without conversion, is directly interpreted.  A host application typically sequentially executes source expressions, one at a time.


In this case:
- there is no binary product containing byte code instructions
- a transpiler is not utilized, as it is not required