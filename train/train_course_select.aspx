<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="train_course_select.aspx.cs" Inherits="DigitalSystem.train.train_course_select" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHiddenField" tagprefix="dx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>


        function gridList_SelectionChanged(s, e) {
            //            gridAuditedList.Refresh();
            if (e.isSelected) {
                e.processOnServer = false;
                s.GetSelectedFieldValues('Lesson_id', OnGetSelectedFieldValues);

            }
        }
        function OnGetSelectedFieldValues(values) {
             Lesson_id = values[0];
             
          
        }
        function gridList2_SelectionChanged(s, e) {  
            if (e.isSelected) {
                e.processOnServer = false;
                s.GetSelectedFieldValues('Course_id', OnGetSelectedFieldValues2);
               gridList_SelectionChanged(s, e);
            }
        }
        function OnGetSelectedFieldValues2(values) {
           
            mainsplitter.GetPaneByName('right').SetContentUrl("train_course_details.aspx?Course_id=" + values[0]);
            
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div >
        <asp:HiddenField  ID="HiddenField1" runat="server"   EnableViewState="false" Value="-1"  />
       
        <dx:ASPxSplitter ID="mainsplitter"  ClientInstanceName="mainsplitter" runat="server" Height="1000px"   Width="100%" FullscreenMode="True" Style="margin-bottom: 0px" ClientIDMode="AutoID"   >
            <Panes>
                <%--左分隔栏--%>
                <dx:SplitterPane  Name="left" ScrollBars="Auto" ShowCollapseBackwardButton="True"  ShowCollapseForwardButton="True" Size="50%" >
                                <Panes>

                                    <%-- 学生选课 --%>
                                    <dx:SplitterPane  Name="select_course" ScrollBars="Auto"  ShowCollapseBackwardButton="True" ShowCollapseForwardButton="True" Size="30%" >
                                        <ContentCollection>
                                            <dx:SplitterContentControl ID="SplitterContentControl1" runat="server"  SupportsDisabledAttribute="True">
                                                  <dx:ASPxGridView  OnSelectionChanged="ASPxGridView1_SelectionChanged" ID="ASPxGridView1"  Caption="可选的课程" EnableCallBacks="false"  runat="server"  AutoGenerateColumns="False"
                                                       ClientIDMode="AutoID" DataSourceID="LinqDataSource1" Width ="100%"   KeyFieldName="Course_id">
                                                 
                                                 <ClientSideEvents  SelectionChanged="gridList2_SelectionChanged" />
                                                   <Settings ShowFilterRow="True" />
                                                     <SettingsText EmptyDataRow="无数据显示" />   
                                                      
                                     <Columns>
                <dx:GridViewDataTextColumn  FieldName="Course_id"  ReadOnly="True" VisibleIndex="0" visible="false">
                </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn  FieldName="Lesson_id" Caption="Id" ReadOnly="True" VisibleIndex="0" visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Number" Caption="课程编号" ReadOnly="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="cname" Caption="课程名称" ReadOnly="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="employeename" Caption="代课教师"  ReadOnly="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>      
                <dx:GridViewDataTextColumn FieldName="Class_time" Caption="上课时间" ReadOnly="True" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Place" Caption="上课地点" ReadOnly="True" VisibleIndex="5">
                         </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="Start_date" Caption="开始日期" ReadOnly="True" VisibleIndex="6">
                </dx:GridViewDataDateColumn>
                     <dx:GridViewDataDateColumn FieldName="End_date" Caption="结束日期" ReadOnly="True" VisibleIndex="7">           
                </dx:GridViewDataDateColumn>
                   



            </Columns>
                                         
                                                  <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
                                                <SettingsPager   AlwaysShowPager="true" PageSize="12" NumericButtonCount="5" >
                                                    <Summary  Text="第{0}页  共{1}页 (共{2} 项)" />
                                       
                                                  
                                                </SettingsPager>
                                                 <Settings ShowFilterRow="True" />
                                                  <SettingsText EmptyDataRow="无数据显示" />
                                                  <Styles>
                                                    <Cell Wrap="True" HorizontalAlign="Center">
                                                    </Cell>
                                                    <Header HorizontalAlign="Center">
                                                    </Header>
                                                </Styles>      
        </dx:ASPxGridView>
                                               
                                                                                      
                                  <div style ="padding-left:40%; padding-top:4%;float:left;padding-bottom:2%">
                                     <table>
                                         <tr>
                                             <td >
                                                    <dx:ASPxButton ID="ASPxButton12" runat="server" Text="选课"   Image-Url="~/Images/up.ico"  ImagePosition="Right" OnClick="ASPxButton1_Click" HorizontalAlign="Right"  ></dx:ASPxButton>
                                             </td>
                                             <td>
                                                    <dx:ASPxButton ID="ASPxButton22" runat="server" Text="退课" Image-Url="~/Images/down.ico" ImagePosition="Right" OnClick="ASPxButton2_Click"></dx:ASPxButton>                        
                                             </td>
                                         </tr>
                                     </table>
                                       </div>

                            
                                              
                                            </dx:SplitterContentControl>
                                        </ContentCollection>
                                    </dx:SplitterPane>
                                 
                                    <dx:SplitterPane Name="delete_course" ScrollBars="Auto" ShowCollapseBackwardButton="True" ShowCollapseForwardButton="True" >

                                        <ContentCollection>
                                            <dx:SplitterContentControl ID="SplitterContentControl2" runat="server"  SupportsDisabledAttribute="True">
                                                 
                                                                       <%-- 学生退课 --%>
                                                <dx:ASPxGridView ID="ASPxGridView2" ClientIDMode="AutoID" OnSelectionChanged="ASPxGridView2_SelectionChanged"  Caption="已选的课程" EnableCallBacks="false" runat="server"
                                                      AutoGenerateColumns="False" DataSourceID="LinqDataSource2" Width="100%"  KeyFieldName="Course_id"> 
                                                  
                                                       <ClientSideEvents  SelectionChanged="gridList2_SelectionChanged"/>
                                <Columns>
                                    
                                    <dx:GridViewDataTextColumn  FieldName="Course_id" Caption="Id" ReadOnly="True" VisibleIndex="0" Visible="false" >
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn  FieldName="LoginName"  Caption="员工编号" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="UserName" Caption="员工姓名" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Number"  Caption="课程编号" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="cname"  Caption="课程名称" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="Status"  Caption="课程状态" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     
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
                                                <Settings ShowFilterRow="True" />
                                                <SettingsText EmptyDataRow="无数据显示" /> 
                            </dx:ASPxGridView>
                                            </dx:SplitterContentControl>
                                        </ContentCollection>
                                    </dx:SplitterPane>

                                </Panes>
                            <%--</dx:ASPxSplitter>--%>
<%--                        </dx:SplitterContentControl>
                    </ContentCollection>--%>

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
        <%--配置数据源--%>
            <asp:HiddenField  ID="Hidden" runat="server"   EnableViewState="false"   />
        <asp:HiddenField  ID="Hidden2" runat="server"   EnableViewState="false"   />
         <asp:HiddenField  ID="Hidden3" runat="server"   EnableViewState="false"  Value="0" />
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" Select="new (Course_id,Lesson_id,Number, cname,Status, employeename, Place, Class_time, Start_date, End_date)" 
            Where="Status =1 and End_choose_date.AddDays(1)>= @nowdate and id = @imployee_id" TableName="train_personal_notselect_view">
            <WhereParameters>
                <asp:ControlParameter  ControlID="Hidden" DefaultValue="0"  Name="nowdate"  PropertyName="Value"  Type ="DateTime"/>
                   <asp:ControlParameter  ControlID="Hidden2" DefaultValue="0"  Name="imployee_id"  PropertyName="Value"  Type="Int32"/>
            </WhereParameters>
        </asp:LinqDataSource>

        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" Select="new (Course_id,LoginName, UserName, Number, cname)" 
            where="id=@imployee_id"
            TableName="train_record_view">
            <WhereParameters>
                <asp:ControlParameter  ControlID="Hidden2" DefaultValue="0"  Name="imployee_id"  PropertyName="Value"  Type ="Int32"/>
            </WhereParameters>
        </asp:LinqDataSource>

    </form>
</body>
</html>
