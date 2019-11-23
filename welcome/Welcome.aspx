<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="DigitalSystem.Welcome" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        iframe.loginiframe
        {
            width:100%;
            border:none;
            height:250px;
        }
        a
        {
            text-decoration:none;
            color:#333;
        }
        table.divtable
        {
            width:100%;
            height:250px;
            border:1px solid  #AECAF0;
            border-collapse:collapse;
        }
        td.divtd
        {
            vertical-align:top;
            border:1px solid  #AECAF0;
            border-collapse:collapse;
        }
        div.contentdiv
        {
            width:100%;
            height:250px;
        }
        table.contenttable
        {
            width:100%;
            table-layout:fixed;
        }
        tr.functiontr
        {
            background-image:url(images/bgcolor.png);
            background-repeat:repeat-x;
            height:30px;
        }
        tr.contenttr
        {
            height:30px;
        }
        td.titletd
        {
            border-bottom:1px dashed #AECAF0;
            border-collapse:collapse;
             word-break:keep-all;/* 不换行 */
            white-space:nowrap;/* 不换行 */
            overflow:hidden;
            text-overflow:ellipsis;
        }
        td.timetd
        {
            border-bottom:1px dashed #AECAF0;
            border-collapse:collapse;
        }
        span.timespan
        {
            margin-left:70%;
        }
        td.moretd
        {
            text-align:right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="manager" runat="server"></asp:ScriptManager>
    <div id="maindiv" runat="server" style="width:100%;">
    </div>
    </form>
</body>
</html>
