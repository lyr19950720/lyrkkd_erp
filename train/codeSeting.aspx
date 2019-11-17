<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="codeSeting.aspx.cs" Inherits="DigitalSystem.train.codeSeting" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        iframe {
        border:none;
        width:100%;
        margin:0px;
        padding:0px;
        height:650px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="3" Width ="100%" >
            <TabPages>
                <dx:TabPage Name ="Teacher" Text="课程状态">
                    <ContentCollection>
                        <dx:ContentControl>
                            <iframe src="floder/lessonStatus.aspx"></iframe>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name ="CourseType" Text="课程类型">
                    <ContentCollection>
                        <dx:ContentControl>
                            <iframe src="floder/courseType.aspx"></iframe>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
               <dx:TabPage Name ="StudentType" Text="学生成绩状态">
                    <ContentCollection>
                        <dx:ContentControl>
                            <iframe src="floder/studentType.aspx"></iframe>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                
            </TabPages>
        </dx:ASPxPageControl>
        
    </div>
    </form>
</body>
</html>
