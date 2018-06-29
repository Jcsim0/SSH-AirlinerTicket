package junJian.web.service;

import java.util.List;

import junJian.web.pojo.Plane;

public interface PlaneService
{
	public List<Plane> getAllPlanes();
	
	public void updatePlane(Plane plane);
	
	public Plane getPlaneById(Integer id);
	
	public void delPlane(Plane plane);
	
	public void savePlane(Plane plane);
	
	public List<Plane> getPlaneListByPlaneName(String planeName);
	
	public List<Plane> getPlaneNoFlying();
}
