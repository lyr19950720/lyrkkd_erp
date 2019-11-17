using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DevExpress.Web.ASPxTreeView;
using System.Data.Linq;
namespace DigitalSystem.train.cs
{
    public class dbForLesson
    {
        private train_courseDataContext kkd = new train_courseDataContext();
        // 2. 建立相应的方法
        // 3. 建立treeview
        public void newCreateTree(TreeViewVirtualModeCreateChildrenEventArgs e, int root_type_ID)
        {
            List<TreeViewVirtualNode> children = new List<TreeViewVirtualNode>();
            var lesson_content_type_table = kkd.GetTable<train_lesson_content_type>();
            if (string.IsNullOrEmpty(e.NodeName))
            {
                // 查询节点信息
                train_lesson_content_type root_type = lesson_content_type_table.Single(d => d.ID == root_type_ID);
                // 建立节点
                TreeViewVirtualNode childNode = new TreeViewVirtualNode(root_type.ID.ToString(), root_type.TypeName);
                childNode.IsLeaf = lesson_content_type_table.Any(d => d.ParentID == root_type.ID) ? false : true;
                children.Add(childNode);
            }
            else
            {
                this.tree_view_child(children, int.Parse(e.NodeName), lesson_content_type_table);
            }
            e.Children = children;
        }
        private void tree_view_child(List<TreeViewVirtualNode> children, int root_type_id, Table<train_lesson_content_type> table)
        {
            // 1. 查询所有符合的节点
            IEnumerable<train_lesson_content_type> type_list;
            type_list = from type in table
                        where type.ParentID == root_type_id
                        select type;
            // 2. 添加节点
            foreach (var type in type_list)
            {
                TreeViewVirtualNode childNode = new TreeViewVirtualNode(type.ID.ToString(), type.TypeName);
                childNode.IsLeaf = table.Any(d => d.ParentID == type.ID) ? false : true;
                children.Add(childNode);
            }

        }

        public train_lesson_basicInfo findlessonByID(int ID)
        {
            var list = kkd.GetTable<train_lesson_basicInfo>();
            train_lesson_basicInfo lessonSingle = list.Single(d => d.Id == ID);
            return lessonSingle;
        }
        public void saveLesson()
        {
            kkd.SubmitChanges();
        }
        // 获取表名
        public List<string> getTableName()
        {
            List<string> result = new List<string>();
            var tables = kkd.Mapping.GetTables();
            foreach (var table in tables)
            {
                result.Add(table.TableName);
            }
            return result;

        }
    }
}