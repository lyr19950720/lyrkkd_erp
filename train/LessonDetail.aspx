<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LessonDetail.aspx.cs" Inherits="DigitalSystem.train.LessonDetail" %>

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
            if (Name.isValid && Number.isValid && Description.isValid && Type.isValid && Time.isValid)
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
                                <dx:ASPxLabel ID="ASPxLabe17" runat="server" Text="课程名称" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td >
                                <dx:ASPxTextBox ID="Name" ClientInstanceName="Name" runat="server"
                                    Width="100%">
                               
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="课程编号" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                 <dx:ASPxTextBox ID="Number" runat="server" ClientInstanceName="Number"                             
                                    Width="100%">                                
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="学时" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                 <dx:ASPxTextBox ID="Time" runat="server" ClientInstanceName="Time"                             
                                    Width="100%">                                
                                </dx:ASPxTextBox>
                            </td>
                           <td >
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="类型" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="Type" runat="server" ClientIDMode="AutoID" DataSourceID="LinqDataSource1"  AutoPostBack="True" ValueType="System.Int32"
                                    DropDownStyle="DropDown" TextField="lesson_type_name" ValueField="id" Width="100%" >
                             </dx:ASPxComboBox>         
                            </td>
                             <%--<dx:ASPxComboBox ID="City" runat="server" DropDownStyle="DropDown" AutoPostBack="True" OnSelectedIndexChanged="City_SelectedIndexChanged"
                                    TextField="Name" ValueField="Id" ValueType="System.Int32" DataSourceID="Citys"  EnableViewState="true">
                                </dx:ASPxComboBox>--%>
           
                          <tr>
 
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="课程描述" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td colspan="3">    
                                 <dx:ASPxTextBox ID="Description" runat="server" ClientInstanceName="Description"                             
                                    Width="100%" Editable=false>                                
                                </dx:ASPxTextBox>
                            </td>
                         </tr>
                                      
                    </table>
                     
           
            
                    </div>
        <div style="height:30%">

             <dx:ASPxPageControl ID="ASPxPageControl1" runat="server"  width="100%" >
        </dx:ASPxPageControl>
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
                                        <td class="style2"></td>
                                        <td align="right">
                                            <dx:ASPxButton ID="btnSave" runat="server" Text="保存" Width="80px"  AutoPostBack="true" OnClick="btnSave_Click"
                                                ValidationGroup="EditProject">
                                                <ClientSideEvents Click="btnSaveClick" />
                                            </dx:ASPxButton>
                                        </td>
                                        <td class="style1">
                                            <div style="width: 8px;">
                                            </div>
                                        </td>
        <%--                                <td align="left" class="style3">
                                            <dx:ASPxButton ID="btnSubmit" runat="server" Text="提交" Width="80px" 
                                                ValidationGroup="EditProject" Style="margin-right: 0px" OnClick="btnSubmit_Click">
                                                <ClientSideEvents Click="btnSaveClick" />
                                            </dx:ASPxButton>
                                        </td>--%>
                                        <td>
                                            <dx:ASPxButton ID="btnDelete" runat="server" Text="删除课程" Width="100px"
                                                Style="margin-left: 0px" ClientIDMode="AutoID" OnClick="btnDelete_Click" >
                                                <ClientSideEvents Click="function(s, e) {
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
<%--                            </ContentTemplate>
        </asp:UpdatePanel>--%>


<div>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" 
        EntityTypeName="" TableName="train_lesson_type" ></asp:LinqDataSource>

</div>
 </form>
</body>
</html>

