package com.quiz;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity(name="results")
@Table(name="results")
public class Results {
	@Id
	int rid;
	int testId,score,marks;
	String email,subject;
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getTestId() {
		return testId;
	}
	public void setTestId(int testId) {
		this.testId = testId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getMarks() {
		return marks;
	}
	public void setMarks(int marks) {
		this.marks = marks;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public Results(int testId, int score, int marks, String email, String subject) {
		super();
		this.testId = testId;
		this.score = score;
		this.marks = marks;
		this.email = email;
		this.subject = subject;
	}
	public Results(int testId, int score, int marks, String email) {
		super();
		this.testId = testId;
		this.score = score;
		this.marks = marks;
		this.email = email;
	}
	public Results() {
		super();
	}
	public Results(int rid, int testId, int score, int marks, String email, String subject) {
		super();
		this.rid = rid;
		this.testId = testId;
		this.score = score;
		this.marks = marks;
		this.email = email;
		this.subject = subject;
	}
	

}
