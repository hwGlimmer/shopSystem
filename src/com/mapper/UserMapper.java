package com.mapper;

import java.util.List;

import com.bean.User;
import com.bean.ShopAddress;

/**
 * 
 * @author daijinchi
 *	2017-12-14
 */
public interface UserMapper {
	//添加用户
	public void addUser(User user);
	//根据User查找用户
	public User selectUserByUser(User user);
	//根据用户名查找用户
	public User selectUserByName(String userName);
	//修改用户信息
	public void updateUserInfo(User user);
	//根据用户id查找所有收货地址
	public List<ShopAddress> selectAddressByUserId(int userId);
	//根据收货地址id查找收货地址
	public ShopAddress selectAddressById(int addressId);
	//修改收货地址
	public void updateAddress(ShopAddress shopAddress);
	//根据id删除收货地址
	public void deleteAddressById(int id);
	//添加收货地址
	public void addShopAddress(ShopAddress shopAddress);
	//查找所有用户
	public List<User> selectAllUser();
}
