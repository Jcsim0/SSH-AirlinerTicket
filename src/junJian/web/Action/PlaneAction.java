package junJian.web.Action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.omg.CORBA.PUBLIC_MEMBER;

import junJian.web.pojo.AdminUser;
import junJian.web.pojo.Plane;
import junJian.web.service.AdminUserService;
import junJian.web.service.PlaneService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PlaneAction extends ActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Plane plane;
	private PlaneService planeService;
	private AdminUserService adminUserService;
	
	private String result;
	
	public Plane getPlane()
	{
		return plane;
	}
	public void setPlane(Plane plane)
	{
		this.plane = plane;
	}
	public PlaneService getPlaneService()
	{
		return planeService;
	}
	public void setPlaneService(PlaneService planeService)
	{
		this.planeService = planeService;
	}
	
	public AdminUserService getAdminUserService()
	{
		return adminUserService;
	}
	public void setAdminUserService(AdminUserService adminUserService)
	{
		this.adminUserService = adminUserService;
	}
	public String getResult()
	{
		return result;
	}
	public void setResult(String result)
	{
		this.result = result;
	}
	/**
	 * 查询所有客机
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String queryAllPlane(){
		List<Plane> planes = planeService.getAllPlanes();
		((Map<String, Object>) ActionContext.getContext().get("session")).put("all_planeList",planes);
		return "queryAllPlane";
	}
	
	/**
	 * 更新客机信息
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public String updatePlane() throws ParseException{
		HttpServletRequest request = ServletActionContext.getRequest();
		String buyDateString = request.getParameter("buyDate");
		String useDateString = request.getParameter("useDate");
		
		//把字符转换为Date类型
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date buyDate = simpleDateFormat.parse(buyDateString);
		Date useDate = simpleDateFormat.parse(useDateString);
		//System.out.println(buyDate);
		//System.out.println(useDate);
		
		plane.setBuyDate(buyDate);
		plane.setUseDate(useDate);
		
		AdminUser adminUser = (AdminUser) ((Map<String, Object>) ActionContext.getContext().get("session")).get("admin");
		plane.setAdminUser(adminUser);

		planeService.updatePlane(plane);
		this.setResult("updatePlaneSuccess");
		return "updatePlane";
	}
	
	/**
	 * 删除客机信息,级联删除
	 * @return
	 */
	public String delPlane(){
		plane = planeService.getPlaneById(plane.getPlaneId());
		System.out.println(plane);
		planeService.delPlane(plane);
		this.setResult("delPlaneSuccess");
		return "delPlane";
	}
	
	/**
	 * 保存新的客机信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String saveNewPlane(){		
		AdminUser adminUser = (AdminUser) ((Map<String, Object>) ActionContext.getContext().get("session")).get("admin");
		plane.setAdminUser(adminUser);
		planeService.savePlane(plane);
		this.setResult("saveNewPlaneSuccecc");
		return "saveNewPlane";
	}

	/**
	 * 检查客机编号是否重复
	 */
	public String checkPlaneNameRepeat(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String newPlaneName = request.getParameter("newPlaneName");
		List<Plane> planeList = planeService.getPlaneListByPlaneName(newPlaneName);
		if(planeList.isEmpty()){
			this.setResult("notRepeat");
		}else{
			this.setResult("repeat");
		}
		return "checkPlaneNameRepeat";
	}

}
