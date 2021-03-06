package Project_Management.entity;
// Generated Mar 26, 2017 4:27:50 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Comment generated by hbm2java
 */
public class Comment  implements java.io.Serializable {


     private Integer commentId;
     private Project project;
     private User user;
     private String commentContent;
     private Date commentPostDate;
     private boolean commentEnable;
     private Date commentLastModifed;
     private String commentLastEditor;
     private Boolean commentIsRead;
     private String commentFont;
     private String commentLanguage;

    public Comment() {
    }

	
    public Comment(User user, String commentContent, boolean commentEnable) {
        this.user = user;
        this.commentContent = commentContent;
        this.commentEnable = commentEnable;
    }
    public Comment(Project project, User user, String commentContent, Date commentPostDate, boolean commentEnable, Date commentLastModifed, String commentLastEditor, Boolean commentIsRead, String commentFont, String commentLanguage) {
       this.project = project;
       this.user = user;
       this.commentContent = commentContent;
       this.commentPostDate = commentPostDate;
       this.commentEnable = commentEnable;
       this.commentLastModifed = commentLastModifed;
       this.commentLastEditor = commentLastEditor;
       this.commentIsRead = commentIsRead;
       this.commentFont = commentFont;
       this.commentLanguage = commentLanguage;
    }
   
    public Integer getCommentId() {
        return this.commentId;
    }
    
    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }
    public Project getProject() {
        return this.project;
    }
    
    public void setProject(Project project) {
        this.project = project;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public String getCommentContent() {
        return this.commentContent;
    }
    
    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }
    public Date getCommentPostDate() {
        return this.commentPostDate;
    }
    
    public void setCommentPostDate(Date commentPostDate) {
        this.commentPostDate = commentPostDate;
    }
    public boolean isCommentEnable() {
        return this.commentEnable;
    }
    
    public void setCommentEnable(boolean commentEnable) {
        this.commentEnable = commentEnable;
    }
    public Date getCommentLastModifed() {
        return this.commentLastModifed;
    }
    
    public void setCommentLastModifed(Date commentLastModifed) {
        this.commentLastModifed = commentLastModifed;
    }
    public String getCommentLastEditor() {
        return this.commentLastEditor;
    }
    
    public void setCommentLastEditor(String commentLastEditor) {
        this.commentLastEditor = commentLastEditor;
    }
    public Boolean getCommentIsRead() {
        return this.commentIsRead;
    }
    
    public void setCommentIsRead(Boolean commentIsRead) {
        this.commentIsRead = commentIsRead;
    }
    public String getCommentFont() {
        return this.commentFont;
    }
    
    public void setCommentFont(String commentFont) {
        this.commentFont = commentFont;
    }
    public String getCommentLanguage() {
        return this.commentLanguage;
    }
    
    public void setCommentLanguage(String commentLanguage) {
        this.commentLanguage = commentLanguage;
    }




}


