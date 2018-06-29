package junJian.web.service.Impl;

import java.util.List;

import junJian.web.dao.PlaneDAO;
import junJian.web.pojo.Plane;
import junJian.web.service.PlaneService;

import org.springframework.transaction.annotation.Transactional;
@Transactional
public class PlaneServiceImpl implements PlaneService
{
	private PlaneDAO planeDAO;

	public PlaneDAO getPlaneDAO()
	{
		return planeDAO;
	}

	public void setPlaneDAO(PlaneDAO planeDAO)
	{
		this.planeDAO = planeDAO;
	}

	/**
	 * 查询所有客机
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Plane> getAllPlanes()
	{
		// TODO Auto-generated method stub
		return planeDAO.findAll();
	}

	@Override
	public void updatePlane(Plane plane)
	{
		// TODO Auto-generated method stub
		planeDAO.updatePlane(plane);
	}

	@Override
	public Plane getPlaneById(Integer id)
	{
		// TODO Auto-generated method stub
		return planeDAO.findById(id);
	}

	@Override
	public void delPlane(Plane plane)
	{
		// TODO Auto-generated method stub
		planeDAO.delete(plane);
	}

	@Override
	public void savePlane(Plane plane)
	{
		// TODO Auto-generated method stub
		planeDAO.save(plane);
	}

	@Override
	public List<Plane> getPlaneListByPlaneName(String planeName)
	{
		// TODO Auto-generated method stub
		return planeDAO.findByPlaneName(planeName);
	}

	@Override
	public List<Plane> getPlaneNoFlying()
	{
		// TODO Auto-generated method stub
		return planeDAO.findPlaneNoFlying();
	}
	

}
