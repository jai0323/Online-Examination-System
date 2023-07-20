package com.quiz;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="studentlogin")
@Table(name="studentlogin")
public class Student {
@Id
String email;
String password,name,pno,gender,course,ques,ans;
public String getQues() {
	return ques;
}
public void setQues(String ques) {
	this.ques = ques;
}
public String getAns() {
	return ans;
}
public void setAns(String ans) {
	this.ans = ans;
}
int semester,code;
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPno() {
	return pno;
}
public void setPno(String pno) {
	this.pno = pno;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getCourse() {
	return course;
}
public void setCourse(String course) {
	this.course = course;
}
public int getSemester() {
	return semester;
}
public void setSemester(int semester) {
	this.semester = semester;
}
public int getCode() {
	return code;
}
public void setCode(int code) {
	this.code = code;
}

public Student(String email, String password, String name, String pno, String gender, String course, String ques,
		String ans, int semester, int code) {
	super();
	this.email = email;
	this.password = password;
	this.name = name;
	this.pno = pno;
	this.gender = gender;
	this.course = course;
	this.ques = ques;
	this.ans = ans;
	this.semester = semester;
	this.code = code;
}
public Student() {
	super();
}

}
