<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddLearner.aspx.cs" Inherits="DigitalSystem.train.floder.AddLearner" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx1" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx2" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">
    
    // <![CDATA[
    function MenuItemClick(e) {

        switch (e.item.name) {
            case "addType":
                NewType.Show();
                break;
            case "editType":
                EditType.Show();
                break;
            case "deleteType":
                DelType.Show();
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
    <style type="text/css">
        td {
            
         }
        iframe {
        border:none;
        width:100%;
        margin:0px;
        padding:0px;
        height:450px;
        }
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="height: 336px">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div style="height: 100%">
        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" Height="900px" Width="100%" ClientIDMode="AutoID" FullscreenMode="True">
            <Panes>
               

                <dx:SplitterPane ScrollBars="Auto">
                    <ContentCollection>
                        <dx:SplitterContentControl  runat="server" SupportsDisabledAttribute="True">
                            <dx:ASPxCallbackPanel ID="click_callback" runat="server"  LoadingPanelText="请稍后"  Width="100%" ClientInstanceName="click_callback" EnableRowsCache="false">
                                <PanelCollection>
                                    <dx:PanelContent  ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxMenu ID="ASPxMenu1" runat="server" ClientIDMode="AutoID">
                                            <%--事件管理--%>
                                            <ClientSideEvents ItemClick="function(s, e) { MenuItemClick(e);}" Init="function(s, e) {  if(ErrorMessage.GetText() != '' ){  ErrorBox.Show(); } }"></ClientSideEvents>
                                            <Items>

                                                <dx:MenuItem Name="addLesson" Text="按部门添加学员">
                                                    <Image Url="~/Images/addnode.png">
                                                        </Image>
                                                </dx:MenuItem>
                                            </Items>
                                        </dx:ASPxMenu>
                                        <dx:ASPxGridView ID="LessonGridview" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" KeyFieldName="Id">
                                            <SettingsText EmptyDataRow="无数据显示" />
                                            <SettingsPager>
                                            <Summary Text="第{0}页  共{1}页 (共{2} 项)" />
                                             </SettingsPager>
                                            <SettingsLoadingPanel Text="请稍后" />
                                            <Settings ShowFilterRow="True" />
                                            
                                            <Columns>
                                           
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                </dx:GridViewCommandColumn>
                                           
                                                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Employee_id" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Course_id" ShowInCustomizationForm="True" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Grade" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                               
                                                <dx:GridViewDataTextColumn FieldName="UserName" ShowInCustomizationForm="True" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                         
                                        
                                            </Columns>
                                            <Settings ShowFilterRow="True" />
                                        </dx:ASPxGridView>
                                        
                                        <%--产品表数据源--%>
                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" 
                                                    EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Train_Employee_User_view"  EnableViewState="False" Where="Course_id == @Course_id" >
                                                <WhereParameters>
                                                    <asp:ControlParameter ControlID="hide_lesson_id" Name="Course_id" PropertyName="Value" Type="Int32" />
                                                </WhereParameters>
                                        </asp:LinqDataSource>
                                        <%--传递typeid--%>
                                        <asp:HiddenField ID="hide_type_id" runat="server"  />
                                        <%--传递productId--%>
                                        <asp:HiddenField ID="hide_lesson_id" runat="server" />
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxCallbackPanel>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
            </Panes>
        </dx:ASPxSplitter>
        <%--数据源模块--%>
        
        <%--级别表数据源--%>
        <asp:LinqDataSource ID="LinqDataSourceDepartment" runat="server" ContextTypeName="DigitalSystem.dbDataContext" EntityTypeName="" TableName="S_Department_Info" Select="new (id, DepartmentName)"></asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSourceUser" runat="server" ContextTypeName="DigitalSystem.dbDataContext" EntityTypeName="" TableName="S_User_Info" Select="new (id, UserName)">
        </asp:LinqDataSource>
    
       

 
        <%--错误信息弹出框--%>
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
                HeaderText="按部门添加学员" AllowDragging="True" EnableAnimation="False" EnableViewState="False">
            <%--作用清空输入框--%>
            <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('NewProductGroup'); NewProductName.Focus(); }" />
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxPanel ID="ASPxPanel3" runat="server" ClientIDMode="AutoID" Width="207px">
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent4" runat="server" SupportsDisabledAttribute="True">
                                <table cellpadding="0" cellspacing="0" style="width: 132%">
                                        
                                        
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="部门">
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

    </div>
        
    </form>
</body>
</html>

