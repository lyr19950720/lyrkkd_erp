<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseInfo.aspx.cs" Inherits="DigitalSystem.train.CourseInfo" %>
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
<body >
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
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="类型" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="Type" runat="server" ClientIDMode="AutoID" DataSourceID="lessonType"  AutoPostBack="True" ValueType="System.Int32" ClientInstanceName="Type"
                                    TextField="lesson_type_name" ValueField="id" Width="100%">
                             </dx:ASPxComboBox>         
                            </td>
                            
                            <td >
                                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="内容类型" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="ContentType" runat="server" ClientIDMode="AutoID" DataSourceID="LinqContentType"  AutoPostBack="True" ValueType="System.Int32" ClientInstanceName="ContentType"
                                    DropDownStyle="DropDown" TextField="TypeName" ValueField="ID" Width="100%">
                             </dx:ASPxComboBox>         
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
                                     
                                <dx:ASPxDateEdit ID="start_date" runat="server" ClientInstanceName="start_date"                             
                                    Width="100%"></dx:ASPxDateEdit>
                          
                            </td>
             
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="上课结束日期" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                  <dx:ASPxDateEdit ID="end_date" runat="server" ClientInstanceName="end_date"                             
                                    Width="100%"></dx:ASPxDateEdit>
                            </td>
                         </tr>      
                       <tr>
                           <td>
                                <dx:ASPxLabel ID="ASPxLabeEndChooseDate" runat="server" Text="选课结束日期" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                  <dx:ASPxDateEdit ID="EndChooseDate" runat="server" ClientInstanceName="EndChooseDate"                             
                                    Width="100%"></dx:ASPxDateEdit>
                            </td>
                           <td >
                                <dx:ASPxLabel ID="CourseTeacherlable" runat="server" Text="教师" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="Teacher" runat="server" ClientIDMode="AutoID" DataSourceID="TeacherType"  AutoPostBack="True" ValueType="System.Int32" ClientInstanceName="Teacher"
                                    DropDownStyle="DropDown" TextField="UserName" ValueField="Id" Width="100%">
                             </dx:ASPxComboBox>         
                            </td>
                       </tr>
                       <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="状态" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>

                                <dx:ASPxComboBox ID="Status" runat="server" ClientIDMode="AutoID" DataSourceID="CourseStatus"  AutoPostBack="True" ValueType="System.Int32" ClientInstanceName="Status"
                                    DropDownStyle="DropDown" TextField="Name" ValueField="ID" Width="100%">
                             </dx:ASPxComboBox>         
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
                    </div>
        <div>
            
            <%-- <dx:ASPxPageControl ID="ASPxPageControl2"  runat="server" ActiveTabIndex="0" width="100%">
             <TabPages>
                   <dx:TabPage Text="学员名单">
                                <ContentCollection>
                                          <dx:ContentControl >--%>
                                             <%--<iframe src="floder/AddLearner.aspx" style="width: 100%" id="addLeranerId"></iframe>--%>
                                              
                                             <%-- <dx:ASPxMenu ID="ASPxMenu1" runat="server" ClientIDMode="AutoID">--%>
                                            <%--事件管理--%>
                                           <%-- <ClientSideEvents ItemClick="function(s, e) { MenuItemClick(e);}" Init="function(s, e) {  if(ErrorMessage.GetText() != '' ){  ErrorBox.Show(); } }"></ClientSideEvents>
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
                                              <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="Employee_train_record" Width="100%" KeyFieldName="Id">
                                                  <SettingsPager Visible="False">
                                                  </SettingsPager>
            <Settings ShowFilterRow="True" />
            <SettingsText EmptyDataRow="无数据显示" />
  
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" Caption="操作">
                    
                    <DeleteButton Visible="True" Text="删除">
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
      
                                              <dx:ASPxPopupControl ID="NewProduct" runat="server" CloseAction="CloseButton" Width="300px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="NewProduct"
                HeaderText="按部门添加学员" AllowDragging="True" EnableAnimation="False" EnableViewState="False">--%>
            <%--作用清空输入框--%>
           <%-- <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('NewProductGroup'); NewProductName.Focus(); }" />
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
                HeaderText="添加单个学员" AllowDragging="True" EnableAnimation="False" EnableViewState="False">--%>
            <%--作用清空输入框--%>
           
          <%--  <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxPanel ID="ASPxPanel1" runat="server" ClientIDMode="AutoID" Width="207px">
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent1" runat="server" >
                                <table cellpadding="0" cellspacing="0" style="width: 132%">--%>
                                        
                                        
                                        <%--<tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="部门">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                              
                                                <dx:ASPxComboBox ID="AddSingleEmployeeDepartmentId" runat="server" ClientIDMode="AutoID" DataSourceID="LinqDataSourceDepartment"   ValueType="System.Int32" OnSelectedIndexChanged="AddSingleEmployeeDepartmentId_SelectedIndexChanged"
                                    DropDownStyle="DropDown" TextField="DepartmentName" ValueField="id" Width="100%" AutoPostBack="True">              
                             </dx:ASPxComboBox>
                                 
                                                
                                            </td>
                                        </tr>--%>
                                       <%-- <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="员工">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                              
                                     
                                      <dx:ASPxComboBox ID="AddSingleEmployeeUserId" runat="server" ClientIDMode="AutoID" DataSourceID="User_info_select_by_Departmet"   ValueType="System.Int32" 
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
                  <dx:TabPage Text="成绩录入" ActiveTabImage-Url="c">
<ActiveTabImage Url="c"></ActiveTabImage>
                                <ContentCollection>
                                          <dx:ContentControl>--%>
            <hr />
                                             <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="Employee_Course_View" Width="100%" KeyFieldName="Id">
            <Settings ShowFilterRow="True" />
            <SettingsText EmptyDataRow="无数据显示" />
  
            <Columns>
            <%--   <dx:GridViewCommandColumn VisibleIndex="0" Caption="操作">
                    <EditButton Visible="True" Text="编辑">
                    </EditButton>
                    <UpdateButton Visible="true" Text="更新">
                    </UpdateButton>
                    <CancelButton Visible="true" Text="取消"></CancelButton>
                </dx:GridViewCommandColumn>--%>
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
                                         <%-- </dx:ContentControl> 
                                </ContentCollection>
                     </dx:TabPage>
            </TabPages>
            </dx:ASPxPageControl>--%>

       </div>
   <%-- save & delete button --%>
       <div>
            <table width="100%" style="border: thin solid #999999; background-color: #D8F0FE"
                        border="4px" cellpadding="4" cellspacing="0">
                <tr>
                     <td>
                                <dx:ASPxLoadingPanel ID="loadingPanel" runat="server" ClientInstanceName="loadingPanel"
                                    Text="保存中" Modal="True">
                                </dx:ASPxLoadingPanel>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="style2"></td>
                                        <td align="right">
                                            <dx:ASPxButton ID="btnSave" runat="server" Text="保存" Width="80px"  AutoPostBack="true" OnClick="btnSave_Click">
                                                <ClientSideEvents Click="btnSaveClick" />
                                            </dx:ASPxButton>
                                        </td>
                                        <td class="style1">
                                            <div style="width: 8px;">
                                            </div>
                                        </td>

                                        <td>
                                            <dx:ASPxButton ID="btnDelete" runat="server" Text="删除课程" Width="100px"
                                                Style="margin-left: 0px" ClientIDMode="AutoID" ClientInstanceName="btnDelete" OnClick="btnDelete_Click" >
                                                <ClientSideEvents Click=
                                                    "function(s, e) {
	                                                                if(confirm(&quot;删除课程，请确认！&quot;))
                                                                            {e.processOnServer=true;}
                                                                                                    else
                                                                                                    {e.processOnServer=false;}

                                                                        }" />
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
