package com.order.service;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.order.entity.Image;
import com.order.mapper.ImageMapper;
import com.order.util.DateUtil;
@Service("imageService")
public class ImageServiceImpl implements ImageService {
	
	@Resource
	private ImageMapper imageMapper;
	@Override
	public int uploadIamge(MultipartFile file) throws Exception {
		String targetPath = "d:\\upload";
		File target = new File(targetPath);
		if(!target.exists()){
			target.mkdirs();
		}
		target.setWritable(true);
		//原文件名
		String name = file.getOriginalFilename();
		//文件大小  单位:kb
		String size = file.getSize()/1024+"kb";
		// 文件类型  后缀名
		String type = name.substring(name.lastIndexOf(".")+1);
		//新文件名
		String newName = UUID.randomUUID().toString().replace("-", "")+"."+type;
		//根目录
		Date today = new Date();
		String datePath = DateUtil.dateToString(today, "yyyy") + File.separator + 
							DateUtil.dateToString(today, "MM") + File.separator + 
							DateUtil.dateToString(today, "dd");
		String path =  File.separator + datePath + File.separator + newName;
		System.out.println(targetPath + File.separator + path);
		//创建保持上传文件的File对象
		File destFile = new File(targetPath + File.separator + path);
		//调用MultipartFile对象中复制文件的方法，将上传文件传输指定的位置
		if(!destFile.exists()){
			destFile.mkdirs();
		}
		destFile.setWritable(true);
		file.transferTo(destFile);
		Image img = new Image();
		img.setName(name);
		img.setImgPath(path);
		img.setImgType(type);
		img.setImgSize(size);
		imageMapper.insertImage(img);
		return img.getId();
	}

}
