package com.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Manager;
import com.mapper.ManagerMapper;
import com.service.ManagerService;


@Service("managerService")
public class ManagerServiceImpl implements ManagerService{
	@Autowired
	private ManagerMapper managerMapper;
	//查找管理员
	@Override
	public Manager selectManager(Manager manager) {
		Manager selectedManager = managerMapper.selectManager(manager);
		return selectedManager;
	}

}
