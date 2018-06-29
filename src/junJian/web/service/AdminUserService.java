package junJian.web.service;

import java.util.List;

import junJian.web.pojo.AdminUser;

public interface AdminUserService
{
	public String adminLogin(AdminUser adminUser);
	
	public List<AdminUser> getAllAdminUser();
	
	public void updateAdminPhone(AdminUser admin);
	
	public AdminUser getAdminById(Integer id);
}
