package com.order.util;

import java.util.HashMap;
import java.util.Map;

import com.github.pagehelper.PageInfo;

public class QueryUtil {
	public static <T> Map<String,Object> getMap(PageInfo<T> info){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", info.getTotal());
		map.put("rows", info.getList());
		return  map;
	}
}
