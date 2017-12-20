package com.service.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.User;
import com.bean.ShopAddress;
import com.mapper.UserMapper;
import com.service.UserService;


@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	//添加用户
	@Override
	public void addUser(User user) {
		userMapper.addUser(user);
	}

	//根据USER查找用户
	@Override
	public User selectUserByUser(User user) {
		User selectUser = userMapper.selectUserByUser(user);
		return selectUser;
	}
	
	//根据用户名查找用户
	@Override
	public User selectUserByName(String userName) {
		User user = userMapper.selectUserByName(userName);
		return user;
	}
	//修改用户信息
	@Override
	public void updateUserInfo(User user) {
		userMapper.updateUserInfo(user);
	}
	//根据用户id查找所有收获地址
	@Override
	public List<ShopAddress> selectAddressByUserId(int userId) {
		List<ShopAddress> shopAddressList = new ArrayList<ShopAddress>();
		shopAddressList = userMapper.selectAddressByUserId(userId);
		return shopAddressList;
	}
	//根据收货地址id查找收货地址
	@Override
	public ShopAddress selectAddressById(int addressId) {
		ShopAddress shopAddress = userMapper.selectAddressById(addressId);
		return shopAddress;
	}
	//修改收货地址
	@Override
	public void updateAddress(ShopAddress shopAddress) {
		userMapper.updateAddress(shopAddress);
	}
	//根据id删除收货地址
	@Override
	public void deleteAddressById(int id) {
		userMapper.deleteAddressById(id);
	}
	//添加收货地址
	@Override
	public void addShopAddress(ShopAddress shopAddress) {
		userMapper.addShopAddress(shopAddress);
	}
	//查找所有用户
	@Override
	public List<User> selectAllUser() {
		List<User> userList = new ArrayList<User>();
		userList = userMapper.selectAllUser();
		return userList;
	}

}
