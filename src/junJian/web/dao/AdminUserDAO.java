package junJian.web.dao;

import static org.hibernate.criterion.Example.create;

import java.util.List;
import java.util.Map;

import junJian.web.pojo.AdminUser;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionContext;

/**
 * A data access object (DAO) providing persistence and search support for
 * AdminUser entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see junJian.web.pojo.AdminUser
 * @author MyEclipse Persistence Tools
 */
public class AdminUserDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(AdminUserDAO.class);
	// property constants
	public static final String ADMIN_NAME = "adminName";
	public static final String ADMIN_PASSWORD = "adminPassword";
	public static final String ADMIN_PHONE = "adminPhone";
	public static final String ADMIN_TYPE = "adminType";
	public static final String ADMIN_AUTHORITY = "adminAuthority";
	public static final String ACCOUNT = "account";
	
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

	public void save(AdminUser transientInstance) {
		log.debug("saving AdminUser instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(AdminUser persistentInstance) {
		log.debug("deleting AdminUser instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public AdminUser findById(java.lang.Integer id) {
		log.debug("getting AdminUser instance with id: " + id);
		try {
			AdminUser instance = (AdminUser) getSession().get(
					"junJian.web.pojo.AdminUser", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<AdminUser> findByExample(AdminUser instance) {
		log.debug("finding AdminUser instance by example");
		try {
			List<AdminUser> results = (List<AdminUser>) getSession()
					.createCriteria("junJian.web.pojo.AdminUser")
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
		log.debug("finding AdminUser instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from AdminUser as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<AdminUser> findByAdminName(Object adminName) {
		return findByProperty(ADMIN_NAME, adminName);
	}

	public List<AdminUser> findByAdminPassword(Object adminPassword) {
		return findByProperty(ADMIN_PASSWORD, adminPassword);
	}

	public List<AdminUser> findByAdminPhone(Object adminPhone) {
		return findByProperty(ADMIN_PHONE, adminPhone);
	}

	public List<AdminUser> findByAdminType(Object adminType) {
		return findByProperty(ADMIN_TYPE, adminType);
	}

	public List<AdminUser> findByAdminAuthority(Object adminAuthority) {
		return findByProperty(ADMIN_AUTHORITY, adminAuthority);
	}
	
	public List<AdminUser> findByAccount(Object account){
		return findByProperty(ACCOUNT, account);
	}

	public List findAll() {
		log.debug("finding all AdminUser instances");
		try {
			String queryString = "from AdminUser";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public AdminUser merge(AdminUser detachedInstance) {
		log.debug("merging AdminUser instance");
		try {
			AdminUser result = (AdminUser) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(AdminUser instance) {
		log.debug("attaching dirty AdminUser instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(AdminUser instance) {
		log.debug("attaching clean AdminUser instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	/*
	 * 登录判断--return 0:用户名密码均正确，1，为用户名不存在，2为密码不正确；-1为异常
	 */
	@SuppressWarnings("unchecked")
	public String judgeAdminAccount(AdminUser admin)
	{
		List<AdminUser> rs = this.findByAccount(admin.getAccount());
		if (!rs.isEmpty())
		{
			for (AdminUser admins : rs)
			{
				String pwd = admins.getAdminPassword();
				if (pwd.equals(admins.getAdminPassword()))
				{
					((Map<String, Object>) ActionContext.getContext().get("session")).put("admin", admins);
					return admins.getAdminName(); // 密码正确，登录成功 返回用户名字
				} else
					return "passwordError";// 密码错误
			}
			return "unknowError";// 异常
		} else
			return "accountError";// 登录名错误
	}
	
	public void updateAdminPhone(AdminUser admin){
		getSession().update(admin);
	}
}