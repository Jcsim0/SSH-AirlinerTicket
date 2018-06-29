package junJian.web.service;

import java.util.List;

import junJian.web.pojo.Users;

public interface UsersService {
	
	public String loginUser(Users users);

	public List<Users> queryAll();
	
	public boolean isRepeat(String phone);//查询手机号是否重复
	
	public void registerUser(Users users);
	
	public Users findUserNameById(Integer id);
	
	public Users queryMyInfo(Integer id);
	
	public void updateUser(Users users);
}
