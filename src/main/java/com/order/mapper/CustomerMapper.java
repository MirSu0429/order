package com.order.mapper;

import java.util.List;

import com.order.entity.Customer;
/**
 * 客户的增删改查操作类
 */
public interface CustomerMapper {

	/**
	 * 添加客户
	 */
	public void InsertCustomer(Customer cust);
	/**
	 * 根据客户id删除客户
	 */
	public void deleteCustomer(Integer id);
	/**
	 * 修改客户信息
	 */
	public void updateCustomer(Customer cust);
	/**
	 * 根据id查询客户信息
	 */
	public Customer getCustomer(Integer id);
	/**
	 * 查询所有客户信息
	 */
	public List<Customer> queryCustomers();
}
