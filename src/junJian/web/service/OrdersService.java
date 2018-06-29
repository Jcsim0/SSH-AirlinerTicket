package junJian.web.service;

import java.util.List;

import junJian.web.pojo.Orders;
import junJian.web.pojo.Users;

public interface OrdersService
{
	public void saveOrder(Orders orders);
	
	public List<Object[]> queryUserOrders(Users user);
	
	public void updateOrders(Orders orders);
	
	public Orders queryOrdersInfo(Integer id);
	
	public void delOrder(Orders orders);
}
