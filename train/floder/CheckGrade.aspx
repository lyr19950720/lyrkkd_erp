<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckGrade.aspx.cs" Inherits="DigitalSystem.train.floder.CheckGrade" %>
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
    <div style="overflow:scroll; position:relative; top:0px; width:100%; height:1000px; left:0px;" runat="server" >
        <dx:ASPxGridView ID="ASPxGridViewForDepot" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="LinqDataSource1" Width="100%" KeyFieldName="Id">
            <Settings ShowFilterRow="True" />
            <SettingsText EmptyDataRow="无数据显示" />
  
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <EditButton Visible="True">
                    </EditButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Employee_id" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
  
                <dx:GridViewDataTextColumn FieldName="Grade" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Course_id" VisibleIndex="4" Visible="false">
                </dx:GridViewDataTextColumn>
            </Columns>

        </dx:ASPxGridView>
    </div>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EnableUpdate="True" EntityTypeName="" TableName="Train_Employee_User_view" Where="Course_id == @Course_id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Course_id" SessionField="Id" Type="Int32" />
            </WhereParameters>
            
        </asp:LinqDataSource>
      
    </form>
</body>
</html>
