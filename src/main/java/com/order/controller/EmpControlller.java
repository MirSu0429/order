package com.order.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.order.entity.Emp;
import com.order.service.EmpService;
import com.order.util.QueryUtil;

@Controller
@ResponseBody
public class EmpControlller {
	@Resource
	private EmpService empService;
	/**
	 * 登录
	 */
	@RequestMapping(value="/loginEmp",method=RequestMethod.GET)
	public String loginEmp(@RequestParam("empno")String empno,@RequestParam("password")String password,HttpSession httpSession){
		Emp emp = empService.Login(empno, password);
		if(emp!=null){
			httpSession.setAttribute("loginEmp", emp);
			return "";
		}
		return "";
	}
	/**
	 * 登出
	 */
	@RequestMapping(value="/logoutEmp",method=RequestMethod.GET)
	public String logoutEmp(HttpSession httpSession){
		httpSession.removeAttribute("loginEmp");
		httpSession.invalidate();
		return "";
	}
	/**
	 * 查询全部员工信息
	 */
	@GetMapping("/queryEmp")
	public Map<String,Object> queryEmp(@RequestParam("page") Integer page,@RequestParam("rows") Integer pageSize){
		PageHelper.startPage(page, pageSize);
		PageInfo<Emp> info = new PageInfo<Emp>(empService.queryEmp());
		return  QueryUtil.getMap(info);
	}
	/**
	 * 新增
	 */
	@PostMapping("/insertEmp")
	public String insertEmp(Emp emp){
		empService.insertEmp(emp);
		return "Insert Success!";
	}
	/**
	 * 添加或者修改员工头像
	 */
	@RequestMapping(value="/insertOrUpdateEmpImage",method=RequestMethod.POST)
	public String insertOrUpdateEmpImage(MultipartFile file,HttpServletRequest req) throws Exception{
		String id =req.getParameter("id");
		empService.insertOrUpdateEmpImage(file, Integer.parseInt(id));
		return "success!";
	}
	
	/**
	 * 修改
	 */
	@PutMapping("/updateEmp")
	public String updateEmp(Emp emp){
		empService.updateEmp(emp);
		return "update success!";
	}
	/**
	 * 删除
	 */
	@DeleteMapping("/deleteEmp")
	public String deleteEmp(@RequestParam("ids[]")Integer ids[]){
		empService.deleteEmp(ids,1);
		return "delete success!";
	}
}
