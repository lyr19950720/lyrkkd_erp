<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OpenCourseDetail.aspx.cs" Inherits="DigitalSystem.train.OpenCourseDetail1" %>

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

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<%--        <style type="text/css">
        html, body, form
        {
            height: 100%;
            margin: 0px;
            padding: 0px;
            overflow: hidden;
            font-size: 12px;
            font-family: "宋体";
        }
    </style>--%>
    <script type="text/javascript">
        function btnSaveClick(s, e) {
            
                loadingPanel.Show();
        }

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
</head>
<body>
   <form id="form2" runat="server">
        &nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:HiddenField ID="HF_SupplierID" runat="server" />
        <dx:ASPxPopupControl ID="popupUpLoadFiles" runat="server" AllowDragging="True" PopupHorizontalAlign="OutsideRight"
            HeaderText="文件上传" ClientIDMode="AutoID" Modal="True" Width="600px" Height="300px" ClientInstanceName="popupUpLoadFiles"
            AllowResize="True" CloseAction="CloseButton" ShowPageScrollbarWhenModal="True">
            <ClientSideEvents Closing="function(s, e) {
	        ASPxCallbackFileMger.PerformCallback();
        }"></ClientSideEvents>
            <ClientSideEvents Closing="function(s, e) {ASPxCallbackFileMger.PerformCallback();}" />
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                    <div style="width: 100%; height: 100%; overflow: auto;">
                        <%--                <uc1:UpLoadFiles ID="upLoadFiles" runat="server"></uc1:UpLoadFiles>--%>

                     <%--   <uc1:ucProjLoadFile ID="ucProjLoadFile" runat="server"></uc1:ucProjLoadFile>--%>
                    </div>
                </dx:PopupControlContentControl>

            </ContentCollection>
        </dx:ASPxPopupControl>
 <%--       <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
                <div height="50%">
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
                                    DropDownStyle="DropDown" TextField="lesson_type_name" ValueField="id" Width="100%">
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
                     
                    </table>
              </div>
 
   
         <div style="height:30%">
            <table width="100%" style="border: thin solid #999999; background-color: #D8F0FE"
                        border="4px" cellpadding="4" cellspacing="0">
                <tr>
                     <td>
                                <dx:ASPxLoadingPanel ID="loadingPanel" runat="server" ClientInstanceName="loadingPanel"
                                    Text="保存中" Modal="True">
                                </dx:ASPxLoadingPanel>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>

                                        <td align="center">
                                            <dx:ASPxButton ID="btnSave" runat="server" Text="确定" Width="80px"  AutoPostBack="true" OnClick="btnSave_Click"    >

                                               
                                            </dx:ASPxButton>
                                        </td>

                                    </tr>
                                    </table>
                                </td>
                        </tr>
                    </table>
          </div>


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
</div>
 </form>
</body>
</html>
