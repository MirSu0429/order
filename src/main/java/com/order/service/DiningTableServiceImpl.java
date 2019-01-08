package com.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.order.entity.DiningTable;
import com.order.mapper.DiningTableMapper;
@Service("dtService")
public class DiningTableServiceImpl implements DiningTableService {
	
	@Resource
	private DiningTableMapper dtMapper;
	@Override
	public void insertDiningTable(DiningTable dTable) {
		dtMapper.insertDiningTable(dTable);
	}

	@Override
	public void updateDiningTable(DiningTable dTable) {
		dtMapper.updateDiningTable(dTable);
	}

	@Override
	public void deleteDiningTable(Integer[] ids) {
		dtMapper.deleteDiningTable(ids);
	}

	@Override
	public List<DiningTable> queryDiningTable() {
		return dtMapper.queryDiningTable();
	}

	@Override
	public List<DiningTable> queryDiningTableByState() {
		return dtMapper.queryDiningTableByState();
	}

	@Override
	public DiningTable getDiningTable(Integer id) {
		return dtMapper.getDiningTable(id);
	}

	@Override
	public void updateDiningTableState(Integer[] ids) {
		dtMapper.updateDiningTableState(ids);
	}

}
