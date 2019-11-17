<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LessonManagement.aspx.cs" Inherits="DigitalSystem.train.LessonManagement" %>

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
<body >
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div style="height: 100%">
        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" Height="1000px" Width="100%" ClientIDMode="AutoID" FullscreenMode="True">
            <Panes>
                <dx:SplitterPane Size="30%" ScrollBars ="Auto">
                    <ContentCollection>
                        <dx:SplitterContentControl>
                            <%--类型树--%>
                            <dx:ASPxTreeView ID="typeTreeView" runat="server" ClientIDMode="AutoID" EnableCallBacks="true"   AllowSelectNode="true" OnVirtualModeCreateChildren="treeview_create"   >
                                <%--传值到updatePanel--%>
                                <ClientSideEvents NodeClick="function( s, e){
                                  
                                          click_callback.PerformCallback(e.node.name);   

                                     
                                    }"></ClientSideEvents>
                                <SettingsLoadingPanel Text="请稍后" />
                            </dx:ASPxTreeView>
                        </dx:SplitterContentControl> 
                    </ContentCollection>
                </dx:SplitterPane>

                <dx:SplitterPane ScrollBars="Auto">
                    <ContentCollection>
                        <dx:SplitterContentControl  runat="server" SupportsDisabledAttribute="True">
                            <dx:ASPxCallbackPanel   ID="click_callback" runat="server"  LoadingPanelText="请稍后" OnCallback="click_node" Width="100%" ClientInstanceName="click_callback" EnableRowsCache="false">
                                <PanelCollection>
                                    <dx:PanelContent  ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxMenu ID="ASPxMenu1" runat="server" ClientIDMode="AutoID" Width="100%">
                                            <%--事件管理--%>
                                            <ClientSideEvents ItemClick="function(s, e) {MenuItemClick(e);}"  Init="function(s, e) {  if(ErrorMessage.GetText() != '' ){  ErrorBox.Show(); } }"></ClientSideEvents>
                                            <Items   >
                                                <dx:MenuItem Name="addLesson" Text="添加课程"   >
                                                    <Image Url="~/Images/addnode.png">
                                                        </Image>
                                                    
                                                </dx:MenuItem>
                                            </Items>
                                        </dx:ASPxMenu>
                                        <dx:ASPxGridView ID="LessonGridview" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" KeyFieldName="Id"   >
                                         
                                            <SettingsText EmptyDataRow="无数据显示" />
                                            <SettingsPager>
                                            <Summary Text="第{0}页  共{1}页 (共{2} 项)" />
                                             </SettingsPager>
                                            <SettingsLoadingPanel Text="请稍后" />
                                            <Settings ShowFilterRow="True" />
                                            
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Caption="操作">
                                                    <EditButton Visible="True" Text="编辑">
                                                    </EditButton>
                               
                                                    <DeleteButton Visible="True" Text="删除" >
                                                    </DeleteButton>
                                                    <CancelButton Text="取消">
                                                            <Image Url="~/Images/gcancel.png">
                                                            </Image>
                                                        </CancelButton>
                                                        <UpdateButton Text="确认">
                                                            <Image ToolTip="确认" Url="~/Images/gok.png">
                                                            </Image>
                                                        </UpdateButton>
                                                </dx:GridViewCommandColumn>
                                           
                                                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False" >
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Number" ShowInCustomizationForm="True" VisibleIndex="1" Caption="课程编号">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name" ShowInCustomizationForm="True" VisibleIndex="2" Caption="课程名称">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Time" ShowInCustomizationForm="True" VisibleIndex="3" Caption="学时">
                                                </dx:GridViewDataTextColumn>
                                               
                                                <dx:GridViewDataComboBoxColumn FieldName="Type" ShowInCustomizationForm="True" VisibleIndex="4" Caption="类型">
                                                    <PropertiesComboBox ValueType="System.String" DataSourceID="LinqDataSourceType" TextField="lesson_type_name" ValueField="id"></PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                              
                                                <dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="5" Caption="课程描述">
                                                </dx:GridViewDataTextColumn>
                                         
                                                 <dx:GridViewDataComboBoxColumn FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="6" Caption="状态">
                                                    <PropertiesComboBox ValueType="System.String" DataSourceID="LinqDataSourceStatus" TextField="Name" ValueField="ID"></PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                               <%-- <dx:GridViewDataTextColumn FieldName="ContentTypeId" ShowInCustomizationForm="True" VisibleIndex="7" >
                                                     
                                                </dx:GridViewDataTextColumn>--%>
                                        
                                            </Columns>
                                            <Settings ShowFilterRow="True" />
                                        </dx:ASPxGridView>
                                        
                                        <%--产品表数据源--%>
                                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" 
                                                    EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="train_lesson_basicInfo"  EnableViewState="False"
                                                        Where="ContentTypeId == @ContentTypeId" >
                                                    <WhereParameters>
                                                <asp:ControlParameter ControlID="hide_type_id" DefaultValue="0" Name="ContentTypeId" PropertyName="Value" Type="Int32" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                        <%--传递typeid--%>
                                        <asp:HiddenField ID="hide_type_id" runat="server" />
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
        <asp:LinqDataSource ID="LinqDataSourceType" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" TableName="train_lesson_type"></asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSourceStatus" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" TableName="train_lesson_status"></asp:LinqDataSource>
    
       
        <%--弹出框模块--%>
        <%--新建类型弹出框--%>
        <dx:ASPxPopupControl ID="NewType" runat="server" CloseAction="CloseButton" Width="300px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="NewType"
                HeaderText="新建类型" AllowDragging="True" EnableAnimation="False" EnableViewState="False">
            <%--作用清空输入框--%>
            <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('NewTypeGroup'); NewTypeName.Focus(); }" />
            <ContentCollection>
                <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxPanel ID="aspPanel" runat="server" ClientIDMode="AutoID" Width="207px">
                        <PanelCollection>
                            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                <table cellpadding="0" cellspacing="0" style="width: 132%">
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="NameLabel" runat="server" Text="类型名称:">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td class="pcmCellText">
                                                <dx:ASPxTextBox ID="NewTypeName" runat="server" Width="150px" ClientInstanceName="NewTypeName">
                                                    <ValidationSettings ValidationGroup="NewTypeGroup" Display="Dynamic"
                                                        ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                        <RequiredField ErrorText="类型名称不能为空" IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div class="pcmButton">
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="right">
                                                                <dx:ASPxButton ID="btOK" runat="server" Text="确认" Width="80px"
                                                                    AutoPostBack="False" OnClick="New_Type" ValidationGroup="NewTypeGroup">

                                                                    <ClientSideEvents Click="function(s, e) {if(!ASPxClientEdit.ValidateGroup('NewTypeGroup')){e.processOnServer = false; }else{NewType.Hide();} }" />

                                                                </dx:ASPxButton>
                                                            </td>
                                                            <td>
                                                                <div style="width: 8px;">
                                                                </div>
                                                            </td>
                                                            <td align="left">
                                                                <dx:ASPxButton ID="btCancel" runat="server" Text="取消" Width="80px" AutoPostBack="False">
                                                                    <ClientSideEvents Click="function(s, e) { NewType.Hide(); }" />
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
        <%--删除类型弹出框--%>
        <dx:ASPxPopupControl ID="DelType" runat="server" CloseAction="CloseButton" Width="300px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="DelType"
                HeaderText="删除类型" AllowDragging="True" EnableAnimation="False" EnableViewState="False">
            <%--作用清空输入框--%>
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxPanel ID="ASPxPanel1" runat="server" ClientIDMode="AutoID" Width="207px">
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttribute="True">
                                <table cellpadding="0" cellspacing="0" style="width: 132%">
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="是否要删除当前类型？" >
                                                </dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="pcmButton">
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="right">
                                                                <dx:ASPxButton ID="ASPxButton1" runat="server" Text="确认" Width="80px"
                                                                    AutoPostBack="False" OnClick="Del_Type" ValidationGroup="NewTypeGroup">

                                                                    <ClientSideEvents Click="function(s, e) {DelType.Hide(); }" />

                                                                </dx:ASPxButton>
                                                            </td>
                                                            <td>
                                                                <div style="width: 8px;">
                                                                </div>
                                                            </td>
                                                            <td align="left">
                                                                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="取消" Width="80px" AutoPostBack="False">
                                                                    <ClientSideEvents Click="function(s, e) { DelType.Hide(); }" />
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
        <%--修改类型弹出框--%>
        <dx:ASPxPopupControl ID="EditType" runat="server" CloseAction="CloseButton" Width="300px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="EditType"
                HeaderText="修改类型" AllowDragging="True" EnableAnimation="False" EnableViewState="False">
            <%--作用清空输入框--%>
            <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('EditTypeGroup'); EditTypeName.Focus(); }" />
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxPanel ID="ASPxPanel2" runat="server" ClientIDMode="AutoID" Width="207px">
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent3" runat="server" SupportsDisabledAttribute="True">
                                <table cellpadding="0" cellspacing="0" style="width: 132%">
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="类型名称:">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td class="pcmCellText">
                                                <dx:ASPxTextBox ID="EditTypeName" runat="server" Width="150px" ClientInstanceName="EditTypeName">
                                                    <ValidationSettings ValidationGroup="EditTypeGroup" Display="Dynamic"
                                                        ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                        <RequiredField ErrorText="类型名称不能为空" IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div class="pcmButton">
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="right">
                                                                <dx:ASPxButton ID="ASPxButton3" runat="server" Text="确认" Width="80px"
                                                                    AutoPostBack="False" OnClick="Edit_Type" ValidationGroup="EditTypeGroup">

                                                                    <ClientSideEvents Click="function(s, e) {if(!ASPxClientEdit.ValidateGroup('EditTypeGroup')){e.processOnServer = false; }else{EditType.Hide();} }" />

                                                                </dx:ASPxButton>
                                                            </td>
                                                            <td>
                                                                <div style="width: 8px;">
                                                                </div>
                                                            </td>
                                                            <td align="left">
                                                                <dx:ASPxButton ID="ASPxButton4" runat="server" Text="取消" Width="80px" AutoPostBack="False">
                                                                    <ClientSideEvents Click="function(s, e) { EditType.Hide(); }" />
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
        <%--新建产品弹出框--%>
        <dx:ASPxPopupControl ID="NewProduct" runat="server" CloseAction="CloseButton" Width="300px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="NewProduct"
                HeaderText="新建课程" AllowDragging="True" EnableAnimation="False" EnableViewState="False">
            <%--作用清空输入框--%>
            <ClientSideEvents  
                PopUp="function(s, e) { ASPxClientEdit.ClearGroup('NewProductGroup'); NewProduct.Focus(); }" />
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxPanel ID="ASPxPanel3" runat="server" ClientIDMode="AutoID" Width="207px">
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent4" runat="server" SupportsDisabledAttribute="True">
                                <table cellpadding="0" cellspacing="0" style="width: 132%">
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="labelForLevel" runat="server" Text="课程编号">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                                 <dx:ASPxTextBox ID="Number" runat="server" ClientInstanceName="Number" Width="100%"> 
                                                    <ValidationSettings Display="Dynamic" ValidationGroup ="NewProductGroup" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                            <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                   </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="labelForPackage" runat="server" Text="课程名称">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox ID="Name" ClientInstanceName="Name" runat="server" Width="100%">
                                                   <ValidationSettings Display="Dynamic" ValidationGroup ="NewProductGroup"  ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                            <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                   </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="类型">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <%--<dx:ASPxComboBox ID="SuffixComboBox" runat="server" IncrementalFilteringMode="Contains" ></dx:ASPxComboBox>--%>
                                                <dx:ASPxComboBox ID="Type" runat="server" ClientIDMode="AutoID" DataSourceID="LinqDataSourceType"   ValueType="System.Int32"
                                    DropDownStyle="DropDown" TextField="lesson_type_name" ValueField="id" Width="100%" >
                                                    <ValidationSettings ValidationGroup ="NewProductGroup" Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                            <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                   </ValidationSettings>
                             </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="学时">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox ID="Time" runat="server" ClientInstanceName="Time" Width="100%"> 
                                                    <ValidationSettings ValidationGroup ="NewProductGroup" Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                            <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                   </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="课程描述">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                               <dx:ASPxTextBox ID="Description" runat="server" ClientInstanceName="Description" Width="100%" > 
                                                  <ValidationSettings ValidationGroup ="NewProductGroup" Display="Dynamic" ErrorDisplayMode="ImageWithText"  SetFocusOnError  ="True">
                                                            <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                   </ValidationSettings>
                                               </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <dx:ASPxLabel ID="ASPxLabel31" runat="server" Text="状态">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                               
                                              <dx:ASPxComboBox ID="Status" runat="server" ClientIDMode="AutoID" DataSourceID="LinqDataSourceStatus"   ValueType="System.Int32"
                                    DropDownStyle="DropDown" TextField="Name" ValueField="ID" Width="100%" >
                                                  <ValidationSettings ValidationGroup ="NewProductGroup" Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                            <RequiredField ErrorText="不能为空" IsRequired="True" />
                                                   </ValidationSettings>
                                                  
                             </dx:ASPxComboBox>
                                   
                                            </td>
                                        </tr>
                          
                                        
                                        <tr>
                                            <td colspan="2">
                                                <div class="pcmButton" style="margin-top:10px;">
                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="right">
                                                                <dx:ASPxButton ID="ASPxButton5" runat="server" Text="确认" Width="80px"
                                                                    AutoPostBack="False" OnClick="New_Lesson" ValidationGroup="NewProductGroup">

                                                                    <ClientSideEvents Click="function(s, e) {if(!ASPxClientEdit.ValidateGroup('NewProductGroup')){e.processOnServer = false; }else{  NewProduct.Hide(); } }" />

                                                                </dx:ASPxButton>
                                                            </td>
                                                            <td>
                                                                <div style="width: 8px;">
                                                                </div>
                                                            </td>
                                                            <td align="left">
                                                                <dx:ASPxButton ID="ASPxButton6" runat="server" Text="取消" Width="80px" AutoPostBack="False">
                                                                    <ClientSideEvents Click="function(s, e) { NewProduct.Hide();}" />
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

