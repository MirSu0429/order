package com.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.order.entity.Order;
import com.order.mapper.OrderMapper;
/**
 * 订单的增删改查业务类的实现类
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Resource
	private OrderMapper orderMapper;
	/**
	 * 添加订单
	 */
	@Override
	public void InsertOrder(Order order) {
		orderMapper.InsertOrder(order);
	}
	/**
	 * 根据订单id删除订单
	 */
	@Override
	public void deleteOrder(Integer id) {
		orderMapper.deleteOrder(id);
	}
	/**
	 * 修改订单信息
	 */
	@Override
	public void updateOrder(Order order) {
		orderMapper.updateOrder(order);
	}
	/**
	 * 根据id查询订单信息
	 */
	@Override
	public Order getOrder(Integer id) {
		return orderMapper.getOrder(id);
	}
	/**
	 * 查询所有订单信息
	 */
	@Override
	public List<Order> queryOrders() {
		return orderMapper.queryOrders();
	}

}
