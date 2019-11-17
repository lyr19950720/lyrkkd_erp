<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseManagement.aspx.cs" Inherits="DigitalSystem.train.CourseManagement" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>

<!DOCTYPE html>

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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    <form id="form1" runat="server">

    <div>
        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" ClientIDMode="AutoID" Width="100%" Height="900 px">
            <Panes>
                <dx:SplitterPane>
                    <ContentCollection>
                        <dx:SplitterContentControl>
                            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" width="100%">
                                <TabPages>
                                    <dx:TabPage Text="学员名单">
                                        <ContentCollection>
                                            <dx:SplitterContentControl>
                                                <iframe src="floder/AddLearner.aspx" style="width: 100%" id="addLeranerId"> </iframe>
                                                <dx:ASPxMenu ID="ASPxMenu1" runat="server" ClientIDMode="AutoID">
                                                    <ClientSideEvents ItemClick="function(s, e) { MenuItemClick(e);}" Init="function(s, e) {  if(ErrorMessage.GetText() != '' ){  ErrorBox.Show(); } }"/>
                                                    <Items>
                                                        <dx:MenuItem>

                                                        </dx:MenuItem>
                                                    </Items>
                                                </dx:ASPxMenu>
                                            </dx:SplitterContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                </TabPages>
                            </dx:ASPxPageControl>
                        </dx:SplitterContentControl>
                    </ContentCollection>
                </dx:SplitterPane>
                <dx:SplitterPane></dx:SplitterPane>
            </Panes>
        </dx:ASPxSplitter>

    </div>
    </form>
</body>
</html>--%>
