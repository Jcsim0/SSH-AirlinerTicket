package junJian.web.service.Impl;

import java.util.List;

import junJian.web.dao.FlightInformationDAO;
import junJian.web.pojo.FlightInformation;
import junJian.web.service.FlightInfoService;

import org.springframework.transaction.annotation.Transactional;
@Transactional
public class FlightInfoServiceImpl implements FlightInfoService
{
	private  FlightInformationDAO flightInformationDAO;

	public FlightInformationDAO getFlightInformationDAO()
	{
		return flightInformationDAO;
	}

	public void setFlightInformationDAO(FlightInformationDAO flightInformationDAO)
	{
		this.flightInformationDAO = flightInformationDAO;
	}

	@Override
	public List<FlightInformation> bookingQuery(FlightInformation flightInformation)
	{
		// TODO Auto-generated method stub
		return flightInformationDAO.Bookingsearch(flightInformation.getFromCity(), flightInformation.getToCity(),flightInformation.getStartDate());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FlightInformation> queryAll()
	{
		// TODO Auto-generated method stub
		return flightInformationDAO.findAll();
	}

	@Override
	public FlightInformation findByFlightId(Integer id)
	{
		// TODO Auto-generated method stub
		return flightInformationDAO.findByFlightId(id);
	}

	@Override
	public List<Object[]> getFlightMsgByFlightId(Integer id)
	{
		// TODO Auto-generated method stub
		return flightInformationDAO.getFlightMsgByFlightId(id);
	}

	@Override
	public List<FlightInformation> getFlightInformationsByFlightName(FlightInformation flightInformation)
	{
		// TODO Auto-generated method stub
		return flightInformationDAO.findFlightInformationsByFlightName(flightInformation.getFlightName(), flightInformation.getStartDate());
	}

	@Override
	public void saveFlight(FlightInformation flightInformation)
	{
		// TODO Auto-generated method stub
		flightInformationDAO.save(flightInformation);
	}
	
	public List<FlightInformation> checkRepeatFlightNameByFlightName(String flightName){
		return flightInformationDAO.findByFlightName(flightName);
	}

	@Override
	public void updateNewFlight(FlightInformation flightInformation)
	{
		// TODO Auto-generated method stub
		flightInformationDAO.updateFlight(flightInformation);
	}

	@Override
	public List<FlightInformation> getFlightByState(String state)
	{
		// TODO Auto-generated method stub
		return flightInformationDAO.findFlightByState(state);
	}

}
