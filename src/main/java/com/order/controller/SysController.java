package com.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SysController {
	@RequestMapping("/showQueryEmp")
	public String  showQueryEmp(){
		return "emp/emp";
	}
	@RequestMapping("/showQueryFood")
	public String  showQueryFood(){
		return "food/food";
	}
	@RequestMapping("/showQueryCustomer")
	public String  showQueryCustomer(){
		return "customer/customer";
	}
	@RequestMapping("/openDiningTable")
	public String openDiningTable(){
		return "diningTable/diningTable";
	}
	@RequestMapping("/freeTable.html")
	public String freeTable(){
		return "diningTable/freeTable";
	}
}
