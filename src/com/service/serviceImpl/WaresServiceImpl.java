package com.service.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Wares;
import com.mapper.UserMapper;
import com.mapper.WaresMapper;
import com.service.WaresService;
/**
 * 商品service实现层
 * @author Glimmer
 *
 */
@Service("waresService")
public class WaresServiceImpl implements WaresService {
	@Autowired
	private WaresMapper waresMapper;
	
	//获取总页数，分页需要
	@Override
	public Integer getTotalPage(Map<String, Object> param) {
		// TODO Auto-generated method stub
		
		Integer count = waresMapper.getCount(param);
		
		Integer pageSize = Integer.parseInt(param.get("pageSize").toString());
		
		Integer totalPage = ((count % pageSize) == 0) ? (count / pageSize) : (count / pageSize + 1);
		
		return totalPage;
	}
	
	//查询所有商品，product.jsp展示需要
	@Override
	public List<Wares> selectWaresAll(Map<String,Object> param) {
		// TODO Auto-generated method stub
		
		Integer curPage = Integer.parseInt(param.get("curPage").toString()) ;
		Integer pageSize = Integer.parseInt(param.get("pageSize").toString()) ;
 		
		Integer statrPos = (curPage - 1) * pageSize;
		param.put("startPos", statrPos);
		param.put("pageSize", pageSize);
		
		return waresMapper.selectWaresAll(param);
	}

	//查询商品（index.jsp 推荐商品,价格高的为推荐）
	@Override
	public List<Wares> selectWaresTj() {
		// TODO Auto-generated method stub
		return waresMapper.selectWaresTj();
	}
	
	//查询商品（index.jsp 推荐商品,价格低的为促销）
	@Override
	public List<Wares> selectWaresCX() {
		// TODO Auto-generated method stub
		return waresMapper.selectWaresCX();
	}
	
	//根据二级分类名查询商品（index.jsp 根据楼层F显示那里需要用)
	@Override
	public List<Wares> selectWaresByT(String twoName) {
		// TODO Auto-generated method stub
		return waresMapper.selectWaresByT(twoName);
	}

	//根据名字分页查找商品
	@Override
	public List<Wares> selectWaresByNameAndPage(Map<String, Object> map) {
		List<Wares> waresList = new ArrayList<Wares>();
		waresList = waresMapper.selectWaresByNameAndPage(map);
		return waresList;
	}
	//根据商品名字动态查找数量
	@Override
	public int selectAllCount(String waresName) {
		int count = waresMapper.selectAllCount(waresName);
		return count;
	}
	//根据商品id查询商品
	@Override
	public Wares selectWaresById(int wId) {
		Wares wares = waresMapper.selectWaresById(wId);
		return wares;
	}
	//修改商品
	@Override
	public void updateWares(Wares wares) {
		waresMapper.updateWares(wares);
	}
	//添加商品
	@Override
	public void addWares(Wares wares) {
		waresMapper.addWares(wares);
	}
	//删除商品
	@Override
	public void deleteWares(int wId) {
		waresMapper.deleteWares(wId);
	}
	//模糊搜索
	@Override
	public List<Wares> selectSearch(String wName) {
		// TODO Auto-generated method stub
		return waresMapper.selectSearch(wName);
	}

	@Override
	public Integer getCount(Map<String, Object> param) {
		return waresMapper.getCount(param);
	}
	//无条件查询所有商品
	@Override
	public List<Wares> selectAllWaresByNo() {
		return waresMapper.selectAllWaresByNo();
	}

}
