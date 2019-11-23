<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Configure.aspx.cs" Inherits="DigitalSystem.welcome.Confirgure" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        iframe {
        border:none;
        width:100%;
        margin:0px;
        padding:0px;
        height:650px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="manager" runat="server"></asp:ScriptManager>
    <div>
        <dx:ASPxPageControl ID="PageControl" runat="server" Width="100%">
            <TabPages>
                <dx:TabPage Text="区域管理">
                    <ContentCollection>
                        <dx:ContentControl>
                           <iframe src="AreaManage.aspx"></iframe>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="功能管理">
                    <ContentCollection>
                        <dx:ContentControl>
                            <iframe src="FunctionManage.aspx"></iframe>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="内容管理">
                    <ContentCollection>
                        <dx:ContentControl>
                            <iframe src="ContentManage.aspx"></iframe>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
        </dx:ASPxPageControl>
        
    </div>
    </form>
</body>
</html>
