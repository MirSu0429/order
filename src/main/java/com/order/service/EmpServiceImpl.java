package com.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.order.entity.Emp;
import com.order.mapper.EmpMapper;
@Service("empService")
public class EmpServiceImpl implements EmpService {
	
	@Resource
	private EmpMapper empMapper;
	@Resource
	private ImageService imageService;
	@Override
	public void insertEmp(Emp emp) {
		empMapper.insertEmp(emp);
	}

	@Override
	public void updateEmp(Emp emp) {
		empMapper.updateEmp(emp);
	}

	@Override
	public void deleteEmp(Integer[] ids,Integer myId) {
		empMapper.deleteEmp(ids,myId);
	}

	@Override
	public List<Emp> queryEmp() {
		return empMapper.queryEmp();
	}

	@Override
	public Emp getEmp(Integer id) {
		return empMapper.getEmp(id);
	}

	@Override
	public void insertOrUpdateEmpImage(MultipartFile file, Integer id) throws Exception {
		int imageId = imageService.uploadIamge(file);
		empMapper.updateEmpImageid(id, imageId);
	}

	@Override
	public Emp Login(String empno, String password) {
		return empMapper.Login(empno, password);
	}

}
