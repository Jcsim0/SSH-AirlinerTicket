package junJian.web.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Plane entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "plane", schema = "dbo", catalog = "JunJianAirlines")
public class Plane implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer planeId;
	private AdminUser adminUser;
	private String planeName;
	private String type;
	private Date buyDate;
	private Date useDate;
	private Integer touristClassNum;
	private Integer businessClassNum;
	private Integer firstClassNum;
	private String remark;
	private Set<FlightInformation> flightInformations = new HashSet<FlightInformation>(0);

	// Constructors

	/** default constructor */
	public Plane() {
	}

	/** minimal constructor */
	public Plane(String planeName, String type, Date buyDate, Date useDate,
			Integer touristClassNum, Integer businessClassNum,
			Integer firstClassNum) {
		this.planeName = planeName;
		this.type = type;
		this.buyDate = buyDate;
		this.useDate = useDate;
		this.touristClassNum = touristClassNum;
		this.businessClassNum = businessClassNum;
		this.firstClassNum = firstClassNum;
	}

	/** full constructor */
	public Plane(AdminUser adminUser, String planeName, String type,
			Date buyDate, Date useDate, Integer touristClassNum,
			Integer businessClassNum, Integer firstClassNum, String remark,
			Set<FlightInformation> flightInformations)
	{
		this.adminUser = adminUser;
		this.planeName = planeName;
		this.type = type;
		this.buyDate = buyDate;
		this.useDate = useDate;
		this.touristClassNum = touristClassNum;
		this.businessClassNum = businessClassNum;
		this.firstClassNum = firstClassNum;
		this.remark = remark;
		this.flightInformations = flightInformations;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "plane_id", unique = true, nullable = false)
	public Integer getPlaneId() {
		return this.planeId;
	}

	public void setPlaneId(Integer planeId) {
		this.planeId = planeId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "admin_id")
	public AdminUser getAdminUser() {
		return this.adminUser;
	}

	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}

	@Column(name = "plane_name", nullable = false, length = 30)
	public String getPlaneName() {
		return this.planeName;
	}

	public void setPlaneName(String planeName) {
		this.planeName = planeName;
	}

	@Column(name = "type", nullable = false, length = 30)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	//@Temporal(TemporalType.DATE)
	@Column(name = "buyDate", nullable = false, length = 10)
	public Date getBuyDate() {
		return this.buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	//@Temporal(TemporalType.DATE)
	@Column(name = "useDate", nullable = false, length = 10)
	public Date getUseDate() {
		return this.useDate;
	}

	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}

	@Column(name = "touristClassNum", nullable = false)
	public Integer getTouristClassNum() {
		return this.touristClassNum;
	}

	public void setTouristClassNum(Integer touristClassNum) {
		this.touristClassNum = touristClassNum;
	}

	@Column(name = "businessClassNum", nullable = false)
	public Integer getBusinessClassNum() {
		return this.businessClassNum;
	}

	public void setBusinessClassNum(Integer businessClassNum) {
		this.businessClassNum = businessClassNum;
	}

	@Column(name = "firstClassNum", nullable = false)
	public Integer getFirstClassNum() {
		return this.firstClassNum;
	}

	public void setFirstClassNum(Integer firstClassNum) {
		this.firstClassNum = firstClassNum;
	}

	@Column(name = "remark", length = 300)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "plane")
	public Set<FlightInformation> getFlightInformations()
	{
		return this.flightInformations;
	}

	public void setFlightInformations(Set<FlightInformation> flightInformations)
	{
		this.flightInformations = flightInformations;
	}

}