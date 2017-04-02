DROP SCHEMA IF EXISTS project_management ;

CREATE SCHEMA IF NOT EXISTS project_management DEFAULT CHARACTER SET utf8 ;

USE project_management ;

DROP TABLE IF EXISTS project_management.tbl_faculty;

create table if not exists project_management.tbl_faculty (
	faculty_id integer not null auto_increment,
    faculty_enable bool not null,
    faculty_dean_name varchar(30) not null,
    faculty_vice_dean_name varchar(30) not null,
    faculty_major varchar(30) not null,
    faculty_lecturer_count integer not null,
    faculty_student_count integer not null,
    faculty_class_count integer not null,
    faculty_subject_list varchar(200) not null,
    faculty_personnel_manager varchar(50) not null,
    primary key(faculty_id)
);
insert into project_management.tbl_faculty (faculty_enable, 
											faculty_dean_name, faculty_vice_dean_name, 
                                            faculty_major, faculty_lecturer_count,
                                            faculty_student_count, faculty_class_count,
                                            faculty_subject_list, faculty_personnel_manager)
									values(true,'Nguyen Van A','Tran Thi B','CNTT',5,19,100,'KHMT','Nguyen Duc C');
                                            
DROP TABLE IF EXISTS project_management.tbl_class;

create table if not exists project_management.tbl_class (
	class_id integer not null auto_increment,
    class_enable bool not null,
    class_name varchar(10) not null,
	class_student_count integer not null,
    class_representative_name varchar(30) not null,
    class_vice_representative_name varchar(30) not null,
    class_head_teacher_name varchar(30) not null,
    class_academic_year integer not null,
    class_faculty_id integer not null,
    foreign key(class_faculty_id) references project_management.tbl_faculty(faculty_id) on delete cascade on update cascade,
    primary key(class_id)
);

DROP TABLE IF EXISTS project_management.tbl_user ;

create table if not exists project_management.tbl_user (
	user_id integer not null auto_increment,
    user_name varchar(50) not null,
    user_date_of_birth varchar(20) not null,
    user_gender varchar(10) not null,
    user_identification_number varchar(12) not null,
    user_language varchar(15) not null,
    user_nationality varchar(15),
    user_salary integer,
    user_address varchar(100),
    user_hometown varchar(20),
    user_mobile_number varchar(12),
    user_phone_number varchar(12),
    user_religion varchar(15),
    user_ethnic varchar(15),
    user_account_create_date varchar(20) not null,
    user_last_login varchar(20),
    user_last_modified varchar(20),
    user_alias varchar (20) not null,
    user_password varchar (20) not null,
    user_avatar varchar(100) not null,
    user_enable boolean not null,
    user_active boolean not null,
    user_facebook varchar(100),
    user_email varchar(100),
    user_duty varchar(30) not null,
    user_authority varchar(100) not null,
    user_self_describe varchar(100),
    user_diploma varchar(50),
    user_degree varchar(50),
    user_marriage_status varchar(15),
    user_faculty_id integer not null,
    user_manager_parent_id integer,
    foreign key(user_faculty_id) references project_management.tbl_faculty(faculty_id) on delete cascade on update cascade,
    primary key(user_id)
);

 DROP TABLE IF EXISTS project_management.tbl_student ;

create table if not exists project_management.tbl_student (
	student_id integer not null,
	student_class_id integer not null,
    student_graduation_date varchar(20),
    #float(3,2) = tong cong 3 cs, 2 cs sau dau phay, vd: 3,94
    student_gpa integer,
    student_credit_taken integer,
    student_training_program varchar(20),
	student_father_name varchar(30),
    student_father_phone varchar(12),
    student_mother_name varchar(30),
    student_mother_phone varchar(12),
    foreign key(student_id) references project_management.tbl_user(user_id) on delete cascade on update cascade,
    foreign key(student_class_id) references project_management.tbl_class(class_id) on delete cascade on update cascade,
    primary key(student_id)
);

DROP TABLE IF EXISTS project_management.tbl_project ;

create table if not exists project_management.tbl_project (
	project_id integer not null auto_increment,
    project_name varchar(30) not null,
    project_author_id integer not null,
    project_instructor_id integer not null,
    project_content_link varchar (100) not null,
    project_progress text(1000) not null,
    #diem danh gia
    project_valuation_point integer,
    #danh gia = chu
    project_appraisal text(1000),
    project_enable bool not null,
    project_start_date varchar(20),
    #text: toi da 65536 ki tu
    project_brief text(2000),
    project_view_count integer,
	project_page_count integer,
    project_chapter_list varchar(500),
    project_font varchar(20),
    project_language varchar(20),
    #project_size: mb
    project_size integer,
    project_last_modified varchar(20),
    #hoi dong cham diem
    project_valuation_council text(1000),
    #hoi dong phan bien
    project_reviewer_council text(1000),
    #ghi chu
    project_note text(1000),
    #tu khoa search
    project_keywork varchar(100),
    #chu de
    project_theme varchar(100),
    #nhiem vu
    project_task text(1000),
    foreign key (project_author_id) references project_management.tbl_user(user_id) on delete cascade on update cascade,
    foreign key (project_instructor_id) references project_management.tbl_user(user_id) on delete cascade on update cascade,
    primary key(project_id)
);

DROP TABLE IF EXISTS project_management.tbl_comment ;

create table if not exists project_management.tbl_comment (
	comment_id integer not null auto_increment,
	comment_content text (1000) not null,
    comment_poster_id integer not null,
    comment_post_date varchar(20),
    comment_enable boolean not null,
    comment_last_modifed varchar(20),
    comment_last_editor_id integer,
    comment_is_read boolean,
    comment_font varchar(30),
    comment_language varchar(30),
    comment_project_contain_id integer,
    comment_parent_id integer,
    foreign key (comment_last_editor_id) references project_management.tbl_user(user_id) on delete cascade on update cascade,
    foreign key (comment_project_contain_id) references project_management.tbl_project(project_id) on delete cascade on update cascade,
    foreign key (comment_poster_id) references project_management.tbl_user(user_id) on delete cascade on update cascade,
    primary key(comment_id)
); 

DROP TABLE IF EXISTS project_management.tbl_form ;

create table if not exists project_management.tbl_form (
	form_id integer not null auto_increment,
    form_title varchar (100) not null,
    form_creator_id integer not null,
    form_receiver_id integer not null,
	form_created_date varchar(20),
    form_status varchar(20) not null,
	foreign key (form_receiver_id) references project_management.tbl_user(user_id) on delete cascade on update cascade,
    foreign key (form_creator_id) references project_management.tbl_user(user_id) on delete cascade on update cascade,
    primary key (form_id)
);
DROP TABLE IF EXISTS project_management.tbl_project_create_form ;

create table if not exists project_management.tbl_project_create_form (
	project_create_form_id integer not null,
    project_create_form_project_name varchar(50) not null,
    project_create_form_project_brief text(1000) not null, 
    foreign key(project_create_form_id) references project_management.tbl_form(form_id) on delete cascade on update cascade,
    primary key(project_create_form_id)
) ;

DROP TABLE IF EXISTS project_management.tbl_progress_report_form ;

create table if not exists project_management.tbl_progress_report_form (
	progress_report_form_id integer not null,
    progress_report_form_content text(1000) not null,
    progress_report_form_project_id integer not null,
    foreign key (progress_report_form_project_id) references project_management.tbl_project(project_id) on delete cascade on update cascade,
    foreign key (progress_report_form_id) references project_management.tbl_form(form_id) on delete cascade on update cascade,
    primary key(progress_report_form_id)
);

DROP TABLE IF EXISTS project_management.tbl_delete_project_form;

create table if not exists project_management.tbl_delete_project_form (
	delete_project_form_id integer not null,
	delete_project_form_reason text(1000) not null,
    foreign key (delete_project_form_id) references project_management.tbl_form(form_id) on delete cascade on update cascade,
    primary key(delete_project_form_id)
)



