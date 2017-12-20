package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.User;
import com.bean.ShopAddress;
import com.bean.Wares;
import com.service.UserService;
import com.service.WaresService;
import com.util.MD5Util;
import com.util.VerifyCodeUtils;


@RequestMapping("/userController")
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private WaresService waresService;
	
	//注册验证码获取
	@RequestMapping("/regGetVerifyImg")
	public String regGetVerifyImg(HttpServletRequest request,Model model) throws IOException{   
		//生成随机字串
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
		model.addAttribute("verifyCode", verifyCode);
		//获取验证码图片存储路径
		String savePath = request.getSession().getServletContext().getRealPath("/")
				+ "/codeImg/";
		//生成图片  
		VerifyCodeUtils.newImg(verifyCode, savePath);
		//图片路径
		String codeImgPath = "codeImg/"+verifyCode+".jpg";
		model.addAttribute("codeImgPath", codeImgPath);
		return "reg";
	 }
	//登录验证码获取
	@RequestMapping("/loginGetVerifyImg")
	public String loginGetVerifyImg(HttpServletRequest request,Model model) throws IOException{   
		//生成随机字串
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
		model.addAttribute("verifyCode", verifyCode);
		//获取验证码图片存储路径
		String savePath = request.getSession().getServletContext().getRealPath("/")
				+ "/codeImg/";
		//生成图片  
		VerifyCodeUtils.newImg(verifyCode, savePath);
		//图片路径
		String codeImgPath = "codeImg/"+verifyCode+".jpg";
		model.addAttribute("codeImgPath", codeImgPath);
		return "login";
	 }	
	 //添加用户
	 @RequestMapping("/addUser")
	 public String addUser(HttpServletRequest request,User user,Model model){
		 User existUser = userService.selectUserByName(user.getUserName());
		 if (existUser != null){
			 model.addAttribute("error","用户名已存在");
			 return "reg";
		 }else{
			 String md5Pwd = MD5Util.MD5Encode(user.getUserPwd());
			 user.setUserPwd(md5Pwd);
			 userService.addUser(user);
			 return "redirect:/jspChange/indexJsp";
		 }
	 }
	 //用户登录
	 @RequestMapping("/userLogin")
	 public String userLogin(User user,Model model,HttpServletRequest request){
		 String md5Pwd = MD5Util.MD5Encode(user.getUserPwd());
		 user.setUserPwd(md5Pwd);
		 User selectedUser = userService.selectUserByUser(user);
		 if (selectedUser != null){
			 request.getSession().setAttribute("user", selectedUser);
			 return "redirect:/jspChange/indexJsp";
		 }
		 else{
			 model.addAttribute("error","用户名或密码错误");
			 return "login";
		 }
	 }
	 //用户修改个人信息
	 @RequestMapping("/userUpdateInfo")
	 public String userUpdateInfo(User user,HttpServletRequest request){
		 userService.updateUserInfo(user);
		 User updatedUser = userService.selectUserByUser(user);//查找修改后的User
		 request.getSession().setAttribute("user", updatedUser);
		 return "vip";
	 }
	 //用户修改密码
	 @RequestMapping("/userUpdatePwd")
	 public String userUpdatePwd(User user,String newPwd,Model model){
		 String pwd = user.getUserPwd();
		 String md5Pwd = MD5Util.MD5Encode(pwd);
		 user.setUserPwd(md5Pwd);
		 User selectUser = userService.selectUserByUser(user);
		 if (selectUser == null){
			 model.addAttribute("error", "原密码错误");
			 return "vipPwd";
		 }else {
			 String md5NewPwd = MD5Util.MD5Encode(newPwd);
			 user.setUserPwd(md5NewPwd);
			 userService.updateUserInfo(user);
			 return "login";
		 }
	 }
	 //更新回显
	 @RequestMapping("/updateAddressSelect")
	 public String updateAddressSelect(int addressId,Model model){
		 ShopAddress shopAddress = userService.selectAddressById(addressId);
		 model.addAttribute("shopAddress",shopAddress);
		 model.addAttribute("flag", "update");
		 return "vipAdress";
	 }
	 //更新收货地址
	 @RequestMapping("/updateShopAddress")
	 public String updateShopAddress(ShopAddress shopAddress){
		 userService.updateAddress(shopAddress);
		 return "redirect:/jspChange/vipAdressJsp";
	 }
	 //删除收货地址
	 @RequestMapping("/deleteShopAddress")
	 public String deleteShopAddress(int id){
		 userService.deleteAddressById(id);
		 return "redirect:/jspChange/vipAdressJsp";
	 }
	 //将vipAdress页面的flag设置为add
	 @RequestMapping("/addFlag")
	 public String addFlag(Model model){
		 model.addAttribute("flag", "add");
		 return "vipAdress";
	 }
	 //添加收货地址
	 @RequestMapping("/addShopAddress")
	 public String addShopAddress(ShopAddress shopAddress){
		 userService.addShopAddress(shopAddress);
		 return "redirect:/jspChange/vipAdressJsp";
	 }
	 //用户注销
	 @RequestMapping("userLoginOut")
	 public String userLoginOut(HttpServletRequest request){
		 request.getSession().removeAttribute("user");
		 return "redirect:/jspChange/indexJsp";
	 }
	 //搜索框模糊匹配
	@ResponseBody
	@RequestMapping("/searchNameLike")
	public Map<String,Object> searchNameLike(){
		List<Wares> wares = new ArrayList<Wares>();
		wares = waresService.selectAllWaresByNo();
		Map<String,Object> stuMap = new HashMap<String, Object>();
		stuMap.put("wares", wares);
	    return stuMap;
	}
	 
}
