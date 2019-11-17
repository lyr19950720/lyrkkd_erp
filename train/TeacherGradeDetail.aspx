<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherGradeDetail.aspx.cs" Inherits="DigitalSystem.train.TeacherGradeDetail" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallback" tagprefix="dx1" %>
<%--<%@ Register Src="~/ucPurLoadFile.ascx" TagName="ucPurLoadFile" TagPrefix="uc1" %>--%>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    
    // <![CDATA[
    

    // ]]> 
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        function btnSaveClick(s, e) {
           
                loadingPanel.Show();
        }
      

        ////选择项目类型设置内容--只能选择叶节点
        function OnCurRootClick(s, e) {
            if (e.node.GetNodeCount() == 0) {
                dropdownProjectType.SetKeyValue(e.node.name);
                dropdownProjectType.SetText(e.node.GetText());
                dropdownProjectType.HideDropDown();
            }
        }

        function OnCurRootClick1(s, e) {
            if (e.node.GetNodeCount() == 0) {
                dropdownProjectType1.SetKeyValue(e.node.name);
                dropdownProjectType1.SetText(e.node.GetText());
                dropdownProjectType1.HideDropDown();
            }
        }

       
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 125px;
        }
    </style>
</head>
<body>
   <form id="form2" runat="server">
        &nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div>
        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server"  ClientIDMode="AutoID" Width="100%" Height="1000 px" >
            <Panes>
                <dx:SplitterPane  ScrollBars ="Auto">
                    <ContentCollection>
                        <dx:SplitterContentControl>
                            <%--类型树--%>
                           
        <div>
            <dx:ASPxPageControl ID="ASPxPageControl2" runat="server" ActiveTabIndex="0" width="100%">
              <TabPages>
                    
                  <dx:TabPage Text="成绩录入" ActiveTabImage-Url="c">
<ActiveTabImage Url="c"></ActiveTabImage>
                                <ContentCollection>
                                          <dx:ContentControl>
                                             <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="Employee_Course_View" Width="100%" KeyFieldName="Id" OnHtmlRowPrepared="ASPxGridView3_HtmlRowPrepared">
            <Settings ShowFilterRow="True" />
            <SettingsText EmptyDataRow="无数据显示" />
  
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" Caption="操作">
                    <EditButton Visible="True" Text="编辑">
                    </EditButton>
                    <UpdateButton Visible="true" Text="更新" >
                    </UpdateButton>
                    <CancelButton Visible="true" Text="取消"></CancelButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Employee_id" VisibleIndex="1" Caption="员工ID">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="2" Caption="员工姓名">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="Grade" VisibleIndex="3" Caption="成绩">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Course_id" VisibleIndex="4" Visible="false">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataComboBoxColumn FieldName="Remark" ShowInCustomizationForm="True" VisibleIndex="5" Caption="备注">
                     <PropertiesComboBox ValueType="System.String" DataSourceID="LinqDataSourceStudentStatus" TextField="Name" ValueField="ID"></PropertiesComboBox>
                 </dx:GridViewDataComboBoxColumn>
            </Columns>

        </dx:ASPxGridView>
<table width="100%">
            <tr>
 
                            <td>
                                   
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="审核意见" Wrap="False" Height="50px"  >  </dx:ASPxLabel>
         
                                
                            </td>
                            <td>    
                                 <dx:ASPxTextBox ID="Suggest" runat="server" ClientInstanceName="Suggest"                             
                                    Width="100%" Editable="False" Height="70px">                                
                                </dx:ASPxTextBox>
                            </td>
                         </tr>
        </table>
                
                                          </dx:ContentControl> 
                                </ContentCollection>
                     </dx:TabPage>
            </TabPages>
            </dx:ASPxPageControl>
            
       </div>
   <%-- save & delete button --%>
        <div>
            <table width="100%" style="border: thin solid #999999; background-color: #D8F0FE"
                        border="4px" cellpadding="4" cellspacing="0">
                <tr>
                     <td>
                                
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        
                                        <td align="center">
                                            <dx:ASPxButton ID="btnSave" runat="server" Text="提交审核"   AutoPostBack="true" OnClick="UploadGrade_Click">
                                            </dx:ASPxButton>
                                        </td>
                                        
                                    </tr>
                                    </table>
                                </td>
                        </tr>
                    </table>
          </div>
                            <%--datasourse --%>
        <div>
             <asp:HiddenField  ID="HiddenField1" runat="server"   EnableViewState="false"   />
           <asp:LinqDataSource ID="lessonType" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EnableUpdate="True" EntityTypeName="" TableName="train_lesson_type"></asp:LinqDataSource>
            <asp:LinqDataSource ID="LinqContentType" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EnableUpdate="True" EntityTypeName="" TableName="train_lesson_content_type"></asp:LinqDataSource>
            <asp:LinqDataSource ID="TeacherType" runat="server" ContextTypeName="DigitalSystem.dbDataContext" EntityTypeName="" TableName="S_User_Info" Select="new (DepartmentId, UserName, id)" Where="DepartmentId == @DepartmentId">
                <WhereParameters>
                     <asp:ControlParameter  ControlID="HiddenField1"  DefaultValue="0" Name="DepartmentId" PropertyName="Value" Type="Int32"  />
                    <%--<asp:Parameter DefaultValue="2186" Name="DepartmentId" Type="Int32" />--%>
                </WhereParameters>
            </asp:LinqDataSource>
            <asp:LinqDataSource ID="CourseStatus" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EnableUpdate="True" EntityTypeName="" TableName="train_course_status"></asp:LinqDataSource>
            <asp:LinqDataSource ID="LinqDataSourceStudentStatus" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EnableUpdate="True" EntityTypeName="" TableName="train_student_status"></asp:LinqDataSource>
            <asp:LinqDataSource ID="Employee_Course_View" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" TableName="Train_Employee_User_view" Where="Course_id == @Course_id" EnableUpdate="True" EnableDelete="True" EnableInsert="True">
            
            <WhereParameters>
                    <asp:QueryStringParameter Name="Course_id" QueryStringField="Id" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
            <asp:LinqDataSource ID="User_info" runat="server" ContextTypeName="DigitalSystem.dbDataContext" Select="new (id, UserName, DepartmentId)" TableName="S_User_Info"></asp:LinqDataSource>
             <asp:HiddenField ID="hide_lesson_id" runat="server" />
       <asp:HiddenField ID="hide_department_id" runat="server" />
        <asp:LinqDataSource ID="LinqDataSourceDepartment" runat="server" ContextTypeName="DigitalSystem.dbDataContext" EntityTypeName="" TableName="S_Department_Info" Select="new (id, DepartmentName)"></asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSourceUser" runat="server" ContextTypeName="DigitalSystem.dbDataContext" EntityTypeName="" TableName="S_User_Info" Select="new (id, UserName)">
        </asp:LinqDataSource>
        
         <asp:LinqDataSource ID="Employee_train_record" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="Employee_train_record" Where="Course_id == @Course_id">
             <WhereParameters>
                 <asp:QueryStringParameter Name="Course_id" QueryStringField="Id" Type="Int32" />
             </WhereParameters>
            </asp:LinqDataSource>
           
        </div>
                        </dx:SplitterContentControl> 
                    </ContentCollection>
                </dx:SplitterPane>
            </Panes>
        </dx:ASPxSplitter>
    </div>
</form>
</body>
</html>
