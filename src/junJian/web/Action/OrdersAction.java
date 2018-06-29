package junJian.web.Action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import junJian.web.pojo.FlightInformation;
import junJian.web.pojo.Orders;
import junJian.web.pojo.Users;
import junJian.web.service.FlightInfoService;
import junJian.web.service.OrdersService;
import junJian.web.service.UsersService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class OrdersAction extends ActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Orders orders;
	private OrdersService ordersService;
	
	private FlightInfoService flightInfoService;
	private UsersService usersService;
	
	FlightInformation flightInformation = null;
	Users users = null;
	
	private String result;
	
	private List<Orders> ordersList;
	private List<FlightInformation> ordersFlightInformationsList;
	
	public Orders getOrders()
	{
		return orders;
	}
	public void setOrders(Orders orders)
	{
		this.orders = orders;
	}
	public OrdersService getOrdersService()
	{
		return ordersService;
	}
	public void setOrdersService(OrdersService ordersService)
	{
		this.ordersService = ordersService;
	}
	
	public FlightInfoService getFlightInfoService()
	{
		return flightInfoService;
	}
	public void setFlightInfoService(FlightInfoService flightInfoService)
	{
		this.flightInfoService = flightInfoService;
	}
	public UsersService getUsersService()
	{
		return usersService;
	}
	public void setUsersService(UsersService usersService)
	{
		this.usersService = usersService;
	}
	
	public List<Orders> getOrdersList()
	{
		return ordersList;
	}
	public void setOrdersList(List<Orders> ordersList)
	{
		this.ordersList = ordersList;
	}
	
	public List<FlightInformation> getOrdersFlightInformationsList()
	{
		return ordersFlightInformationsList;
	}
	public void setOrdersFlightInformationsList(
			List<FlightInformation> ordersFlightInformationsList)
	{
		this.ordersFlightInformationsList = ordersFlightInformationsList;
	}
	
	public String getResult()
	{
		return result;
	}
	public void setResult(String result)
	{
		this.result = result;
	}
	public String saveOrder(){

		HttpServletRequest request1 = ServletActionContext.getRequest();
		Integer flightId = Integer.valueOf(request1.getParameter("flightId"));
		Integer usersId = Integer.valueOf(request1.getParameter("usersId"));
		
		flightInformation = flightInfoService.findByFlightId(flightId); //返回fligInformation类型
		users = usersService.findUserNameById(usersId);  //返回Users类型
				
		orders.setFlightInformation(flightInformation);
		orders.setUsers(users);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ordersTime = simpleDateFormat.format(new Date());  //下单时间
		
		orders.setOrdersTime(ordersTime);
		orders.setState("待出行");
		ordersService.saveOrder(orders);
		return "orders_success";
	}
	
	@SuppressWarnings("unchecked")
	public String queryUserOrdersListByUsersId(){
		users = (Users) ((Map<String, Object>) ActionContext.getContext().get("session")).get("users");
		List<Object[]> list = ordersService.queryUserOrders(users);	
		
		/*for(Iterator<Object[]> iterator = list.iterator();iterator.hasNext();){
			Object[] objects = iterator.next();
			FlightInformation flightInformation  = (FlightInformation) objects[0];
			orders = (Orders) objects[1];
			Users users = (Users) objects[2];
			System.out.println(flightInformation.getFlightName()+"  "+orders.getOrdersTime()+"  ");
		}*/
		((Map<String, Object>) ActionContext.getContext().get("session")).put("ordersList",list);
		return "queryMyOrders";
		
		
	}
	
	public String updateMyOrder(){
		HttpServletRequest request = ServletActionContext.getRequest();
		Integer id = Integer.valueOf(request.getParameter("orderId"));
		
		Integer firstClassNum = Integer.valueOf(request.getParameter("firstClassNum"));
		Integer businessClassNum = Integer.valueOf(request.getParameter("businessClassNum"));
		Integer touristClassNum = Integer.valueOf(request.getParameter("touristClassNum"));
		
		Orders o = ordersService.queryOrdersInfo(id);
		o.setFirstClassNum(firstClassNum);
		o.setBusinessClassNum(businessClassNum);
		o.setTouristClassNum(touristClassNum);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simpleDateFormat.format(new Date());
		o.setConversionTime(date);
		o.setRefundOrConversion("改签");
		
		ordersService.updateOrders(o);
		this.setResult("updateOrdersSuccess");
		return "updateMyOrder";		
	}

	public String delMyOrder(){
		HttpServletRequest request = ServletActionContext.getRequest();
		Integer id = Integer.valueOf(request.getParameter("orderId"));
		Orders o = ordersService.queryOrdersInfo(id);
		ordersService.delOrder(o);
		this.setResult("delSuccess");
		return "delMyOrder";
	}
}
