package com.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.order.entity.Customer;
import com.order.mapper.CustomerMapper;
/**
 * 客户的增删改查操作业务类的实现类
 */
@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Resource
	private CustomerMapper customerMapper;
	/**
	 * 添加客户
	 */
	@Override
	public void InsertCustomer(Customer cust) {
		customerMapper.InsertCustomer(cust);
	}
	/**
	 * 根据客户id删除客户
	 */
	@Override
	public void deleteCustomer(Integer id) {
		customerMapper.deleteCustomer(id);
	}
	/**
	 * 修改客户信息
	 */
	@Override
	public void updateCustomer(Customer cust) {
		customerMapper.updateCustomer(cust);
	}
	/**
	 * 根据id查询客户信息
	 */
	@Override
	public Customer getCustomer(Integer id) {
		return customerMapper.getCustomer(id);
	}
	/**
	 * 查询所有客户信息
	 */
	@Override
	public List<Customer> queryCustomers() {
		return customerMapper.queryCustomers();
	}

}
