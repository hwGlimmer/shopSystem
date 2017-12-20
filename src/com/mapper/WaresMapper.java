package com.mapper;
import java.util.List;

import java.util.Map;

/**
 * 商品mapper层
 */
import com.bean.Wares;

public interface WaresMapper {
	public void deleteByPrimaryKey(Integer wId);
	public void insert(Wares record);
	public void insertSelective(Wares record);

	//模糊搜索框，模糊查询 
	public  List<Wares> selectSearch(String wName);
	//查询所有商品，product.jsp展示需要（8个换页）
	public  List<Wares> selectWaresAll(Map<String, Object> param);
    //查询商品（index.jsp 推荐商品(价格高的为推荐))
	public  List<Wares> selectWaresTj();
	//查询商品（index.jsp 推荐商品(价格低的为促销))
	public  List<Wares> selectWaresCX();
	//根据二级分类名查询商品（index.jsp 根据楼层F显示那里需要用)
	public  List<Wares> selectWaresByT(String twoName);
	//获取所有商品总数(product.jsp分页时需要用到)
	public Integer getCount(Map<String, Object> param);

	public void updateByPrimaryKeySelective(Wares record);
	public void updateByPrimaryKey(Wares record);
	//根据名字分页查找商品
	public List<Wares> selectWaresByNameAndPage(Map<String, Object> map);
	//根据商品名字动态查找数量
	public int selectAllCount(String waresName);
	//根据商品id查询商品
	public Wares selectWaresById(int wId);
	//修改商品
	public void updateWares(Wares wares);
	//添加商品
	public void addWares(Wares wares);
	//删除商品
	public void deleteWares(int wId);
	//无条件查询所有商品
	public List<Wares> selectAllWaresByNo();
	
}