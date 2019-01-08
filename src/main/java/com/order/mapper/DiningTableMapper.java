package com.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.order.entity.DiningTable;

public interface DiningTableMapper {
	/**
	 * 添加餐桌
	 */
	public void  insertDiningTable(DiningTable dTable);
	/**
	 * 修改餐桌信息
	 */
	public void  updateDiningTable(DiningTable dTable);
	/**
	 * 删除餐桌
	 */
	public void  deleteDiningTable(@Param("ids")Integer[] ids);
	/**
	 * 查询全部餐桌
	 */
	public List<DiningTable> queryDiningTable();
	/**
	 * 查询全部空闲餐桌
	 */
	public List<DiningTable> queryDiningTableByState();
	/**
	 * 查询单个餐桌
	 */
	public DiningTable getDiningTable(Integer id);
	/**
	 * 修改餐桌状态
	 */
	public void updateDiningTableState(@Param("ids")Integer[] ids);
}
