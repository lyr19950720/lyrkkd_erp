﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lessonStatus.aspx.cs" Inherits="DigitalSystem.train.floder.lessonStatus" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="LinqDataSource1" KeyFieldName="ID" Width="100%">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="2" Caption="操作">
                    <EditButton Visible="True" Text="编辑">
                    </EditButton>
                    <CancelButton Text="取消">
                    </CancelButton>
                    <UpdateButton Text="确定">
                    </UpdateButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0" Visible="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1" Caption="状态名称">
                </dx:GridViewDataTextColumn>
                
            </Columns>
            </dx:ASPxGridView>
            </ContentTemplate>
        
        </asp:UpdatePanel>
    </div> 
    </form>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EnableUpdate="True" EntityTypeName="" TableName="train_lesson_status" EnableViewState="False"></asp:LinqDataSource>
</body>
</html>
