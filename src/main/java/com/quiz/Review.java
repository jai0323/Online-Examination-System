package com.quiz;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="reviews")
@Table(name="reviews")
public class Review {
	@Id
	 int rid;
	 String review,resp,email,subject;
	 int testId,rate,code;
	 
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
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getResp() {
		return resp;
	}
	public void setResp(String resp) {
		this.resp = resp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTestId() {
		return testId;
	}
	public void setTestId(int testId) {
		this.testId = testId;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public Review(int rid, String review, String resp, String email, int testId, int rate, int code) {
		super();
		this.rid = rid;
		this.review = review;
		this.resp = resp;
		this.email = email;
		this.testId = testId;
		this.rate = rate;
		this.code = code;
	}
	public Review(String review, String resp, String email, int testId, int rate, int code) {
		super();
		this.review = review;
		this.resp = resp;
		this.email = email;
		this.testId = testId;
		this.rate = rate;
		this.code = code;
	}
	public Review(String review, String email, int testId, int rate, int code) {
		super();
		this.review = review;
		this.email = email;
		this.testId = testId;
		this.rate = rate;
		this.code = code;
	}
	public Review() {
		super();
	}
	public Review(String review, String resp, String email, String subject, int testId, int rate, int code) {
		super();
		this.review = review;
		this.resp = resp;
		this.email = email;
		this.subject = subject;
		this.testId = testId;
		this.rate = rate;
		this.code = code;
	}
	
	
	 
}
