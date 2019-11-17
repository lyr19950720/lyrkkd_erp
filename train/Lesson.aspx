<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lesson.aspx.cs" Inherits="DigitalSystem.train.Lesson" %>
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
                mainsplitter.GetPaneByName('right').SetContentUrl("LessonRedirect.aspx?pageAttr=edit&lessonId=-1");

            }
            function gridEditList_SelectionChanged(s, e) {
                //            gridAuditedList.Refresh();
                if (e.isSelected) {
                    e.processOnServer = false;
                    s.GetSelectedFieldValues('Id', OnGetSelectedFieldValues);

                }
            }
            function OnGetSelectedFieldValues(values) {
                mainsplitter.GetPaneByName('right').SetContentUrl("LessonRedirect.aspx?pageAttr=edit&lessonId=" + values[0]);

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
        <div style="height: 100%">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <dx:ASPxSplitter ID="mainsplitter" runat="server" ClientInstanceName="mainsplitter"
                Height="1000px" Width="100%" FullscreenMode="True" Style="margin-bottom: 0px" ClientIDMode="AutoID">
                <Panes>
                    <dx:SplitterPane Name="left" ScrollBars="Auto" ShowCollapseBackwardButton="True"
                        ShowCollapseForwardButton="True" Size="50%">
                        <Panes>
                            <dx:SplitterPane Name="newProject" Size="50px">
                                <ContentCollection>
                                    <dx:SplitterContentControl ID="SplitterContentControl2" runat="server" SupportsDisabledAttribute="True">
                                        <table>
                                            <tr>

                                                <td>
                                                   
                                                    &nbsp;</td>
                                              <td>
                                                    <dx:ASPxButton ID="btnNew" runat="server" Text="新建课程" Wrap="False" AutoPostBack="False">
                                                        <ClientSideEvents Click="btnNew_Click" />
                                                    </dx:ASPxButton>
                                                </td>


                                                <td>
                                                    <dx:ASPxButton ID="RefreshBtn" runat="server" ClientIDMode="AutoID" Text="刷新" Visible = "false" ClientInstanceName="RefreshBtn" OnClick="RefreshBtn_Click"
                                                        Height="1px">
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>
                            <dx:SplitterPane Name="editProject" ScrollBars="Auto" ShowCollapseBackwardButton="True"
                                ShowCollapseForwardButton="True">
                                <ContentCollection>
                                    <dx:SplitterContentControl ID="SplitterContentControl3" runat="server" SupportsDisabledAttribute="True">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <table>
                                                    <tr>
                                                        <td>             
                                                       <dx:ASPxLabel ID="ASPxLabel2" runat="server" ClientIDMode="AutoID" Text="课程名称">
                                                            </dx:ASPxLabel>
                                                        </td>
                                             <td>
                                                            <dx:ASPxTextBox ID="txtProjectName1" runat="server" Width="200px" 
                                                                AutoPostBack="True">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                    </tr>
                                                </table>
                                                <dx:ASPxGridView ID="gridEditList" runat="server" DataSourceID="LinqDataSource1"  ClientInstanceName="gridEditList" Width="100%" 
                                                       AutoGenerateColumns="False" ClientIDMode="AutoID" Caption="课程基本信息" KeyFieldName="Id">
                                                    <ClientSideEvents SelectionChanged="gridEditList_SelectionChanged" />
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="Number"  VisibleIndex="0" ReadOnly="True" Caption="课程编号">
                                                            </dx:GridViewDataTextColumn>
                                                         <dx:GridViewDataTextColumn FieldName="Name" ReadOnly="True" VisibleIndex="1" Caption="课程名称">
                                                          </dx:GridViewDataTextColumn>
                                                       <dx:GridViewDataTextColumn FieldName="Type"  VisibleIndex="2" ReadOnly="True" Caption="类型" >
                                                       </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Time"  VisibleIndex="3" ReadOnly="True" Caption="学时" >
                          
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="4" Visible="False">
                                                    </dx:GridViewDataTextColumn>
                
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
                                                    <SettingsText EmptyDataRow="无数据显示" />
                                                </dx:ASPxGridView>
                                                
                                                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="train_lesson_basicInfo"></asp:LinqDataSource>
                                                
                                                <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="loadingPanelWait"
                                                    Text="请稍等">
                                                </dx:ASPxLoadingPanel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>
                            <dx:SplitterPane Name="AuditedProject" ScrollBars="Auto" ShowCollapseBackwardButton="True"
                                ShowCollapseForwardButton="True">
                                <ContentCollection>
                                    <dx:SplitterContentControl ID="SplitterContentControl4" runat="server" SupportsDisabledAttribute="True">
                                        <div style="display: none">
                                        </div>
                                    </dx:SplitterContentControl>
                                    
                                </ContentCollection>
                            </dx:SplitterPane>
                        </Panes>
                        <ContentCollection>
                            <dx:SplitterContentControl ID="SplitterContentControl6" runat="server" SupportsDisabledAttribute="True">
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                    <dx:SplitterPane Name="right" ContentUrl="blank.aspx" ScrollBars="Auto" ShowCollapseBackwardButton="True"
                        ShowCollapseForwardButton="True">
                        <ContentCollection>
                            <dx:SplitterContentControl ID="SplitterContentControl5" runat="server" SupportsDisabledAttribute="True">
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                </Panes>
            </dx:ASPxSplitter>
        </div>
    </form>
</body>
</html>
