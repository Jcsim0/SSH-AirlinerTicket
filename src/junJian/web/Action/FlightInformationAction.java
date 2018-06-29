package junJian.web.Action;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import junJian.web.pojo.FlightInformation;
import junJian.web.service.FlightInfoService;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FlightInformationAction extends ActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FlightInformation flightInfo;
	private FlightInfoService flightInfoService;
	
	private List<FlightInformation> flightInformationsList;

	public FlightInformation getFlightInfo()
	{
		return flightInfo;
	}
	public void setFlightInfo(FlightInformation flightInfo)
	{
		this.flightInfo = flightInfo;
	}
	public FlightInfoService getFlightInfoService()
	{
		return flightInfoService;
	}
	public void setFlightInfoService(FlightInfoService flightInfoService)
	{
		this.flightInfoService = flightInfoService;
	}
	
	public List<FlightInformation> getFlightInformationsList()
	{
		return flightInformationsList;
	}
	public void setFlightInformationsList(List<FlightInformation> flightInformationsList)
	{
		this.flightInformationsList = flightInformationsList;
	}
	
	/**
	 * ��ѯ�û��������Ļ�Ʊ
	 */
	@SuppressWarnings("unchecked")
	public String bookingSearch(){
		flightInformationsList = flightInfoService.bookingQuery(flightInfo);	
		((Map<String, Object>) ActionContext.getContext().get("session")).put("flightInfoList", flightInformationsList);
		return "bookingSearch";
	}
	
	@SuppressWarnings("unchecked")
	public String queryFlightByFlightName(){
		flightInformationsList = flightInfoService.getFlightInformationsByFlightName(flightInfo);
		((Map<String, Object>) ActionContext.getContext().get("session")).put("flightInfoList", flightInformationsList);
		return "queryFlightByFlightName";
	}
	
	
	/**
	 * ��ѯ���л�Ʊ
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String queryAll(){
		flightInformationsList = flightInfoService.queryAll();
		((Map<String, Object>) ActionContext.getContext().get("session")).put("allflightInfoList", flightInformationsList);
		return "queryAll";
	}
	
	/**
	 * ��idΪ������ѯ����
	 */
	@SuppressWarnings("unchecked")
	public String getId(){
		HttpServletRequest request1 = ServletActionContext.getRequest();
		Integer id = Integer.valueOf(request1.getParameter("Fid")) ;
		flightInfo = flightInfoService.findByFlightId(id);
		((Map<String, Object>) ActionContext.getContext().get("request")).put("flightInfo", flightInfo);
		return "getId";
	}
	
	/**
	 * ��ѯ��������
	 * @return
	 */

	@SuppressWarnings("unchecked")
	public String getFlightMsg(){
		HttpServletRequest request1 = ServletActionContext.getRequest();
		Integer id = Integer.valueOf(request1.getParameter("Fid")) ;
		List<Object[]> list = flightInfoService.getFlightMsgByFlightId(id);
		((Map<String, Object>) ActionContext.getContext().get("request")).put("getFlightInfo", list);
		return "getFlightMsg";
	}
	
	
	

	
}
