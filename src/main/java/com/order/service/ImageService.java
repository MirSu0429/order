package com.order.service;

import org.springframework.web.multipart.MultipartFile;

public interface ImageService {
	/**
	 * 上传图片 并返回其id
	 */
	public int uploadIamge(MultipartFile file) throws Exception;
}
