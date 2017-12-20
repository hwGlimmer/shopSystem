package com.service;

import java.util.List;
import java.util.Map;

import com.bean.Catagory;
import com.bean.OneCatagory;

public interface CatagoryService {
	//查找所有一级分类
	public List<OneCatagory> selectAllOneCatagory();
	//根据一级分类查找所有二级分类
	public List<String> selectAllTwoCatagoryByOne(String oneCatagory);
	//根据一级分类id查找一级分类
	public String selectOneCatagoryById(int oneCatagoryId);
	//修改一级分类
	public void updateOneCatagory(OneCatagory oneCatagory);
	//根据二级分类名字查找id
	public int selectTwoCatagoryIdByname(String twoCatagoryName);
	//修改二级分类
	public void updateTwoCatagory(Map<String,Object> map);
	//添加二级分类
	public void addTwoCatagory(Map<String, Object> map);
	//删除二级分类
	public void deleteTwoCatagoryById(int twoCatagoryId);
	//添加一级分类
	public void addOneCatagory(String oneCatagoryName);
	//根据id删除一级分类
	public void deleteOneCatagoryById(int oneCatagoryId);
	//根据一级分类名字删除所属二级分类
	public void deleteTwoCatagoryByOneCatagoryName(String oneCatagoryName);
}
