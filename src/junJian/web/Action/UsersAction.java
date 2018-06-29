package junJian.web.Action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import junJian.web.pojo.Users;
import junJian.web.service.UsersService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
//@Controller
//@Component//@Controller  用来标注控制层，同时表示此组件交给spring的IOC容器管理
public class UsersAction extends ActionSupport
{
	private Users user;
	//@Autowired //@Autowired 自动注入 ，表示此对象由IOC容器负责初始化并注入
	private UsersService usersService;
	
    private String result;

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	public UsersService getUsersService()
	{
		return usersService;
	}

	public void setUsersService(UsersService usersService)
	{
	
		this.usersService = usersService;
		//System.out.println(this.userService);
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public UsersAction() {
		super();
	}
	
	/*@SuppressWarnings("unchecked")
	public String userLogin(){
		String name = usersService.loginUser(user);//返回的是用户的名字
		if(name=="passwordError"||name=="phoneError"||name=="unknowError"){
			((Map<String, Object>) ActionContext.getContext().get("request")).put("msg", name);
			return "loginError";			
		}
		else{
			((Map<String, Object>) ActionContext.getContext().get("session")).put("userName",name);
			return "loginSucc";
		}	
	}*/
	
	@SuppressWarnings("unchecked")
	public String userLogin(){
		String name = usersService.loginUser(user);//返回的是用户的名字
		
		System.out.println(user);
		System.out.println(user.getPhone());
		System.out.println(user.getPassword());
		
		if(name=="passwordError"||name=="accountError"||name=="unknowError"){
			this.setResult(name);			
		}
		else{
			((Map<String, Object>) ActionContext.getContext().get("session")).put("userName",name);
			this.setResult("success");
		}	
		return "login";
	}

	public String checkRepeat()
	{
		if(usersService.isRepeat(user.getPhone())){	
			
			this.setResult("no repeat");
		}
		else {
			this.setResult("repeat");
		}
		return "checkRepeat";		
	}

	 /**
	  * 注册
	  * @return
	  */
	 public String register() {
		 usersService.registerUser(user);
		 return "registerSucc";
	 }
	 
	 /**
	  * 用户退出
	  */
	 public String loginOut(){
		 ActionContext.getContext().getSession().remove("userName");
		 return "loginOut";
	 }
	 
	 @SuppressWarnings("unchecked")
	public String checkMyInfo(){
		 Users users = (Users) ((Map<String, Object>) ActionContext.getContext().get("session")).get("users");
		 Users myInfo = usersService.queryMyInfo(users.getUsersId());
		((Map<String, Object>) ActionContext.getContext().get("request")).put("myInfo",myInfo);
		return "checkMyInfo";		 
	 }
	 
	 @SuppressWarnings("unchecked")
	public String updateUserInfo(){
		HttpServletRequest request = ServletActionContext.getRequest();
		
		Integer id = Integer.valueOf(request.getParameter("usersId")); 
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		String idCard = request.getParameter("idCard");
		String sex = request.getParameter("sex");
		
		Users users = usersService.queryMyInfo(id);
		
		users.setName(name);
		users.setPhone(phone);
		users.setEmail(email);
		users.setCountry(country);
		users.setSex(sex);
		users.setIdCard(idCard);
		
		 usersService.updateUser(users);
		 
		 ((Map<String, Object>) ActionContext.getContext().get("session")).put("userName",users.getName());
		 ((Map<String, Object>) ActionContext.getContext().get("session")).put("users",users);
		 
		 this.setResult("updateSuccess");
		 return "updateUserInfo";
	 }
	 
	 public String updatePwd(){
		 HttpServletRequest request = ServletActionContext.getRequest();
		 Integer id = Integer.valueOf(request.getParameter("usersId")); 
		 String oldPwd = request.getParameter("oldPwd");
		 String newPwd = request.getParameter("newPwd");
		 Users checkUserId = usersService.queryMyInfo(id);
		 System.out.println(checkUserId.getPassword());
		 System.out.println("old="+oldPwd);
		 if(checkUserId.getPassword().equals(oldPwd)){
			 checkUserId.setPassword(newPwd);
			 usersService.updateUser(checkUserId);
			 this.setResult("updatePasswordSuccess");
		 }
		 else{
			 this.setResult("updatePasswordError");
		 }
		 return "updatePassword";
	 }
	 
	 @SuppressWarnings("unchecked")
	public String queryAllUser(){
		 List<Users> usersList = usersService.queryAll();
		 ((Map<String, Object>) ActionContext.getContext().get("session")).put("all_usersList",usersList);
		 return "queryAllUser";
	 }
}
