package com.order.service;

import java.util.List;

import com.order.entity.OrderItem;

/**
 * 订单条目的增删改查业务类
 */
public interface OrderItemService {

	/**
	 * 添加订单条目
	 */
	public void InsertOrderItem(OrderItem orderItem);
	/**
	 * 根据订单条目id删除订单条目
	 */
	public void deleteOrderItem(Integer id);
	/**
	 * 修改订单条目信息
	 */
	public void updateOrderItem(OrderItem orderItem);
	/**
	 * 根据id查询订单条目信息
	 */
	public OrderItem getOrderItem(Integer id);
	/**
	 * 查询所有订单条目信息
	 */
	public List<OrderItem> queryOrderItems();
}
