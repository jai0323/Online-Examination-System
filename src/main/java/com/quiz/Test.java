package com.quiz;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="test")
@Table(name="test")
public class Test {
    @Id 
	int testId;
	String name,subject;
	int code;
	public int getTestId() {
		return testId;
	}
	public void setTestId(int testId) {
		this.testId = testId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public Test(int testId, String name, String subject, int code) {
		super();
		this.testId = testId;
		this.name = name;
		this.subject = subject;
		this.code = code;
	}
	
	public Test(String name, String subject, int code) {
		super();
		this.name = name;
		this.subject = subject;
		this.code = code;
	}
	public Test() {
		super();
	}
	
}
