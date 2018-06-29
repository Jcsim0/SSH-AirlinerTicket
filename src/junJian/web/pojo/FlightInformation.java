package junJian.web.pojo;

import java.sql.Time;
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

import org.hibernate.annotations.Cascade;
import org.hibernate.sql.Delete;


/**
 * FlightInformation entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "flightInformation", schema = "dbo", catalog = "JunJianAirlines")
public class FlightInformation implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer flightId;
	private AdminUser adminUser;
	private Plane plane;
	private String flightName;
	private String fromCity;
	private String toCity;
	private String fromTerminal;
	private String toTerminal;
	private Date startDate;
	private Time startTime;
	private Date arriveDate;
	private Time arriveTime;
	private Double duration;
	private Integer touristClassRemain;
	private Integer businessClassRemain;
	private Integer firstClassRemain;
	private Integer touristClassPrice;
	private Integer businessClassPrice;
	private Integer firstClassPrice;
	private String flightState;
	private Set<Orders> orderses = new HashSet<Orders>(0);

	// Constructors

	/** default constructor */
	public FlightInformation() {
	}

	/** minimal constructor */
	public FlightInformation(Plane plane, String flightName,
			String fromCity, String toCity, String fromTerminal,
			String toTerminal, Date startDate, Time startTime, Date arriveDate,
			Time arriveTime, Double duration, Integer touristClassRemain,
			Integer businessClassRemain, Integer firstClassRemain,
			Integer touristClassPrice, Integer businessClassPrice,
			Integer firstClassPrice) {
		this.plane = plane;
		this.flightName = flightName;
		this.fromCity = fromCity;
		this.toCity = toCity;
		this.fromTerminal = fromTerminal;
		this.toTerminal = toTerminal;
		this.startDate = startDate;
		this.startTime = startTime;
		this.arriveDate = arriveDate;
		this.arriveTime = arriveTime;
		this.duration = duration;
		this.touristClassRemain = touristClassRemain;
		this.businessClassRemain = businessClassRemain;
		this.firstClassRemain = firstClassRemain;
		this.touristClassPrice = touristClassPrice;
		this.businessClassPrice = businessClassPrice;
		this.firstClassPrice = firstClassPrice;
	}

	/** full constructor */
	public FlightInformation(AdminUser adminUser, Plane plane,
			String flightName, String fromCity, String toCity,
			String fromTerminal, String toTerminal, Date startDate,
			Time startTime, Date arriveDate, Time arriveTime, Double duration,
			Integer touristClassRemain, Integer businessClassRemain,
			Integer firstClassRemain, Integer touristClassPrice,
			Integer businessClassPrice, Integer firstClassPrice,
			Set<Orders> orderses) {
		this.adminUser = adminUser;
		this.plane = plane;
		this.flightName = flightName;
		this.fromCity = fromCity;
		this.toCity = toCity;
		this.fromTerminal = fromTerminal;
		this.toTerminal = toTerminal;
		this.startDate = startDate;
		this.startTime = startTime;
		this.arriveDate = arriveDate;
		this.arriveTime = arriveTime;
		this.duration = duration;
		this.touristClassRemain = touristClassRemain;
		this.businessClassRemain = businessClassRemain;
		this.firstClassRemain = firstClassRemain;
		this.touristClassPrice = touristClassPrice;
		this.businessClassPrice = businessClassPrice;
		this.firstClassPrice = firstClassPrice;
		this.orderses = orderses;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "flight_id", unique = true, nullable = false)
	public Integer getFlightId() {
		return this.flightId;
	}

	public void setFlightId(Integer flightId) {
		this.flightId = flightId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "admin_id")
	public AdminUser getAdminUser() {
		return this.adminUser;
	}

	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "plane_id", nullable = false)
	public Plane getPlane()
	{
		return this.plane;
	}

	public void setPlane(Plane plane)
	{
		this.plane = plane;
	}

	@Column(name = "flight_name", nullable = false, length = 10)
	public String getFlightName() {
		return this.flightName;
	}

	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}

	@Column(name = "fromCity", nullable = false, length = 100)
	public String getFromCity() {
		return this.fromCity;
	}

	public void setFromCity(String fromCity) {
		this.fromCity = fromCity;
	}

	@Column(name = "toCity", nullable = false, length = 100)
	public String getToCity() {
		return this.toCity;
	}

	public void setToCity(String toCity) {
		this.toCity = toCity;
	}

	@Column(name = "fromTerminal", nullable = false, length = 10)
	public String getFromTerminal() {
		return this.fromTerminal;
	}

	public void setFromTerminal(String fromTerminal) {
		this.fromTerminal = fromTerminal;
	}

	@Column(name = "toTerminal", nullable = false, length = 10)
	public String getToTerminal() {
		return this.toTerminal;
	}

	public void setToTerminal(String toTerminal) {
		this.toTerminal = toTerminal;
	}

//	@Temporal(TemporalType.DATE)
	@Column(name = "startDate", nullable = false, length = 10)
	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	@Column(name = "startTime", nullable = false, length = 16)
	public Time getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}

//	@Temporal(TemporalType.DATE)
	@Column(name = "arriveDate", nullable = false, length = 10)
	public Date getArriveDate() {
		return this.arriveDate;
	}

	public void setArriveDate(Date arriveDate) {
		this.arriveDate = arriveDate;
	}

	@Column(name = "arriveTime", nullable = false, length = 16)
	public Time getArriveTime() {
		return this.arriveTime;
	}

	public void setArriveTime(Time arriveTime) {
		this.arriveTime = arriveTime;
	}

	@Column(name = "duration", precision = 53, scale = 0)
	public Double getDuration() {
		return this.duration;
	}

	public void setDuration(Double duration) {
		this.duration = duration;
	}

	@Column(name = "touristClassRemain", nullable = false)
	public Integer getTouristClassRemain() {
		return this.touristClassRemain;
	}

	public void setTouristClassRemain(Integer touristClassRemain) {
		this.touristClassRemain = touristClassRemain;
	}

	@Column(name = "businessClassRemain", nullable = false)
	public Integer getBusinessClassRemain() {
		return this.businessClassRemain;
	}

	public void setBusinessClassRemain(Integer businessClassRemain) {
		this.businessClassRemain = businessClassRemain;
	}

	@Column(name = "firstClassRemain", nullable = false)
	public Integer getFirstClassRemain() {
		return this.firstClassRemain;
	}

	public void setFirstClassRemain(Integer firstClassRemain) {
		this.firstClassRemain = firstClassRemain;
	}

	@Column(name = "touristClassPrice", nullable = false)
	public Integer getTouristClassPrice() {
		return this.touristClassPrice;
	}

	public void setTouristClassPrice(Integer touristClassPrice) {
		this.touristClassPrice = touristClassPrice;
	}

	@Column(name = "businessClassPrice", nullable = false)
	public Integer getBusinessClassPrice() {
		return this.businessClassPrice;
	}

	public void setBusinessClassPrice(Integer businessClassPrice) {
		this.businessClassPrice = businessClassPrice;
	}

	@Column(name = "firstClassPrice", nullable = false)
	public Integer getFirstClassPrice() {
		return this.firstClassPrice;
	}

	public void setFirstClassPrice(Integer firstClassPrice) {
		this.firstClassPrice = firstClassPrice;
	}
	
	@Column(name = "flight_state", length = 50)
	public String getFlightState()
	{
		return flightState;
	}

	public void setFlightState(String flightState)
	{
		this.flightState = flightState;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "flightInformation",cascade=CascadeType.REMOVE)
	public Set<Orders> getOrderses() {
		return this.orderses;
	}

	public void setOrderses(Set<Orders> orderses) {
		this.orderses = orderses;
	}

}