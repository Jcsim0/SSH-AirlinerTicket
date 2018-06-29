package junJian.web.Action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.Time;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import junJian.web.pojo.AdminUser;
import junJian.web.pojo.FlightInformation;
import junJian.web.pojo.Plane;
import junJian.web.service.AdminUserService;
import junJian.web.service.FlightInfoService;
import junJian.web.service.PlaneService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminUserAction extends ActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private AdminUser adminUser;
	private AdminUserService adminUserService;
	private Plane plane;
	private PlaneService planeService;
	private FlightInfoService flightInfoService;
	private FlightInformation flightInformation;
	
	private String result;
	
	public AdminUser getAdminUser()
	{
		return adminUser;
	}
	public void setAdminUser(AdminUser adminUser)
	{
		this.adminUser = adminUser;
	}
	public AdminUserService getAdminUserService()
	{
		return adminUserService;
	}
	public void setAdminUserService(AdminUserService adminUserService)
	{
		this.adminUserService = adminUserService;
	}

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
	public FlightInfoService getFlightInfoService()
	{
		return flightInfoService;
	}
	public void setFlightInfoService(FlightInfoService flightInfoService)
	{
		this.flightInfoService = flightInfoService;
	}
	public FlightInformation getFlightInformation()
	{
		return flightInformation;
	}
	public void setFlightInformation(FlightInformation flightInformation)
	{
		this.flightInformation = flightInformation;
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
	 * ��¼
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String userLogin(){
		String name = adminUserService.adminLogin(adminUser);//���ص����û�������
		
		System.out.println(adminUser);
		System.out.println(adminUser.getAccount());
		System.out.println(adminUser.getAdminPassword());
		
		if(name=="passwordError"||name=="accountError"||name=="unknowError"){
			this.setResult(name);			
		}
		else{
			((Map<String, Object>) ActionContext.getContext().get("session")).put("adminName",name);
			this.setResult("loginSuccess");
		}	
		return "login";
	}
	
	/**
	  * �û��˳�
	  */
	 public String loginOut(){
		 ActionContext.getContext().getSession().remove("adminName");
		 ActionContext.getContext().getSession().remove("admin");
		 return "loginOut";
	 }
	 
	 /**
	  * �л��û�
	  */
	 public String changeAdmin(){
		 ActionContext.getContext().getSession().remove("adminName");
		 ActionContext.getContext().getSession().remove("admin");
		 return "changeAdmin";
	 }
	 
	 /**
	  * ��ѯ���п���ʹ�õĿͻ�
	  * @return
	  */
	 @SuppressWarnings("unchecked")
	public String queryAllPlane(){
		 List<Plane> planes = planeService.getAllPlanes();
		 ((Map<String, Object>) ActionContext.getContext().get("session")).put("all_planeList",planes);
		 return "queryAllPlane";
	 }
	 
	 /**
	  * ��ѯ���к���
	  * @return
	  */
	 @SuppressWarnings("unchecked")
	public String QueryAllFlightInfo(){
		List<FlightInformation> flightInformationsList = flightInfoService.queryAll();
		((Map<String, Object>) ActionContext.getContext().get("session")).put("all_flightInfoList", flightInformationsList);
		return "QueryAllFlightInfo";
	}
	 /**
	  * �����º���
	  * @return
	  * @throws ParseException
	  */
	 @SuppressWarnings("unchecked")
	public String saveNewFlight() throws ParseException{
		 HttpServletRequest request = ServletActionContext.getRequest();
		 
		 String startDateString = request.getParameter("startDate");
		 String arriveDateString = request.getParameter("arriveDate");
		 
		 String startTimeString = request.getParameter("startTime");
		 String arriveTimeString = request.getParameter("arriveTime");
		 //���ַ�ת��ΪDate����
		 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 Date startDate = simpleDateFormat.parse(startDateString);
		 Date arriveDate = simpleDateFormat.parse(arriveDateString);
		 
		// System.out.println("start="+startDate);
		// System.out.println(flightInformation.getFlightName());
		// System.out.println("arrive="+arriveDate);
	 
		// SimpleDateFormat simpleTimeFormat = new SimpleDateFormat("HH-mm-ss");
		 Time startTime = Time.valueOf(startTimeString);
		 Time arriveTime = Time.valueOf(arriveTimeString);
		 
		// System.out.println("startTime="+startTime);
		// System.out.println("arriveTime="+arriveTime);
		 
		 Integer touristClassRemain;
		 Integer touristClassPrice;
		 
		 if(request.getParameter("touristClassRemain")==null){
			 touristClassRemain=0;
		 }else {
			 touristClassRemain = Integer.valueOf(request.getParameter("touristClassRemain"));
		}
		 if(request.getParameter("touristClassPrice")==null){
			 touristClassPrice=0;
		 }else{
			 touristClassPrice = Integer.valueOf(request.getParameter("touristClassPrice"));
		 }
		 
		 Integer businessClassRemain;
		 Integer businessClassPrice;
		 
		 if(request.getParameter("businessClassRemain")==null){
			 businessClassRemain=0;
		 }else{
			 businessClassRemain = Integer.valueOf(request.getParameter("businessClassRemain"));
		 }
		 if(request.getParameter("businessClassPrice")==null){
			 businessClassPrice=0;
		 }else {
			 businessClassPrice = Integer.valueOf(request.getParameter("businessClassPrice"));
		}
		 
		 Integer firstClassRemain;
		 Integer firstClassPrice;
		 
		 if(request.getParameter("firstClassRemain")==null){
			 firstClassRemain=0;
		 }else {
			 firstClassRemain = Integer.valueOf(request.getParameter("firstClassRemain"));
		}
		 if(request.getParameter("firstClassPrice")==null){
			 firstClassPrice=0;
		 }else {
			 firstClassPrice = Integer.valueOf(request.getParameter("firstClassPrice"));
		}
		 
		 flightInformation.setStartDate(startDate);
		 flightInformation.setArriveDate(arriveDate);
		 flightInformation.setStartTime(startTime);
		 flightInformation.setArriveTime(arriveTime);
		 
		 flightInformation.setTouristClassRemain(touristClassRemain);
		 flightInformation.setTouristClassPrice(touristClassPrice);
		 flightInformation.setBusinessClassRemain(businessClassRemain);
		 flightInformation.setBusinessClassPrice(businessClassPrice);
		 flightInformation.setFirstClassRemain(firstClassRemain);
		 flightInformation.setFirstClassPrice(firstClassPrice);
		 
		// System.out.println("���ü۸����λ��");
		 
		 AdminUser adminUser = (AdminUser) ((Map<String, Object>) ActionContext.getContext().get("session")).get("admin");
		 flightInformation.setAdminUser(adminUser);
		 
		 Integer planeId = Integer.valueOf(request.getParameter("planeId"));
		 plane = planeService.getPlaneById(planeId);		 
		 flightInformation.setPlane(plane);
		 
		 flightInformation.setFlightState("δ���");
		 
		 flightInfoService.saveFlight(flightInformation);
		 
		 this.setResult("saveFlightSuccess");
		 
		 return "saveNewFlight";
	 }
	 
	 /**
	  * ��ѯ�������Ƿ��ظ�
	  * @return
	  */
	 public String checkFlightNameRepeat(){
		 HttpServletRequest request = ServletActionContext.getRequest();
		 String name = request.getParameter("flightName");
		 List<FlightInformation> list = flightInfoService.checkRepeatFlightNameByFlightName(name);
		 if(list.isEmpty()){
			 this.setResult("noRepeat");
		 }else{
			 this.setResult("repeat");
		 }
		 return "checkFlightNameRepeat";
	 }
	
	 /*
	  * 
	  * ��ѯû�з�������Ŀͻ�
	  */
	 @SuppressWarnings("unchecked")
	public String queryNoFlyingPlane(){
		 List<Plane> list = planeService.getPlaneNoFlying();
		 ((Map<String, Object>) ActionContext.getContext().get("session")).put("noFlying_planeList",list);
		 return "queryNoFlyingPlane";
	 }
	 
	 /**
	  * ���º�����Ϣ
	  * @return
	  */
	 public String updateNewFlight(){
		 HttpServletRequest request = ServletActionContext.getRequest();
		 Integer id = Integer.valueOf(request.getParameter("flightId"));
		 Integer fp = Integer.valueOf(request.getParameter("fp"));
		 Integer bp = Integer.valueOf(request.getParameter("bp"));
		 Integer tp = Integer.valueOf(request.getParameter("tp"));
		 Integer fr = Integer.valueOf(request.getParameter("fr"));
		 Integer br = Integer.valueOf(request.getParameter("br"));
		 Integer tr = Integer.valueOf(request.getParameter("tr"));
		 
		 flightInformation = flightInfoService.findByFlightId(id);
		 flightInformation.setFirstClassPrice(fp);
		 flightInformation.setFirstClassRemain(fr);
		 flightInformation.setBusinessClassPrice(bp);
		 flightInformation.setBusinessClassRemain(br);
		 flightInformation.setTouristClassPrice(tp);
		 flightInformation.setTouristClassRemain(tr);
		 
		 flightInfoService.saveFlight(flightInformation);
		 
		 this.setResult("updateNewFlightSuccess");
		 return "updateNewFlight";
	 }
	 
	 /**
	  * ���º���״̬
	  * @return
	  */
	 @SuppressWarnings("unchecked")
	public String updateFlightState(){
		 HttpServletRequest request = ServletActionContext.getRequest();
		 Integer id = Integer.valueOf(request.getParameter("flightId"));
		 String state = request.getParameter("state");
		 
		 flightInformation = flightInfoService.findByFlightId(id);
		 flightInformation.setFlightState(state);
		 AdminUser adminUser = (AdminUser) ((Map<String, Object>) ActionContext.getContext().get("session")).get("admin");
		 flightInformation.setAdminUser(adminUser);
		 
		 flightInfoService.saveFlight(flightInformation);
		 
		 this.setResult("updateFlightStateSuccess");
		 return "updateFlightState";
	 }
	 
	 /**
	  * ��ѯδ��ɵĺ���
	  */
	 @SuppressWarnings("unchecked")
	public String queryNotTakingOffFlight(){
		 //HttpServletRequest request = ServletActionContext.getRequest();
		 String state = "δ���";
		 List<FlightInformation> list = flightInfoService.getFlightByState(state);
		 ((Map<String, Object>) ActionContext.getContext().get("session")).put("not_taking_off_flightList", list);
		 return "queryNotTakingOffFlight";
	 }
	 
	 /**
	  * ��ѯ����ɺ���
	  */
	 @SuppressWarnings("unchecked")
	public String queryTakingOffFlight(){
		 String state = "�����";
		 List<FlightInformation> list = flightInfoService.getFlightByState(state);
		 ((Map<String, Object>) ActionContext.getContext().get("session")).put("taking_off_flightList", list);
		 return "queryTakingOffFlight";
	 }
	 
	 /**
	  * ��ѯ��ȡ������
	  */
	 @SuppressWarnings("unchecked")
	public String queryCancelFlight(){
		 String state = "��ȡ��";
		 List<FlightInformation> list = flightInfoService.getFlightByState(state);
		 ((Map<String, Object>) ActionContext.getContext().get("session")).put("cancel_flightList", list);
		 return "queryCancelFlight";
	 }
	 
	 
	 /**
	  * ��ѯ���й���Ա
	  */
	 @SuppressWarnings("unchecked")
	public String queryAllAdmin(){
		 List<AdminUser> list = adminUserService.getAllAdminUser();
		 ((Map<String, Object>) ActionContext.getContext().get("session")).put("all_adminList", list);
		 return "queryAllAdmin";
	 }
	 
	 public String updateAdminPhone(){
		 HttpServletRequest request = ServletActionContext.getRequest();
		 Integer id = Integer.valueOf(request.getParameter("adminId"));
		 adminUser = adminUserService.getAdminById(id);
		 adminUser.setAdminPhone(request.getParameter("adminPhone"));
		 adminUserService.updateAdminPhone(adminUser);
		 this.setResult("updateAdminPhoneSuccess");
		 return "updateAdminPhone";
	 }
}
