package com.quiz;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="questions")
@Table(name="questions")
public class Question {
	@Id
	int qid;
  String question,op1,op2,op3,op4,answer;
  int testId;
public int getTestId() {
	return testId;
}
public void setTestId(int testId) {
	this.testId = testId;
}
public String getQuestion() {
	return question;
}
public void setQuestion(String question) {
	this.question = question;
}
public String getOp1() {
	return op1;
}
public void setOp1(String op1) {
	this.op1 = op1;
}
public String getOp2() {
	return op2;
}
public void setOp2(String op2) {
	this.op2 = op2;
}
public String getOp3() {
	return op3;
}
public void setOp3(String op3) {
	this.op3 = op3;
}
public String getOp4() {
	return op4;
}
public void setOp4(String op4) {
	this.op4 = op4;
}
public int getQid() {
	return qid;
}
public void setQid(int qid) {
	this.qid = qid;
}
public String getAnswer() {
	return answer;
}
public void setAnswer(String answer) {
	this.answer = answer;
}


public Question(int qid, String question, String op1, String op2, String op3, String op4, String answer, int testId) {
	super();
	this.qid = qid;
	this.question = question;
	this.op1 = op1;
	this.op2 = op2;
	this.op3 = op3;
	this.op4 = op4;
	this.answer = answer;
	this.testId = testId;
}
public Question(String question, String op1, String op2, String op3, String op4, String answer, int testId) {
	super();
	this.question = question;
	this.op1 = op1;
	this.op2 = op2;
	this.op3 = op3;
	this.op4 = op4;
	this.answer = answer;
	this.testId = testId;
}
public Question() {
	
}
  
}
