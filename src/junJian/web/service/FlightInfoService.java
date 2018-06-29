package junJian.web.service;

import java.util.List;

import junJian.web.pojo.FlightInformation;

public interface FlightInfoService
{

	public List<FlightInformation> bookingQuery(FlightInformation flightInformation);
	public List<FlightInformation> queryAll();
	public FlightInformation findByFlightId(Integer id);
	public List<Object[]> getFlightMsgByFlightId(Integer id);
	public List<FlightInformation> getFlightInformationsByFlightName(FlightInformation flightInformation);
	
	public void saveFlight(FlightInformation flightInformation);
	
	public List<FlightInformation> checkRepeatFlightNameByFlightName(String flightName);
	
	public  void updateNewFlight(FlightInformation flightInformation);
	
	public  List<FlightInformation> getFlightByState(String state);
}
