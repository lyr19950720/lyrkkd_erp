<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditContent.aspx.cs" Inherits="DigitalSystem.welcome.configure.EditContent" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <style>
        table,tr
        {
            width:100%;
            padding:0px;
            margin:0px;
        }
        fieldset
        {
            padding:0px;
            margin:0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="manager" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="HF_Key" runat="server" value="" />
 <div>
     <div id="editdiv" runat="server" visible="true">
          <!--展示编辑 -->
        <fieldset>
            <legend>编辑内容</legend>
                <table>
                <tr>
                    <td colspan="2"><dx:ASPxMemo ID="ContentMemo" runat="server" Height="420px"></dx:ASPxMemo></td>
                </tr>
            </table>
        </fieldset>
    </div>
     <div id="showdiv" runat="server" visible="false">
         <!--展示内容 -->
         <fieldset>
            <legend>展示内容</legend>
                <table>
                <tr>
                      <td id="showcontenttd" runat="server"></td>
                </tr>
            </table>
        </fieldset>
     </div>
     <div>
         <table>
             <tr>
                 <td><dx:ASPxButton ID="SaveBtn" runat="server" Text="保存" Width="100px" OnClick="SaveBtn_Click"></dx:ASPxButton></td>
                 <td style="text-align:left"><dx:ASPxButton ID="LookBtn" runat="server" Text="查看"  Width="100px" OnClick="LookBtn_Click"></dx:ASPxButton></td>
             </tr>
         </table>
    </div>
     <div id="filediv" style="margin-top:10px">
         <fieldset>
             <legend>
                 附加文件
             </legend>
               <table>
             <tr>
                 <td><asp:FileUpload ID="FU" runat="server" Width="70px" /></td>
                 <td>类型：</td>
                 <td><dx:ASPxComboBox ID="FileTypeBox" runat="server" Width="70px">
                        <Items>
                            <dx:ListEditItem Text="文件" Value="0" />
                            <dx:ListEditItem Text="图片" value="1"/>
                        </Items>
                     </dx:ASPxComboBox></td>
                 <td>位置：</td>
                 <td><dx:ASPxTextBox ID="LocationText" runat="server"></dx:ASPxTextBox></td>
                 <td><dx:ASPxButton ID="UpLoadBtn" runat="server" Text="上传" OnClick="UpLoadBtn_Click"></dx:ASPxButton></td>
             </tr>
             <tr>
                <td colspan="6"><h5>注：位置为内容的某一连续文字，并且位置信息对图片有效，图片将显示在所给位置之后。若图片不指定位置，将显示在最前面。文件始终显示在正文的最下方，供用户下载。</h5></td>
             </tr>
         </table>
         </fieldset>
     </div>
</div>
    </form>
</body>
</html>
