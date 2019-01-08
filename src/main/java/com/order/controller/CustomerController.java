package com.order.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.order.entity.Customer;
import com.order.service.CustomerService;
import com.order.util.QueryUtil;

@Controller
@ResponseBody
public class CustomerController {

	@Resource
	private CustomerService customerService;
	
	
	@GetMapping("/queryCustomer")
	public Map<String,Object> queryCustomers(@RequestParam(value="page")Integer page,@RequestParam("rows") Integer pageSize){
		PageHelper.startPage(page, pageSize);
		PageInfo<Customer> info=new PageInfo<Customer>(customerService.queryCustomers());
		return QueryUtil.getMap(info);
	}
	@RequestMapping(value="/insertCustomer",method=RequestMethod.POST)
	public String insertCustomer(Customer cust){
		customerService.InsertCustomer(cust);
		return "insert success!";
	}
	@RequestMapping(value="/deleteCustomer",method=RequestMethod.DELETE)
	public String deleteCustomer(@RequestParam("ids[]")Integer ids[]){
		customerService.deleteCustomer(ids[0]);
		return "delete success!";
	}
	@RequestMapping(value="/updateCustomer",method=RequestMethod.PUT)
	public String updateCustomer(Customer cust){
		customerService.updateCustomer(cust);
		return "update success!";
	}
}
