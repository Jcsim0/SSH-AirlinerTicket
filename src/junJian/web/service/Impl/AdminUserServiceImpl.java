package junJian.web.service.Impl;

import java.util.List;

import junJian.web.dao.AdminUserDAO;
import junJian.web.pojo.AdminUser;
import junJian.web.service.AdminUserService;

import org.springframework.transaction.annotation.Transactional;
@Transactional
public class AdminUserServiceImpl implements AdminUserService
{
	private AdminUserDAO adminUserDAO;

	public AdminUserDAO getAdminUserDAO()
	{
		return adminUserDAO;
	}

	public void setAdminUserDAO(AdminUserDAO adminUserDAO)
	{
		this.adminUserDAO = adminUserDAO;
	}

	@Override
	public String adminLogin(AdminUser adminUser)
	{
		// TODO Auto-generated method stub
		return adminUserDAO.judgeAdminAccount(adminUser);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AdminUser> getAllAdminUser()
	{
		// TODO Auto-generated method stub
		return adminUserDAO.findAll();
	}

	@Override
	public void updateAdminPhone(AdminUser admin)
	{
		// TODO Auto-generated method stub
		adminUserDAO.updateAdminPhone(admin);
	}

	@Override
	public AdminUser getAdminById(Integer id)
	{
		// TODO Auto-generated method stub
		return adminUserDAO.findById(id);
	}

}
