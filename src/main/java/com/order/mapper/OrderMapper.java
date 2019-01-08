package com.order.mapper;

import java.util.List;

import com.order.entity.Order;
/**
 * 订单的增删改查功能
 */
public interface OrderMapper {

	/**
	 * 添加订单
	 */
	public void InsertOrder(Order order);
	/**
	 * 根据订单id删除订单
	 */
	public void deleteOrder(Integer id);
	/**
	 * 修改订单信息
	 */
	public void updateOrder(Order order);
	/**
	 * 根据id查询订单信息
	 */
	public Order getOrder(Integer id);
	/**
	 * 查询所有订单信息
	 */
	public List<Order> queryOrders();
}
