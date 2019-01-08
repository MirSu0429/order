package com.order.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.order.entity.DiningTable;
import com.order.service.DiningTableService;

@RestController
public class DiningTableController {
	
	@Resource
	private DiningTableService dtService;
	/**
	 * 查询 全部 餐桌
	 */
	@GetMapping("/queryDiningTable")
	public Map<String,Object> queryDiningTable(@RequestParam("page")Integer page,@RequestParam("rows")Integer pageSize){
		PageHelper.startPage(page, 10);
		PageInfo<DiningTable> info = new PageInfo<DiningTable>(dtService.queryDiningTable());
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", info.getTotal());
		map.put("rows", info.getList());
		return map;
	}
	/**
	 * 查询全部空闲餐桌
	 */
	@GetMapping("/queryDiningTableByState")
	public Map<String,Object> queryDiningTableByState(@RequestParam("page")Integer page,@RequestParam("rows")Integer pageSize){
		PageHelper.startPage(page, 5);
		PageInfo<DiningTable> info = new PageInfo<DiningTable>(dtService.queryDiningTableByState());
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", info.getTotal());
		map.put("rows", info.getList());
		return map;
	}
	/**
	 * 新增餐桌
	 */
	@PostMapping("/insertDiningTable")
	public void insertDiningTable(DiningTable dtable){
		dtService.insertDiningTable(dtable);
	}
	/**
	 * 修改餐桌
	 */
	@PostMapping("/updateDiningTable")
	public void updateDiningTable(DiningTable dtable){
		dtService.updateDiningTable(dtable);
	}
	/**
	 * 删除餐桌
	 */
	@PostMapping("/deleteDiningTable")
	public void deleteDiningTable(@RequestParam("ids[]")Integer[] ids){
		dtService.deleteDiningTable(ids);
	}
	/**
	 * 修改餐桌状态
	 */
	@PostMapping("/updateDiningTableState")
	public void updateDiningTableState(@RequestParam("ids[]")Integer[] ids){
		dtService.updateDiningTableState(ids);
	}
}
