---
layout: post
title: "JavaScript"
date: 2020-01-01
tags: javascript
---

A simple summary of JavaScript 

<style>

    .table td {
        /* padding: 0; */
    }

    .tn {
        color: black;
        font-size: 1.1em;
    }

    .tn.tx {
        display: inline;
    }
    
    .tx {
        display: inline-block;
    }
</style>

<div class="row">

<div class="col-lg-6 col-sm-12">
    <div class="card mb-3" >
        <div class="card-header tn">Data Types</div>
        <div class="card-body">
            <table class="table table-sm">
                <tr><td><span class="border border-danger rounded">S</span></td><th>var s = "string";</th><td>String</td></tr>
                <tr><td><span class="border border-primary rounded">N</span></td><th>var n = 4.0;</th><td>Number</td></tr>
                <tr><td><span class="border border-warning rounded">B</span></td><th>var b = True;</th><td>Boolean</td></tr>
                <tr><td><span class="border border-primary rounded">N[]&nbsp;</span></td><th>var a = [1,2,3,4];</th><td>Array of numbers</td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>var a = ["a","b","c"];</th><td>Array of strings</td></tr>
                <tr><td><span>*</span></td><th>var g = /()/;</th><td>Regular Expression syntax</td></tr>
                <tr><td><span class="border border-primary rounded">N</span></td><th>const n = 4.0;</th><td>Constant Number, runtime immutable</td></tr>
                <tr><td><span class="border border-primary rounded">N</span></td><th>let n = 4.0;</th><td>Block scope number definition, ie. inside functions</td></tr>
            </table>
        </div>
    </div>
</div>

<div class="col-lg-6 col-sm-12">
    <div class="card mb-3" >
        <div class="card-header tn">Using data types</div>
        <div class="card-body">
            <table class="table table-sm">
                <tr class="table-active"><td colspan="2" class="col-*">Assignment</td></tr>
                <tr><th>var s = "string";</th><td>Stores the value into the variable</td></tr>
                <tr class="table-active"><td colspan="2" class="col-*">Comparison</td></tr>
                <tr><th>a == b</th><td>Equals</td></tr>
                <tr><th>a === b</th><td>Strictly Equals</td></tr>
                <tr><th>a != b</th><td>Not equal</td></tr>
                <tr><th>!(a == b)</th><td>Logical not of a == b</td></tr>
                <tr><th>a !== b</th><td>Strictly not equal</td></tr>
                <tr><th>a &lt; b</th><td>Less than</td></tr>
                <tr><th>a &lt;= b</th><td>Less than, or equal</td></tr>
                <tr><th>a &gt; b</th><td>Greater than</td></tr>
                <tr><th>a &gt;= b</th><td>Greater than</td></tr>
                <tr class="table-active"><td colspan="2" class="col-*">Arithmetic</td></tr>
                <tr><th>a += b</th><td>Adds a and b, then assigns value to a</td></tr>
                <tr><th>a -= b</th><td>Subtracts b from a, then assigns value to a</td></tr>
                <tr><th>a /= b</th><td>Divides a by b, then assigns value to a</td></tr>
                <tr><th>a *= b</th><td>Multiplies a and b, then assigns value to a</td></tr>
                <tr class="table-active"><td colspan="2" class="col-*">Logic</td></tr>
                <tr><th>a && b</th><td>Logical a AND b</td></tr>
                <tr><th>a || b</th><td>Logical a or b</td></tr>
                <tr class="table-active"><td colspan="2" class="col-*">Bitwise Operators</td></tr>
                <tr><th>a & b</th><td>AND</td></tr>
                <tr><th>a | b</th><td>OR</td></tr>
                <tr><th>a ^ b</th><td>XOR</td></tr>
                <tr><th>~ b</th><td>NOT (complement)</td></tr>
                <tr><th>a &lt;&lt; b</th><td>Shift a left b bits (Increase)</td></tr>
                <tr><th>a &gt;&gt; b</th><td>Shift a right b bits (Decrease)</td></tr>
                <tr><th>a &gt;&gt;&gt; b</th><td>Shift a right b bits (Decrease), filling with zeroes</td></tr>
                <tr class="table-active"><td colspan="2" class="col-*">Other</td></tr>
                <tr><th>typeof a</th><td>Returns the type of variable 'a' (number, string, object, function)</td></tr>
                <tr><th>var a;</th><td>undefined, meaning has not been assigned a value</td></tr>
                <tr><th>var a = null;</th><td>null, has been assigned a non value</td></tr>
            </table>
        </div>
    </div>
</div>

<div class="col-lg-6 col-sm-12">
    <div class="card mb-3" >
        <div class="card-header tn"><span class="border border-primary rounded">N</span> Number()</div>
        <div class="card-body">
            <table class="table table-sm">
                <tr class="table-active"><td class="col-*">Return</td><th class="col-*">Properties</th><td class="col-*"></td></tr>
                <tr><td><span class="border border-primary rounded">N</span></td><th>.POSITIVE_INFINITY</th><td>+inf equivalent</td></tr>
                <tr><td><span class="border border-primary rounded">N</span></td><th>.NEGATIVE_INFINITY</th><td>-inf equivalent</td></tr>
                <tr><td><span class="border border-primary rounded">N</span></td><th>.MAX_VALUE</th><td>largest positive value</td></tr>
                <tr><td><span class="border border-primary rounded">N</span></td><th>.MIN_VALUE</th><td>smallest positive value</td></tr>
                <tr><td><span class="border border-primary rounded">N</span></td><th>.EPSILON</th><td>difference between 1 and smallest > 1</td></tr>
                <tr><td></td><th>.NaN</th><td>not a number value</td></tr>
                 <tr class="table-active"><td class="col-*">Return</td><th class="col-*">Methods</th><td class="col-*"></td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>.toExponential(dec)</th><td>exponential notation</td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>.toFixed(dec)</th><td>fixed-point notation</td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>.toPrecision(dec)</th><td>change precision</td></tr>
                <tr><td><span class="border border-warning rounded">B</span></td><th>.isFinite(n)</th><td>checks if number is finite</td></tr>
                <tr><td><span class="border border-warning rounded">B</span></td><th>.isInteger(n)</th><td>checks if number is an integer</td></tr>
                <tr><td><span class="border border-primary rounded">N</span></td><th>.parseInt(n)</th><td>string to integer conversion</td></tr>
                <tr><td><span class="border border-primary rounded">N</span></td><th>.parseFloat(n)</th><td>string to float conversion</td></tr>
            </table>
        </div>
    </div>
</div>

<div class="col-lg-6 col-sm-12">
    <div class="card mb-3" >
        <div class="card-header tn"><span class="border border-danger rounded">S</span> Strings</div>
        <div class="card-body">
            <table class="table table-sm">
                <tr class="table-active"><td class="col-*">Return</td><th class="col-*">Properties</th><td class="col-*"></td></tr>
                <tr><td><span class="border border-primary rounded">N</span></td><th>.length</th><td>length of string</td></tr>
                <tr class="table-active"><td class="col-*">Return</td><th class="col-*">Accessor</th><td class="col-*"></td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>[2]</th><td>Array accessor, returns character at index offset 2 (Unsafe if length of string < 2)</td></tr>
                 <tr class="table-active"><td class="col-*">Return</td><th class="col-*">Methods</th><td class="col-*"></td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>.charAt(2)</th><td>Returns character at index offset 2</td></tr>
                <tr><td><span class="border border-danger rounded">s</span></td><th>.charCodeAt(2)</th><td>Returns the ascii code of the character at position 2</td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>.concat("1","2","3")</th><td>Returns string with values "123" appended to the end of the string</td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>.indexOf("value")</th><td>find first occurrence of string, or -1</td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>.lastIndexOf("value")</th><td>find last occurrence of string, or -1</td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>.replace("abc","123")</th><td>Returns the string with all instances of string "abc" replaced with "123"</td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>.slice(3,6)</th><td>Returns string with characters inside range removed. Negative numbers are from end of string.</td></tr>
                <tr><td><span class="border border-danger rounded">S[]&nbsp;</span></td><th>.split(",")</th><td>Returns an array of strings, split using the provided separator</td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>.toLowerCase()</th><td>Returns string in "lower case"</td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>.toUpperCase()</th><td>Returns string in "UPPER CASE"</td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>value.toString()</th><td>Returns value as string</td></tr>
                <tr><td><span class="border border-danger rounded">S</span></td><th>value.toString(16)</th><td>Returns number value as hex string</td></tr>
            </table>
        </div>
    </div>
</div>

<div class="col-12">
    <div class="card mb-3" >
        <div class="card-header">RESTful Architecture</div>
        <div class="card-body">
            <p class="card-text">Stateless : client state data is typically not stored on the server</p>
            <p class="card-text">Client <--> Server : Separation between client and server, supports isolation, independence, atomicity</p>
            <p class="card-text">Cache : Data can be cached on the client</p>
            <p class="card-text">URL Composition : data type and record identity is conveyed through the URL</p>
            <p class="card-text">HTTP verbs : GET, POST, PUT, DELETE used to perform CRUD
            <ul>
                <li><b>GET</b> - Read a record or get many records of a type
                    <ul>
                        <li>HTTP Response Code 200 (OK) on success</li>
                        <li>HTTP Response Code 404 (NOT FOUND) or 400 (Bad Request) on error</li>
                    </ul>
                </li>
                <li><b>POST</b> - Add a record, or subordinate (child) records of another parent object
                    <ul>
                        <li>HTTP Response Code 201 on success, returning a location header with a link to the newly created resource.</li>
                    </ul>
                </li>
                <li><b>PUT</b> - Update a record
                    <ul>
                        <li>On edit, HTTP Response Code 200 on success, or 204 if not returning content in body.</li>
                        <li>On create, HTTP Response Code 201 on success.</li>
                    </ul>
                </li>
                <li><b>DELETE</b> - Remove a record
                    <ul>
                        <li>HTTP Response Code 200 (OK) on success, with response body</li>
                    </ul>
                </li>
                <li><b>PATCH</b> - Modify a record, by sending only the changes in the request body (with instructions)
                    <ul>
                        <li>Use JSON patch or XML patch to describe in the body how a new resource will be created.</li>
                    </ul>
                </li>
            </ul>
            </p>
        </div>
    </div>
</div>

<div class="col-12">
    <div class="card mb-3" >
        <div class="card-header"><a href="https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch">Fetch API</a></div>
        <div class="card-body">
            <p class="card-text">Fetch supports asynchronous data transmission over HTTP</p>
            <blk data-enlighter-language="js">
fetch('http://example.com/movies.json')
    .then((response) => {
    return response.json();
    })
    .then((myJson) => {
    console.log(myJson);
    });
            </blk>
            <p class="card-text">
            The fetch specification differs from jQuery.ajax() in three main ways:
            <ol>
                <li>The Promise returned from fetch() won’t reject on HTTP error status even if the response is an HTTP 404 or 500. Instead, it will resolve normally (with ok status set to false), and it will only reject on network failure or if anything prevented the request from completing.</li>
                <li>fetch() won't receive cross-site cookies; you can’t establish a cross site session using fetch. Set-Cookie headers from other sites are silently ignored.</li>
                <li>fetch won’t send cookies, unless you set the credentials init option. (Since Aug 25, 2017. The spec changed the default credentials policy to same-origin. Firefox changed since 61.0b13.)</li>
            </ol>
            </p>
            <blk data-enlightener-language="js">
// Example POST method implementation:
async function postData(url = '', data = {}) {
  // Default options are marked with *
  const response = await fetch(url, {
    method: 'POST', // *GET, POST, PUT, DELETE, etc.
    mode: 'cors', // no-cors, *cors, same-origin
    cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
    credentials: 'same-origin', // include, *same-origin, omit
    headers: {
      'Content-Type': 'application/json'
      // 'Content-Type': 'application/x-www-form-urlencoded',
    },
    redirect: 'follow', // manual, *follow, error
    referrerPolicy: 'no-referrer', // no-referrer, *client
    body: JSON.stringify(data) // body data type must match "Content-Type" header
  });
  return await response.json(); // parses JSON response into native JavaScript objects
}

postData('https://example.com/answer', { answer: 42 })
  .then((data) => {
    console.log(data); // JSON data parsed by `response.json()` call
  });
            </blk>
            <ul>
            <li><a href="https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch#Sending_a_request_with_credentials_included">Send a request with credentials</a></li>
            <li><a href="https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch#Uploading_a_file">Uploading a file</a></li>
            <li><a href="https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch#Uploading_JSON_data">Uploading JSON data</a></li>
            <li><a href="https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch#Uploading_multiple_files">Uploading multiple files</a></li>
            <li><a href="https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch#Processing_a_text_file_line_by_line">Processing a text file line by line</a></li>
            <li><a href="https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch#Checking_that_the_fetch_was_successful">Checking that the fetch was successful</a></li>
            <li><a href="https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch#Supplying_your_own_request_object">Supplying your own request object</a></li>
            </ul>
        </div>
    </div>
</div>

</div>
