package junJian.web.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Orders entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "orders", schema = "dbo", catalog = "JunJianAirlines")
public class Orders implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer ordersId;
	private FlightInformation flightInformation;
	private Users users;
	private String ordersTime;
	private Integer touristClassNum;
	private Integer businessClassNum;
	private Integer firstClassNum;
	private Integer totalNum;
	private Integer totalPrice;
	private String state;
	private String refundTime;  //退票时间
	private String conversionTime;  //改签时间
	private String refundOrConversion;

	// Constructors

	
	/** default constructor */
	public Orders() {
	}

	/** minimal constructor */
	public Orders(FlightInformation flightInformation, Users users) {
		this.flightInformation = flightInformation;
		this.users = users;
	}

	/** full constructor */
	public Orders(FlightInformation flightInformation, Users users,
			String ordersTime, Integer touristClassNum,
			Integer businessClassNum, Integer firstClassNum, Integer totalNum,
			Integer totalPrice, String state, String refundTime, String conversionTime) {
		this.flightInformation = flightInformation;
		this.users = users;
		this.ordersTime = ordersTime;
		this.touristClassNum = touristClassNum;
		this.businessClassNum = businessClassNum;
		this.firstClassNum = firstClassNum;
		this.totalNum = totalNum;
		this.totalPrice = totalPrice;
		this.state = state;
		this.refundTime = refundTime;
		this.conversionTime = conversionTime;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "orders_id", unique = true, nullable = false)
	public Integer getOrdersId() {
		return this.ordersId;
	}

	public void setOrdersId(Integer ordersId) {
		this.ordersId = ordersId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "flight_id", nullable = false)
	public FlightInformation getFlightInformation()
	{
		return flightInformation;
	}

	public void setFlightInformation(FlightInformation flightInformation)
	{
		this.flightInformation = flightInformation;
	}

	@ManyToOne(fetch = FetchType.LAZY )
	@JoinColumn(name = "users_id", nullable = false)
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Column(name = "ordersTime", length = 50)
	public String getOrdersTime() {
		return this.ordersTime;
	}

	public void setOrdersTime(String ordersTime) {
		this.ordersTime = ordersTime;
	}

	@Column(name = "touristClassNum")
	public Integer getTouristClassNum() {
		return this.touristClassNum;
	}

	public void setTouristClassNum(Integer touristClassNum) {
		this.touristClassNum = touristClassNum;
	}

	@Column(name = "businessClassNum")
	public Integer getBusinessClassNum() {
		return this.businessClassNum;
	}

	public void setBusinessClassNum(Integer businessClassNum) {
		this.businessClassNum = businessClassNum;
	}

	@Column(name = "firstClassNum")
	public Integer getFirstClassNum() {
		return this.firstClassNum;
	}

	public void setFirstClassNum(Integer firstClassNum) {
		this.firstClassNum = firstClassNum;
	}

	@Column(name = "totalNum")
	public Integer getTotalNum() {
		return this.totalNum;
	}

	public void setTotalNum(Integer totalNum) {
		this.totalNum = totalNum;
	}

	@Column(name = "totalPrice")
	public Integer getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Column(name = "state", length = 10)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name = "refundTime", length = 50)
	public String getRefundTime()
	{
		return refundTime;
	}

	public void setRefundTime(String refundTime)
	{
		this.refundTime = refundTime;
	}

	@Column(name = "conversionTime", length = 50)
	public String getConversionTime()
	{
		return conversionTime;
	}

	public void setConversionTime(String conversionTime)
	{
		this.conversionTime = conversionTime;
	}

	@Column(name = "refundOrConversion", length = 50)
	public String getRefundOrConversion()
	{
		return refundOrConversion;
	}

	public void setRefundOrConversion(String refundOrConversion)
	{
		this.refundOrConversion = refundOrConversion;
	}


}