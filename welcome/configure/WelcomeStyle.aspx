<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomeStyle.aspx.cs" Inherits="DigitalSystem.welcome.configure.WelcomeStyle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        table,tr
        {
            border-collapse:collapse;
            width:100%;
            border:1px solid black;
        }
        td
        {
            border-collapse:collapse;
            border:1px solid black;
        }
        table.logintable
        {
            height:100px;
        }
        table.contenttable
        {
            height:200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="manager" runat="server"></asp:ScriptManager>
    <div>
        <div id="stylediv" runat="server"></div>
    </div>
    </form>
</body>
</html>
