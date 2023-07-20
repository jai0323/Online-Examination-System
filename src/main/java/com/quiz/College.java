package com.quiz;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="college")
@Table(name="college")
public class College {
	@Id
	String email;
	String name,city,state,pwd;
	int code;
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public College() {
		
	}

	public College(String email, String name, String city, String state, String pwd, int code) {
		super();
		this.email = email;
		this.name = name;
		this.city = city;
		this.state = state;
		this.pwd = pwd;
		this.code = code;
	}
	
	

}
