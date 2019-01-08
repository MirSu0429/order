package com.order.entity;

public class Customer {

	private Integer id;
	private String name;
	private String sex;
	private String mobile;
	private Integer eatCount;
	private Integer expendMoney;
	private Integer vipState;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Integer getEatCount() {
		return eatCount;
	}
	public void setEatCount(Integer eatCount) {
		this.eatCount = eatCount;
	}
	public Integer getExpendMoney() {
		return expendMoney;
	}
	public void setExpendMoney(Integer expendMoney) {
		this.expendMoney = expendMoney;
	}
	public Integer getVipState() {
		return vipState;
	}
	public void setVipState(Integer vipState) {
		this.vipState = vipState;
	}
	
}
