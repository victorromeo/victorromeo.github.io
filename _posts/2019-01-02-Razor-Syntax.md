---
layout: post
title: "ASP.Net MVC Razor Syntax"
date: 2019-12-27
tags: Microsoft web asp.net razor
image: https://images.unsplash.com/photo-1524230616393-d6229fcd2eff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9
imagecredit: https://unsplash.com/@joshsorenson
type: spec
---

ASP.NET MVC Razor Syntax which is rendered via the Razor View Engine has been around a while.  Razor is the new defacto standard for server rendered ASP.NET web applications, having surpassed the ASP.NET Web Forms technology due to its ease and flexibility particularly due to its natural melding of C# and HTML syntax, design time error detection and template capabilities.

The Razor syntax is used in Razor Pages, MVC and Blazor web app technologies, although not all technologies implement the full syntax.

<style>
.highlighter-rouge {
    padding-left: 20px;
}
</style>

[Source - Syntax Reference](https://docs.microsoft.com/en-us/aspnet/core/mvc/views/razor?view=aspnetcore-3.1)

The `@` character transitions from HTML to Razor syntax

- Simple example `<p>@model</p>`
- Multiline example 
    ```xml
    <p>
    @if (value % 2 == 0)
    {
        <div>The value was even.</div>
    }
    </p>
    ```
- Accessor support `<p>@DateTime.Now.Year</p>`
- Escaping the `@` character is supported by a double `@@`
<br>e.g. `<p>@@Username</p>`

## Enabling Razor Pages

```csharp
public class Startup
{
    public Startup(IConfiguration configuration)
    {
        Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    public void ConfigureServices(IServiceCollection services)
    {
        // Enable the Razor View Engine 
        services.AddRazorPages();
    }

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
        if (env.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
        }
        else
        {
            app.UseExceptionHandler("/Error");
            app.UseHsts();
        }

        app.UseHttpsRedirection();
        app.UseStaticFiles();

        app.UseRouting();

        app.UseAuthorization();

        app.UseEndpoints(endpoints =>
        {
            // Map the Razor pages to endpoints
            endpoints.MapRazorPages();
        });
    }
}
```


### Control Structures

#### @if, else if and else statements

```html
@if (value % 2 == 0)
{
    <p>The value was even.</p>
}
else if (value >= 1337)
{
    <p>The value is large.</p>
}
else
{
    <p>The value is odd and small.</p>
}
```

#### @switch case statement

```html
@switch (value)
{
    case 1:
        <p>The value is 1!</p>
        break;
    case 1337:
        <p>Your number is 1337!</p>
        break;
    default:
        <p>Your number wasn't 1 or 1337.</p>
        break;
}
```

#### @for loop statement

```html
@for (var i = 0; i < people.Length; i++)
{
    var person = people[i];
    <p>Name: @person.Name</p>
    <p>Age: @person.Age</p>
}
```

#### @foreach statement

```html
@foreach (var person in people)
{
    <p>Name: @person.Name</p>
    <p>Age: @person.Age</p>
}
```

#### @while statement

```html
@{ var i = 0; }
@while (i < people.Length)
{
    var person = people[i];
    <p>Name: @person.Name</p>
    <p>Age: @person.Age</p>

    i++;
}
```

#### @do while statement

```html
@{ var i = 0; }
@do
{
    var person = people[i];
    <p>Name: @person.Name</p>
    <p>Age: @person.Age</p>

    i++;
} while (i < people.Length);
```

#### Compound @using statements

```html 
@using (Html.BeginForm())
{
    <div>
        Email: <input type="email" id="Email" value="">
        <button>Register</button>
    </div>
}
```

#### @try, catch, finally statement

```html
@try
{
    throw new InvalidOperationException("You did something invalid.");
}
catch (Exception ex)
{
    <p>The exception message: @ex.Message</p>
}
finally
{
    <p>The finally statement.</p>
}
```

#### @lock statement

```html
@lock (SomeLock)
{
    // Do critical section work
}
```

#### Comments

<div class="alert alert-info">Comments inside razor syntax are not rendered, however comments inside HTML syntax are rendered</div>

```html
@{
    /* C# comment */
    // Another C# comment
}
<!-- HTML comment -->
```

## Directives

#### @ 

```html
@{
    var quote = "Getting old ain't for wimps! - Anonymous";
}

<div>Quote of the Day: @quote</div>
```

which generates csharp at runtime similar to the following

```csharp
public class _Views_Something_cshtml : RazorPage<dynamic>
{
    public override async Task ExecuteAsync()
    {
        var output = "Getting old ain't for wimps! - Anonymous";

        WriteLiteral("/r/n<div>Quote of the Day: ");
        Write(output);
        WriteLiteral("</div>");
    }
}
```

#### @attribute

- @attribute directive gives the given attribute to the class of the generated page or view.

```html
@attribute [Authorize]
```

#### @code 
- Enables a [Razor component](https://docs.microsoft.com/en-us/aspnet/core/blazor/components?view=aspnetcore-3.1) to add C# members to a component

```html
@code {
    // C# members (fields, properties, and methods)
}
```

#### @functions
- Enables the adding of C# members (fields, properties and methods) to the generated class
  
```html
@functions {
    public string GetHello()
    {
        return "Hello";
    }
}

<div>From method: @GetHello()</div> 
```

Which generates the following HTML

```html
<div>From method: Hello</div>
```

from the generated Razor C# class 

```csharp 
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Razor;

public class _Views_Home_Test_cshtml : RazorPage<dynamic>
{
    // Functions placed between here 
    public string GetHello()
    {
        return "Hello";
    }
    // And here.
#pragma warning disable 1998
    public override async Task ExecuteAsync()
    {
        WriteLiteral("\r\n<div>From method: ");
        Write(GetHello());
        WriteLiteral("</div>\r\n");
    }
#pragma warning restore 1998
```

Another useful example is the creation of template methods

```html
@{
    RenderName("Mahatma Gandhi");
    RenderName("Martin Luther King, Jr.");
}

@functions {
    private void RenderName(string name)
    {
        <p>Name: <strong>@name</strong></p>
    }
}
```

#### @implements 

- implements an interface on the generated class

```html
@implements IDisposable

<h1>Example</h1>

@functions {
    private bool _isDisposed;

    ...

    public void Dispose() => _isDisposed = true;
}
```

#### @inherits
- Provides full control of the class the view inherits

```html
@inherits TypeNameOfClassToInheritFrom
```

An example of the generated C# class

```csharp

using Microsoft.AspNetCore.Mvc.Razor;

public abstract class CustomRazorPage<TModel> : RazorPage<TModel>
{
    public string CustomText { get; } = 
        "Gardyloo! - A Scottish warning yelled from a window before dumping" +
        "a slop bucket on the street below.";
}
```

The `CustomText` is displayed in a view:
```html
@inherits CustomRazorPage<TModel>

<div>Custom text: @CustomText</div>
```

Which renders the following HTML 

```html
<div>
    Custom text: Gardyloo! - A Scottish warning yelled from a window before dumping
    a slop bucket on the street below.
</div>
```

`@inherits` and `@model` are supported in the same view

```html
@inherits CustomRazorPage<TModel>

<div>The Login Email: @Model.Email</div>
<div>Custom text: @CustomText</div>
```

#### @inject
- Supports injecting a service from the service container into a view
- [Further detail](https://docs.microsoft.com/en-us/aspnet/core/mvc/views/dependency-injection?view=aspnetcore-3.1)

#### @model
- Specifies the type of model passed to a view or page
- _MVC Views or Razor pages only_
  
```html
@model LoginViewModel
```

Which generates the following C# class, which inherits from `RazorPage<dynamic>`

```csharp
public class _Views_Account_Login_cshtml : RazorPage<LoginViewModel> {
    ...
}
```

#### @namespace
- Sets the namespace of the class generated Razor page, MVC view or Razor component

```html
@namespace Your.Namespace.Here
```

#### @page 
- In a .cshtml file, indicates that the file is a Razor page
- Indicates that a Razor component should handle requests directly

#### @section
- Supports the delayed rendering of the DOM, by passing the definition of an section of the DOM to a child partial view
- [Further detail](https://docs.microsoft.com/en-us/aspnet/core/mvc/views/layout?view=aspnetcore-3.1#sections)

```html
<html>
    <head>
        ...
    </head>
    <body>
        ...
        @RenderSection("Scripts", required: false)
    </body>
</html>
```

Where the `Scripts` section is defined in a child view

```html
@section Scripts {
     <script type="text/javascript" src="~/scripts/main.js"></script>
}
```

Which will render as follows

```html
<html>
    <head>
        ...
    </head>
    <body>
        ...
        <script type="text/javascript" src="~/scripts/main.js"></script>
    </body>
</html>
```

#### @using
- Adds the C# directive to a generated view
  
```html
@using System.IO
@{
    var dir = Directory.GetCurrentDirectory();
}
<p>@dir</p>
```

## Razor Components

<div class="alert alert-info">Requires using the Blazor file syntax, using a <i>.razor</i> file extension</div>

Simple Razor components extend the existing Razor syntax, allowing dynamically defined members to be late interpretted when rendering the page response.

```html
<h1 style="font-style:@_headingFontStyle">@_headingText</h1>

@code {
    private string _headingFontStyle = "italic";
    private string _headingText = "Put on your new Blazor!";
}
```

#### Blazor

Blazor is a framework for building interactive client-side web UI with .NET:

- Create rich interactive UIs using C# instead of JavaScript.
- Share server-side and client-side app logic written in .NET.
- Render the UI as HTML and CSS for wide browser support, including mobile browsers.

Using .NET for client-side web development offers the following advantages:

- Write code in C# instead of JavaScript.
- Leverage the existing .NET ecosystem of .NET libraries.
- Share app logic across server and client.
- Benefit from .NET's performance, reliability, and security.
- Stay productive with Visual Studio on Windows, Linux, and macOS.
- Build on a common set of languages, frameworks, and tools that are stable, feature-rich, and easy to use

[Blazor - Further Reading](https://docs.microsoft.com/en-us/aspnet/core/blazor/?view=aspnetcore-3.1)