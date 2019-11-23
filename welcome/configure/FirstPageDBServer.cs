using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalSystem.welcome
{
    /// <summary>
    /// 此类完成首页的数据库操作
    /// </summary>
    public class FirstPageDBServer
    {
        contextDataContext context = new contextDataContext();
        #region//区域管理
        /// <summary>
        /// 将区域样式存入数据库
        /// </summary>
        /// <param name="style"></param>
        public void saveAreaStyle(string style)
        {
            P_Area_style areaStyle=null;
            var query = from t in context.P_Area_style
                        select t;
            if (query.Count() > 0)//存在则修改
            {
                areaStyle = query.First();
                areaStyle.Style = style;
            }
            else//不存在则创建
            {
                areaStyle = new P_Area_style();
                areaStyle.Style = style;
                context.P_Area_style.InsertOnSubmit(areaStyle);
            }
            context.SubmitChanges();
        }
        /// <summary>
        /// 获取区域设置的样式
        /// </summary>
        /// <returns></returns>
        public string getAreaStyle()
        {
            var query = from t in context.P_Area_style
                        select t;
            if (query.Count() > 0)
            {
                return query.First().Style;
            }
            else
            {
                return "";
            }
        }
        /// <summary>
        /// 获取所有可用区域信息
        /// </summary>
        /// <returns></returns>
        public List<P_Area> getAreas()
        {
            List<P_Area> areas = new List<P_Area>();
            var query = from t in context.P_Area 
                        where t.Enable==1
                        orderby t.Order
                        select t;
            foreach (P_Area item in query)
            {
                areas.Add(item);
            }
            return areas;
        }
        /// <summary>
        /// 判断区域名称是否存在
        /// </summary>
        /// <returns></returns>
        public bool judgeAreaNameExist(string name)
        {
            var query = from t in context.P_Area
                        where t.Name == name
                        select t;
            if (query.Count() > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        ///判断给定区域下是否包含功能
        /// </summary>
        /// <param name="areaId"></param>
        /// <returns></returns>
        public bool judgeIsAreaContainsFunction(int areaId)
        {
            var query = from t in context.P_Function
                        where t.AreaID == areaId
                        select t;
            if (query.Count() > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        #endregion
        #region//功能管理
        /// <summary>
        /// 根据区域ID,获取该区域下第一个可用功能的信息
        /// </summary>
        /// <param name="areaID"></param>
        /// <returns></returns>
        public P_Function getFirstEnableFunction(int areaID)
        {
            var query=from t in context.P_Function
                      where t.AreaID==areaID && t.Enable==1
                      orderby t.Order
                      select t;
            if (query.Count() > 0)
            {
                return query.First();
            }
            else
            {
                return null;
            }

        }
        /// <summary>
        /// 判断给定的功能是否包含内容
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool judgeFunctionContainsContent(int id)
        {
            var query = from t in context.P_Content
                        where t.FunctionID == id
                        select t;
            if (query.Count() > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 判断给定区域下，功能名称是否存在
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool judgeFunctionNameExist(string name,int areaID )
        {
            var query = from t in context.P_Function
                        where t.Name == name && t.AreaID == areaID
                        select t;
            if (query.Count() > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        #endregion
        #region//内容管理
        /// <summary>
        /// 根据功能ID，获取该功能下所有可显示的内容
        /// </summary>
        /// <param name="functionID"></param>
        /// <returns></returns>
        public List<P_Content> getEnableContents(int functionID)
        {
            List<P_Content> contents = new List<P_Content>();
            var query = from t in context.P_Content
                        where t.FunctionID == functionID && t.Enable == 1
                        orderby t.Order
                        select t;
            if (query.Count() > 0)
            {
                foreach (P_Content item in query)
                {
                    contents.Add(item);
                }
            }
            return contents;
        }
        /// <summary>
        /// 判断内容是否包含文件
        /// </summary>
        /// <param name="contentID"></param>
        /// <returns></returns>
        public bool judgeContentContainsFile(int contentID)
        {
            var query = from t in context.P_File
                        where t.ContentID == contentID
                        select t;
            if (query.Count() > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 根据内容id,获取内容信息
        /// </summary>
        /// <param name="contentID"></param>
        /// <returns></returns>
        public string getContentById(int contentID)
        {
            var query = from t in context.P_Content
                        where t.ID == contentID
                        select t;
            if (query.Count() > 0)
            {
                return query.First().Content;
            }
            else
            {
                return "";
            }
        }
        /// <summary>
        /// 根据内容ID，获取内容的所有信息
        /// </summary>
        /// <param name="contentID"></param>
        /// <returns></returns>
        public P_Content getContentInfoById(int contentID)
        {
            var query = from t in context.P_Content
                        where t.ID == contentID
                        select t;
            if (query.Count() > 0)
            {
                return query.First();
            }
            else
            {
                return null; 
            }
        }

        /// <summary>
        /// 保存给定内容id的文本
        /// </summary>
        /// <param name="ContentID"></param>
        public void saveContent(int ContentID,string text)
        {
            var query = from t in context.P_Content
                        where t.ID == ContentID
                        select t;
            if (query.Count() > 0)
            {
                P_Content content = query.First();
                content.Content = text;
                context.SubmitChanges();
            }
        }
        #endregion
        #region//文件操作
        /// <summary>
        /// 将内容对应的文件存到数据库
        /// </summary>
        /// <param name="ContentID"></param>
        /// <param name="filePath"></param>
        public void saveFilePath(int ContentID, string filePath,string location,int fileType)
        {
            P_File file = new P_File();
            file.ContentID = ContentID;//文件所在内容ID
            file.Location = location;//文件在正文中的位置
            file.Type = fileType;//文件类型 0表示文件 1表示图片
            file.Path = filePath;
            context.P_File.InsertOnSubmit(file);
            context.SubmitChanges();   
        }
        /// <summary>
        /// 获取内容下的特定文件的结合
        /// </summary>
        /// <param name="contentID"></param>
        /// <returns></returns>
        public List<P_File> getFilesByContentID(int contentID,int fileType)
        {
            List<P_File> files = new List<P_File>();
            var query = from t in context.P_File
                        where t.ContentID == contentID && t.Type==fileType
                        select t;
            foreach (P_File item in query)
            {
                files.Add(item);
            }
            return files;
        }
        public void deleteFiles(int contentID)
        {
            var query = from t in context.P_File
                        where t.ContentID == contentID
                        select t;
            foreach (P_File item in query)
            {
                context.P_File.DeleteOnSubmit(item);
            }
            context.SubmitChanges();
        }
        #endregion
    }
}