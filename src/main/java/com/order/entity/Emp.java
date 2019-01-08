package com.order.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Emp {
	private Integer id;
	private String empno;
	private String password;
	private String ename;
	private Integer age;
	private String sex;
	private String mobile;
	private String address;
	
	private Integer plevel;
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT")
	private Date hiredate;
	
	private Image image;
	
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Integer getPlevel() {
		return plevel;
	}
	public void setPlevel(Integer plevel) {
		this.plevel = plevel;
	}
	public Image getImage() {
		return image;
	}
	public void setImage(Image image) {
		this.image = image;
	}
	
}
