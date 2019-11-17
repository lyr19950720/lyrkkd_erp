﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherCourse.aspx.cs" Inherits="DigitalSystem.train.TeacherCourse" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <script src="../Scripts/jquery-2.1.1.js"></script>
      <link href="../../css/purchase.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        html, body, form
        {
            height: 100%;
            margin: 0px;
            padding: 0px;
            overflow: hidden;
            font-size: 12px;
            font-family: "宋体";
        }
    </style>
        <script type="text/javascript">
            function btnNew_Click(s, e) {
                e.processOnServer = false;
                mainsplitter.GetPaneByName('right').SetContentUrl("TeacherCourseRedirect.aspx?pageAttr=edit&Id=-1");

            }
            function gridEditList_SelectionChanged(s, e) {
                //            gridAuditedList.Refresh();
                if (e.isSelected) {
                    e.processOnServer = false;
                    s.GetSelectedFieldValues('Id', OnGetSelectedFieldValues);

                }
            }
            function OnGetSelectedFieldValues(values) {
                mainsplitter.GetPaneByName('right').SetContentUrl("TeacherCourseRedirect.aspx?pageAttr=edit&Id=" + values[0]);

            }
            function gridAuditedList_SelectionChanged(s, e) {
                //            gridEditList.Refresh();
                if (e.isSelected) {
                    e.processOnServer = false;

                    s.GetSelectedFieldValues('Id', OnGetSelectedFieldValues);
                }
            }
    </script>
</head>

    <body>
    <form id="form1" runat="server">
        <div style="overflow:scroll; position:relative; top:0px; width:100%; height:100%; left:0px;" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <dx:ASPxSplitter ID="mainsplitter" runat="server" ClientInstanceName="mainsplitter" 
                Height="1000px" Width="100%" ClientIDMode="AutoID" FullscreenMode="True" >

                 
                <Panes>

                    <dx:SplitterPane Name="left" ScrollBars="Auto" ShowCollapseBackwardButton="True"
                        ShowCollapseForwardButton="True" Size="50%">
                        <Panes>
                          <dx:SplitterPane Name="newProject" Size="30px">
                                <ContentCollection>
                                    <dx:SplitterContentControl ID="SplitterContentControl2" runat="server" SupportsDisabledAttribute="True">
                                        <table>
                                            <tr>
                          <%--                      <td>
                                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="项目类型" Wrap="False">
                                                    </dx:ASPxLabel>
                                                </td>--%>
                                                <td>
                                                    <%--<asp:LinqDataSource ID="dsProjectType" runat="server" ContextTypeName="market.dbDataContext"
                                                        TableName="M_Project_Type" OnInit="dsProjectType_Init">
                                                    </asp:LinqDataSource>--%>
                                                    &nbsp;</td>
       
                                                <td>
                                                    <dx:ASPxButton ID="RefreshBtn" runat="server" ClientIDMode="AutoID" Text="刷新"  ClientVisible = "false" ClientInstanceName="RefreshBtn" OnClick="RefreshBtn_Click"
                                                        Height="1px">
                                                        <ClientSideEvents  Click="function(s,e){e.processOnServer=true;}"/>
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>
                          <dx:SplitterPane Name="editProject" ScrollBars="Auto" Size ="35%">
                                <ContentCollection>
                        
                                    <dx:SplitterContentControl ID="SplitterContentControl3" runat="server" SupportsDisabledAttribute="True">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                               
                                                <dx:ASPxGridView ID="gridEditList" runat="server" DataSourceID="LinqDataSource1"  ClientInstanceName="gridEditList" Width="100%" 
                                                       AutoGenerateColumns="False" ClientIDMode="AutoID" Caption="未结课课程信息" KeyFieldName="Id">
                                                    <ClientSideEvents SelectionChanged="gridEditList_SelectionChanged" />
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="6" Visible="false">
                                                    </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Create_time" ReadOnly="True" VisibleIndex="0" Caption="创建时间">
                                                    </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Number"  VisibleIndex="1" ReadOnly="True" Caption="课程编号">
                                                            </dx:GridViewDataTextColumn>
                                                         <dx:GridViewDataTextColumn FieldName="Name" ReadOnly="True" VisibleIndex="2" Caption="课程名称">
                                                          </dx:GridViewDataTextColumn>
                                                       <dx:GridViewDataComboBoxColumn FieldName="Type" ShowInCustomizationForm="True" VisibleIndex="3" Caption="类型">
                                                    <PropertiesComboBox ValueType="System.String" DataSourceID="LinqDataSourceType" TextField="lesson_type_name" ValueField="id"></PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                    
                                                    <dx:GridViewDataComboBoxColumn FieldName="ContentTypeId" ShowInCustomizationForm="True" VisibleIndex="4" Caption="内容类型">
                                                        <PropertiesComboBox ValueType="System.String" DataSourceID="LinqDataSourceContentType" TextField="TypeName" ValueField="ID"></PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>
                                                   
                                                    <dx:GridViewDataComboBoxColumn FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="5" Caption="状态">
                                                        <PropertiesComboBox ValueType="System.String" DataSourceID="LinqDataSourceStatus" TextField="Name" ValueField="ID"></PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>
                                                    </Columns>
                                                    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                    <Styles>
                                                        <Cell Wrap="True">
                                                        </Cell>
                                                        <Header HorizontalAlign="Center">
                                                        </Header>
                                                    </Styles>
                                                    <SettingsPager AlwaysShowPager="true" PageSize="12" NumericButtonCount="5">
                                                        <Summary Text="第{0}页  共{1}页 (共{2} 项)" />
                                                    </SettingsPager>
                                                    <Settings ShowFilterRow="True" />
                                                    <SettingsText EmptyDataRow="无数据显示" />
                                                </dx:ASPxGridView>
    
                                                <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="loadingPanelWait"
                                                    Text="请稍等">
                                                </dx:ASPxLoadingPanel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>

                            <dx:SplitterPane Name="editProject" ScrollBars="Auto">
                                <ContentCollection>
                        
                                    <dx:SplitterContentControl ID="SplitterContentControl1" runat="server" SupportsDisabledAttribute="True">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                               
                                                <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="LinqDataSourceEnd"  ClientInstanceName="gridEditList" Width="100%" 
                                                       AutoGenerateColumns="False" ClientIDMode="AutoID" Caption="已结课程信息" KeyFieldName="Id">
                                                    <ClientSideEvents SelectionChanged="gridEditList_SelectionChanged" />
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="6" Visible="false">
                                                    </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Create_time" ReadOnly="True" VisibleIndex="0" Caption="创建时间">
                                                    </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Number"  VisibleIndex="1" ReadOnly="True" Caption="课程编号">
                                                            </dx:GridViewDataTextColumn>
                                                         <dx:GridViewDataTextColumn FieldName="Name" ReadOnly="True" VisibleIndex="2" Caption="课程名称">
                                                          </dx:GridViewDataTextColumn>
                                                       <dx:GridViewDataComboBoxColumn FieldName="Type" ShowInCustomizationForm="True" VisibleIndex="3" Caption="类型">
                                                    <PropertiesComboBox ValueType="System.String" DataSourceID="LinqDataSourceType" TextField="lesson_type_name" ValueField="id"></PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                    
                                                    <dx:GridViewDataComboBoxColumn FieldName="ContentTypeId" ShowInCustomizationForm="True" VisibleIndex="4" Caption="内容类型">
                                                        <PropertiesComboBox ValueType="System.String" DataSourceID="LinqDataSourceContentType" TextField="TypeName" ValueField="ID"></PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>
                                                   
                                                   <%-- <dx:GridViewDataComboBoxColumn FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="5" Caption="状态">
                                                        <PropertiesComboBox ValueType="System.String" DataSourceID="LinqDataSourceStatus" TextField="Name" ValueField="ID"></PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>--%>
                                                    </Columns>
                                                    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                    <Styles>
                                                        <Cell Wrap="True">
                                                        </Cell>
                                                        <Header HorizontalAlign="Center">
                                                        </Header>
                                                    </Styles>
                                                    <SettingsPager AlwaysShowPager="true" PageSize="12" NumericButtonCount="5">
                                                        <Summary Text="第{0}页  共{1}页 (共{2} 项)" />
                                                    </SettingsPager>
                                                    <Settings ShowFilterRow="True" />
                                                    <SettingsText EmptyDataRow="无数据显示" />
                                                </dx:ASPxGridView>
    
                                                <dx:ASPxLoadingPanel ID="ASPxLoadingPanel2" runat="server" ClientInstanceName="loadingPanelWait"
                                                    Text="请稍等">
                                                </dx:ASPxLoadingPanel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>
                     
                        </Panes>
                    </dx:SplitterPane>
                    <dx:SplitterPane Name="right" ContentUrl="blank.aspx" ScrollBars="Auto" >
                        <ContentCollection>
                            <dx:SplitterContentControl ID="SplitterContentControl5" runat="server" SupportsDisabledAttribute="True">
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                </Panes>
            </dx:ASPxSplitter>
        </div>

        <div>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" TableName="train_course_view" Where="Teacher == @Teacher &amp;&amp; Status != @Status">
                <WhereParameters>
                    <asp:SessionParameter DefaultValue="0" Name="Teacher" SessionField="user_id" Type="Int32" />
                    <asp:Parameter DefaultValue="3" Name="Status" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
            <asp:LinqDataSource ID="LinqDataSourceEnd" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" TableName="train_course_view" Where="Teacher == @Teacher &amp;&amp; Status == @Status">
                <WhereParameters>
                    <asp:SessionParameter DefaultValue="0" Name="Teacher" SessionField="user_id" Type="Int32" />
                    <asp:Parameter DefaultValue="3" Name="Status" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
       
             <asp:LinqDataSource ID="LinqDataSourceType" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" TableName="train_lesson_type"></asp:LinqDataSource>
             <asp:LinqDataSource ID="LinqDataSourceContentType" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" TableName="train_lesson_content_type" Select="new (ID, TypeName)"></asp:LinqDataSource>
         <asp:LinqDataSource ID="LinqDataSourceStatus" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" TableName="train_course_status"></asp:LinqDataSource>
    
        </div>
    </form>
</body>
</html>
