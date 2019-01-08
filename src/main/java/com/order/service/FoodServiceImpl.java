package com.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.order.entity.Food;
import com.order.mapper.FoodMapper;
@Service("foodService")
public class FoodServiceImpl implements FoodService {

	
	@Resource
	private FoodMapper foodMapper;
	@Resource
	private ImageService imageService;
	@Override
	public void insertFood(Food food) {
		foodMapper.insertFood(food);
	}

	@Override
	public void updateFood(Food food) {
		foodMapper.updateFood(food);
	}

	@Override
	public void deleteFood(Integer[] ids) {
		foodMapper.deleteFood(ids);
	}

	@Override
	public List<Food> queryFood() {
		return foodMapper.queryFood();
	}

	@Override
	public Food getFood(Integer id) {
		return foodMapper.getFood(id);
	}

	@Override
	public void insertOrUpdateFoodImage(MultipartFile file, Integer id) throws Exception {
		int imageId = imageService.uploadIamge(file);
		foodMapper.updateFoodImageid(id, imageId);
	}

}
