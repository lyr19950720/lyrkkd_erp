<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentManage.aspx.cs" Inherits="DigitalSystem.welcome.ContentManage" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        html, body, form {
            padding: 0px;
            margin: 0px;
            overflow: hidden;
            height: 100%;
        }
    </style>
    <script type="text/javascript">
        function GV_ContentRowClick(key)//key为点击行的ID
        {
            //alert(Splitter.GetPaneByName("ContentPane").ContentUrl);
            Splitter.GetPaneByName("ContentPane").SetContentUrl("EditContent.aspx?key=" + key);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="manager" runat="server"></asp:ScriptManager>
        <div style="height: 100%">
            <dx:ASPxSplitter ID="Splitter" runat="server" Orientation="Horizontal" Width="100%" Height="100%" ClientIDMode="AutoID" ClientInstanceName="Splitter">
                <Panes>
                    <dx:SplitterPane Size="40%">
                        <ContentCollection>
                            <dx:SplitterContentControl>
                                <div>
                                    <dx:ASPxGridView ID="GV_Content" runat="server" AutoGenerateColumns="False" DataSourceID="lq_content" KeyFieldName="ID"
                                        Width="100%" SettingsBehavior-AllowSort="false" SettingsBehavior-AllowSelectByRowClick="true" EnableCallBacks="false"
                                        OnRowDeleting="GV_Content_RowDeleting" OnRowInserting="GV_Content_RowInserting" OnRowUpdating="GV_Content_RowUpdating"
                                        ClientIDMode="AutoID" ClientInstanceName="GV_Content">
                                        <SettingsText EmptyDataRow="无数据显示" />
                                        <SettingsPager>
                                            <Summary Text="第{0}页  共{1}页 (共{2} 项)" />
                                        </SettingsPager>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Visible="false">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="标题" FieldName="Title" ShowInCustomizationForm="True" VisibleIndex="0" Width="35%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="是否显示" FieldName="Enable" ShowInCustomizationForm="True" VisibleIndex="2" Width="5%">
                                                <DataItemTemplate>
                                                    <dx:ASPxLabel ID="EnableLabel" runat="server" Text='<%#getContentEnable(Eval("Enable")) %>'></dx:ASPxLabel>
                                                </DataItemTemplate>
                                                <PropertiesComboBox>
                                                    <Items>
                                                        <dx:ListEditItem Text="是" Value="1" />
                                                        <dx:ListEditItem Text="否" Value="0" />
                                                    </Items>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataDateColumn Caption="创建时间" FieldName="Time" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="功能名称" FieldName="FunctionID" ShowInCustomizationForm="True" VisibleIndex="1" Width="10%">
                                                <PropertiesComboBox DataSourceID="lq_function" TextField="Name" ValueField="ID"></PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataTextColumn Caption="内容" FieldName="Content" ShowInCustomizationForm="True" VisibleIndex="4" Visible="false">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="序号" FieldName="Order" ShowInCustomizationForm="True" VisibleIndex="4" Width="5%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewCommandColumn Caption="操作" ShowInCustomizationForm="True" VisibleIndex="5">
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
                                        <ClientSideEvents RowClick="function(s,e){GV_ContentRowClick( s.GetRowKey(e.visibleIndex));}" />
                                    </dx:ASPxGridView>
                                    <asp:LinqDataSource ID="lq_content" runat="server" ContextTypeName="DigitalSystem.contextDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="P_Content"></asp:LinqDataSource>
                                    <asp:LinqDataSource ID="lq_function" runat="server" ContextTypeName="DigitalSystem.contextDataContext" Select="new (ID, Name)" TableName="P_Function"></asp:LinqDataSource>
                                </div>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                    <dx:SplitterPane ScrollBars="Vertical" Name="ContentPane" ContentUrl="EditContent.aspx">
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server" SupportsDisabledAttribute="True">
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                </Panes>
            </dx:ASPxSplitter>
        </div>
    </form>
</body>
</html>
