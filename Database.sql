DROP SCHEMA IF EXISTS project_management ;

CREATE SCHEMA IF NOT EXISTS project_management DEFAULT CHARACTER SET utf8 ;

USE project_management ;

DROP TABLE IF EXISTS project_management.faculty;

create table if not exists project_management.faculty (
	#id(10) = toi da 10 cs
	faculty_id int (10) not null auto_increment,
    faculty_enable bool not null,
    faculty_dean_name nvarchar(30) not null,
    faculty_vice_dean_name nvarchar(30) not null,
    faculty_major nvarchar(30) not null,
    faculty_lecturer_count int(10) not null,
    faculty_student_count int(10) not null,
    faculty_class_count int(10) not null,
    faculty_subject_list nvarchar(200) not null,
    faculty_personnel_manager nvarchar(50) not null,
    primary key(faculty_id)
);

DROP TABLE IF EXISTS project_management.classes;

create table if not exists project_management.classes (
	classes_id int (10) not null auto_increment,
    classes_enable bool not null,
    classes_name nvarchar(10) not null,
	classes_student_count int(10) not null,
    classes_representative_name nvarchar(30) not null,
    classes_vice_representative_name nvarchar(30) not null,
    classes_head_teacher_name nvarchar(30) not null,
    classes_academic_year int(2) not null,
    classes_faculty_id int(10) not null,
    foreign key(classes_faculty_id) references project_management.faculty(faculty_id) on delete cascade on update cascade,
    primary key(classes_id)
);

DROP TABLE IF EXISTS project_management.user ;

create table if not exists project_management.user (
	user_id int(10) not null auto_increment,
    user_name nvarchar(50) not null,
    user_date_of_birth datetime not null,
    user_gender nvarchar(10) not null,
    user_identification_number varchar(12) not null,
    user_language nvarchar(15) not null,
    user_nationality nvarchar(15),
    user_salary int (10),
    user_address nvarchar(100),
    user_hometown nvarchar(20),
    user_mobile_number varchar(12),
    user_phone_number varchar(12),
    user_religion nvarchar(15),
    user_ethnic nvarchar(15),
    user_account_create_date datetime not null,
    user_last_login datetime,
    user_last_modified datetime,
    user_alias varchar (20) not null,
    user_password varchar (20) not null,
    user_avatar varchar(100) not null,
    user_enable boolean not null,
    user_active boolean not null,
    user_facebook varchar(100),
    user_email varchar(100),
    user_duty nvarchar(30) not null,
    user_authority nvarchar(100) not null,
    user_self_describe nvarchar(100),
    user_diploma nvarchar(50),
    user_degree nvarchar(50),
    user_marriage_status nvarchar(15),
    user_faculty_id int (10) not null,
    user_manager_parent_id int(10),
    foreign key(user_faculty_id) references project_management.faculty(faculty_id) on delete cascade on update cascade,
    primary key(user_id)
);

 DROP TABLE IF EXISTS project_management.student ;

create table if not exists project_management.student (
	student_id int (10) not null,
	student_class_id int (10) not null,
    student_graduation_date datetime,
    #float(3,2) = tong cong 3 cs, 2 cs sau dau phay, vd: 3,94
    student_gpa float(3,2),
    student_credit_taken int(3),
    student_training_program nvarchar(20),
	student_father_name nvarchar(30),
    student_father_phone nvarchar(12),
    student_mother_name nvarchar(30),
    student_mother_phone nvarchar(12),
    foreign key(student_id) references project_management.user(user_id) on delete cascade on update cascade,
    foreign key(student_class_id) references project_management.classes(classes_id) on delete cascade on update cascade,
    primary key(student_id)
);

DROP TABLE IF EXISTS project_management.project ;

create table if not exists project_management.project (
	project_id int(10) not null auto_increment,
    project_name nvarchar(30) not null,
    project_author_id int(10) not null,
    project_instructor_id int(10) not null,
    project_content_link varchar (100) not null,
    project_progress text(1000) not null,
    #diem danh gia
    project_valuation_point float(5,2),
    #danh gia = chu
    project_appraisal text(1000),
    project_enable bool not null,
    project_start_date datetime,
    #text: toi da 65536 ki tu
    project_brief text(2000),
    project_view_count int(3),
	project_page_count int(10),
    project_chapter_list nvarchar(500),
    project_font varchar(20),
    project_language nvarchar(20),
    #project_size: mb
    project_size float(10,2),
    project_last_modified datetime,
    #hoi dong cham diem
    project_valuation_council text(1000),
    #hoi dong phan bien
    project_reviewer_council text(1000),
    #ghi chu
    project_note text(1000),
    #tu khoa search
    project_keywork nvarchar(100),
    #chu de
    project_theme nvarchar(100),
    #nhiem vu
    project_task text(1000),
    foreign key (project_author_id) references project_management.user(user_id) on delete cascade on update cascade,
    foreign key (project_instructor_id) references project_management.user(user_id) on delete cascade on update cascade,
    primary key(project_id)
);

DROP TABLE IF EXISTS project_management.comment ;

create table if not exists project_management.comment (
	comment_id int(10) not null auto_increment,
	comment_content text (1000) not null,
    comment_poster_id int(10) not null,
    comment_post_date datetime,
    comment_enable boolean not null,
    comment_last_modifed datetime,
    comment_last_editor_id int(10),
    comment_is_read boolean,
    comment_font varchar(30),
    comment_language nvarchar(30),
    comment_project_contain_id int(10),
    comment_parent_id int(10),
    foreign key (comment_last_editor_id) references project_management.user(user_id) on delete cascade on update cascade,
    foreign key (comment_project_contain_id) references project_management.project(project_id) on delete cascade on update cascade,
    foreign key (comment_poster_id) references project_management.user(user_id) on delete cascade on update cascade,
    primary key(comment_id)
); 

DROP TABLE IF EXISTS project_management.form ;

create table if not exists project_management.form (
	form_id int(10) not null auto_increment,
    form_title nvarchar (100) not null,
    form_creator_id int (10) not null,
    form_receiver_id int (10) not null,
	form_created_date datetime,
    form_status nvarchar(20) not null,
	foreign key (form_receiver_id) references project_management.user(user_id) on delete cascade on update cascade,
    foreign key (form_creator_id) references project_management.user(user_id) on delete cascade on update cascade,
    primary key (form_id)
);
DROP TABLE IF EXISTS project_management.project_create_form ;

create table if not exists project_management.project_create_form (
	project_create_form_id int(10) not null,
    project_create_form_project_name nvarchar(50) not null,
    project_create_form_project_brief text(1000) not null, 
    foreign key(project_create_form_id) references project_management.form(form_id) on delete cascade on update cascade,
    primary key(project_create_form_id)
) ;

DROP TABLE IF EXISTS project_management.progress_report_form ;

create table if not exists project_management.progress_report_form (
	progress_report_form_id int(10) not null,
    progress_report_form_content text(1000) not null,
    progress_report_form_project_id int(10) not null,
    foreign key (progress_report_form_project_id) references project_management.project(project_id) on delete cascade on update cascade,
    foreign key (progress_report_form_id) references project_management.form(form_id) on delete cascade on update cascade,
    primary key(progress_report_form_id)
);

DROP TABLE IF EXISTS project_management.delete_project_form;

create table if not exists project_management.delete_project_form (
	delete_project_form_id int(10) not null,
	delete_project_form_reason text(1000) not null,
    foreign key (delete_project_form_id) references project_management.form(form_id) on delete cascade on update cascade,
    primary key(delete_project_form_id)
)