﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Log Items</h3>
            <asp:ListView ID="logListView" runat="server" ItemPlaceholderID="itemPlaceHolder" ClientIDMode="Static" EnableViewState="false">
                <LayoutTemplate>
                    <ul id="logUl">
                        <li runat="server" id="itemPlaceHolder"></li>
                    </ul>
                </LayoutTemplate>
                <ItemTemplate>
                    <li><span class="logItem"><%#Container.DataItem.ToString() %></span></li>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </form>
    <!--(page scripts)-->
    <script src="Scripts/jquery-2.2.3.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.signalR-2.2.0.min.js"></script>
    <script src="/signalr/hubs" type="text/javascript"></script>
    <script>
        $(function () {

            var logger = $.connection.logHub;

            logger.client.logMessage = function (msg) {

                $("#logUl").append("<li>" + msg + "</li>");

            };

            $.connection.hub.start();

        });
    </script>
</body>
</html>
