using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxTreeView;
using DigitalSystem.xiaoshou.cs;
using DevExpress.Web.ASPxClasses;
using DevExpress.Web.ASPxGridView;
using System.Collections;
using DevExpress.Web.Data;
using DigitalSystem.train.cs;
using MessageBox=System.Windows.Forms.MessageBox;
using MessageBoxButtons=System.Windows.Forms.MessageBoxButtons;
using MessageBoxIcon=System.Windows.Forms.MessageBoxIcon;

namespace DigitalSystem.train
{
    public partial class LessonManagement : System.Web.UI.Page
    {
        private dbForLesson kkd = new dbForLesson();
        private train_courseDataContext kkdb = new train_courseDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

            typeTreeView.ExpandToDepth(2);
          typeTreeView.SelectedNode = typeTreeView.Nodes[0];
        }
        // 创建treeview 树
        protected void treeview_create(object sender, TreeViewVirtualModeCreateChildrenEventArgs e)
        {
            kkd.newCreateTree(e, 1);
        }
        // 传递node 的值
        protected void click_node(object sender, CallbackEventArgsBase e)
        {
           
            hide_type_id.Value = e.Parameter;
            // 刷新gridview 没有写
            LessonGridview.DataBind();


        }
        // 编辑产品页面
        protected void row_editing(object sender, ASPxDataUpdatingEventArgs e)
        {

        }
        /// <summary>
        /// 类型更改相关操作
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void New_Type(object sender, EventArgs e)
        {
         
            train_lesson_content_type newType = new train_lesson_content_type();
            newType.TypeName = NewTypeName.Text;
            newType.ParentID = int.Parse(typeTreeView.SelectedNode.Name);
             kkdb.train_lesson_content_type.InsertOnSubmit(newType);
            kkdb.SubmitChanges();
            typeTreeView.RefreshVirtualTree();
            
          

        }
        public void Edit_Type(object sender, EventArgs e)
        {
            var typeList = kkdb.GetTable<train_lesson_content_type>();
            train_lesson_content_type editType = typeList.Single(d => d.ID == int.Parse(typeTreeView.SelectedNode.Name));
            editType.TypeName = EditTypeName.Text;
            kkdb.SubmitChanges();
            typeTreeView.RefreshVirtualTree();
           
        }
        public void Del_Type(object sender, EventArgs e)
        {
            if (typeTreeView.SelectedNode.Name == null) return;
            var typeID = int.Parse(typeTreeView.SelectedNode.Name);
            // 先判断类型下是否还有类型
            var typeList = kkdb.GetTable<train_lesson_content_type>();
            var productList = kkdb.GetTable<train_lesson_basicInfo>();
            if (typeList.Any(d => d.ParentID == int.Parse(typeTreeView.SelectedNode.Name)))
            {
                ErrorMessage.Text = "此类型已进行过分类，请先删除下属类型";
                return;
            }
            else
            {
                // 判断该类型是否有产品
                if (productList.Any(d => d.ContentTypeId == int.Parse(typeTreeView.SelectedNode.Name)))
                {
                    ErrorMessage.Text = "此类型已经建立课程，请先删除";
                    return;
                }
                else
                {
                    train_lesson_content_type newType = typeList.Single(d => d.ID == int.Parse(typeTreeView.SelectedNode.Name));
                    kkdb.train_lesson_content_type.DeleteOnSubmit(newType);
                    kkdb.SubmitChanges();
                    typeTreeView.RefreshVirtualTree();
                }
            }

        }
        // 产品表的相关操作
        public void New_Lesson(object sender, EventArgs e)
        {
            // 存储字段

            train_lesson_basicInfo info = new train_lesson_basicInfo();
          
            info.Name = Name.Text;
            info.Number = Number.Text;
            info.Description = Description.Text;
            info.Time = Convert.ToInt32(Time.Text);
            info.Type = Convert.ToInt32(Type.Value);
            info.ContentTypeId = int.Parse(typeTreeView.SelectedNode.Name);
            info.Status = Convert.ToInt32(Status.Value);

       //     kkdb.train_lesson_basicInfo.InsertOnSubmit(info);
        //    kkdb.SubmitChanges();
     
            //判断该课程是否已经添加
            var lessonInfo = kkdb.GetTable<train_lesson_basicInfo>();

            var lessonNum = from t in lessonInfo
                            where t.Number == info.Number
                              select t.Number;

            foreach (var i in lessonNum)
            {
              
                if (i.ToString() != "")
                {
                    Response.Write("<script>alert('该课程已经添加，请勿重复添加！');</script>");
                    return;
                 
                }
      
            }
                    kkdb.train_lesson_basicInfo.InsertOnSubmit(info);
                    kkdb.SubmitChanges();
          
            
            

        }


        // 查找一个类型下的所有子类型
        public void findTypelList(int typeId, ArrayList result)
        {
            // 查找表集合
            var typeList = kkdb.GetTable<train_lesson_content_type>();
            //
            var typeChidren = from t in typeList
                              where t.ParentID == typeId
                              select t;
            if (typeChidren != null)
            {
                foreach (var i in typeChidren)
                {
                    findTypelList(i.ID, result);
                    result.Add(i.ID);
                }
            }

        }
        // 查找符合类型的所有产品
        public List<train_lesson_basicInfo> findAllProduct(ArrayList typeList)
        {
            List<train_lesson_basicInfo> productList = new List<train_lesson_basicInfo>();
            var productArray = kkdb.GetTable<train_lesson_basicInfo>();
            foreach (var i in typeList)
            {
                var aa = Convert.ToInt32(i);
                var bb = aa;
                var product = from t in productArray
                              where t.ContentTypeId == Convert.ToInt32(i)
                              select t;
                if (product != null)
                {
                    foreach (var t in product)
                    {
                        productList.Add(t);
                    }
                }
            }

            return productList;
        }
        // gridview 删除事件
        public void GridView1_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            var i = e.Keys[LessonGridview.KeyFieldName];
            var bb = i;
            LessonGridview.DataBind();
        }
        // gridview 更改事件

        /// <summary>
        /// 提示对话框
        /// </summary>
        public void showMessage(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), this.UniqueID, "alert('" + msg + "')", true);
        }

        protected void productGridview_StartRowEditing(object sender, ASPxStartRowEditingEventArgs e)
        {

            hide_lesson_id.Value = e.EditingKeyValue.ToString();
            Session["product_formula"] = e.EditingKeyValue.ToString();
        }



    }
}