<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course_Students_Info_Modify.aspx.cs" Inherits="DigitalSystem.train.Course_Students_Info_Modify" %>

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
    function MenuItemClick(e) {

        switch (e.item.name) {
            case "addEmployee":
                AddSingleEmployee.Show();
                break;

            case "addLesson":
                NewProduct.Show();
                break;
        }

    }

    // ]]> 
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <div  style="overflow:scroll; position:relative; top:0px; width:100%; height:100%; left:0px;" runat="server">
        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server"  ClientIDMode="AutoID" Width="100%" Height="1000 px" >
            <Panes>
                <dx:SplitterPane  ScrollBars ="Auto">
                    <ContentCollection>
                        <dx:SplitterContentControl>
                            <%--类型树--%>
                       
        <div>
             
             <dx:ASPxPageControl ID="ASPxPageControl2"  runat="server" width="100%"  OnTabClick="ASPxPageControl2_TabClick" >
             <ClientSideEvents  ActiveTabChanged=" function (s,e)
         {   
               
            
        
        }"/>
                 <TabPages>
                   <dx:TabPage Text="学员名单" >
                                <ContentCollection>
                                          <dx:ContentControl >
                                             <%--<iframe src="floder/AddLearner.aspx" style="width: 100%" id="addLeranerId"></iframe>--%>
                                                <%--事件管理--%>
                                              <dx:ASPxMenu ID="ASPxMenu1" runat="server" ClientIDMode="AutoID">
                                          
                                            <ClientSideEvents ItemClick="function(s, e) { MenuItemClick(e);}" Init="function(s, e) {  if(ErrorMessage.GetText() != '' ){  ErrorBox.Show(); } }"></ClientSideEvents>
                                            <Items>

                                                <dx:MenuItem Name="addLesson" Text="按部门添加学员">
                                                    <Image Url="~/Images/addnode.png">
                                                        </Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem Name="addEmployee" Text="添加单个学员">
                                                    <Image Url="~/Images/addnode.png">
                                                        </Image>
                                                </dx:MenuItem>
                                            </Items>
                                        </dx:ASPxMenu>
                                              <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="Employee_train_record" Width="100%" KeyFieldName="Id" OnRowDeleting="ASPxGridView2_RowDeleting" OnRowDeleted="ASPxGridView2_RowDeleted" >
                                                  <SettingsPager Visible="False">
                                                  </SettingsPager>
            <Settings ShowFilterRow="True" />
            <SettingsText EmptyDataRow="无数据显示" />
  
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" Caption="操作">
                    
                    <DeleteButton  Visible="True" Text="删除"   >
                    </DeleteButton>

                </dx:GridViewCommandColumn>

                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Employee_id" VisibleIndex="1" Caption="员工编号">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataComboBoxColumn FieldName="Employee_id" ShowInCustomizationForm="True" VisibleIndex="2" Caption="员工姓名">
                       <PropertiesComboBox ValueType="System.String" DataSourceID="User_info" TextField="UserName" ValueField="id"></PropertiesComboBox>
                  </dx:GridViewDataComboBoxColumn>
                
                <dx:GridViewDataTextColumn FieldName="Course_id" VisibleIndex="3" Visible="false">
                </dx:GridViewDataTextColumn>
            </Columns>

        </dx:ASPxGridView>
                                              <dx:ASPxPopupControl ID="ErrorBox" HeaderText="错误信息" Modal="True" CloseAction="CloseButton" Width="420px" runat="server" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="ErrorBox">
                <ClientSideEvents CloseUp="function(s, e) { ErrorMessage.SetText(''); }" />
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTextBox ID="ErrorMessage" ReadOnly="true" ClientInstanceName="ErrorMessage" runat="server" ClientIDMode="AutoID"
                            Width="400px">
                        </dx:ASPxTextBox>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
                                              <div>
                                              </div>
      
                                              <dx:ASPxPopupControl ID="NewProduct" runat="server" CloseAction="CloseButton" Width="300px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="NewProduct"
                HeaderText="按部门添加学员" AllowDragging="True" EnableAnimation="False" EnableViewState="False">
            <%--作用清空输入框--%>
       <%--    <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('NewProductGroup'); NewProductName.Focus(); }" />--%>
                                                      <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('NewProductGroup'); }" />
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxPanel ID="ASPxPanel3" runat="server" ClientIDMode="AutoID" Width="207px">
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent4" runat="server" SupportsDisabledAttribute="True">
                                <table cellpadding="0" cellspacing="0" style="width: 132%">
                                        
                                        
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="部门">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                              
                                                <dx:ASPxComboBox ID="Department" runat="server" ClientIDMode="AutoID" DataSourceID="LinqDataSourceDepartment"   ValueType="System.Int32"
                                    DropDownStyle="DropDown" TextField="DepartmentName" ValueField="id" Width="100%" >
                                                    
                             </dx:ASPxComboBox>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">
                                                <div class="pcmButton">
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="right">
                                                                <dx:ASPxButton ID="ASPxButton5" runat="server" Text="确认" Width="80px"
                                                                    AutoPostBack="False" OnClick="New_By_Department">

                                                                    <ClientSideEvents Click="function(s, e) {if(!ASPxClientEdit.ValidateGroup('NewProductGroup')){e.processOnServer = false; }else{NewProduct.Hide();} }" />

                                                                </dx:ASPxButton>
                                                            </td>
                                                            <td>
                                                                <div style="width: 8px;">
                                                                </div>
                                                            </td>
                                                            <td align="left">
                                                                <dx:ASPxButton ID="ASPxButton6" runat="server" Text="取消" Width="80px" AutoPostBack="False">
                                                                    <ClientSideEvents Click="function(s, e) { NewProduct.Hide(); }" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
                                              <dx:ASPxPopupControl ID="AddSingleEmployee" runat="server" CloseAction="CloseButton" Width="300px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="AddSingleEmployee"
                HeaderText="添加单个学员" AllowDragging="True" EnableAnimation="False" EnableViewState="False">
            <%--作用清空输入框--%>
           
           <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxPanel ID="ASPxPanel1" runat="server" ClientIDMode="AutoID" Width="207px">
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent1" runat="server" >
                                <table cellpadding="0" cellspacing="0" style="width: 132%">
                                        
                                        
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="部门">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                              
                                                <dx:ASPxComboBox ID="AddSingleEmployeeDepartmentId" runat="server" ClientIDMode="AutoID" DataSourceID="LinqDataSourceDepartment"   ValueType="System.Int32" OnSelectedIndexChanged="AddSingleEmployeeDepartmentId_SelectedIndexChanged"
                                    DropDownStyle="DropDown" TextField="DepartmentName" ValueField="id" Width="100%" AutoPostBack="True">              
                             </dx:ASPxComboBox>
                                 
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="员工">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                              
                                     
                                      <dx:ASPxComboBox ID="AddSingleEmployeeUserId" runat="server" ClientIDMode="AutoID" DataSourceID="Department_user"   ValueType="System.Int32" 
                                    DropDownStyle="DropDown" TextField="UserName" ValueField="id" Width="100%" >              
                             </dx:ASPxComboBox>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">
                                                <div class="pcmButton">
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="right">
                                                                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="确认" Width="80px"
                                                                    AutoPostBack="True" OnClick="AddSingleEmploy">

                                                                    <ClientSideEvents Click="function(s, e) { AddSingleEmployee.Hide(); }" />

                                                                </dx:ASPxButton>
                                                            </td>
                                                            <td>
                                                                <div style="width: 8px;">
                                                                </div>
                                                            </td>
                                                            <td align="left">
                                                                <dx:ASPxButton ID="ASPxButton3" runat="server" Text="取消" Width="80px" AutoPostBack="False">
                                                                    <ClientSideEvents Click="function(s, e) { AddSingleEmployee.Hide(); }" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
                                          </dx:ContentControl> 
                                    
                                </ContentCollection>
                     </dx:TabPage>
                  <%--<dx:TabPage   Name ="TabPage2" Text="成绩修改" ActiveTabImage-Url="c"   >
                      
<ActiveTabImage Url="c"></ActiveTabImage>
                                <ContentCollection>
                                          <dx:ContentControl>
            <hr />
                                             <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="Employee_Course_View" Width="100%" KeyFieldName="Id" OnRowDeleting="ASPxGridView2_RowDeleting" OnRowDeleted="ASPxGridView2_RowDeleted">
                                                 
            <Settings ShowFilterRow="True" />
            <SettingsText EmptyDataRow="无数据显示" />
  
            <Columns>
               <dx:GridViewCommandColumn  VisibleIndex="0" Caption="操作" >
                    <EditButton Visible="True" Text="编辑"></EditButton>
                    <UpdateButton Visible="true" Text="更新"></UpdateButton>  
                    <CancelButton Visible="true" Text="取消"></CancelButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Employee_id" VisibleIndex="1" Caption="员工编号">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="2" Caption="员工姓名">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="Grade" VisibleIndex="3" Caption="成绩">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Course_id" VisibleIndex="4" Visible="false">
                </dx:GridViewDataTextColumn>
            </Columns>

        </dx:ASPxGridView>
                                          </dx:ContentControl> 
                                </ContentCollection>
                     </dx:TabPage>--%>
            </TabPages>
            </dx:ASPxPageControl>

       </div>
  
                            <%--datasourse --%>
        <div>
              <asp:HiddenField  ID="HiddenField1" runat="server"   EnableViewState="false"   />
           <asp:LinqDataSource ID="lessonType" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EnableUpdate="True" EntityTypeName="" TableName="train_lesson_type"></asp:LinqDataSource>
            <asp:LinqDataSource ID="LinqContentType" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EnableUpdate="True" EntityTypeName="" TableName="train_lesson_content_type"></asp:LinqDataSource>
            <asp:LinqDataSource ID="TeacherType" runat="server" ContextTypeName="DigitalSystem.dbDataContext" EntityTypeName="" TableName="S_User_Info" Select="new (DepartmentId, UserName, id)" Where="DepartmentId = @DepartmentId">
                <WhereParameters>
                        <asp:ControlParameter  ControlID="HiddenField1"  DefaultValue="0" Name="DepartmentId" PropertyName="Value" Type="Int32"  />
                    <%--<asp:Parameter DefaultValue="2186" Name="DepartmentId" Type="Int32" />--%>
                </WhereParameters>
            </asp:LinqDataSource>
            <asp:LinqDataSource ID="CourseStatus" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EnableUpdate="True" EntityTypeName="" TableName="train_course_status"></asp:LinqDataSource>
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
            <asp:LinqDataSource ID="User_info_select_by_Departmet" runat="server" ContextTypeName="DigitalSystem.dbDataContext" TableName="S_User_Info" Select="new (DepartmentId, id, UserName)" OnSelecting="User_select">
            </asp:LinqDataSource>


            
                   <asp:LinqDataSource ID="Department_user" runat="server" ContextTypeName="DigitalSystem.dbDataContext"
                        EntityTypeName="" TableName="S_User_Info" Where="   DepartmentId == @ProvenceNum  " Select="new (id, DepartmentId, UserName)">
                        <WhereParameters>
                            
                            <asp:ControlParameter ControlID="hide_department_id" DefaultValue="0" Name="ProvenceNum" PropertyName="Value" Type="Int32" />
                            
                          
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
