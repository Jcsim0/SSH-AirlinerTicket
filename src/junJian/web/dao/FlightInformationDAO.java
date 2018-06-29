package junJian.web.dao;

import static org.hibernate.criterion.Example.create;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import junJian.web.pojo.FlightInformation;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * FlightInformation entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see junJian.web.pojo.FlightInformation
 * @author MyEclipse Persistence Tools
 */
public class FlightInformationDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(FlightInformationDAO.class);
	// property constants
	public static final String PLANE_ID = "planeId";
	public static final String FLIGHT_NAME = "flightName";
	public static final String FROM_CITY = "fromCity";
	public static final String TO_CITY = "toCity";
	public static final String FROM_TERMINAL = "fromTerminal";
	public static final String TO_TERMINAL = "toTerminal";
	public static final String DURATION = "duration";
	public static final String TOURIST_CLASS_REMAIN = "touristClassRemain";
	public static final String BUSINESS_CLASS_REMAIN = "businessClassRemain";
	public static final String FIRST_CLASS_REMAIN = "firstClassRemain";
	public static final String TOURIST_CLASS_PRICE = "touristClassPrice";
	public static final String BUSINESS_CLASS_PRICE = "businessClassPrice";
	public static final String FIRST_CLASS_PRICE = "firstClassPrice";
	
	
	 private SessionFactory sessionFactory;  
	 
	 public SessionFactory getSessionFactory()
	{
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {  
	        return sessionFactory.getCurrentSession();  
	    }  

	public void save(FlightInformation transientInstance) {
		log.debug("saving FlightInformation instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(FlightInformation persistentInstance) {
		log.debug("deleting FlightInformation instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public FlightInformation findById(java.lang.Integer id) {
		log.debug("getting FlightInformation instance with id: " + id);
		try {
			FlightInformation instance = (FlightInformation) getSession().get(
					"junJian.web.pojo.FlightInformation", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<FlightInformation> findByExample(FlightInformation instance) {
		log.debug("finding FlightInformation instance by example");
		try {
			List<FlightInformation> results = (List<FlightInformation>) getSession()
					.createCriteria("junJian.web.pojo.FlightInformation")
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
		log.debug("finding FlightInformation instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from FlightInformation as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<FlightInformation> findByPlaneId(Object planeId) {
		return findByProperty(PLANE_ID, planeId);
	}

	public List<FlightInformation> findByFlightName(Object flightName) {
		return findByProperty(FLIGHT_NAME, flightName);
	}

	public List<FlightInformation> findByFromCity(Object fromCity) {
		return findByProperty(FROM_CITY, fromCity);
	}

	public List<FlightInformation> findByToCity(Object toCity) {
		return findByProperty(TO_CITY, toCity);
	}

	public List<FlightInformation> findByFromTerminal(Object fromTerminal) {
		return findByProperty(FROM_TERMINAL, fromTerminal);
	}

	public List<FlightInformation> findByToTerminal(Object toTerminal) {
		return findByProperty(TO_TERMINAL, toTerminal);
	}

	public List<FlightInformation> findByDuration(Object duration) {
		return findByProperty(DURATION, duration);
	}

	public List<FlightInformation> findByTouristClassRemain(
			Object touristClassRemain) {
		return findByProperty(TOURIST_CLASS_REMAIN, touristClassRemain);
	}

	public List<FlightInformation> findByBusinessClassRemain(
			Object businessClassRemain) {
		return findByProperty(BUSINESS_CLASS_REMAIN, businessClassRemain);
	}

	public List<FlightInformation> findByFirstClassRemain(
			Object firstClassRemain) {
		return findByProperty(FIRST_CLASS_REMAIN, firstClassRemain);
	}

	public List<FlightInformation> findByTouristClassPrice(
			Object touristClassPrice) {
		return findByProperty(TOURIST_CLASS_PRICE, touristClassPrice);
	}

	public List<FlightInformation> findByBusinessClassPrice(
			Object businessClassPrice) {
		return findByProperty(BUSINESS_CLASS_PRICE, businessClassPrice);
	}

	public List<FlightInformation> findByFirstClassPrice(Object firstClassPrice) {
		return findByProperty(FIRST_CLASS_PRICE, firstClassPrice);
	}

	public List findAll() {
		log.debug("finding all FlightInformation instances");
		try {
			String queryString = "from FlightInformation";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public FlightInformation merge(FlightInformation detachedInstance) {
		log.debug("merging FlightInformation instance");
		try {
			FlightInformation result = (FlightInformation) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(FlightInformation instance) {
		log.debug("attaching dirty FlightInformation instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(FlightInformation instance) {
		log.debug("attaching clean FlightInformation instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	

	/**
	 * 通过出发城市，到达城市，出发时间 搜索机票
	 * @param fromCity
	 * @param toCity
	 * @param startDate
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<FlightInformation> Bookingsearch(String fromCity, String toCity,Date startDate) {
		try {
			String queryString = "from FlightInformation as f where f.fromCity=? and f.toCity=? and f.startDate=? and f.flightState='未起飞'";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, fromCity);
			queryObject.setParameter(1, toCity);
			queryObject.setParameter(2, startDate );
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}		
	}
	/**
	 * 通过航班Id查找航班
	 * @param id
	 * @return
	 */
	public FlightInformation findByFlightId(Integer id){
		String hql ="from FlightInformation as f where f.flightId=?";
		Query queryObject = getSession().createQuery(hql);
		queryObject.setParameter(0, id);
		FlightInformation flightInformation = (FlightInformation) queryObject.uniqueResult();
		return flightInformation;
	}	
	
	/**
	 * 通过航班Id查找航班详细信息
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> getFlightMsgByFlightId(Integer id){
		List<Object[]> list = new ArrayList<Object[]>();
		String hql ="from FlightInformation as f , Plane as p where f.flightId=? and f.plane = p.planeId";
		Query queryObject = getSession().createQuery(hql);
		queryObject.setParameter(0, id);
		list = queryObject.list();
		return list;
	}
	
	/**
	 * 通过航班编号寻找航班
	 * @param flightName
	 * @param date
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<FlightInformation> findFlightInformationsByFlightName(String flightName,Date date){
		String hql = "from FlightInformation as f where f.flightName=? and f.startDate=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, flightName);
		query.setParameter(1, date);
		return query.list();
	}
	
	/**
	 * 更新航班信息
	 * @param flight
	 */
	public void updateFlight(FlightInformation flight){
		getSession().update(flight);
	}
	
	/**
	 * 通过航班状态查询航班
	 * @param state
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<FlightInformation> findFlightByState(String state){
		String hql = "from FlightInformation as f where f.flightState=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, state);
		return query.list();
	}
	
}