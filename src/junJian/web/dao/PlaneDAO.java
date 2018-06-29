package junJian.web.dao;

import java.util.Date;
import java.util.List;

import junJian.web.pojo.Plane;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import static org.hibernate.criterion.Example.create;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for Plane
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see junJian.web.pojo.Plane
 * @author MyEclipse Persistence Tools
 */
public class PlaneDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(PlaneDAO.class);
	// property constants
	public static final String PLANE_NAME = "planeName";
	public static final String TYPE = "type";
	public static final String TOURIST_CLASS_NUM = "touristClassNum";
	public static final String BUSINESS_CLASS_NUM = "businessClassNum";
	public static final String FIRST_CLASS_NUM = "firstClassNum";
	public static final String REMARK = "remark";
	
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
	

	public void save(Plane transientInstance) {
		log.debug("saving Plane instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Plane persistentInstance) {
		log.debug("deleting Plane instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Plane findById(java.lang.Integer id) {
		log.debug("getting Plane instance with id: " + id);
		try {
			Plane instance = (Plane) getSession().get("junJian.web.pojo.Plane",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Plane> findByExample(Plane instance) {
		log.debug("finding Plane instance by example");
		try {
			List<Plane> results = (List<Plane>) getSession()
					.createCriteria("junJian.web.pojo.Plane")
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
		log.debug("finding Plane instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Plane as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Plane> findByPlaneName(Object planeName) {
		return findByProperty(PLANE_NAME, planeName);
	}

	public List<Plane> findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List<Plane> findByTouristClassNum(Object touristClassNum) {
		return findByProperty(TOURIST_CLASS_NUM, touristClassNum);
	}

	public List<Plane> findByBusinessClassNum(Object businessClassNum) {
		return findByProperty(BUSINESS_CLASS_NUM, businessClassNum);
	}

	public List<Plane> findByFirstClassNum(Object firstClassNum) {
		return findByProperty(FIRST_CLASS_NUM, firstClassNum);
	}

	public List<Plane> findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findAll() {
		log.debug("finding all Plane instances");
		try {
			String queryString = "from Plane";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Plane merge(Plane detachedInstance) {
		log.debug("merging Plane instance");
		try {
			Plane result = (Plane) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Plane instance) {
		log.debug("attaching dirty Plane instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Plane instance) {
		log.debug("attaching clean Plane instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	public void updatePlane(Plane plane){
		getSession().update(plane);
	}
	
	@SuppressWarnings("unchecked")
	public List<Plane> findPlaneNoFlying(){
		String hql = "from Plane as p where p.planeId not in "
				+ "(select f.plane from FlightInformation as f where f.flightState='Î´Æð·É')";
		List<Plane> list = getSession().createQuery(hql).list();
		return list;
	}
}