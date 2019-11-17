<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trainRecord.aspx.cs" Inherits="DigitalSystem.train.trainRedirect" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler.Controls" TagPrefix="dxwschsc" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

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
       <link href="../Styles/ToolKitStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
     .hidden{display:none;}
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
     <link href="../Styles/ToolKitStyle.css" rel="stylesheet" type="text/css" />
  
    
        <script type="text/javascript">
     

    
            function gridList_SelectionChanged(s, e) {
                //            gridAuditedList.Refresh();
                if (e.isSelected) {
                    e.processOnServer = false;
                    s.GetSelectedFieldValues('Id', OnGetSelectedFieldValues);

                }
            }
            function OnGetSelectedFieldValues(values) {
            //alert(values[0]);
                mainsplitter.GetPaneByName('right').SetContentUrl("train_course_details.aspx?Course_id=" + values[0]);
    
            }
          
    </script>

</head>

    <body>
    <form id="form1" runat="server">
        <div style="overflow:scroll; position:relative; top:0px; width:100%; height:100%; left:0px;" runat="server" >     
            <%--分隔栏--%>
            <dx:ASPxSplitter ID="mainsplitter"    ShowCollapseBackwardButton="True"  ShowCollapseForwardButton="True"   ClientInstanceName="mainsplitter" runat="server"
                  Height="1000px" Width="100%" FullscreenMode="True" Style="margin-bottom: 0px" ClientIDMode="AutoID" >
              
                  <Panes>
                    <%--左分隔栏--%>

                    <dx:SplitterPane  Name="left" ScrollBars="Auto" ShowCollapseBackwardButton="True"  ShowCollapseForwardButton="True" Size="50%">
                         <Panes >  
                           
                               
                           <dx:SplitterPane Name="find_course"  ScrollBars="Auto"  ShowCollapseBackwardButton="True" ShowCollapseForwardButton="True" Size="6%" AllowResize="True">
                               <ContentCollection>
                                   <dx:SplitterContentControl >
                                      
                                   
                                       <table>
                                           <tr>
                                               <td>
                                                   <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="请输入课程编号"></dx:ASPxLabel>
                                               </td>
                                                 <td>  
                                                    <textarea  id="Number" runat="server" style="height:15px;font-size:xx-small" cols="4"  ></textarea>
                                                     
                                               </td>
                                                    <td>
                                            <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Width="135px" >
                                             <Items>
                                               <dx:ListEditItem Text="年份" />
                                             </Items>
                                         </dx:ASPxComboBox>
                                             </td>

                                                 <td>
                                                      <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" Width="135px" >
                                                    <Items>
                                                                 <dx:ListEditItem Text="全年" />

                             
                                                      </Items>
                                                  </dx:ASPxComboBox>

                                                 </td>
                                               <td>

                                                      <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" Width="135px" >
                                                    <Items>
                                                                  <dx:ListEditItem Text="课程状态" />                                                            
                             
                                                      </Items>
                                                  </dx:ASPxComboBox>
                                               </td>
                                                 <td>
                                                     <dx:ASPxButton ID="ASPxButton1" runat="server" Text="查询" OnClick="Select_Click"></dx:ASPxButton>
                                               </td>
                                               <td>
                                                     <dx:ASPxButton ID="ASPxButton2" runat="server" Text="刷新" OnClick="btnRefresh_Click"></dx:ASPxButton>
                                               </td>
                                           </tr>
                                       </table>
                                         <%--显示用户查询的课程的信息--%>

                                       <dx:ASPxGridView ID="ASPxGridView3" runat="server"  DataSourceID="LinqDataSource3" Width="100%" Visible="false"  ClientIDMode="AutoID"  >
                                            <ClientSideEvents SelectionChanged="gridList_SelectionChanged" />
                                          <Settings ShowFilterRow="True" />
                                           <SettingsText EmptyDataRow="无数据显示" />
                                            <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="Id"  Caption ="Id"   VisibleIndex="0"  visible="true" >
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Number"  Caption ="课程编号"  ReadOnly="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Name"  Caption ="课程名称" ReadOnly="True" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="employeename"  Caption ="培训教师" ReadOnly="True" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                      <dx:GridViewDataTextColumn FieldName="Time" Caption ="学时" ReadOnly="True" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Class_time" Caption ="培训时间" ReadOnly="True" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                    
                                                    <dx:GridViewDataTextColumn FieldName="Place" Caption ="培训地点" ReadOnly="True" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn FieldName="Start_date" Caption ="开始日期" ReadOnly="True" VisibleIndex="7">
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataDateColumn FieldName="End_date" Caption ="结束日期" ReadOnly="True" VisibleIndex="8">
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataTextColumn FieldName="StatusName"  Caption ="状态" ReadOnly="True" VisibleIndex="9">
                                                    </dx:GridViewDataTextColumn>
                                                      <%-- <dx:GridViewDataTextColumn FieldName="option"  Caption ="操作" ReadOnly="True"  VisibleIndex="10" >
                                                        <DataItemTemplate >
                                                      
                                                            <dx:ASPxButton ID="Details"  runat="server" Text="查看详情"  >
                                                                <ClientSideEvents  click="gridList_SelectionChanged"/>
                                                                   <%--<ClientSideEvents Click="Details_Click" />
                                                            </dx:ASPxButton>
                                                       
                                                        </DataItemTemplate>
                                                      
                                                    </dx:GridViewDataTextColumn>--%>
                    
                                             </Columns>
                                            <Styles>
                                                    <Cell Wrap="True" HorizontalAlign="Center">
                                                    </Cell>
                                                    <Header HorizontalAlign="Center">
                                                    </Header>
                                                </Styles>
                                       </dx:ASPxGridView> 
                                        <asp:HiddenField  ID="HiddenField1" runat="server"   EnableViewState="false"   />
                                       <asp:HiddenField  ID="HiddenField11" runat="server"   EnableViewState="false"   />
                                        <asp:HiddenField  ID="HiddenField2" runat="server"   EnableViewState="false"   />
                                        <asp:HiddenField  ID="HiddenField3" runat="server"   EnableViewState="false"   />
                                       <asp:HiddenField  ID="HiddenField4" runat="server"   EnableViewState="false"   />
                                       <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" Select="new (Id, Number, Name, employeename,Time, Class_time,Place, Start_date, End_date, StatusName)" 
                                            where ="" TableName ="train_course_view" >
                                                <WhereParameters>         
                                                    <asp:ControlParameter  ControlID="HiddenField4"  DefaultValue="-1"  Name="course_number" PropertyName="Value" Type="String" />                              
                                                        <asp:ControlParameter  ControlID="HiddenField1"    Name="course_year_start" PropertyName="Value" Type="DateTime"  />
                                                    <asp:ControlParameter  ControlID="HiddenField11"    Name="course_year_end" PropertyName="Value" Type="DateTime"  />
                                                    <asp:ControlParameter  ControlID="HiddenField2"  DefaultValue="-1"  Name="course_term" PropertyName="Value" Type="String"  />
                                                    <asp:ControlParameter  ControlID="HiddenField3"  DefaultValue="-1"  Name="course_status" PropertyName="Value" Type="String"  />

                                                </WhereParameters>

                                          </asp:LinqDataSource>
                                                
                                   </dx:SplitterContentControl>

                               </ContentCollection>
                           </dx:SplitterPane>
                        

                          <%-- 显示已经开课但是还没有结课的课程--%>
                           <dx:SplitterPane Name="starting_train" ScrollBars="Auto"  ShowCollapseBackwardButton="True" ShowCollapseForwardButton="True" Size="35%" >
                   
                               <ContentCollection>
                                   
                                     <dx:SplitterContentControl  ID="SplitterContentControl1" runat="server" SupportsDisabledAttribute="True" >

                                           <dx:ASPxGridView ID="ASPxGridView1" runat="server" Caption="开课未结课的课程信息" Width="100%" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="starting_course"   
                                                KeyFieldName="Id"  >
                                              
                                                 <ClientSideEvents SelectionChanged="gridList_SelectionChanged" />

                                                 <Columns>
                                                    <dx:GridViewDataColumn FieldName="Id"  Caption ="Id"  VisibleIndex="0"   Visible="false">
                                                    </dx:GridViewDataColumn>
                                                     
                                                    <dx:GridViewDataTextColumn FieldName="Number"  Caption ="课程编号"  ReadOnly="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Name"  Caption ="课程名称" ReadOnly="True" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="employeename"  Caption ="培训教师" ReadOnly="True" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                       <dx:GridViewDataTextColumn FieldName="Time" Caption ="学时" ReadOnly="True" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Class_time" Caption ="培训时间" ReadOnly="True" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                     
                                                    <dx:GridViewDataTextColumn FieldName="Place" Caption ="培训地点" ReadOnly="True" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn FieldName="Start_date" Caption ="开始日期" ReadOnly="True" VisibleIndex="7">
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataDateColumn FieldName="End_date" Caption ="结束日期" ReadOnly="True" VisibleIndex="8">
                                                    </dx:GridViewDataDateColumn>
                                                       <dx:GridViewDataTextColumn FieldName="StatusName"  Caption ="状态" ReadOnly="True" VisibleIndex="9">
                                                    </dx:GridViewDataTextColumn>
                                                   <%-- <dx:GridViewDataTextColumn FieldName="option"  Caption ="操作" ReadOnly="True"  VisibleIndex="10">
                                                        <DataItemTemplate >
                                                            <dx:ASPxButton ID="Details" runat="server" ClientIDMode="AutoID" Text="查看详情"   Wrap="False" AutoPostBack="false">
                                                                 <ClientSideEvents Click="gridList_SelectionChanged" />
                                                            </dx:ASPxButton>
                                          
                                            
                                                        </DataItemTemplate>
                                                      
                                                    </dx:GridViewDataTextColumn>--%>
                                             </Columns>
                                                 <%--翻页功能--%>
                                                  <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                  <Styles>
                                                    <Cell Wrap="True" HorizontalAlign="Center">
                                                    </Cell>
                                                    <Header HorizontalAlign="Center">
                                                    </Header>
                                                </Styles>
                                                <SettingsPager AlwaysShowPager="true" PageSize="12" NumericButtonCount="5">
                                                    <Summary Text="第{0}页  共{1}页 (共{2} 项)" />
                                                </SettingsPager>
                                                <SettingsText EmptyDataRow="无数据显示" /> 
                                                  <%--翻页功能--%>
                                        </dx:ASPxGridView>
                                       
                                        <%-- 配置数据源--%>
                                           <asp:LinqDataSource ID="starting_course" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" Select="new (Id, Number, Name, employeename,Time, Class_time,Place, Start_date, End_date, StatusName)" 
                                              Where="Status !=3"
                                                TableName ="train_course_view">
                                              <%--  <WhereParameters>                                       
                                            <asp:Parameter DefaultValue="正在进行" Name="Running" Type="String" />
                                            </WhereParameters>--%>
                                          </asp:LinqDataSource>
                                    
                                    </dx:SplitterContentControl>
                              </ContentCollection>
                           </dx:SplitterPane>


                            <%-- 显示已经开课并且结课的课程--%>
                           <dx:SplitterPane  Name="end_train" ScrollBars="Auto" ShowCollapseBackwardButton="True" ShowCollapseForwardButton="True" Size="60%"  >
                   
                               <ContentCollection>
                                     <dx:SplitterContentControl  ID="SplitterContentControl2" runat="server" SupportsDisabledAttribute="True">
                                          
                                         <dx:ASPxGridView ID="ASPxGridView2" runat="server" Caption="结课的课程信息" Width="100%" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="end_course"   KeyFieldName="Id">
                                                   <ClientSideEvents SelectionChanged="gridList_SelectionChanged" />
                                                 <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id"  Caption ="Id"  ReadOnly="True" VisibleIndex="-1" Visible="false" >
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Number"  Caption ="课程编号"  ReadOnly="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Name"  Caption ="课程名称" ReadOnly="True" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="employeename"  Caption ="培训教师" ReadOnly="True" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                       <dx:GridViewDataTextColumn FieldName="Time" Caption ="学时" ReadOnly="True" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Class_time" Caption ="培训时间" ReadOnly="True" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                     
                                                    <dx:GridViewDataTextColumn FieldName="Place" Caption ="培训地点" ReadOnly="True" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn FieldName="Start_date" Caption ="开始日期" ReadOnly="True" VisibleIndex="7">
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataDateColumn FieldName="End_date" Caption ="结束日期" ReadOnly="True" VisibleIndex="8">
                                                    </dx:GridViewDataDateColumn>
                                                       <dx:GridViewDataTextColumn FieldName="StatusName"  Caption ="状态" ReadOnly="True" VisibleIndex="9">

                                                       <%-- <DataItemTemplate>
                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="已经结课"></dx:ASPxLabel>
                                                        </DataItemTemplate>--%>
                                                    </dx:GridViewDataTextColumn>
                                                  <%--  <dx:GridViewDataTextColumn FieldName="option"  Caption ="操作" ReadOnly="True"  VisibleIndex="10">
                                                        <DataItemTemplate >
                                                            <dx:ASPxButton ID="Details" runat="server" ClientIDMode="AutoID" Text="查看详情"   Wrap="False" AutoPostBack="false">
                                                                 
                                                            </dx:ASPxButton>
                                          
                                            
                                                        </DataItemTemplate>
                                                      
                                                    </dx:GridViewDataTextColumn>--%>
                                             </Columns>
                                                 <%--翻页功能--%>
                                                  <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                  <Styles>
                                                    <Cell Wrap="True" HorizontalAlign="Center">
                                                    </Cell>
                                                    <Header HorizontalAlign="Center">
                                                    </Header>
                                                </Styles>
                                                <SettingsPager AlwaysShowPager="true" PageSize="12" NumericButtonCount="5">
                                                    <Summary Text="第{0}页  共{1}页 (共{2} 项)" />
                                                </SettingsPager>
                                                <SettingsText EmptyDataRow="无数据显示" /> 
                                                  <%--翻页功能--%>
                                        </dx:ASPxGridView>
                                         <%--配置数据源--%>
                                          <asp:HiddenField  ID="hidden" runat="server"   EnableViewState="false"   />
                                         <asp:LinqDataSource ID="end_course" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" Select="new (Id, Number, Name, employeename, Time,Class_time,Place, Start_date, End_date, StatusName)" 
                                             where ="Status = 3"
                                              TableName ="train_course_view">                
                                     
                                      </asp:LinqDataSource>
                                        
                                    
                                                
                                    </dx:SplitterContentControl>
                              </ContentCollection>
                           </dx:SplitterPane>
                       </Panes>
<ContentCollection>
<dx:SplitterContentControl runat="server" SupportsDisabledAttribute="True"></dx:SplitterContentControl>
</ContentCollection>
                    </dx:SplitterPane>
                    
                 
                    <%--右分隔栏--%>
                    <dx:SplitterPane Name="right" ScrollBars="Auto" ShowCollapseBackwardButton="True" ContentUrl="blank.aspx"
                    ShowCollapseForwardButton="True">
                    <ContentCollection>
                        <dx:SplitterContentControl ID="SplitterContentControl3" runat="server" SupportsDisabledAttribute="True"></dx:SplitterContentControl>
                    </ContentCollection>

                </dx:SplitterPane>
            </Panes>
        </dx:ASPxSplitter>
        </div>
             
    </form>
</body>
</html>

