<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="train_myrecord.aspx.cs" Inherits="DigitalSystem.train.train_myrecord" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="overflow:scroll; position:relative; top:0px; width:100%; height:1000px; left:0px; margin-left:20%;" runat="server">
           <table style="margin-left:5%">
                                           <tr>
                                              <td width="200px"></td>
                                                    <td>
                                            <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Width="135px" >
                                             <Items>
                                               <dx:ListEditItem Text="年份" />
                                             </Items>
                                         </dx:ASPxComboBox>
                                             </td>

                                                 <td>
                                                      <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" Width="135px" >
                                                    <Items>
                                                                 <dx:ListEditItem Text="全年" />
                       
                                                      </Items>
                                                  </dx:ASPxComboBox>

                                                 </td>
                                            
                                                 <td>
                                                     <dx:ASPxButton ID="ASPxButton1" runat="server" Text="查询" OnClick="Select_Click"></dx:ASPxButton>
                                               </td>
                                               <td>
                                                     <dx:ASPxButton ID="ASPxButton2" runat="server" Text="刷新" OnClick="btnRefresh_Click"></dx:ASPxButton>
                                               </td>
                                           </tr>
                                       </table>
        <%-- 某员工培训的全部记录 --%>
        <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="LinqDataSource1" OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared " Width="60%"  >
               <Settings ShowFilterRow="True" />
                                           <SettingsText EmptyDataRow="无数据显示" />
            <Columns>
                
           
                <dx:GridViewDataTextColumn FieldName="id"  ReadOnly="True" VisibleIndex="0" Visible="false">
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Course_id"   ReadOnly="True" VisibleIndex="0" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Number"  Caption="课程编号" ReadOnly="True" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="cname" Caption="课程名称"   ReadOnly ="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LoginName"  Caption="员工编号"  ReadOnly ="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName"  Caption= "员工姓名"  ReadOnly="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Grade"  Caption="员工成绩"  ReadOnly="True" VisibleIndex="4" >
                    
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFilterRow="True" />
              <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
                                                <SettingsPager   AlwaysShowPager="true" PageSize="12" NumericButtonCount="5" >
                                                    <Summary  Text="第{0}页  共{1}页 (共{2} 项)" />
                                       
                                                  
                                                </SettingsPager>
                                                 <Settings ShowFilterRow="True" />
                                                  <SettingsText EmptyDataRow="无数据显示" />
                                                  <Styles>
                                                    <Cell Wrap="True" HorizontalAlign="Center">
                                                    </Cell>
                                                    <Header HorizontalAlign="Center">
                                                    </Header>
                                                </Styles>
        </dx:ASPxGridView>
    </div>
           <asp:HiddenField  ID="HiddenField1" runat="server"   EnableViewState="false"   />
                                       <asp:HiddenField  ID="HiddenField11" runat="server"   EnableViewState="false"   />
                                        <asp:HiddenField  ID="HiddenField2" runat="server"   EnableViewState="false"   />
                                       <asp:HiddenField  ID="HiddenField4" runat="server"   EnableViewState="false"   />
        <asp:HiddenField  ID="Hidden2" runat="server"/>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DigitalSystem.train.train_courseDataContext" EntityTypeName="" Select="new (id,LoginName, UserName,Course_id, Number, cname,Grade)" 
                  where="id=@imployee_id and Grade>=0"
                 TableName="train_personal_record_view" >
                  <WhereParameters>
                         <%--<asp:ControlParameter  ControlID="HiddenField4"  DefaultValue="-1"  Name="course_number" PropertyName="Value" Type="String" />--%>                              
                         <asp:ControlParameter  ControlID="HiddenField1"    Name="course_year_start" PropertyName="Value" Type="DateTime"  />
                         <asp:ControlParameter  ControlID="HiddenField11"    Name="course_year_end" PropertyName="Value" Type="DateTime"  />
                          <asp:ControlParameter  ControlID="HiddenField2"  DefaultValue="-1"  Name="course_term" PropertyName="Value" Type="String"  />
                <asp:ControlParameter  ControlID="Hidden2" DefaultValue="0"  Name="imployee_id"  PropertyName="Value"  Type ="Int32"/>
            </WhereParameters>
        </asp:LinqDataSource>
    </form>
</body>
</html>
