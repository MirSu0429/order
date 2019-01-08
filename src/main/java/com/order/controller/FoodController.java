package com.order.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.order.entity.Food;
import com.order.service.FoodService;
import com.order.util.QueryUtil;

@Controller
@ResponseBody
public class FoodController {
	
	@Resource
	private FoodService foodService;
	/**
	 * 查询全部菜品信息
	 */
	@GetMapping("/queryFood")
	public  Map<String,Object> queryFood(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam("rows") Integer pageSize){
		PageHelper.startPage(page, pageSize);
		PageInfo<Food> info = new PageInfo<Food>(foodService.queryFood());
		return QueryUtil.getMap(info);
	}
	
	/**
	 * 新增菜品
	 */
	@PostMapping("/insertFood")
	public String insertFood(Food food){
		foodService.insertFood(food);
		return " insert success!";
	}
	/**
	 * 新增或者修改从菜品图片
	 * 异步
	 */
	@RequestMapping(value="/insertOrUpdateFoodImage",method=RequestMethod.POST)
	public String insertOrUpdateFoodImage(MultipartFile file, HttpServletRequest req) throws Exception{
		String id =req.getParameter("id");
		foodService.insertOrUpdateFoodImage(file, Integer.parseInt(id));
		return "";
	}
	/**
	 * 修改
	 */
	@PutMapping("/updateFood")
	public String updateFood(Food food){
		foodService.updateFood(food);
		return "update success!";
	}
	/**
	 * 删除菜品
	 */
	@DeleteMapping("/deleteFood")
	public String deleteFood(@RequestParam("ids[]")Integer[] ids ){
		foodService.deleteFood(ids);
		return "delete success!";
	}
}
