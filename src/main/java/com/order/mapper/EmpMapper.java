package com.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.order.entity.Emp;

public interface EmpMapper {
	/**
	 * 添加员工
	 */
	public void  insertEmp(Emp emp);
	/**
	 * 添加或者修改员工头像
	 */
	public void updateEmpImageid(@Param("id")Integer id,@Param("imageId")Integer imageId);
	/**
	 * 修改员工信息
	 */
	public void  updateEmp(Emp emp);
	/**
	 * 删除员工
	 */
	public void  deleteEmp(@Param("ids")Integer[] ids,@Param("myId")Integer myId);
	/**
	 * 查询全部员工
	 */
	public List<Emp> queryEmp();
	/**
	 * 查询单个员工
	 */
	public Emp getEmp(Integer id);
	/**
	 * 登录
	 */
	public Emp Login(@Param("empno")String empno,@Param("password")String password);
}
