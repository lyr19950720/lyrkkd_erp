<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="train_course_details.aspx.cs" Inherits="DigitalSystem.train.train_course_details" %>

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
     <script type="text/javascript">
        
     </script>
</head>
<body>
    <form id="form1" runat="server" >
    <div>
        <div >         
             <table width="100%" style="border: thin solid #999999; background-color: #D8F0FE"
                        border="1px" cellpadding="2" cellspacing="0">
                        <tr>
                            <td colspan="4" align="center" style="font-weight: bold;">
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="课程信息" Wrap="False" Font-Size="Large">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
 
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="课程名称" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td colspan="3">    
                                 <dx:ASPxTextBox ID="Name" runat="server" ClientInstanceName="Name" Width="100%" >                                
                                </dx:ASPxTextBox>
                            </td>
                         </tr>
                        <tr>
                            
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="课程编号" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                 <dx:ASPxTextBox ID="Number" runat="server" ClientInstanceName="Number" Width="100%">                                
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="学时" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                 <dx:ASPxTextBox ID="Time" runat="server" ClientInstanceName="Time"                             
                                    Width="100%">                                
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            
                           <td >
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="类型" Wrap="False"  AutoPostBack="True" ValueType="System.Int32" ClientInstanceName="Type"
                                    TextField="lesson_type_name" ValueField="id">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox  ID="Type" runat="server" ClientIDMode="AutoID" DataSourceID="lessonType"  AutoPostBack="True" ValueType="System.Int32" ClientInstanceName="Type"
                                    TextField="lesson_type_name" ValueField="id" Width="100%">
                             </dx:ASPxTextBox>         
                            </td>
                            
                            <td >
                                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="内容类型" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="ContentType" runat="server" ClientIDMode="AutoID" DataSourceID=""  AutoPostBack="True" ValueType="System.Int32" ClientInstanceName="ContentType"
                                    DropDownStyle="DropDown" TextField="TypeName" ValueField="ID" Width="100%">
                             </dx:ASPxTextBox>         
                            </td>
           
                          <tr>
 
                            <td>
                                <div style="text-align:left;vertical-align:middle;padding-top:20%" >
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="课程描述" Wrap="False" Height="50px"  >  </dx:ASPxLabel>
                              
                                </div>
                                
                            </td>
                            <td colspan="3">    
                                 <dx:ASPxTextBox ID="Description" runat="server" ClientInstanceName="Description"                      
                                    Width="100%" Editable="False" Height="70px">                                
                                </dx:ASPxTextBox>
                            </td>
                         </tr>
 
                          <tr>

                            <td>
                                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="地点" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                     
                                 <dx:ASPxTextBox ID="Place" runat="server" ClientInstanceName="Place"                             
                                    Width="100%">                                
                                </dx:ASPxTextBox>
                          
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="上课时间" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                 <dx:ASPxTextBox ID="Class_time" runat="server" ClientInstanceName="Class_time"                             
                                    Width="100%">                                
                                </dx:ASPxTextBox>
                            </td>
                         </tr>
                         <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="上课开始日期" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                     
                                <dx:ASPxTextBox  ID="start_date" runat="server" ClientInstanceName="start_date"                             
                                    Width="100%"></dx:ASPxTextBox>
                          
                            </td>
             
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="上课结束日期" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                  <dx:ASPxTextBox ID="end_date" runat="server" ClientInstanceName="end_date"                             
                                    Width="100%"></dx:ASPxTextBox>
                            </td>
                         </tr>      
                       <tr>
                           <td>
                                <dx:ASPxLabel ID="ASPxLabeEndChooseDate" runat="server" Text="选课结束日期" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                  <dx:ASPxTextBox ID="EndChooseDate" runat="server" ClientInstanceName="EndChooseDate"                             
                                    Width="100%"></dx:ASPxTextBox>
                            </td>
                           <td >
                                <dx:ASPxLabel ID="CourseTeacherlable" runat="server" Text="教师" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="employeename" runat="server" ClientInstanceName="employeename"  Width="100%">
                             </dx:ASPxTextBox>         
                            </td>
                       </tr>
                       <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="状态" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>

                                <dx:ASPxTextBox ID="StatusName" runat="server" ClientInstanceName="StatusName"  Width="100%">
                              
                             </dx:ASPxTextBox>         
                            </td>
                          
                           
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="创建时间" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                 <dx:ASPxTextBox ID="Create_time" runat="server" ClientInstanceName="Create_time"                             
                                    Width="100%">                                
                                </dx:ASPxTextBox>
                            </td>
                       

                        </tr>

                    </table>
        <br />
        <br />
        </div>
      
                       

         <asp:HiddenField  ID="hidden" runat="server"   EnableViewState="false"   />

        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" Select="new (UserName, LoginName, Number,Grade)" 
            Where="Course_id=@Number" TableName="train_record_view">
            <WhereParameters>
                <asp:ControlParameter  ControlID="hidden" DefaultValue="0" Name="Number" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>

       <asp:LinqDataSource ID="grade_pass" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" Select="new (UserName, LoginName, Number, Grade)" Where="Course_id=@Number and Grade>=60 "
            TableName="train_record_view" >
            <WhereParameters>
                <asp:ControlParameter ControlID="hidden" DefaultValue="0" Name="Number" PropertyName="Value" Type="Int32" />
            </WhereParameters>
       </asp:LinqDataSource>

        <asp:LinqDataSource ID="grade_notpass" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" Select="new(UserName, LoginName, Number, Grade)" Where="Course_id=@Number and Grade <60"
          
            TableName="train_record_view" >
             <WhereParameters>
                <asp:ControlParameter ControlID="hidden" DefaultValue="0" Name="Number" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
         <asp:LinqDataSource ID="lessonType" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EnableUpdate="True" EntityTypeName="" TableName="train_lesson_type"></asp:LinqDataSource>
    </div>
        <div>
            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" width="100%">
                <TabPages>
                    <dx:TabPage Text="学员名单">
                        <ContentCollection>
                           <dx:ContentControl>
                               

                               <table>
                                   <tr>
                                       <td >学员总人数: </td>
                                       <td >
                                           <dx:ASPxLabel ID="Students_num" runat="server" Text="">  </dx:ASPxLabel>
                                       </td>
                                   </tr>
                                </table>
                               <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" Width="100%" OnHtmlRowPrepared="ASPxGridView3_HtmlRowPrepared">

                                   <Columns>
                                       <dx:GridViewDataTextColumn FieldName="Number" ReadOnly="True" Caption="课程编号" ShowInCustomizationForm="True" VisibleIndex="0">
                                       </dx:GridViewDataTextColumn>
                                       <dx:GridViewDataTextColumn FieldName="LoginName" ReadOnly="True" Caption="员工编号" ShowInCustomizationForm="True" VisibleIndex="1">
                                       </dx:GridViewDataTextColumn>
                                       <dx:GridViewDataTextColumn FieldName="UserName" ReadOnly="True" Caption="员工姓名" ShowInCustomizationForm="True" VisibleIndex="2">
                                       </dx:GridViewDataTextColumn>
                                       <dx:GridViewDataTextColumn FieldName="Grade" ReadOnly="True" Caption="成绩" ShowInCustomizationForm="True" VisibleIndex="3">
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
                                                    <Summary  Text="第{0}页  共{1}页 (共{2} 项)" />
                                                </SettingsPager>
                                                <SettingsText EmptyDataRow="无数据显示" /> 
                                                  <%--翻页功能--%>
                               </dx:ASPxGridView>
                               
                           </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="成绩合格">
                        <ContentCollection>
                            <dx:ContentControl>
                                 <table>
                                   <tr>
                                       <td >成绩合格总人数: </td>
                                       <td >
                                           <dx:ASPxLabel ID="pass_num" runat="server" Text="">  </dx:ASPxLabel>
                                       </td>
                                   </tr>
                                </table>
                                      <dx:ASPxGridView ID="ASPxGridView1" runat="server"  AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="grade_pass"  Width ="100%">
                             <Columns>
                                
                                 <dx:GridViewDataTextColumn FieldName="Number"  Caption="课程编号" ReadOnly="True" VisibleIndex="0">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="LoginName" Caption="员工编号"  ReadOnly="True" VisibleIndex="1">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="UserName"  Caption="员工姓名"  ReadOnly="True" VisibleIndex="2">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Grade"  Caption="成绩" ReadOnly="True" VisibleIndex="3">
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
                                                    <Summary  Text="第{0}页  共{1}页 (共{2} 项)" />
                                                </SettingsPager>
                                                <SettingsText EmptyDataRow="无数据显示" /> 
                                                  <%--翻页功能--%>
                         </dx:ASPxGridView>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="成绩不合格">
                        <ContentCollection>
                            <dx:ContentControl>
                                 <table>
                                   <tr>
                                       <td >成绩不合格总人数: </td>
                                       <td >
                                           <dx:ASPxLabel ID="notpass_num" runat="server" Text="">  </dx:ASPxLabel>
                                       </td>
                                   </tr>
                                </table>
                                      <dx:ASPxGridView ID="ASPxGridView3" runat="server"  AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="grade_notpass" Width="100%" OnHtmlRowPrepared="ASPxGridView3_HtmlRowPrepared">
                             <Columns>
                                
                                 <dx:GridViewDataTextColumn FieldName="Number"  Caption="课程编号" ReadOnly="True" VisibleIndex="0">
                                 </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="LoginName" Caption="员工编号"  ReadOnly="True" VisibleIndex="1">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="UserName"  Caption="员工姓名"  ReadOnly="True" VisibleIndex="2">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Grade"  Caption="成绩" ReadOnly="True" VisibleIndex="3">
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
                                                <SettingsText EmptyDataRow="无数据显示" /> 
                                                  <%--翻页功能--%>
                         </dx:ASPxGridView>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
            </dx:ASPxPageControl>
        </div>
        
    </form>
</body>
</html>
