---
layout: post
title: "ASP.Net Core"
date: 2019-12-27
tags: Microsoft web asp.net
---

The `ASP.Net Core framework` has been a significant shift from the original `ASP.Net Web Forms` request processing chain.  Here's a rundown on the major elements.

## Startup

The Startup class is used to configure the application

* _*Services*_ <br>Are components used by the application, such as logging.<br>*These services are configured in* <code>Startup.ConfigureServices</code> *method.*
* _*Request handling pipeline*_ <br> Composed of middleware components, which each interact with the messages being received from and returned to the calling clients.

```csharp
public class Startup
{
    // Service configuration
    public void ConfigureServices(IServiceCollection services)
    {
        // The specific compatibility version of the MVC pipeline
        services.AddMvc()
            .SetCompatibilityVersion(CompatibilityVersion.Version_2_2);

        // The database context
        services.AddDbContext<MovieContext>(options =>
                options.UseSqlServer(Configuration.GetConnectionString("MovieDb")));
    }

    // Pipeline configuration
    public void Configure(IApplicationBuilder app)
    {
        app.UseHttpsRedirection();
        app.UseStaticFiles();
        app.UseMvc();
    }
}
```

## Dependency Injection

Dependency injection allows child classes to access configured services.
The framework allows the dependencies to be injected into:
* Constructor (preferred)
* HttpContext.RequestServices 
* Manually via the service locator 

<div class="alert alert-warning" role="alert">
Always prefer the use constructor injection, and avoid using service locator patterns
</div>

### Lifetime

Dependencies can be registered as either:
* _*Transient*_ - Transient instances are created every time they are requested from the dependency container, meaning no two instances will be shared ever 
* _*Scoped*_ - Scoped instances exist for the lifetime of the client request.  All requests for a type will receive the same instance, for the lifetime of the processing of a single client request.  Instances are not shared across multiple client requests
* _*Singleton*_ - Only one instance exists for the application and is shared amongst all client requests

### Registration

Define the dependencies during Service configuration

```csharp
public void ConfigureServices(IServiceCollection services)
{
    services.AddRazorPages();

    // Dependency is defined as follows
    services.AddScoped<IMyDependency, MyDependency>();
    
    // Then other definitions can follow
    services.AddTransient<IOperationTransient, Operation>();
    services.AddScoped<IOperationScoped, Operation>();
    services.AddSingleton<IOperationSingleton, Operation>();
    services.AddSingleton<IOperationSingletonInstance>(new Operation(Guid.Empty));

    // OperationService depends on each of the other Operation types.
    services.AddTransient<OperationService, OperationService>();
}
```

Registration can be dynamic, using generics, so that exhaustive combinations are not required

```csharp
services.AddSingleton(typeof(ILogger<T>), typeof(Logger<T>));
```

### Worked Example

To create your own dependency registration:

1. Define your own interface type
    ```csharp
    public interface IElement {
        ...
    }
    ```
2. Define your own implementation type
    ```csharp
    public class Element : IElement {
        ...
    }
    ```
3. Add the registration to the <code>Startup.ConfigureServices</code> method
    ```csharp 
    public void ConfigureServices(IServiceCollection services) {
        ...
        services.AddScoped<IElement,Element>();
        ...
    }
    ```
4. Add the dependency as an argument on the constuctor of the Controller or other pipeline component.  When the type is instantiated, the dependency will be injected.
    ```csharp
    public class IndexModel : PageModel {
        public IndexModel(IElement element) {
            // Use the element here
        }
    }
    ```

### Special Startup Configuration Injection

There are three special dependencies which can be created for Startup application configuration, when using the Generic Host (IHostBuilder)

* IWebHostEnvironment 
* IHostEnvironment
* IConfiguration

Services can be injected into Startup.Configure as follows:
```csharp
public void Configure(IApplicationBuilder app, IOptions<MyOptions> options)
{
    ...
}
```

### Framework Injection

The framework automatically provides the following types via dependency injection

Service Type                                                    | Lifetime
----------------------------------------------------------------|----------
Microsoft.AspNetCore.Hosting.Builder.IApplicationBuilderFactory | Transient
IHostApplicationLifetime                                        | Singleton
IWebHostEnvironment                                             | Singleton
Microsoft.AspNetCore.Hosting.IStartup                           | Singleton
Microsoft.AspNetCore.Hosting.IStartupFilter                     | Transient
Microsoft.AspNetCore.Hosting.Server.IServer                     | Singleton
Microsoft.AspNetCore.Http.IHttpContextFactory                   | Transient
Microsoft.Extensions.Logging.ILogger&lt;TCategoryName&gt;       | Singleton
Microsoft.Extensions.Logging.ILoggerFactory                     | Singleton
Microsoft.Extensions.ObjectPool.ObjectPoolProvider              | Singleton
Microsoft.Extensions.Options.IConfigureOptions&lt;TOptions&gt;  | Transient
Microsoft.Extensions.Options.IOptions&lt;TOptions&gt;           | Singleton
System.Diagnostics.DiagnosticSource                             | Singleton
System.Diagnostics.DiagnosticListener                           | Singleton

### Dependency Registration via Extension Methods

A further example of dependency registration follows where authentication and dbcontext registration is made, via inbuilt Extension Methods.

```csharp
public void ConfigureServices(IServiceCollection services)
{
    ...

    services.AddDbContext<ApplicationDbContext>(options =>
        options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

    services.AddIdentity<ApplicationUser, IdentityRole>()
        .AddEntityFrameworkStores<ApplicationDbContext>()
        .AddDefaultTokenProviders();

    ...
}
```
### Supported DI frameworks

The built-in DI container doesn't support some features:

* Property injection
* Injection based on name
* Child containers
* Custom lifetime management
* Func<T> support for lazy initialization

So the following DI containers can be swapped in place of the default DI container

* Autofac
* DryIoc
* Grace
* LightInject
* Lamar
* Stashbox
* Unity

## Middleware

The Pipeline is a collection of middleware components which each have an opportunity to:
* interpret the request 
* modify the request context
* pass the request further along the pipeline 
* respond to the request sending a response object 
* modify the response object created by pipeline components which have already constructed a response 

Here's a simple diagram expressing a pipeline with 3 middleware components

<div class="mermaid">
sequenceDiagram
    participant Pipeline 
    participant Middleware1
    participant Middleware2
    participant Middleware3

    Pipeline->>Middleware1: Request
    activate Middleware1
    Middleware1->>Middleware2: Request
    activate Middleware2
    Middleware2->>Middleware3: Request
    activate Middleware3
    Middleware3->>Middleware2: Response
    deactivate Middleware3
    Middleware2->>Middleware1: Response
    deactivate Middleware2
    Middleware1->>Pipeline: Response
    deactivate Middleware1
</div>
<br>

Here's a very trivial pipeline component registration, which responds to requests by always returning the response "Hello, World!"

```csharp
public class Startup
{
    public void Configure(IApplicationBuilder app)
    {
        app.Run(async context =>
        {
            await context.Response.WriteAsync("Hello, World!");
        });
    }
}
```

Typically, the pipeline will contain items which:
* Logs the request
* Authenticate the user
* Authorize the user 
* Interpret the HTTP client request, 
  * Instantiating and passing  control to the appropriate Controller to handle the specific request
  * Invoking the correct Controller Action, to handle the request based on the URL and HTTP verb 
  * Binding the request body to internal models
  * Validating the model content
  * Applying internal business logic to interpret and invoke behaviours which exhibit the desired functionality of the application
  * Construct an appropriate response to send to the user
* Validates the response context and sends the response content to the user
* Cleans up the pipeline request and response chain, including dependencies which were created during the request handling

### Pipeline component chaining

Chain multiple request delegates together with Use. The next parameter represents the next delegate in the pipeline. You can short-circuit the pipeline by not calling the next parameter

```csharp
public class Startup
{
    public void Configure(IApplicationBuilder app)
    {
        app.Use(async (context, next) =>
        {
            // Do work that doesn't write to the Response.
            await next.Invoke();
            // Do logging or other work that doesn't write to the Response.
        });

        app.Run(async context =>
        {
            await context.Response.WriteAsync("Hello from 2nd delegate.");
        });
    }
}
```

When <code>next.invoke()</code> is not called, the pipeline is short circuited, and this is a positive way to avoid unnecessary processing work.

<div class="alert alert-warning" role="alert">
Calling <code>next.invoke()</code> after the response has been sent to the client will typically cause an exception to be raised. 
</div>


### Typical Middleware Registration Order

Security is important, and it should always be registered into the pipeline prior to the application interpretting the client request.  This avoids processing loads from unauthorized clients, and ensures that the user context is well established when authorized requests are being interpreted.

```csharp 
public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
{
    if (env.IsDevelopment())
    {
        app.UseDeveloperExceptionPage();
        app.UseDatabaseErrorPage();
    }
    else
    {
        app.UseExceptionHandler("/Error");
        app.UseHsts();
    }

    app.UseHttpsRedirection();
    app.UseStaticFiles();
    // app.UseCookiePolicy();

    app.UseRouting();
    // app.UseRequestLocalization();
    // app.UseCors();

    app.UseAuthentication();
    app.UseAuthorization();
    // app.UseSession();

    app.UseEndpoints(endpoints =>
    {
        endpoints.MapRazorPages();
        endpoints.MapControllerRoute(
            name: "default",
            pattern: "{controller=Home}/{action=Index}/{id?}");
    });
}
```

<div class="alert alert-warning" role="alert">
Typically the order of the pipeline is up to the software architect, however <code>UserCors</code>, <code>UseAuthentication</code> and <code>UseAuthentication</code> must be declared in the order above
</div>

### Important Pipeline components

Component                 | Description
--------------------------|------------------------------------------------------------------------------------------------------------------
UseDeveloperExceptionPage | reports app runtime errors, while the application is typically not used in a production public facing environment
UseExceptionHandler       | Catches exceptions thrown by middleware
UseHsts                   | HTTP Strict Transport Security Protocol
UseHttpsRedirection       | Forces HTTP requests to use HTTPS
UseStaticFiles            | Short circuits the pipeline, returning static files where appropriate (js/css/images etc.)
UseCookiePolicy           | Conforms to EU General Data Protection Regulation
UseRouting                | Supports routing the request to be handled by custom request handlers
UseAuthentication         | Attempts to authenticate the user, before the user can access secure resources
UseAuthorization          | Checks permission to access secure resources
UseSession                | establishes and maintains a session state.  Called after UsCookiePolicy and before MVC middleware
UseEndpoints              | maps Razor pages to the request pipeline

## Host

A Host encapsulates the applications (independent and interdependent) resources.  As a benefit of this design, object lifetime is cleanly managed throughout, including the startup and shutdown phases of the application life.

* Dependency Injection
* Logging
* Configuration
* IHostedService implementations

<div class="alert alert-warning" role="alert">
WebHost is provided for backward compatibility and is not recommended going forward, instead use Generic Host
</div>

The host is constructed typically in the Program class during the Main method call.

```csharp
public class Program
{
    public static void Main(string[] args)
    {
        CreateHostBuilder(args).Build().Run();
    }

    public static IHostBuilder CreateHostBuilder(string[] args) =>
        Host.CreateDefaultBuilder(args)
            .ConfigureServices((hostContext, services) =>
            {
               services.AddHostedService<Worker>();
            });
}
```

Processing HTTP workloads will be more specific than the above generic approach, instead creating a Web specific Host builder.

```csharp
public static IHostBuilder CreateHostBuilder(string[] args) =>
    Host.CreateDefaultBuilder(args)
        .ConfigureWebHostDefaults(webBuilder =>
        {
            webBuilder.UseStartup<Startup>();
        });
```

<div class="alert alert-warning" role="alert">
Entity Framework expects <code>CreateHostBuilder</code> to configure the host without running the application.  Don't change the signature of <code>CreateHostBuilder</code>
</div>


The CreateDefaultBuilder method:

* Sets the content root using <code>GetCurrentDirectory</code>
* Loads host configuration
* Loads app configuration
  * *appsettings.json*
  * *appsettings.{Environment}.json*
  * Secret Manager *(Dev environment)*
  * Environment variables
  * Command-line arguments
* Add logging (console, debug, event source and event log)
* Enables scope validation and dependency validation *(Dev environment)*

The ConfigureWebHostDefaults method:

* Loads host configuration, from environment variables prefixed with "ASPNETCORE_" on the server host
* Sets Kestrel server as the web server and configures it using the applications configuration providers
* Adds Host filtering middleware
* Adds Forwarded Headers middleware
* Enables IIS integration

### Framework Registered Services

* IHostApplicationLifetime
  * Adds support for classes to handle post-startup and pre-shutdown tasks gracefully
* IHostLifetime
  * Controls when the host starts and stops, interacting with the environment which invoked the application
* IHostEnvironment / IWebHostEnvironment
  * Provides access to the ApplicationName, EnvironmentName and ContentRootPath
  * IWebHostEnvironment also provides access to WebRootPath

### Host Configuration

To add host configuration call <code>ConfigureHostConfiguration</code> on <code>IHostBuilder</code>.

* CreateDefaultBuilder adds environment variables with the <code>DOTNET_</code> prefix.
* When called on a Web Host Builder, environment variables with the <code>APSNETCORE_</code> prefix are loaded.

e.g. <code>ASPNETCORE_ENVIRONMENT</code> is the host configuration for the environment key

```csharp
// using Microsoft.Extensions.Configuration;

Host.CreateDefaultBuilder(args)
    .ConfigureHostConfiguration(configHost =>
    {
        configHost.SetBasePath(Directory.GetCurrentDirectory());
        configHost.AddJsonFile("hostsettings.json", optional: true);
        configHost.AddEnvironmentVariables(prefix: "PREFIX_");
        configHost.AddCommandLine(args);
    });

```

### App Configuration

Can be called multiple times, and each call adds to the previous app configuration.
Setting the value for a key multiple times will use the most recent defined value when the host starts and runs

The configuration is accessible via <code>HostBuilderContext.Configuration</code>

<br>
### Settings for all applications

Key             | Type     | Default                                                | Environment variable                    | Comment
----------------|----------|--------------------------------------------------------|-----------------------------------------|--------
**applicationName** | *string* | Name of the assembly that contains the app entry point | *&lt;PREFIX_&gt;*APPLICATIONNAME        |
**contentRoot**     | *string* | The folder where the application is installed          | *&lt;PREFIX_&gt;*CONTENTROOT            |
**environment**     | *string* | Production                                             | *&lt;PREFIX_&gt;*ENVIRONMENT            |
**shutdownTimeout** | int      | 5 seconds                                              | *&lt;PREFIX_&gt;*SHUTDOWNTIMEOUTSECONDS |

<br>
### Settings for web applications

Key                                 |   Type   |                         Default                          | Environment variable                             | Comment
------------------------------------|:--------:|:--------------------------------------------------------:|--------------------------------------------------|--------
**captureStartupErrors**            |  *bool*  |        false (unless run with Kestral behind IIS)        | *&lt;PREFIX_&gt;*CAPTURESTARTUPERRORS            |
**detailedErrors**                  |  *bool*  |                          false                           | *&lt;PREFIX_&gt;*DETAILEDERRORS                  |
**hostingStartupAssemblies**        |  *bool*  |                       empty string                       | *&lt;PREFIX_&gt;*HOSTINGSTARTUPASSEMBLIES        |
**hostingStartupExcludeAssemblies** |  *bool*  |                       empty string                       | *&lt;PREFIX_&gt;*HOSTINGSTARTUPEXCLUDEASSEMBLIES |
**https_port**                      | *string* |                    not set by default                    | *&lt;PREFIX_&gt;*HTTPS_PORT                      |
**preferHostingUrls**               |  *bool*  |                           true                           | *&lt;PREFIX_&gt;*PREFERHOSTINGURLS               |
**preferHostingStartup**            |  *bool*  |                          false                           | *&lt;PREFIX_&gt;*PREFERHOSTINGSTARTUP            |
**startupAssembly**                 | *string* |                    The apps assembly                     | *&lt;PREFIX_&gt;*STARTUPASSEMBLY                 |
**urls**                            | *string* | [http://localhost:5000]() and [https://localhost:5001]() | *&lt;PREFIX_&gt;*URLS                            |
**webroot**                         | *string* |                         wwwroot                          | *&lt;PREFIX_&gt;*WEBROOT                         |


## Servers

### Kestrel

Kestrel is the default web server used by the `ASP.NET CORE` project templates, and is shipped with `ASP.NET Core` for cross server compatibility Windows, MacOS and Linux servers.

#### Edge Processing Server
![Edge Processing Server](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/servers/kestrel/_static/kestrel-to-internet2.png?view=aspnetcore-3.1)

#### Server behind Reverse Proxy
![Server Behind Reverse Proxy](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/servers/kestrel/_static/kestrel-to-internet.png?view=aspnetcore-3.1)

### Hosting models
When run from within IIS, the app runs either as In-Process or Out-Of-Process

#### In-Process Hosting
Executes in the same process as the IIS worker process, with the IIS HTTP Server.  (Recommended)
In-Process hosting is faster than Out-Of-Process hosting, as requests are not proxied over loopback adapters 

#### Out-Of-Process Hosting
Executes in a separate process to the IIS worker process.

The `ASP.NET Core Module` starts the process for the `ASP.NET Core App` when the first request is received and restarts the app if the app shuts down or crashes. 

## Configuration

Configuration is split into Host configuration and App configuration.

Configuration sources may include:

* Azure Key Vault
* Azure App Configuration
* Command-Line arguments 
* Custom Providers 
* Directory filesIn
* Environment variables
* In-memory .Net objects
* Settings files

Most common configuration provider scenarios use `Microsoft.Extensions.Configuration`

```csharp
using Microsoft.Extensions.Configuration 
```

#### Security Configuration

Adhere to best practices whenever possible

* Never store passwords in configuration files.  Use secure password stores built into the host environment instead to fetch credentials as required
* Never use production credentials in non-production environments.  This will avoid accidental release of production details to unauthorized people and prevent accidental production damage
* Always store secrets outside of the source code repository, even during project initialization

Using dependency injection, configuration is accessible in classes throughout the application.

```csharp
public class IndexModel : PageModel
{
    private readonly IConfiguration _config;

    public IndexModel(IConfiguration config)
    {
        _config = config;
    }

    // The _config local variable is used to obtain configuration 
    // throughout the class.
}
```csharp

### ConfigureHostConfiguration

```csharp
public static IHostBuilder CreateHostBuilder(string[] args) =>
    Host.CreateDefaultBuilder(args)
        .ConfigureHostConfiguration(config =>
        {
            var dict = new Dictionary<string, string>
            {
                {"MemoryCollectionKey1", "value1"},
                {"MemoryCollectionKey2", "value2"}
            };

            config.AddInMemoryCollection(dict);
        })
        .ConfigureWebHostDefaults(webBuilder =>
        {
            webBuilder.UseStartup<Startup>();
        });
```

### ConfigureAppConfiguration

```csharp
public class Program
{
    public static Dictionary<string, string> arrayDict = 
        new Dictionary<string, string>
        {
            {"array:entries:0", "value0"},
            {"array:entries:1", "value1"},
            {"array:entries:2", "value2"},
            {"array:entries:4", "value4"},
            {"array:entries:5", "value5"}
        };

    public static void Main(string[] args)
    {
        CreateHostBuilder(args).Build().Run();
    }

    public static IHostBuilder CreateHostBuilder(string[] args) =>
        Host.CreateDefaultBuilder(args)
            .ConfigureAppConfiguration((hostingContext, config) =>
            {
                config.AddInMemoryCollection(arrayDict);
                config.AddJsonFile(
                    "json_array.json", optional: false, reloadOnChange: false);
                config.AddJsonFile(
                    "starship.json", optional: false, reloadOnChange: false);
                config.AddXmlFile(
                    "tvshow.xml", optional: false, reloadOnChange: false);
                config.AddEFConfiguration(
                    options => options.UseInMemoryDatabase("InMemoryDb"));
                config.AddCommandLine(args);
            })
            .ConfigureWebHostDefaults(webBuilder =>
            {
                webBuilder.UseStartup<Startup>();
            });
}
```

### Typical Configuration Providers

* [Azure Key Vault Configuration Provider](https://docs.microsoft.com/en-us/aspnet/core/security/key-vault-configuration?view=aspnetcore-3.1)
* [Azure App Configuration Provider](https://docs.microsoft.com/en-us/azure/azure-app-configuration/quickstart-aspnet-core-app)
* [Command-Line Configuration Provider](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-3.1#command-line-configuration-provider)
* [Custom Configuration Provider](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-3.1#custom-configuration-provider)
* [Environment Configuration Provider](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-3.1#environment-variables-configuration-provider)
* [File Configuration Provider](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-3.1#file-configuration-provider)
* [Key-Per-File Configuration Provider](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-3.1#key-per-file-configuration-provider)
* [Memory Configuration Provider](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-3.1#memory-configuration-provider)
* [User Secrets](https://docs.microsoft.com/en-us/aspnet/core/security/app-secrets?view=aspnetcore-3.1)

## Options
## Environments
## Logging
## Routing
## Error Handling
## Make HTTP Requests
## Content Root
## Web Root
