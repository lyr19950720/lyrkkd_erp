using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalSystem.train.cs
{
    public partial class LessonDB
    {
        train_courseDataContext context = new train_courseDataContext();
        public void insert_lesson_basicInfo(
            String number,
            String name,
            int time,
            int type,
            String description
            )
        {
            train_lesson_basicInfo info = new train_lesson_basicInfo();
            info.Name = name;
            info.Number = number;
            info.Time = time;
            info.Type = type;
            info.Description = description;
            context.train_lesson_basicInfo.InsertOnSubmit(info);
            context.SubmitChanges();

        }

        
        public void update_lesson_basicInfo(
            int _Id,
            String number,
            String name,
            int time,
            int type,
            String description
            )
        {
            train_lesson_basicInfo info = context.train_lesson_basicInfo.Single(i => i.Id == _Id);
            info.Name = name;
            info.Number = number;
            info.Time = time;
            info.Type = type;
            info.Description = description;
            context.SubmitChanges();
        }

        public void delete_lesson_basicInfo(int id)
        {
            train_lesson_basicInfo info = context.train_lesson_basicInfo.Single(i => i.Id == id);
            context.train_lesson_basicInfo.DeleteOnSubmit(info);
            context.SubmitChanges();

        }

        public train_lesson_basicInfo select_info(int lessonId)
        {
            return context.train_lesson_basicInfo.Single(i => i.Id == lessonId);
        }
    }
}