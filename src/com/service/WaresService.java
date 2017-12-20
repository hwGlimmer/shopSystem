package com.service;

import java.util.List;
import java.util.Map;

import com.bean.Wares;

/**
 * 商品service接口
 * @author Glimmer
 *
 */
public interface WaresService {
	// 获取总页数，分页需要
	public Integer getTotalPage(Map<String, Object> param);
	//获取所有商品总数(product.jsp分页时需要用到)
	public Integer getCount(Map<String, Object> param);

	// 查询所有商品，product.jsp展示需要（8个换页）
	public List<Wares> selectWaresAll(Map<String, Object> param);

	// 查询商品（index.jsp 推荐商品，价格高的为推荐，显示前4条）
	public List<Wares> selectWaresTj();

	// 查询商品（index.jsp 促销商品，价格低的为促销，显示前4条）
	public List<Wares> selectWaresCX();

	// 根据二级分类名查询商品（index.jsp 根据楼层F显示那里需要用)
	public List<Wares> selectWaresByT(String twoName);

	// 根据名字分页查找商品
	public List<Wares> selectWaresByNameAndPage(Map<String, Object> map);

	// 根据商品名字动态查找数量
	public int selectAllCount(String waresName);

	// 根据商品id查询商品
	public Wares selectWaresById(int wId);

	// 修改商品
	public void updateWares(Wares wares);

	// 添加商品
	public void addWares(Wares wares);

	// 删除商品
	public void deleteWares(int wId);
	//模糊搜索框，模糊查询 
	public  List<Wares> selectSearch(String wName);
	//无条件查询所有商品
	public List<Wares> selectAllWaresByNo();
	 
}
