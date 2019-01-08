package com.order.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.order.entity.Food;

public interface FoodService {
	/**
	 * 添加菜品
	 */
	public void  insertFood(Food food);
	/**
	 * 修改菜品信息
	 */
	public void  updateFood(Food food);
	/**
	 * 删除菜品
	 */
	public void  deleteFood(Integer[] ids);
	/**
	 * 查询全部菜品
	 */
	public List<Food> queryFood();
	/**
	 * 查询单个菜品
	 */
	public Food getFood(Integer id);
	/**
	 * 添加菜品图片
	 */
	public void insertOrUpdateFoodImage(MultipartFile file,Integer id) throws Exception;
}
