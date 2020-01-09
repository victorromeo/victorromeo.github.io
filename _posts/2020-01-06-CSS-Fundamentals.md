---
layout: post
title: "CSS Fundamentals"
date: 2020-01-02
tags: css style 
image: https://images.unsplash.com/photo-1510936994138-07e06c7c5add?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9
thumb: https://images.unsplash.com/photo-1510936994138-07e06c7c5add?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@kellysikkema
type: spec
---

Cascading Style Sheets provide an additional layer of visual styling over HTML Document Object Model elements, in a hierarchical, forward applied, declarative manner.  

<!-- markdownlint-disable MD018 MD033 -->

<style>
    table {
        width:100%;
        border-collapse: collapse;
    }

    table, th, td {
        border: 1px solid lightgray;
    }

    th, td {
        padding: 5px;
    }

    table th:first-of-type {
        width:35%;
    }

    table th:nth-of-type(2) {
        width:25%;
    }
</style>

- Styles cascade
  - Styles which are defined can replace previously defined styles
- Styles can be declared
  - inside the head of the HTML within style tags<br>
        `<head> <style>...</style> </head>`
  - inside the body of the HTML within style tags<br>
        `<body> <style>...</style> </body>`
  - inline within HTML tags<br>
        `<input style="..." />`
  - _**(Best Practice)**_<br>
        externally in files which are referenced and linked to the HTML document inside the HTML head<br>
        `<head> ... <link rel="stylesheet" href="site-styles.css"> ... </head>`
- Styles modify the appearance of HTML DOM elements using selectors which match to tags, attributes, and behaviors on HTML
- Styles effect **DOM element properties**
- Styles are context specific, in that:
  - a single style may alter the appearance of zero, one or more multiple elements
  - multiple styles may modify the appearance of any one DOM element
  - one style may obscure the visual appearance effects of other styles
  - some DOM elements do not support the style specific declarations intended for other DOM element tag types
  - some browsers interpret the style declarations of CSS in different ways

## CSS Comments

<div class="card">
    <div class="card-header">CSS Comments</div>
    <div class="card-body container">
        <blk  data-enlighter-language="css">
/*external comment*/
p {
    /*internal single line comment*/
    /*internal multiline
    comment*/
    color: red;
}
        </blk>
    </div>
</div><br>

## CSS Selectors

### Basic CSS Selectors

|                 syntax | type                   | description                                                            |
| ---------------------: | ---------------------- | ---------------------------------------------------------------------- |
|            `p { ... }` | **element** selector   | All document tags of specified type will be effected                   |
|     `#idValue { ... }` | **id** selector        | Any document tags with specified id _(typically one)_ will be effected |
|  `.classValue { ... }` | **class** selector     | Any document tags with specified class will be effected                |
| `[attr=value] { ... }` | **attribute** selector | Any document tags with specified attribute having specified value      |

### Combinator Selectors

|                          syntax | type                          | description                                                                                                                                                                           |
| ------------------------------: | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `selectorA + selectorB { ... }` | **adjacent sibling** selector | Any tag matching selector B which is immediately adjacent to a DOM element matching selector A on the same depth of the DOM, inside the same parent                                   |
| `selectorA ~ selectorB { ... }` | **general sibling** selector  | Any tag matching selector B which is adjacent (but not necessarily immediately adjacent) to a DOM element matching selector A on the same depth of the DOM, inside in the same parent |
|        `parent > child { ... }` | **direct child** selector     | Any specified element which is direct child of a parent tag                                                                                                                           |
|     `parent descendant { ... }` | **descendant** selector       | Any tag matching selector B which is adjacent (but not necessarily immediately adjacent) to a DOM element matching selector A on the same depth of the DOM, inside in the same parent |
|     `parent descendant { ... }` | **descendant** selector       | Any tag matching selector B which is adjacent (but not necessarily immediately adjacent) to a DOM element matching selector A on the same depth of the DOM, inside in the same parent |

### Pseudo Selectors

|                                 syntax | type                          | description                                                                                                                                                                                                                                                                                               |
| -------------------------------------: | ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|            `<optional>:active { ... }` | **active** selector           | Applies the style to a DOM element which the user is activating, i.e. click on button                                                                                                                                                                                                                     |
|             `<optional>:focus { ... }` | **focus** selector            | Applies the style on a DOM element which has the current browser focus, i.e. cursor in text box                                                                                                                                                                                                           |
|             `<optional>:hover { ... }` | **hover** selector            | Applies the style when the mouse cursor is over an element                                                                                                                                                                                                                                                |
|           `<optional>:visited { ... }` | **visited** selector          | Applies the style on a link when the browser history remembers a visit to the destination URL                                                                                                                                                                                                             |
|     `<required>:first-of-type { ... }` | **first-of-type** selector    | Applies the style to the first element of a type                                                                                                                                                                                                                                                          |
|    `<required>:nth-of-type(p) { ... }` | **nth-of-type** selector      | Applies style to an element using an order condition, where _p_ is comprised of <br> “a” is an integer value <br> “n” is the literal letter “n”, used to skip <br> “+” is an operator and may be either “+” or “-" <br>“b” is an integer and is required if an operator is included in the formula        |
|      `<required>:last-of-type { ... }` | **last-of-type** selector     | Applies the style the last element of a type                                                                                                                                                                                                                                                              |
| `<required>:n-last-of-type(p) { ... }` | **nth-last-of-type** selector | Applies style to an element using a reverse order condition, where _p_ is comprised of <br> “a” is an integer value <br> “n” is the literal letter “n”, used to skip <br> “+” is an operator and may be either “+” or “-" <br>“b” is an integer and is required if an operator is included in the formula |
|      `<required>:nth-child(p) { ... }` | **nth-child** selector        | Applies style to a child element using an order condition, where _p_ is comprised of <br> “a” is an integer value <br> “n” is the literal letter “n”, used to skip <br> “+” is an operator and may be either “+” or “-" <br>“b” is an integer and is required if an operator is included in the formula   |

### Pseudo Elements

|                                  syntax | type                      | description                                                     |
| --------------------------------------: | ------------------------- | --------------------------------------------------------------- |
|  `<required>::after { content: '...' }` | **after** pseudo element  | Add content directly after a matching selector matched element  |
| `<required>::before { content: '...' }` | **before** pseudo element | Add content directly before a matching selector matched element |

## CSS Properties

### Text Properties

|            property | description |
| ------------------: | ----------- |
|               color | -           |
|                font | -           |
|         font-family | -           |
|           font-size | -           |
|         font-weight | -           |
|      letter-spacing | -           |
|         line-height | -           |
|          text-align | -           |
|     text-decoration | -           |
|         text-indent | -           |
| text-transformation | -           |
|      vertical-align | -           |

### List Properties

|            property | description |
| ------------------: | ----------- |
|          list-style |
|    list-style-image |
| list-style-position |
|     list-style-type |

### Background Properties

|              property | description |
| --------------------: | ----------- |
|            background |
| background-attachment |
|      background-color |
|      background-image |
|   background-position |
|     background-repeat |

### Display Properties

|   property | description |
| ---------: | ----------- |
|    display |
|      float |
|      clear |
|   overflow |
| visibility |

### Box Properties

|     property | description |
| -----------: | ----------- |
|       border |
| border-color |
| border-style |
| border width |
|       height |
|        width |
|      padding |
|       margin |
|   box-sizing |

### Position Properties

| property | description |
| -------: | ----------- |
| position |
|      top |
|   bottom |
|     left |
|    right |
|  z-index |

### Other Properties

| property | description |
| -------: | ----------- |
|   cursor |