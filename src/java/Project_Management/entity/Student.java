package Project_Management.entity;
// Generated Mar 26, 2017 4:27:50 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Student generated by hbm2java
 */
public class Student  implements java.io.Serializable {


     private int studentId;
     private Classes classes;
     private User user;
     private Date studentGraduationDate;
     private Float studentGpa;
     private Integer studentCreditTaken;
     private String studentTrainingProgram;
     private String studentFatherName;
     private String studentFatherPhone;
     private String studentMotherName;
     private String studentMotherPhone;

    public Student() {
    }

	
    public Student(Classes classes, User user) {
        this.classes = classes;
        this.user = user;
    }
    public Student(Classes classes, User user, Date studentGraduationDate, Float studentGpa, Integer studentCreditTaken, String studentTrainingProgram, String studentFatherName, String studentFatherPhone, String studentMotherName, String studentMotherPhone) {
       this.classes = classes;
       this.user = user;
       this.studentGraduationDate = studentGraduationDate;
       this.studentGpa = studentGpa;
       this.studentCreditTaken = studentCreditTaken;
       this.studentTrainingProgram = studentTrainingProgram;
       this.studentFatherName = studentFatherName;
       this.studentFatherPhone = studentFatherPhone;
       this.studentMotherName = studentMotherName;
       this.studentMotherPhone = studentMotherPhone;
    }
   
    public int getStudentId() {
        return this.studentId;
    }
    
    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }
    public Classes getClasses() {
        return this.classes;
    }
    
    public void setClasses(Classes classes) {
        this.classes = classes;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public Date getStudentGraduationDate() {
        return this.studentGraduationDate;
    }
    
    public void setStudentGraduationDate(Date studentGraduationDate) {
        this.studentGraduationDate = studentGraduationDate;
    }
    public Float getStudentGpa() {
        return this.studentGpa;
    }
    
    public void setStudentGpa(Float studentGpa) {
        this.studentGpa = studentGpa;
    }
    public Integer getStudentCreditTaken() {
        return this.studentCreditTaken;
    }
    
    public void setStudentCreditTaken(Integer studentCreditTaken) {
        this.studentCreditTaken = studentCreditTaken;
    }
    public String getStudentTrainingProgram() {
        return this.studentTrainingProgram;
    }
    
    public void setStudentTrainingProgram(String studentTrainingProgram) {
        this.studentTrainingProgram = studentTrainingProgram;
    }
    public String getStudentFatherName() {
        return this.studentFatherName;
    }
    
    public void setStudentFatherName(String studentFatherName) {
        this.studentFatherName = studentFatherName;
    }
    public String getStudentFatherPhone() {
        return this.studentFatherPhone;
    }
    
    public void setStudentFatherPhone(String studentFatherPhone) {
        this.studentFatherPhone = studentFatherPhone;
    }
    public String getStudentMotherName() {
        return this.studentMotherName;
    }
    
    public void setStudentMotherName(String studentMotherName) {
        this.studentMotherName = studentMotherName;
    }
    public String getStudentMotherPhone() {
        return this.studentMotherPhone;
    }
    
    public void setStudentMotherPhone(String studentMotherPhone) {
        this.studentMotherPhone = studentMotherPhone;
    }




}

