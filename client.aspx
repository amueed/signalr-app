<%@ Page Language="C#" AutoEventWireup="true" CodeFile="client.aspx.cs" Inherits="client" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <ul class="notificationBalloon" id="container">
    </ul>
    <!--(page scripts)-->
    <script src="Scripts/jquery-2.2.3.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.signalR-2.2.0.min.js"></script>
    <script src="/signalr/hubs" type="text/javascript"></script>
    <script>
        $(function () {
            var proxy = $.connection.notificationHub;
            proxy.client.receiveNotification = function (message) {
                $("#container").append('<li>' + message + '</li>');
                //setTimeout('$("#container").html("");', 3000);
            };
            $.connection.hub.start();
        });
    </script>
</body>
</html>
