package junJian.web.service.Impl;

import java.util.List;

import junJian.web.dao.UsersDAO;
import junJian.web.pojo.Users;
import junJian.web.service.UsersService;

import org.springframework.transaction.annotation.Transactional;
//@Service ("usersService")//@Service 用来标注service层，表示此组件为service并交给Spring的IOC容器管理
@Transactional
public class UsersServiceImpl implements UsersService
{
//	@Autowired  //@Autowired 自动注入 ，表示此对象由IOC容器负责初始化并注入
	private  UsersDAO dao;

	public UsersDAO getDao() {
		return dao;
	}

	public void setDao(UsersDAO dao) {
		this.dao = dao;
	}
		
	@SuppressWarnings("unchecked")
	public List<Users> queryAll(){
		return dao.findAll();  
	}

	@Override
	public String loginUser(Users users)
	{
		// TODO Auto-generated method stub
		return dao.judgeUserPhone(users);
	}

	@Override
	public boolean isRepeat(String phone)
	{
		// TODO Auto-generated method stub
		return dao.judgeRepeat(phone);
	}

	@Override
	public void registerUser(Users users)
	{
		// TODO Auto-generated method stub
		dao.save(users);
	}

	@Override
	public Users findUserNameById(Integer id)
	{
		// TODO Auto-generated method stub
		return dao.findUserNameById(id);
	}

	@Override
	public Users queryMyInfo(Integer id)
	{
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public void updateUser(Users users)
	{
		// TODO Auto-generated method stub
		dao.updateUser(users);;
	}

	
}
