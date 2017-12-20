package com.service;

import com.bean.Manager;

public interface ManagerService {
	//根据manager类查找管理员
	public Manager selectManager(Manager manager);
}
