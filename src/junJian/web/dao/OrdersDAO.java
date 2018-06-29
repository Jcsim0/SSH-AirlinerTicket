package junJian.web.dao;

import java.util.ArrayList;
import java.util.List;

import junJian.web.pojo.Orders;
import junJian.web.pojo.Users;
import junJian.web.service.UsersService;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import static org.hibernate.criterion.Example.create;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Orders entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see junJian.web.pojo.Orders
 * @author MyEclipse Persistence Tools
 */
public class OrdersDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(OrdersDAO.class);
	// property constants
	public static final String ORDERS_TIME = "ordersTime";
	public static final String TOURIST_CLASS_NUM = "touristClassNum";
	public static final String BUSINESS_CLASS_NUM = "businessClassNum";
	public static final String FIRST_CLASS_NUM = "firstClassNum";
	public static final String TOTAL_NUM = "totalNum";
	public static final String TOTAL_PRICE = "totalPrice";
	public static final String STATE = "state";
	
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory()
	{
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}

	public Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}

	public void save(Orders transientInstance) {
		log.debug("saving Orders instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Orders persistentInstance) {
		log.debug("deleting Orders instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Orders findById(java.lang.Integer id) {
		log.debug("getting Orders instance with id: " + id);
		try {
			Orders instance = (Orders) getSession().get(
					"junJian.web.pojo.Orders", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Orders> findByExample(Orders instance) {
		log.debug("finding Orders instance by example");
		try {
			List<Orders> results = (List<Orders>) getSession()
					.createCriteria("junJian.web.pojo.Orders")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Orders instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Orders as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Orders> findByOrdersTime(Object ordersTime) {
		return findByProperty(ORDERS_TIME, ordersTime);
	}

	public List<Orders> findByTouristClassNum(Object touristClassNum) {
		return findByProperty(TOURIST_CLASS_NUM, touristClassNum);
	}

	public List<Orders> findByBusinessClassNum(Object businessClassNum) {
		return findByProperty(BUSINESS_CLASS_NUM, businessClassNum);
	}

	public List<Orders> findByFirstClassNum(Object firstClassNum) {
		return findByProperty(FIRST_CLASS_NUM, firstClassNum);
	}

	public List<Orders> findByTotalNum(Object totalNum) {
		return findByProperty(TOTAL_NUM, totalNum);
	}

	public List<Orders> findByTotalPrice(Object totalPrice) {
		return findByProperty(TOTAL_PRICE, totalPrice);
	}

	public List<Orders> findByState(Object state) {
		return findByProperty(STATE, state);
	}

	public List findAll() {
		log.debug("finding all Orders instances");
		try {
			String queryString = "from Orders";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Orders merge(Orders detachedInstance) {
		log.debug("merging Orders instance");
		try {
			Orders result = (Orders) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Orders instance) {
		log.debug("attaching dirty Orders instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Orders instance) {
		log.debug("attaching clean Orders instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	/**
	 * 通过连接查询，查找用户订单信息，返回Object[]类型的List，前端通过迭代取值
	 * @param user
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> fingUserOrdersList(Users user){
		String queryString ="from FlightInformation as f , Orders as o , Users as u  "
				+"where  o.users=? and f.flightId=o.flightInformation and o.users=u.usersId";
		List<Object[]> list = new ArrayList<Object[]>();
		Query queryObject = getSession().createQuery(queryString);
		queryObject.setParameter(0, user);
		list = queryObject.list();
		return list;
	}
	
	public void updateOrder(Orders orders){
		getSession().update(orders);
	}
	
	public int delOrder(Integer id){
		String hql = "delete from Orders o where o.ordersId=?";
		Query queryObject = getSession().createQuery(hql);
		queryObject.setParameter(0, id);
		return queryObject.executeUpdate();
	}
}