package junJian.web.dao;

import static org.hibernate.criterion.Example.create;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.TransactionManager;

import junJian.web.pojo.Users;

import org.apache.struts2.ServletActionContext;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.opensymphony.xwork2.ActionContext;

/**
 * A data access object (DAO) providing persistence and search support for Users
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see junJian.web.pojo.Users
 * @author MyEclipse Persistence Tools
 */

//@Repository  //注解@Repository，用来标注持久层，同时表示此组件交给spring的IOC容器管理
public class UsersDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(UsersDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String PHONE = "phone";
	public static final String PASSWORD = "password";
	public static final String SEX = "sex";
	public static final String ID_CARD = "idCard";
	public static final String EMAIL = "email";
	public static final String COUNTRY = "country";
	
	//@Autowired  //@Autowired 自动注入 ，表示此对象由IOC容器负责初始化并注入
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
	  

	public void save(Users transientInstance) {
		log.debug("saving Users instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Users persistentInstance) {
		log.debug("deleting Users instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Users findById(java.lang.Integer id) {
		log.debug("getting Users instance with id: " + id);
		try {
			Users instance = (Users) getSession().get("junJian.web.pojo.Users",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Users> findByExample(Users instance) {
		log.debug("finding Users instance by example");
		try {
			List<Users> results = (List<Users>) getSession()
					.createCriteria("junJian.web.pojo.Users")
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
		log.debug("finding Users instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Users as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Users> findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List<Users> findByPhone(Object phone) {
		return findByProperty(PHONE, phone);
	}

	public List<Users> findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List<Users> findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List<Users> findByIdCard(Object idCard) {
		return findByProperty(ID_CARD, idCard);
	}

	public List<Users> findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List<Users> findByCountry(Object country) {
		return findByProperty(COUNTRY, country);
	}

	public List findAll() {
		log.debug("finding all Users instances");
		try {
			String queryString = "from Users";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Users merge(Users detachedInstance) {
		log.debug("merging Users instance");
		try {
			Users result = (Users) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Users instance) {
		log.debug("attaching dirty Users instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Users instance) {
		log.debug("attaching clean Users instance");
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
	public String judgeUserPhone(Users users){	
		List<Users> rs = this.findByPhone(users.getPhone());
		if(!rs.isEmpty()){
			 for(Users use:rs){
				 String pwd =  use.getPassword();
					if(pwd.equals(users.getPassword())){
						((Map<String, Object>) ActionContext.getContext().get("session")).put("users",use);
						return use.getName(); //手机、密码正确，登录成功 返回用户名字
					}
					else
						return "passwordError";//密码错误
			 }
			return "unknowError";//异常
		}
		else
			return "phoneError";//登录名错误
	}	
	
	/**
	 * 判断手机号码是否重复
	 * @param name
	 * @return
	 */
	public boolean judgeRepeat(String phone)
	{
		List<Users> rs = this.findByPhone(phone);
			if(rs.isEmpty())
				{
					return true;
				}
			else {
				return false;
			}
	}
	
	/**
	 * 返回user name
	 * @param id
	 * @return
	 */
	public Users findUserNameById(Integer id){	
		String hql ="from Users as u where u.usersId=?";
		Query queryObject = getSession().createQuery(hql);
		queryObject.setParameter(0, id);
		Users users = (Users) queryObject.uniqueResult();
		if(users!=null){
			return users;
		}else {
			return null;
		}	
	}
	
	public void updateUser(Users users){
		getSession().update(users);
	}
}