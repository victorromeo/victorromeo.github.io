---
layout: post
title: "Real Time Communications"
date: 2023-07-29
tags: Concept
image: https://images.unsplash.com/photo-1533749047139-189de3cf06d3
thumb: https://images.unsplash.com/photo-1533749047139-189de3cf06d3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xvY2t8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@jontyson
type: article
---

Delivering data fast

# Web Sockets

WebSockets is a protocol that enables real-time, full-duplex communication between a client and a server over a single, long-lived connection. Unlike traditional HTTP requests, which are stateless and require the client to initiate a new connection for each request, WebSockets allow continuous bidirectional communication, making them ideal for real-time applications like chat systems, gaming, notifications, and collaborative tools.

In C#, you can implement WebSockets using the System.Net.WebSockets namespace. Here's a simple example to demonstrate how to create a WebSocket server and a client using C#.

Server

```cs
using System;
using System.Net;
using System.Net.WebSockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

public class WebSocketServer
{
    private static async Task HandleClient(WebSocket webSocket)
    {
        byte[] buffer = new byte[1024];

        try
        {
            while (webSocket.State == WebSocketState.Open)
            {
                WebSocketReceiveResult result = await webSocket.ReceiveAsync(new ArraySegment<byte>(buffer), CancellationToken.None);

                if (result.MessageType == WebSocketMessageType.Text)
                {
                    string receivedMessage = Encoding.UTF8.GetString(buffer, 0, result.Count);
                    Console.WriteLine($"Received: {receivedMessage}");

                    string responseMessage = $"Server Response: {receivedMessage}";
                    byte[] responseBuffer = Encoding.UTF8.GetBytes(responseMessage);

                    await webSocket.SendAsync(new ArraySegment<byte>(responseBuffer, 0, responseBuffer.Length),
                        WebSocketMessageType.Text, true, CancellationToken.None);
                }
                else if (result.MessageType == WebSocketMessageType.Close)
                {
                    await webSocket.CloseAsync(WebSocketCloseStatus.NormalClosure, "Connection closed by the server.", CancellationToken.None);
                }
            }
        }
        catch (WebSocketException ex)
        {
            Console.WriteLine($"WebSocket Exception: {ex.Message}");
        }
    }

    public static async Task Main()
    {
        HttpListener listener = new HttpListener();
        listener.Prefixes.Add("http://localhost:8080/");
        listener.Start();

        Console.WriteLine("WebSocket server started.");

        while (true)
        {
            HttpListenerContext context = await listener.GetContextAsync();
            if (context.Request.IsWebSocketRequest)
            {
                HttpListenerWebSocketContext webSocketContext = await context.AcceptWebSocketAsync(null);
                WebSocket webSocket = webSocketContext.WebSocket;

                _ = HandleClient(webSocket);
            }
            else
            {
                context.Response.StatusCode = 400;
                context.Response.Close();
            }
        }
    }
}
```

Client

```cs
using System;
using System.Net.WebSockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

public class WebSocketClient
{
    public static async Task Main()
    {
        ClientWebSocket webSocket = new ClientWebSocket();
        Uri uri = new Uri("ws://localhost:8080");

        try
        {
            await webSocket.ConnectAsync(uri, CancellationToken.None);
            Console.WriteLine("Connected to WebSocket server.");

            while (webSocket.State == WebSocketState.Open)
            {
                Console.Write("Enter a message to send to the server (or 'exit' to quit): ");
                string message = Console.ReadLine();

                if (message == "exit")
                {
                    await webSocket.CloseAsync(WebSocketCloseStatus.NormalClosure, "Connection closed by the client.", CancellationToken.None);
                    break;
                }

                byte[] buffer = Encoding.UTF8.GetBytes(message);
                await webSocket.SendAsync(new ArraySegment<byte>(buffer), WebSocketMessageType.Text, true, CancellationToken.None);

                buffer = new byte[1024];
                WebSocketReceiveResult result = await webSocket.ReceiveAsync(new ArraySegment<byte>(buffer), CancellationToken.None);
                string receivedMessage = Encoding.UTF8.GetString(buffer, 0, result.Count);
                Console.WriteLine($"Received from server: {receivedMessage}");
            }
        }
        catch (WebSocketException ex)
        {
            Console.WriteLine($"WebSocket Exception: {ex.Message}");
        }
    }
}

```

In this example, we have a simple WebSocket server that listens for incoming WebSocket requests using HttpListener and handles client connections and messages. The server responds to each client message with a simple echo response.

The WebSocket client connects to the server using ClientWebSocket, sends messages to the server, and displays the responses received from the server.

To run this example, you can create two separate console applications for the server and the client. Start the server first and then run the client. The client will connect to the server, and you can exchange messages between them.

Please note that this is a basic example to demonstrate how to use WebSockets in C#. In a real-world scenario, you might want to handle disconnections, implement proper error handling, and add more features to suit your application's needs.

## SignalR

In a real-world scenario, you may need to scale your SignalR application to handle a large number of concurrent users across multiple servers or instances. To achieve this, you can use a backplane with SignalR to distribute messages across all connected servers. In this example, we'll use Redis as the backplane, as it's a popular and scalable choice.

Before running this example, make sure you have installed the SignalR package using NuGet: Microsoft.AspNetCore.SignalR. Additionally, you'll need to install the Redis package: StackExchange.Redis.

Here's the updated Startup.cs file with the Redis backplane configuration:

```cs
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using StackExchange.Redis;

public class Startup
{
    public Startup(IConfiguration configuration)
    {
        Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    public void ConfigureServices(IServiceCollection services)
    {
        services.AddSignalR()
            .AddStackExchangeRedis(options =>
            {
                options.Configuration = "localhost"; // Replace with your Redis server address
            });

        services.AddControllersWithViews();
    }

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
        if (env.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
        }
        else
        {
            app.UseExceptionHandler("/Home/Error");
        }

        app.UseStaticFiles();

        app.UseRouting();

        app.UseAuthorization();

        app.UseEndpoints(endpoints =>
        {
            endpoints.MapHub<ChatHub>("/chatHub");
            endpoints.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");
        });
    }
}

```

Now, let's make a ChatHub to use the backplane:

```cs
using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;

public class ChatHub : Hub
{
    public async Task JoinRoom(string roomName)
    {
        await Groups.AddToGroupAsync(Context.ConnectionId, roomName);
        await Clients.Group(roomName).SendAsync("ReceiveMessage", "System", $"{Context.ConnectionId} has joined the room {roomName}");
    }

    public async Task LeaveRoom(string roomName)
    {
        await Groups.RemoveFromGroupAsync(Context.ConnectionId, roomName);
        await Clients.Group(roomName).SendAsync("ReceiveMessage", "System", $"{Context.ConnectionId} has left the room {roomName}");
    }

    public async Task SendMessage(string roomName, string userName, string message)
    {
        await Clients.Group(roomName).SendAsync("ReceiveMessage", userName, message);
    }
}

```

A simple HTML interface

```html
<!DOCTYPE html>
<html>
<head>
    <title>SignalR Chat</title>
</head>
<body>
    <div>
        <h2>Chat Room</h2>
        <div id="messages"></div>
        <input type="text" id="messageInput" />
        <button onclick="sendMessage()">Send</button>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/microsoft-signalr/5.0.11/signalr.min.js"></script>
    <script>
        const connection = new signalR.HubConnectionBuilder()
            .withUrl("/chatHub")
            .build();

        connection.on("ReceiveMessage", (user, message) => {
            const encodedUser = user.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            const encodedMessage = message.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            const li = document.createElement("li");
            li.textContent = `${encodedUser}: ${encodedMessage}`;
            document.getElementById("messages").appendChild(li);
        });

        connection.start().catch(err => console.error(err));

        function sendMessage() {
            const user = prompt("Enter your name:");
            const message = document.getElementById("messageInput").value;
            const roomName = "General"; // Replace with the desired chat room name
            connection.invoke("SendMessage", roomName, user, message).catch(err => console.error(err));
        }
    </script>
</body>
</html>

```


With the backplane configured using Redis, your SignalR application is now scalable across multiple servers. When a user sends a message, the message will be broadcasted to all connected clients on all servers. This allows your application to handle a high number of concurrent users with ease.

Make sure to have Redis running on your server or provide the appropriate Redis server address in the ConfigureServices method in Startup.cs. Keep in mind that using a backplane introduces some overhead due to network communication, but it greatly improves the scalability of your SignalR application.

## Rabbit MQ

RabbitMQ is a popular message broker that allows you to implement various messaging patterns, including publish-subscribe, and provides support for guaranteed message delivery. In this example, we'll create a C# application to demonstrate how to use RabbitMQ to implement a publish-subscribe pattern with guaranteed delivery.

Before proceeding, make sure you have RabbitMQ installed and running on your local machine or server.

To interact with RabbitMQ from C#, we'll use the RabbitMQ.Client library, which you can install via NuGet: RabbitMQ.Client.

Let's create the publisher application first:

```cs
using RabbitMQ.Client;
using System;
using System.Text;

public class Publisher
{
    public static void Main()
    {
        var factory = new ConnectionFactory
        {
            HostName = "localhost" // Replace with your RabbitMQ server address if needed
        };

        using (var connection = factory.CreateConnection())
        using (var channel = connection.CreateModel())
        {
            channel.ExchangeDeclare("logs", ExchangeType.Fanout);

            while (true)
            {
                Console.Write("Enter your message: ");
                var message = Console.ReadLine();

                if (string.IsNullOrWhiteSpace(message))
                    break;

                var body = Encoding.UTF8.GetBytes(message);
                channel.BasicPublish(exchange: "logs", routingKey: "", basicProperties: null, body: body);

                Console.WriteLine(" [x] Sent: {0}", message);
            }
        }
    }
}
```

Now, let's create the subscriber application:

```cs
using RabbitMQ.Client;
using RabbitMQ.Client.Events;
using System;
using System.Text;

public class Subscriber
{
    public static void Main()
    {
        var factory = new ConnectionFactory
        {
            HostName = "localhost" // Replace with your RabbitMQ server address if needed
        };

        using (var connection = factory.CreateConnection())
        using (var channel = connection.CreateModel())
        {
            channel.ExchangeDeclare("logs", ExchangeType.Fanout);
            var queueName = channel.QueueDeclare().QueueName;
            channel.QueueBind(queue: queueName, exchange: "logs", routingKey: "");

            Console.WriteLine(" [*] Waiting for logs. To exit, press CTRL+C");

            var consumer = new EventingBasicConsumer(channel);
            consumer.Received += (model, ea) =>
            {
                var body = ea.Body.ToArray();
                var message = Encoding.UTF8.GetString(body);
                Console.WriteLine(" [x] Received: {0}", message);
            };

            channel.BasicConsume(queue: queueName, autoAck: true, consumer: consumer);

            Console.ReadLine();
        }
    }
}

```

In this example, we create a simple publish-subscribe system using RabbitMQ. The publisher sends messages to an exchange named "logs" with a fanout type. The subscriber binds to the same exchange and listens for messages.

When you run multiple instances of the subscriber application, each instance will receive a copy of the message sent by the publisher, demonstrating the publish-subscribe pattern. RabbitMQ ensures that the messages are delivered to all connected subscribers.

Remember that you need to start RabbitMQ on your machine or server before running these applications. You can interact with the publisher by entering messages, and each subscriber will receive those messages simultaneously.

Please note that in this example, messages are not persisted, meaning if there are no subscribers at the time of message publication, the message will be lost. To implement guaranteed message delivery with persistence, you'll need to set up durable queues and persist messages to disk in RabbitMQ.