package com.order.entity;

public class OrderItem {

	private Integer id;
	private Double foodCount;
	private Double foodPrice;
	private String foodName;
	private String state;
	private Food food;
	private DiningTable table;
	private Customer customer;
	private Order order;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Double getFoodCount() {
		return foodCount;
	}
	public void setFoodCount(Double foodCount) {
		this.foodCount = foodCount;
	}
	public Double getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(Double foodPrice) {
		this.foodPrice = foodPrice;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	public DiningTable getTable() {
		return table;
	}
	public void setTable(DiningTable table) {
		this.table = table;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
}
