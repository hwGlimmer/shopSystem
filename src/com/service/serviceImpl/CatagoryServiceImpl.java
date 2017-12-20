package com.service.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Catagory;
import com.bean.OneCatagory;
import com.mapper.CatagoryMapper;
import com.service.CatagoryService;

@Service("catagoryService")
public class CatagoryServiceImpl implements CatagoryService{
	
	@Autowired
	private CatagoryMapper catagoryMapper;
	
	//查找所有一级分类
	@Override
	public List<OneCatagory> selectAllOneCatagory() {
		List<OneCatagory> oneCatagory = new ArrayList<OneCatagory>();
		oneCatagory = catagoryMapper.selectAllOneCatagory();
		return oneCatagory;
	}
	
	//根据一级分类查找所有二级分类
	@Override
	public List<String> selectAllTwoCatagoryByOne(String oneCatagory) {
		List<String> twoCatagory = new ArrayList<String>();
		twoCatagory = catagoryMapper.selectAllTwoCatagoryByOne(oneCatagory);
		return twoCatagory;
	}
	//根据一级分类id查找一级分类
	@Override
	public String selectOneCatagoryById(int oneCatagoryId) {
		String oneCatagory = catagoryMapper.selectOneCatagoryById(oneCatagoryId);
		return oneCatagory;
	}
	//修改一级分类
	@Override
	public void updateOneCatagory(OneCatagory oneCatagory) {
		catagoryMapper.updateOneCatagory(oneCatagory);
	}
	//根据二级分类名字查找id
	@Override
	public int selectTwoCatagoryIdByname(String twoCatagoryName) {
		int twoCatagoryId = catagoryMapper.selectTwoCatagoryIdByname(twoCatagoryName);
		return twoCatagoryId;
	}
	//修改二级分类
	@Override
	public void updateTwoCatagory(Map<String, Object> map) {
		catagoryMapper.updateTwoCatagory(map);
	}
	//添加二级分类
	@Override
	public void addTwoCatagory(Map<String, Object> map) {
		catagoryMapper.addTwoCatagory(map);
	}
	//删除二级分类
	@Override
	public void deleteTwoCatagoryById(int twoCatagoryId) {
		catagoryMapper.deleteTwoCatagoryById(twoCatagoryId);
	}
	//添加一级分类
	@Override
	public void addOneCatagory(String oneCatagoryName) {
		catagoryMapper.addOneCatagory(oneCatagoryName);
	}
	//根据一级分类id删除一级分类
	@Override
	public void deleteOneCatagoryById(int oneCatagoryId) {
		catagoryMapper.deleteOneCatagoryById(oneCatagoryId);
	}
	//根据一级分类名字删除所属二级分类
	@Override
	public void deleteTwoCatagoryByOneCatagoryName(String oneCatagoryName) {
		catagoryMapper.deleteTwoCatagoryByOneCatagoryName(oneCatagoryName);
	}

	

}
