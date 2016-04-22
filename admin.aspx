<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input id="text1" type="text" />
            <input id="button1" type="button" value="Send" />
        </div>
    </form>
    <!--(page scripts)-->
    <script src="Scripts/jquery-2.2.3.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.signalR-2.2.0.min.js"></script>
    <!--virtual url for signalR-->
    <script src="/signalr/hubs" type="text/javascript"></script>
    <script>
        $(function () {
            //'notificationHub' Hub Name on server as camel case
            var proxy = $.connection.notificationHub;
            $("#button1").click(function () {
                //'sendNotifications' Hub function name in notificationHub class on server
                proxy.server.sendNotifications($("#text1").val());
            });
            $.connection.hub.start();
        });
    </script>
</body>
</html>
