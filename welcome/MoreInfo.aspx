<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoreInfo.aspx.cs" Inherits="DigitalSystem.welcome.MoreInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        table
        {
            width:100%;
             table-layout:fixed;
        }
         a
        {
            text-decoration:none;
            color:#333;
        }
        tr.functiontr
        {
            background-image:url(images/bgcolor.png);
            background-repeat:repeat-x;
            height:30px;
        }
        td
        {
            border-bottom:1px dashed #AECAF0;
            border-collapse:collapse;
             word-break:keep-all;/* 不换行 */
            white-space:nowrap;/* 不换行 */
            overflow:hidden;
            text-overflow:ellipsis;
        }
        span.timespan
        {
            margin-left:80%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="manager" runat="server"></asp:ScriptManager>
    <div id="maindiv" runat="server">
    
    </div>
    </form>
</body>
</html>
