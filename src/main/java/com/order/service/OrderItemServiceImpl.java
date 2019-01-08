package com.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.order.entity.OrderItem;
import com.order.mapper.OrderItemMapper;
/**
 * 订单条目的增删改查业务类的实现类
 */
@Service("orderItemService")
public class OrderItemServiceImpl implements OrderItemService {

	@Resource
	private OrderItemMapper orderItemMapper;
	/**
	 * 添加订单条目
	 */
	@Override
	public void InsertOrderItem(OrderItem orderItem) {
		orderItemMapper.InsertOrderItem(orderItem);
	}
	/**
	 * 根据订单条目id删除订单条目
	 */
	@Override
	public void deleteOrderItem(Integer id) {
		orderItemMapper.deleteOrderItem(id);
	}
	/**
	 * 修改订单条目信息
	 */
	@Override
	public void updateOrderItem(OrderItem orderItem) {
		orderItemMapper.updateOrderItem(orderItem);
	}
	/**
	 * 根据id查询订单条目信息
	 */
	@Override
	public OrderItem getOrderItem(Integer id) {
		return orderItemMapper.getOrderItem(id);
	}
	/**
	 * 查询所有订单条目信息
	 */
	@Override
	public List<OrderItem> queryOrderItems() {
		return orderItemMapper.queryOrderItems();
	}

}
