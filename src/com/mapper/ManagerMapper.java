package com.mapper;

import com.bean.Manager;

public interface ManagerMapper {
	//根据manager类查找管理员
	public Manager selectManager(Manager manager);
}
