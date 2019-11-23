<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowContent.aspx.cs" Inherits="DigitalSystem.welcome.configure.ShowContent" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="manager" runat="server"></asp:ScriptManager>
    <div>
       <h1 style="text-align:center"><dx:ASPxLabel ID="TitleLabel" runat="server"></dx:ASPxLabel></h1> 
        <div id="contentdiv" runat="server">
            <!--此处显示内容 -->
        </div>
    </div>
    </form>
    <script type="text/javascript">
        
    </script>
</body>
</html>
