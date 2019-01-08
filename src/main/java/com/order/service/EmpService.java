package com.order.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.order.entity.Emp;

public interface EmpService {
	/**
	 * 添加员工
	 */
	public void  insertEmp(Emp emp);
	/**
	 * 添加或者修改 员工头像
	 */
	public void insertOrUpdateEmpImage(MultipartFile file,Integer id) throws Exception;
	/**
	 * 修改员工信息
	 */
	public void  updateEmp(Emp emp);
	/**
	 * 删除员工
	 */
	public void  deleteEmp(Integer[] ids,Integer myId);
	/**
	 * 查询全部员工
	 */
	public List<Emp> queryEmp();
	/**
	 * 查询单个员工
	 */
	public Emp getEmp(Integer id);
	/**
	 * 员工登录
	 */
	public Emp Login(String empno,String password);
}
