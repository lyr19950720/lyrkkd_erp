<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FunctionManage.aspx.cs" Inherits="DigitalSystem.welcome.FunctionManage" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="manager" runat="server"></asp:ScriptManager>
        <div>
            <dx:ASPxGridView ID="GV_Function" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="lq_function" KeyFieldName="ID"
                Width="100%" EnableCallBacks="false" SettingsBehavior-AllowSort="false" OnRowInserting="GV_Function_RowInserting" OnRowDeleting="GV_Function_RowDeleting" OnRowUpdating="GV_Function_RowUpdating">
                <SettingsText EmptyDataRow="无数据显示" />
                <SettingsPager>
                    <Summary Text="第{0}页  共{1}页 (共{2} 项)" />
                </SettingsPager>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0" Visible="false">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="功能名称" FieldName="Name" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="是否显示" FieldName="Enable" VisibleIndex="1">
                        <DataItemTemplate>
                            <dx:ASPxLabel ID="EnableLabel" runat="server" Text='<%#getFunctionEnable(Eval("Enable")) %>'></dx:ASPxLabel>
                        </DataItemTemplate>
                        <PropertiesComboBox>
                            <Items>
                                <dx:ListEditItem Text="是" Value="1" />
                                <dx:ListEditItem Text="否" Value="0" />
                            </Items>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="区域名称" FieldName="AreaID" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="lq_area" TextField="Name" ValueField="ID">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn Caption="创建时间" FieldName="Time" VisibleIndex="3">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="序号" FieldName="Order" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewCommandColumn Caption="操作" VisibleIndex="6">
                        <EditButton Text="编辑" Visible="True">
                        </EditButton>
                        <NewButton Text="添加" Visible="True">
                        </NewButton>
                        <DeleteButton Text="删除" Visible="True">
                        </DeleteButton>
                        <CancelButton Text="取消">
                        </CancelButton>
                        <UpdateButton Text="确定">
                        </UpdateButton>
                    </dx:GridViewCommandColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="lq_function" runat="server" ContextTypeName="DigitalSystem.contextDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="P_Function"></asp:LinqDataSource>
            <asp:LinqDataSource ID="lq_area" runat="server" ContextTypeName="DigitalSystem.contextDataContext" EntityTypeName="" Select="new (ID, Name)" TableName="P_Area"></asp:LinqDataSource>
        </div>
        <h5>注：同一区域只能有一个功能给予显示，若同一区域内多个功能可显示，则按照序号排列显示第一个。</h5>
    </form>
</body>
</html>
