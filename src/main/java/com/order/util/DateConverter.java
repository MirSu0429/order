package com.order.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * 日期类型转换器
 * 作用：将请求中的字符串转换为日期类型
 * 需要实现Converter接口
 */
public class DateConverter implements Converter<String, Date>{

	private String partten;
	public DateConverter(String partten){
		this.partten = partten;
	}
	/**
	 * 类型转换的方法
	 * 参数为待转换数据
	 * 返回值为转换之后的数据
	 */
	@Override
	public Date convert(String arg0) {
		if(partten == null)
			partten = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(partten);
		try {
			return sdf.parse(arg0);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

}
