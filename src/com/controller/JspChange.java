package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.Catagory;
import com.bean.OneCatagory;
import com.bean.Orders;
import com.bean.ShopAddress;
import com.bean.User;
import com.bean.Wares;
import com.service.CatagoryService;
import com.service.OrdersService;
import com.service.UserService;
import com.service.WaresService;


@RequestMapping("/jspChange")
@Controller
//用于各jsp间的跳转
public class JspChange {
	@Autowired
	private UserService userService;
	
	@Autowired
	private CatagoryService catagoryService;
	
	@Autowired
	private WaresService waresService;
	
	@Autowired
	private OrdersService orderService;
	
	public Map<String,Object> getCatagory(){
		List<OneCatagory> oneCatagory = new ArrayList<OneCatagory>();
		List<String> twoCatagory = new ArrayList<String>();
		Map<String,Object> catagoryMap = new HashMap<String, Object>();
		List<Catagory> catagory = new ArrayList<Catagory>();
		oneCatagory = catagoryService.selectAllOneCatagory();
		for(int i=0;i<oneCatagory.size();i++){
			twoCatagory = catagoryService.selectAllTwoCatagoryByOne(oneCatagory.get(i).getOneCatagoryName());
			
			catagory.add(new Catagory(oneCatagory.get(i).getOneCatagoryId(), oneCatagory.get(i).getOneCatagoryName(), twoCatagory));
			catagoryMap.put("catagory", catagory);
		}
		return catagoryMap;
	}
	
	//返回到index
	@RequestMapping(value="/indexJsp",method=RequestMethod.GET)
	public String index(@RequestParam(required=false)Map<String, Object>param,Model model){
		
		//显示出每个楼层里二级分类下的商品(只显示4个，点击更多可跳到促销中心界面查看)传到前端
		String  oneName = (String) param.get("oneName");
		String  twoName = (String) param.get("twoName");
		param.put("curPage",1);
		param.put("pageSize",4);
		param.put("oneCatagoryName",oneName);
		param.put("twoCatagoryName",twoName);
		List<Wares> listByT = waresService.selectWaresAll(param);
		model.addAttribute("listByT", listByT);
		
		//把所有的分类以catgory实体类的map传到前端
		model.addAttribute("catagoryMap", getCatagory());
		
		//把查询的的推荐商品传值到前端
		List<Wares> listWTJ = waresService.selectWaresTj();
		model.addAttribute("listWTJ", listWTJ);
		
		//把查询的的促销商品传值到前端
		List<Wares> listWCX = waresService.selectWaresCX();
		model.addAttribute("listWCX", listWCX);
		return "index";
	}
	//返回到login
	@RequestMapping("/loginJsp")
	public String login(){
		return "login";
	}
	//返回到reg(注册)
	@RequestMapping("/regJsp")
	public String reg(){
		return "reg";
	}
	//返回到用户管理
	@RequestMapping("/managerUserJsp")
	public String manager(Model model){
		List<User> userList = new ArrayList<User>();
		userList = userService.selectAllUser();
		model.addAttribute("userList", userList);
		return "managerUser";
	}
	//管理员登录
	@RequestMapping("/managerLoginJsp")
	public String managerLogin(){
		return "managerLogin";
	}
	//分类管理
	@RequestMapping("/managerCatagoryJsp")
	public String managerCatagory(Model model){
		model.addAttribute("catagoryMap", getCatagory());
		return "managerCatagory";
	}
	//商品管理
	@RequestMapping("/managerWaresJsp")
	public String managerWaresJsp(Model model){
		return "redirect:/managerController/selectWaresByNameAndPage?curPage=1&waresName=";
	}
	//订单管理
	@RequestMapping("/managerOrders")
	public String managerOrders(Model model,HttpServletRequest request,Integer curPage){
		if (curPage == null){
			curPage = 1;
		}
		Orders orders = new Orders();
		int pageSize = 3;
		int count = orderService.selectOrdersCount(orders);
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
		map.put("orders", orders);
		map.put("startPos", startPos);
		map.put("pageSize", pageSize);
		
		List<Orders> ordersList = orderService.selectOrdersByPage(map);
		model.addAttribute("ordersList", ordersList);
		model.addAttribute("curPage", curPage);
		model.addAttribute("totalPage", totalPage);
		return "managerOrders";
	}
	//返回到会员中心
	@RequestMapping("/vipJsp")
	public String VipJsp(Model model){
		model.addAttribute("catagoryMap", getCatagory());
		return "vip";
	}
	//
	@RequestMapping("/vipAdressJsp")
	public String vipAddress(Model model,HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		int userId = user.getId();
		List<ShopAddress> shopAddressList = new ArrayList<ShopAddress>();
		shopAddressList = userService.selectAddressByUserId(userId);
		model.addAttribute("shopAddressList", shopAddressList);
		model.addAttribute("catagoryMap", getCatagory());
		return "vipAdress";
	}
	//
	@RequestMapping("/aboutJsp")
	public String aboutJsp(Model model){
		model.addAttribute("catagoryMap", getCatagory());
		return "about";
	}
	//
	@RequestMapping("/contactJsp")
	public String contactJsp(Model model){
		model.addAttribute("catagoryMap", getCatagory());
		return "contact";
	}
	//
	@RequestMapping("/helpJsp")
	public String helpJsp(Model model){
		model.addAttribute("catagoryMap", getCatagory());
		return "help";
	}
	//
	@RequestMapping("/orderJsp")
	public String orderJsp(Model model){
		model.addAttribute("catagoryMap", getCatagory());
		return "order";
	}
	//
	@RequestMapping("/order2Jsp")
	public String order2Jsp(Model model){
		model.addAttribute("catagoryMap", getCatagory());
		return "order2";
	}
	//
	@RequestMapping("/orderDetailsJsp")
	public String orderDetailsJsp(Model model){
		model.addAttribute("catagoryMap", getCatagory());
		return "orderDetails";
	}
	//促销中心
	@RequestMapping(value="/productJsp",method=RequestMethod.GET)
	public String productJsp(Model model,Integer curPage,@RequestParam(required = false) Map<String, Object> param){
		//获取查询的条件
		String  oneName = (String) param.get("oneName");
		String  twoName = (String) param.get("twoName");
		String waresName = (String) param.get("waresName");
		param.put("oneCatagoryName", oneName);
		param.put("twoCatagoryName", twoName);
		param.put("waresName", waresName);
		
		//1.判断入参的范围--2.计算totalpage--3.获取当前页的总数据--4.返回当前页，返回总页数， 返回当前数据
		
		//得到总页码数
		Integer pageSize = 8;
		String size = pageSize.toString();
		param.put("pageSize",size);
		
		Integer totalPage = waresService.getTotalPage(param) <= 0 ? 1:waresService.getTotalPage(param);
		
		if(curPage == null || curPage < 1) {
			curPage = 1;
		} else if( curPage > totalPage) {
			curPage = totalPage;
		}
		
		String cur = curPage.toString();
		param.put("curPage",cur);
		
		//把所有的分类以catgory实体类的map传到前端
		model.addAttribute("catagoryMap", getCatagory());
		//把查询到的所有商品传到前端
		List<Wares> listWAll = waresService.selectWaresAll(param);
		model.addAttribute("jilu", waresService.getCount(param));
		model.addAttribute("listWAll", listWAll);
		model.addAttribute("curPage", curPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("oneName", oneName);
		model.addAttribute("twoName", twoName);
		model.addAttribute("waresName", waresName);
		
		return "product";
	}

	@RequestMapping("/proinfoJsp")
	public String proinfoJsp(Model model,Integer wId){
		Wares wares = waresService.selectWaresById(wId);
		model.addAttribute("wares", wares);
		model.addAttribute("catagoryMap", getCatagory());
		return "proinfo";
	}
	//
	@RequestMapping("/successJsp")
	public String successJsp(Model model){
		model.addAttribute("catagoryMap", getCatagory());
		return "success";
	}
	//
	@RequestMapping("/vipExitJsp")
	public String vipExitJsp(Model model){
		model.addAttribute("catagoryMap", getCatagory());
		return "vipExit";
	}
	//用户管理订单分页显示
	@RequestMapping("/vipOrderJsp")
	public String vipOrderJsp(Model model,HttpServletRequest request,Integer curPage){
		if (curPage == null){
			curPage = 1;
		}
		User user = (User)request.getSession().getAttribute("user");
		int userId = user.getId();
		Orders orders = new Orders();
		orders.setUserId(userId);
		
		int pageSize = 3;
		int count = orderService.selectOrdersCount(orders);
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
		map.put("orders", orders);
		map.put("startPos", startPos);
		map.put("pageSize", pageSize);
		
		List<Orders> ordersList = orderService.selectOrdersByPage(map);
		model.addAttribute("ordersList", ordersList);
		model.addAttribute("catagoryMap", getCatagory());
		model.addAttribute("curPage", curPage);
		model.addAttribute("totalPage", totalPage);
		return "vipOrder";
	}
	//
	@RequestMapping("/vipPwdJsp")
	public String vipPwdJsp(Model model){
		model.addAttribute("catagoryMap", getCatagory());
		return "vipPwd";
	}
	//
	@RequestMapping("/vipTuihuoJsp")
	public String vipTuiHuoJsp(Model model){
		model.addAttribute("catagoryMap", getCatagory());
		return "vipTuihuo";
	}
}
