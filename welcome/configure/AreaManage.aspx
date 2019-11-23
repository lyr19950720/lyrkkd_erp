<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AreaManage.aspx.cs" Inherits="DigitalSystem.welcome.AreaManage" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript">
        var sum = 0;
        function showarea() {
            sum = 0;
            var number = document.getElementById("areaNumberLabel").innerHTML;
            var value = AreaStyleText.GetText();
            var b = judgeValue(value + "");
            if (b && sum == parseInt(number)) {
                document.getElementById("iframe_welcome").src = "WelcomeStyle.aspx?style=" + value;
            }
            else {
                alert("输入序列不符合规则！");
            }
        }
        function judgeValue(value) {//
            for (i = 0; i < value.length; i++) {
                var number = parseInt(value[i]);
                if (!isNaN(number)) {
                    if (number < 0 || number > 4) {
                        sum = 0;
                        return false;
                    }
                    else {//符合规则
                        sum += number;
                    }
                }
                else {
                    sum = 0;
                    return false;
                }
            }

            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="manager" runat="server"></asp:ScriptManager>
        <div>
            <div>
                <dx:ASPxGridView ID="GV_Area" runat="server" Width="100%" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="lq_Area" KeyFieldName="ID"
                    EnableCallBacks="False" SettingsBehavior-AllowSort="false" OnRowDeleting="GV_Area_RowDeleting" OnRowInserting="GV_Area_RowInserting" OnRowUpdating="GV_Area_RowUpdating"
                    OnRowUpdated="GV_Area_RowUpdated">
                    <SettingsText EmptyDataRow="无数据显示" />
                    <SettingsPager>
                        <Summary Text="第{0}页  共{1}页 (共{2} 项)" />
                    </SettingsPager>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0" Visible="false">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="区域名称" FieldName="Name" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn Caption="区域占屏幕百分比" FieldName="Width" VisibleIndex="2">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="20%" Value="20%" />
                                    <dx:ListEditItem Text="30%" Value="30%" />
                                    <dx:ListEditItem Text="40%" Value="40%" />
                                    <dx:ListEditItem Text="50%" Value="50%" />
                                    <dx:ListEditItem Text="60%" Value="60%" />
                                    <dx:ListEditItem Text="70%" Value="70%" />
                                    <dx:ListEditItem Text="80%" Value="80%" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="是否可用" FieldName="Enable" VisibleIndex="3">
                            <PropertiesComboBox ValueType="System.String">
                            </PropertiesComboBox>
                            <DataItemTemplate>
                                <dx:ASPxLabel ID="EnableLabel" runat="server" Text='<%#getAreaEnable(Eval("Enable")) %>'></dx:ASPxLabel>
                            </DataItemTemplate>
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="是" Value="1" />
                                    <dx:ListEditItem Text="否" Value="0" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn Caption="序号" FieldName="Order" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn Caption="操作" VisibleIndex="5">
                            <EditButton Text="编辑" Visible="True">
                            </EditButton>
                            <NewButton Text="添加" Visible="True">
                            </NewButton>
                            <DeleteButton Text="删除" Visible="True">
                            </DeleteButton>
                            <CancelButton Text="取消">
                            </CancelButton>
                            <UpdateButton Text="确定">
                            </UpdateButton>
                        </dx:GridViewCommandColumn>
                    </Columns>

                    <SettingsBehavior AllowSort="False"></SettingsBehavior>

                </dx:ASPxGridView>
                <asp:LinqDataSource ID="lq_Area" runat="server" ContextTypeName="DigitalSystem.contextDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="P_Area"></asp:LinqDataSource>
            </div>
            <div style="margin-top: 10px">
                <fieldset style="height: 480px">
                    <legend>区域分布</legend>
                    <table>
                        <tr>
                            <td style="text-align: left">
                                <h3>当前可用区域个数：</h3>
                            </td>
                            <td>
                                <h3>
                                    <label id="areaNumberLabel" runat="server"></label>
                                </h3>
                            </td>
                            <td style="width: 100px"></td>
                            <td>请输入区域分布样式：
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="AreaStyleText" runat="server" Text="" ClientInstanceName="AreaStyleText"></dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxButton ID="ShowAreaBtn" runat="server" AutoPostBack="false" Text="显示区域" ClientIDMode="AutoID">
                                    <ClientSideEvents Click="showarea" />
                                </dx:ASPxButton>
                            </td>
                            <td>
                                <h5>(区域按照序号排列)</h5>
                            </td>
                        </tr>
                    </table>
                    <h5 style="margin: 0px; padding: 0px;">（样式输入方式：输入数字序列，使得数字之和等于区域个数，且每个数字不超过3.若当前区域有4个，可输入样式为“22”，若有5个，可输入为“23”，若有6个，可输入“231”.）</h5>
                    <hr />
                    <iframe id="iframe_welcome" style="width: 100%; border: none; height: 350px"></iframe>
                </fieldset>
            </div>
        </div>
    </form>
</body>
</html>
