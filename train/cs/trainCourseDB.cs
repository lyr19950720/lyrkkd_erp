using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalSystem.train.cs
{
    public class trainCourseDB
    {
        train_courseDataContext context = new train_courseDataContext();
        public void insert_course(
            DateTime createTime,
            int teacher,
            String classTime,
            String place,
            DateTime end_choose_time,
            DateTime start_date,
            DateTime end_date,
            int status,
            int lesson_id

            )
        {
            train_course info = new train_course();
            info.Class_time = classTime;
            info.Create_time = createTime;
            info.End_choose_date = end_choose_time;
            info.End_date = end_date;
            info.Start_date = start_date;
            info.Status = status;
            info.Teacher = teacher;
            info.Place = place;
            info.Lesson_id = lesson_id;
            context.train_course.InsertOnSubmit(info);
            context.SubmitChanges();
        }

        public void update_train_course(
            int id,
            int teacher,
            String classTime,
            String place,
            DateTime end_choose_time,
            DateTime start_date,
            DateTime end_date,
            int status
            )
        {
            train_course info = context.train_course.Single(i => i.Id == id);
            info.Class_time = classTime;
            info.End_choose_date = end_choose_time;
            info.End_date = end_date;
            info.Start_date = start_date;
            info.Status = status;
            info.Teacher = teacher;
            info.Place = place;
            context.SubmitChanges();
        }

        public void update_course_status(int id,int status,String suggest = "")
        {
            train_course info = context.train_course.Single(i => i.Id == id);
            info.Status = status;
            info.Remark = suggest;
            context.SubmitChanges();
        }
    }
}