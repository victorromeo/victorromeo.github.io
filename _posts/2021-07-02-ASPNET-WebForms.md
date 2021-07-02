---
layout: post
title: "ASP.Net WebForms"
date: 2021-07-09
tags: Microsoft web asp.net webforms
image: https://images.unsplash.com/photo-1524230616393-d6229fcd2eff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9
thumb: https://images.unsplash.com/photo-1524230616393-d6229fcd2eff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@joshsorenson
type: spec
---

ASP.Net Web Forms are a legacy web technology created by Microsoft, and are hosted using IIS web servers.

## Main Element Types

|Type | SubType| Description | 
|-----|-----|----|
| `Page`     |   |   |
|  | `MasterPage` | A file with a `.master` file extension which serves as a high level template for the appearance of a web page.  Masterpages have a predetermined layout, and use Content Place Holders to defer the rendering of specific portions of the page to specific page implementations.  |
| Control |     | Support the appearance of text and user input elements of the page |
|  | HTML Control | Are written in plain old HTML such as:<br>`<input type="text" value="hello world" />`<br><br> They are not bindable, as they do not contain `runat=server` attribute and therefore they are treated as plain text by the `ASP.Net` renderer. |
|  | HTML Server Control | Are types which derive from `System.Web.UI.HtmlControls.HtmlControl` and are formed using HTML compliant controls such as:<br>`<input type="text" value="hello world" runat=server />`<br><br>For the type to be dynamically controlled and manipulated server side, it must have the `runat=server` attribute. |
|  | Web Server Control | Web Server Controls are derive from `System.Web.UI.WebControls.WebControl` and are controls which are interpretted server side and provide an experience above standard HTML controls, as a prepackageed unit.  There are a number of standard Web Server Controls, such as: <br>`<asp:textbox text="hello world" runat=server />` |
|  | Composite Control | A type of Web Control composed of several other Web Controls |
| | Custom Control | Is a low level control type supporting the ablility to make highly customizable user controls, which derive from either `System.Web.UI.Control` or `System.Web.UI.WebControls.WebControl`. <br><br>Renders HTML without the use of a designer, i.e. are rendered using strings interpretation, to write specific text in place of the control, during the render stage.<br><br>To get a unique ID, it must implement `System.Web.UI.INamingContainer`<br><br>To examine PostBack data, it must implement `System.Web.UI.IPostBackDataHandler`<br><br>To capture client-side PostBack events and respond to them, it must implement `System.Web.UI.IPostBackEventHandler` |
| | User Control | Built with a designer, to create a template and code behind.  A User Control has a `ASCX` and `ASCX.cs` file.<br><br>Must be registered in page header:<br> `<%@ Register TagPrefix="UC" TagName="TestControl" Src="test.ascx" %>`<br>Then used inside the page markup as follows:<br>`<UC:TestControl id="Test1" runat="server"/>` |
| State |  | A collection of stores of key value pairs derive from `System.Web.UI.StateBag`, used as a context for the preparation of a web page, comprised of Application State, Session State, and View State |
| | Application State | A long-lived state, storing state which is available across multiple User Sessions |
| | SessionState     |  A state which persists the users current state for the duration of their web browser session, but is removed from the Session State store when the Session has been deemed to be terminated.  If an external Session State store is utilised, this state can persist despite a web brower being closed, and thereby permit a user to resume the application with minimal disruption |
| | ViewState | Stores the state of a webpage, so that upon postback the page can be reinterpretted to detect client side events, back on the server, such as text change and button clicks. | 

## Common Terms

|Type | Description | 
|-----|-----|
| Request | A term which is used to describe when a web client requests content from the web server host | 
| Response | A term which is used to describes the content sent from the web server host to the web client in response to a client Request | 
| Postback | A specific term which means the Web Client is invoking a POST request, normally containing user changes |
| Callback | A general term meaning that a event has occurred, and that the handler of the event should respond |
| AJAX | An ancronym of Asynchronous JavaScript and XML, which is used to provide data to a web page, after the web client has received the page structure. This decouples the data interchange layer from the presentation layer, and thereby supports partial page updates |


## [Application Lifecycle](https://docs.microsoft.com/en-us/previous-versions/aspnet/bb470252(v=vs.100))

Page Requests are handled by IIS 7.0 hosted web sites as follows:
Validate the request, which examines the information sent by the browser and determines whether it contains potentially malicious markup. For more information, see ValidateRequest and Script Exploits Overview.

1. Perform URL mapping, if any URLs have been configured in the UrlMappingsSection section of the Web.config file.
2. Raise the BeginRequest event.**Raised when a request is received**
3. Raise the AuthenticateRequest event. **Confirm the identity of the user**
4. Raise the PostAuthenticateRequest event.  **After attempting confirming user identity, the site may prevent user access if not identifiable**
5. Raise the AuthorizeRequest event. **Confirm the user permission set for the current user**
6. Raise the PostAuthorizeRequest event.  **After confirming the permissions of the user, denial to use website can be enforced, if permissions insufficient**
7. Raise the ResolveRequestCache event.
8. Raise the PostResolveRequestCache event.
9. Raise the MapRequestHandler event. An appropriate handler is selected based on the file-name extension of the requested resource. The handler can be a native-code module such as the IIS 7.0 StaticFileModule or a managed-code module such as the PageHandlerFactory class (which handles .aspx files). 
10. Raise the PostMapRequestHandler event.
11. Raise the AcquireRequestState event.
12. Raise the PostAcquireRequestState event.
13. Raise the PreRequestHandlerExecute event.
14. Call the ProcessRequest method (or the asynchronous version IHttpAsyncHandler.BeginProcessRequest) of the appropriate IHttpHandler class for the request. For example, if the request is for a page, the current page instance handles the request.
15. Raise the PostRequestHandlerExecute event.
16. Raise the ReleaseRequestState event.
17. Raise the PostReleaseRequestState event.
18. Perform response filtering if the Filter property is defined.
19. Raise the UpdateRequestCache event.
20. Raise the PostUpdateRequestCache event.
21. Raise the LogRequest event.
22. Raise the PostLogRequest event.
23. Raise the EndRequest event.
24. Raise the PreSendRequestHeaders event.
25. Raise the PreSendRequestContent event.

## [Page Lifecycle](https://docs.microsoft.com/en-us/previous-versions/aspnet/ms178472(v=vs.100))

|Step|Name|Description|
|-----|-----|----|
| 1| `Page.PreInit` | Raised after start stage is complete and before initialization stage begins. <br/><br/> Used to check `IsPostBack`, `IsCallback` and `IsCrossPagePostBack`, Create dynamic controls, set master page, set theme, read or set profile properties   |
| 2 | `Page.Init` | Raised after all controls have been initialized and skin settings have been applied. The `Init` event of individual controls occurs before the `Init` event of the page. |
| 3| `Page.InitComplete` | An event raised after ViewState is enabled.  Until ViewState is enabled, any values added to the ViewState are lost across postbacks.<br/><br/> **Use this event to make changes to view state that you want to make sure are persisted after the next postback.** |
| 4 | `Page.PreLoad` | An event which fires after ViewState is loaded for Page and all Controls, after processing PostBack data in the Request |
| 5|  `Page.Load` | The Page calls the OnLoad method on the Page object, then recursively does the same for each child control until the Page and all controls are loaded. <br><br>**Use the OnLoad event method to set properties in controls and establish database connections** |
| 6 | Control Events | **Use these events to handle specific control events, such as a Button control's Click event or a TextBox control's TextChanged event** <br><br>In a PostBack request, if the page contains validator controls, check the IsValid property of the Page and of individual controls before performing and processing. |
| 7 | `Page.LoadComplete` | Raised at the end of the Event Handling stage.<br><br>**Use this event, for tasks which require all controls on the Page to be loaded.** | 
| 8 | `Page.PreRender` | Raised after the Page object has created all controls that are required in order to render the page, including child controls of composite controls. (To do this, the Page object calls EnsureChildControls for each control and for the page.)<br><br>The Page object raises the PreRender event on the Page object, and then recursively does the same for each child control. The PreRender event of individual controls occurs after the PreRender event of the page.<br><br>**Use the event to make final changes to the contents of the page or its controls before the rendering stage begins.** |
| 9 | `Page.PreRenderComplete` | Raised after each data bound control whose DataSourceID property is set calls its DataBind method. |
| 10 | `Page.SaveStateComplete` | Raised after view state and control state have been saved for the page and for all controls.<br><br>*Any changes to the page or controls at this point affect rendering, but the changes will not be retrieved on the next postback.* | 
| 11 | Render | This is not an event; instead, at this stage of processing, the Page object calls this method on each control. All ASP.NET Web server controls have a Render method that writes out the control's markup to send to the browser.<br><br>If you create a custom control, you typically override this method to output the control's markup. However, if your custom control incorporates only standard ASP.NET Web server controls and no custom markup, you do not need to override the Render method.<br><br>A user control (an .ascx file) automatically incorporates rendering, so you do not need to explicitly render the control in code. |
| 12 | `Page.Unload` | An event which is raised first for each control, and then the Page, to cleanup after a page is rendered.<br><br>Use in controls to close control specific database connections<br><br>Use in Page to close open files and database connections, finish logging or other request-specific tasks. |

## [Data Binding Events]()


## [Code blocks](https://docs.microsoft.com/en-US/troubleshoot/aspnet/inline-expressions) _also called inline expressions_

The `<% %>` markup is used to indicate an inline code block, which is interpretted server side, at render time.  The renderer 

|What| Description|
|----|-------|
| `< ... >` | Used to handle HTML blocks and beginning ASP.NET Controls | 
| `<% %>` | Used for performing inline code. |
| `<%$ %>`  |As previously mentioned, these are for evaluating expressions.<br>`<%$ MyModel:ModelProperty  %>`<br>`<%$ AppSettings:ValueFromWebConfig  %>`|
| `<%@ %>`  | These are used for Page directives (similar to those you might find at the top of a page).<br>`<%@ Page Language="C#"  %>`|
| `<%= %>`  | Embedded code blocks (similar to performing a Response.Write()), you can read more about them here.|
| `<%# %>`  | Used for data binding expressions like those found in GridViews etc.<br>`<%# Eval("Name")  %>`<br>`<%# Bind("Name")  %>`<br>`<%# XPath ("Name")  %>`|
| `<%: %>`  | Short-handed code for an HTML-encoded Write operation Response.Write(Server.HTMLEncode()).|
| `<%-- --%>`  | Used for writing server-side comments.  These comments are not rendered to the client web browser page. |
| `<!-- -->` | Pure HTML, used for actual comments within your HTML or markup. These comments are rendered to the client web browser page. |

## Examples

### Data binding example 

Page markup

```aspx
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>  
  
<!DOCTYPE html>  
  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head runat="server">  
    <title></title>  
</head>  
<body>  
    <form id="form1" runat="server">  
    <div>  
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="6">  
            <Columns>  
                <asp:BoundField DataField="Id" HeaderText="Employee ID" />  
                <asp:BoundField DataField="First Name" HeaderText="First Name" />  
                <asp:BoundField DataField="Last Name" HeaderText="Last Name" />  
                <asp:BoundField DataField="City" HeaderText="City" />  
            </Columns>  
            <HeaderStyle BackColor="#0066cc" Font-Bold="true" ForeColor="White" />  
            <RowStyle BackColor="#bfdfff" ForeColor="Black" />  
        </asp:GridView>  
    </div>  
    </form>  
</body>  
</html>
```

Code behind

```cs
using System;  
using System.Data;  
using System.Data.SqlClient;  
using System.Configuration;  
  
public partial class _Default : System.Web.UI.Page  
{  
    protected void Page_Load(object sender, EventArgs e)  
    {  
        if(!IsPostBack)  
        {  
            ShowData();  
        }  
    }  
    //getting Connection String from Web.config file  
    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;  
    //Method for DataBinding  
    protected void ShowData()  
    {  
        DataTable dt = new DataTable();  
        SqlConnection con = new SqlConnection(cs);  
        SqlDataAdapter adapt = new SqlDataAdapter("select * from Employee",con);  
        con.Open();  
        adapt.Fill(dt);  
        con.Close();  
        if(dt.Rows.Count>0)  
        {  
            GridView1.DataSource = dt;  
            GridView1.DataBind();  
        }  
    }  
} 
```

### Partial Page Postbacks

This example describes a legacy technique of only updating part of a page, using a ScriptManager.

```aspx
<%@ Page Language="C#" AutoEventWireup="true"
 CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral,
 PublicKeyToken=31bf3856ad364e35"
 Namespace="System.Web.UI" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC
 "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head runat="server">
        <title>Untitled Page</title>
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="Label1" runat="server" Text="This is a label!"></asp:Label>
                        <asp:Button ID="Button1" runat="server" Text="Click Me" OnClick="Button1_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </form>
    </body>
</html>
```