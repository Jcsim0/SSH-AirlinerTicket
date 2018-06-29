package junJian.web.service.Impl;

import java.util.List;

import junJian.web.dao.OrdersDAO;
import junJian.web.pojo.Orders;
import junJian.web.pojo.Users;
import junJian.web.service.OrdersService;

import org.springframework.transaction.annotation.Transactional;
@Transactional
public class OrdersServiceImpl implements OrdersService
{
	private OrdersDAO ordersDAO;

	public OrdersDAO getOrdersDAO()
	{
		return ordersDAO;
	}

	public void setOrdersDAO(OrdersDAO ordersDAO)
	{
		this.ordersDAO = ordersDAO;
	}

	@Override
	public void saveOrder(Orders orders)
	{
		// TODO Auto-generated method stub
		ordersDAO.save(orders);
		
	}

	@Override
	public List<Object[]> queryUserOrders(Users user)
	{
		// TODO Auto-generated method stub
		return ordersDAO.fingUserOrdersList(user);
	}

	@Override
	public void updateOrders(Orders orders)
	{
		// TODO Auto-generated method stub
		ordersDAO.updateOrder(orders);
	}

	@Override
	public Orders queryOrdersInfo(Integer id)
	{
		// TODO Auto-generated method stub
		return ordersDAO.findById(id);
	}

	@Override
	public void delOrder(Orders orders)
	{
		// TODO Auto-generated method stub
		ordersDAO.delete(orders);;
	}
	

}
