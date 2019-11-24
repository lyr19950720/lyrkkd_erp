采取前后端不分离的架构模式，使用Dev Express控件，后端采用C#语言编写，数据库使用SQL Server。
在整个项目中，我负责的是员工培训部分train。 
（1）	课程基本信息管理功能如下(LessonManagement.aspx)：
	培训课程的类型管理(LessonContentType.aspx)
	培训课程内容的管理(train_course_detail.aspx)

（2）	教务员开课管理功能如下（OpenCourse.aspx）：
	列表显示全部课程信息以及已开课程信息，选中某门课程后，显示课程的详	细信息（OpenCourseDetail.aspx），教务员可以设置课程的选课日期、课程	的上课地点、上课开始日期和结束日期等信息。

（3）选课功能（train_course_select.aspx）：
	学生在选课的过程中，选课列表中一门课可以开设由不同的老师代课，学	生只能选择其一，若想重新选择，需要先进行退课操作。

 	教师对于自己开设的课程可以按部门添加学员或者添加单个学员、可以对	 名单中的学生信息进行更新、删除等（Course_Student_Info_Modify.aspx）。

（4）成绩管理（TeacherGradeManage.aspx）：
	教师可以查看自己的授课情况（TeacherCourseInfo.aspx），在课程讲授完毕	后，添加学员成绩，提交给教务员审核。

（5）成绩审核（CheckGrade.aspx）：教务员对学生成绩进行审核，并给出审核	意见，驳回或者通过，驳回原因等。 (CheckGradeInfo.aspx)

（6）培训课程历史纪录（trainRecord.aspx）：可查看目前已结课和未结课的培训课程，选中课程后可查看该课程的选课学员名单、学员的成绩、成绩合格人数名单和成绩不合格人数名单。

（7）我的历史记录（train_myrecord.aspx）：用户可查看本人的培训记录信息。

