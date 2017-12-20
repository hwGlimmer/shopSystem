package com.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import com.bean.Catagory;
import com.bean.Manager;
import com.bean.OneCatagory;
import com.bean.Orders;
import com.bean.OrdersItems;
import com.bean.User;
import com.bean.Wares;
import com.service.CatagoryService;
import com.service.ManagerService;
import com.service.OrdersService;
import com.service.UserService;
import com.service.WaresService;
import com.util.MD5Util;
import com.util.VerifyCodeUtils;


@RequestMapping("/managerController")
@Controller
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	@Autowired
	private UserService userService;
	@Autowired
	private CatagoryService catagoryService;
	@Autowired
	private WaresService waresService;
	@Autowired
	private OrdersService ordersService;
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
		return "managerLogin";
	}
	//管理员登录
	@RequestMapping("managerLogin")
	public String managerLogin(Manager manager,Model model,HttpServletRequest request){
		if (manager.getPassword() == null){
			model.addAttribute("error", "请输入密码");
			return "managerLogin";
		}
		String md5Pwd = MD5Util.MD5Encode(manager.getPassword());
		manager.setPassword(md5Pwd);
		Manager selectedManager = managerService.selectManager(manager);//查找到的管理员
		if (selectedManager == null){
			model.addAttribute("error", "用户名或密码错误");
			return "managerLogin";
		}else{
			request.getSession().setAttribute("manager", selectedManager);
			return "redirect:/jspChange/managerUserJsp";
		}
	}
	//管理员注销
	@RequestMapping("/managerLoginOut")
	public String managerLoginOut(HttpServletRequest request){
		request.getSession().removeAttribute("manager");
		return "redirect:/jspChange/indexJsp";
	}
	
	//修改用户信息设置flag
	@RequestMapping("/userUpdateFlag")
	public String userUpdateFlag(Model model,int userId){
		//根据用户id查找用户
		User user = userService.selectUserByUser(new User(userId, null, null, null, null, null, null));
		model.addAttribute("user", user);
		model.addAttribute("flag", "update");
		return "managerUser";
	}
	//修改用户信息
	@RequestMapping("/updateUser")
	public String updateUser(User user){
		userService.updateUserInfo(user);
		return "redirect:/jspChange/managerUserJsp";
	}
	//修改商品分类设置flag并回显
	@RequestMapping("/catagoryUpdateFlag")
	public String catagoryUpdateFlag(Model model,int oneCatagoryId){
		String oneCatagory = catagoryService.selectOneCatagoryById(oneCatagoryId);
		List<String> twoCatagory = new ArrayList<String>();
		twoCatagory = catagoryService.selectAllTwoCatagoryByOne(oneCatagory);
		Catagory catagory = new Catagory(oneCatagoryId, oneCatagory, twoCatagory);
		model.addAttribute("catagory", catagory);
		model.addAttribute("flag", "update");
		return "managerCatagory";
	}
	//修改商品分类
	@RequestMapping("/updateCatagory")
	public String updateCatagory(Catagory catagory){
		//根据一级分类id查找原一级分类
		String oneCatagoryName = catagoryService.selectOneCatagoryById(catagory.getId());
		//修改后的一级分类
		OneCatagory oneCatagoryUpdate = new OneCatagory(catagory.getId(), catagory.getOneName());
		//根据原一级分类查找二级分类
		List<String> twoCatagory = new ArrayList<String>();
		twoCatagory = catagoryService.selectAllTwoCatagoryByOne(oneCatagoryName);
		
		List<String> twoCatagoryUpdate = new ArrayList<String>();
		twoCatagoryUpdate = catagory.getTwoName();
		int twoCatagoryId = 0;
		for (int i=0;i<twoCatagory.size();i++){
			twoCatagoryId = catagoryService.selectTwoCatagoryIdByname(twoCatagory.get(i));
			//如果修改后二级分类名字为空，则删除该二级分类
			if (twoCatagoryUpdate.get(i) == null || twoCatagoryUpdate.get(i) == ""){
				catagoryService.deleteTwoCatagoryById(twoCatagoryId);
			}
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("twoCatagoryId", twoCatagoryId);
			map.put("twoCatagoryName", twoCatagoryUpdate.get(i));
			map.put("oneCatagoryName", oneCatagoryUpdate.getOneCatagoryName());
			catagoryService.updateTwoCatagory(map);
		}
		catagoryService.updateOneCatagory(oneCatagoryUpdate);
		return "redirect:/jspChange/managerCatagoryJsp";
	}
	//添加二级分类设置flag
	@RequestMapping("/flagAddTwoCatagory")
	public String flagAddTwoCatagory(int oneCatagoryId,Model model){
		model.addAttribute("oneCatagoryId", oneCatagoryId);
		model.addAttribute("flag", "addTwoCatagory");
		return "managerCatagory";
	}
	//添加二级分类
	@RequestMapping("/addTwoCatagory")
	public String addTwoCatagory(int oneCatagoryId,String twoCatagoryName){
		String oneCatagoryName = catagoryService.selectOneCatagoryById(oneCatagoryId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("oneCatagoryName", oneCatagoryName);
		map.put("twoCatagoryName", twoCatagoryName);
		catagoryService.addTwoCatagory(map);
		return "redirect:/jspChange/managerCatagoryJsp";
	}
	//添加一级分类设置flag
	@RequestMapping("/flagAddOneCatagory")
	public String flagAddOneCatagory(Model model){
		model.addAttribute("flag", "addOneCatagory");
		return "managerCatagory";
	}
	//添加一级分类
	@RequestMapping("/addOneCatagory")
	public String addOneCatagory(String oneCatagoryName){
		catagoryService.addOneCatagory(oneCatagoryName);
		return "redirect:/jspChange/managerCatagoryJsp";
	}
	//删除分类
	@RequestMapping("/deleteCatagory")
	public String deleteCatagory(int oneCatagoryId){
		String oneCatagoryName = catagoryService.selectOneCatagoryById(oneCatagoryId);
		catagoryService.deleteTwoCatagoryByOneCatagoryName(oneCatagoryName);
		catagoryService.deleteOneCatagoryById(oneCatagoryId);
		return "redirect:/jspChange/managerCatagoryJsp";
	}
	//分页查找商品
	@RequestMapping("/selectWaresByNameAndPage")
	public String selectWaresByNameAndPage(String waresName,int curPage,Model model){
		if (waresName == null || waresName == "" || waresName == "null"){
			waresName = null;
		}
		int pageSize = 3;
		int count = waresService.selectAllCount(waresName);
		int totalPage;
		
		if (count%pageSize == 0){
			totalPage = count/pageSize;
		}else{
			totalPage = (count/pageSize) + 1;
		}
		
		if (totalPage == 0){
			totalPage = 1;
		}
		
		if (curPage == 0 || curPage < 1){
			curPage = 1;
		}else if (curPage > totalPage){
			curPage = totalPage;
		}
		
		int startPos = (curPage - 1)*pageSize;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("waresName", waresName);
		map.put("startPos", startPos);
		map.put("pageSize", pageSize);
		List<Wares> waresList = new ArrayList<Wares>();
		waresList = waresService.selectWaresByNameAndPage(map);
		model.addAttribute("waresName", waresName);
		model.addAttribute("waresList", waresList);
		model.addAttribute("curPage", curPage);
		model.addAttribute("totalPage", totalPage);
		return "managerWares";
	}
	//修改商品设置flag并回显
	@RequestMapping("/flagUpdateWares")
	public String flagUpdateWares(Model model,int wId,String oneCatagoryName){
		Wares wares = waresService.selectWaresById(wId);
		List<String> oneName = new ArrayList<String>();
		List<OneCatagory> oneCatagory = catagoryService.selectAllOneCatagory();
		for (int i=0;i<oneCatagory.size();i++){
			oneName.add(oneCatagory.get(i).getOneCatagoryName());
		}
		List<String> twoName = catagoryService.selectAllTwoCatagoryByOne(oneCatagoryName);
		model.addAttribute("oneName", oneName);
		model.addAttribute("twoName", twoName);
		model.addAttribute("wares", wares);
		model.addAttribute("flag", "updateWares");
		return "managerWares";
	}
	//修改商品
	@RequestMapping("/updateWares")
	public String updateWares(Wares wares,MultipartFile imageFile,HttpServletRequest request) throws IllegalStateException, IOException{
		if (imageFile.isEmpty()){
			System.out.println("不执行修改头像");
		}else {
			String imagePath = upload(imageFile, wares.getwId()+"", request);
			wares.setwImage(imagePath);
		}
		waresService.updateWares(wares);
		return "redirect:/jspChange/managerWaresJsp";
	}
	//添加商品设置flag
	@RequestMapping("/flagAddWares")
	public String flagAddWares(Model model){
		List<String> oneName = new ArrayList<String>();
		List<String> twoName = new ArrayList<String>();
		List<OneCatagory> oneCatagory = new ArrayList<OneCatagory>();
		oneCatagory = catagoryService.selectAllOneCatagory();
		for (int i=0;i<oneCatagory.size();i++){
			oneName.add(oneCatagory.get(i).getOneCatagoryName());
			List<String> twoNameList = catagoryService.selectAllTwoCatagoryByOne(oneCatagory.get(i).getOneCatagoryName());
			for(int j=0;j<twoNameList.size();j++){
				twoName.add(twoNameList.get(j));
			}
		}
		model.addAttribute("oneName", oneName);
		model.addAttribute("twoName", twoName);
		model.addAttribute("flag", "addWares");
		return "managerWares";
	}
	//添加商品
	@RequestMapping("/addWares")
	public String addWares(Wares wares,MultipartFile imageFile,HttpServletRequest request) throws IllegalStateException, IOException{
		waresService.addWares(wares);
		Integer wId = wares.getwId();
		if (imageFile.isEmpty()){
			System.out.println("没有添加商品图片");
		}else {
			String imagePath = upload(imageFile, wId+"", request);
			wares.setwImage(imagePath);
			waresService.updateWares(wares);
		}
		return "redirect:/jspChange/managerWaresJsp";
	}
	//删除商品
	@RequestMapping("/deleteWares")
	public String deleteWares(int wId){
		waresService.deleteWares(wId);
		return "redirect:/jspChange/managerWaresJsp";
	}
	//修改订单设置flag
	@RequestMapping("/flagUpdateOrders")
	public String flagUpdateOrders(Model model,Integer ordersId){
		Map<String, Object> map = new HashMap<String, Object>();
		Orders orders = new Orders();
		orders.setId(ordersId);
		map.put("orders", orders);
		map.put("startPos", 0);
		map.put("pageSize", 10);
		List<Orders> ordersList = ordersService.selectOrdersByPage(map);
		orders = ordersList.get(0);
		model.addAttribute("orders", orders);
		model.addAttribute("flag", "updateOrders");
		return "managerOrders";
	}
	//修改订单
	@RequestMapping("/updateOrders")
	public String updateOrders(Orders orders){
		ordersService.updateOrders(orders);
		return "redirect:/jspChange/managerOrders";
	}
	//删除订单
	@RequestMapping("/deleteOrders")
	public String deleteOrders(Integer ordersId){
		Orders orders = new Orders();
		orders.setId(ordersId);
		OrdersItems ordersItems = new OrdersItems();
		ordersItems.setOrderId(ordersId);
		ordersService.deleteOrders(orders);
		ordersService.deleteOrdersItems(ordersItems);
		return "redirect:/jspChange/managerOrders";
	}
	
	
	
	
	
	
	
	
	//文件上传
	public String upload(MultipartFile file,String id,HttpServletRequest request) throws IllegalStateException, IOException{
		String fileOrigneName = file.getOriginalFilename();
		String ext = fileOrigneName.substring(fileOrigneName.lastIndexOf('.'));
		String fileName = id + ext;
		String savePath = request.getSession().getServletContext().getRealPath("/")
				+ "/images/";
		File fileSavepath = new File(savePath);
		if(!fileSavepath.exists()) {
			fileSavepath.mkdir();
		}
		try {
			file.transferTo(new File(savePath + fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileName;
		}
}
