package junJian.web.pojo;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * AdminUser entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "adminUser", schema = "dbo", catalog = "JunJianAirlines")
public class AdminUser implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer adminId;
	private String adminName;
	private String account;
	private String adminPassword;
	private String adminPhone;
	private Integer adminType;
	private String adminAuthority;
	private Set<Users> userses = new HashSet<Users>(0);
	private Set<Plane> planes = new HashSet<Plane>(0);
	private Set<FlightInformation> flightInformations = new HashSet<FlightInformation>(
			0);

	// Constructors

	/** default constructor */
	public AdminUser() {
	}

	/** minimal constructor */
	public AdminUser(String adminName, String adminPassword) {
		this.adminName = adminName;
		this.adminPassword = adminPassword;
	}

	/** full constructor */
	public AdminUser(String adminName, String adminPassword, String adminPhone,
			Integer adminType, String adminAuthority, Set<Users> userses,
			Set<Plane> planes, Set<FlightInformation> flightInformations) {
		this.adminName = adminName;
		this.adminPassword = adminPassword;
		this.adminPhone = adminPhone;
		this.adminType = adminType;
		this.adminAuthority = adminAuthority;
		this.userses = userses;
		this.planes = planes;
		this.flightInformations = flightInformations;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "admin_id", unique = true, nullable = false)
	public Integer getAdminId() {
		return this.adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	@Column(name = "admin_name", nullable = false, length = 20)
	public String getAdminName() {
		return this.adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	@Column(name = "account", nullable = false, length = 50)
	public String getAccount()
	{
		return account;
	}

	public void setAccount(String account)
	{
		this.account = account;
	}

	@Column(name = "admin_password", nullable = false, length = 20)
	public String getAdminPassword() {
		return this.adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	@Column(name = "admin_phone", length = 20)
	public String getAdminPhone() {
		return this.adminPhone;
	}

	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}

	@Column(name = "admin_type" ,nullable = false)
	public Integer getAdminType() {
		return this.adminType;
	}

	public void setAdminType(Integer adminType) {
		this.adminType = adminType;
	}

	@Column(name = "admin_authority", length = 100)
	public String getAdminAuthority() {
		return this.adminAuthority;
	}

	public void setAdminAuthority(String adminAuthority) {
		this.adminAuthority = adminAuthority;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "adminUser")
	public Set<Users> getUserses() {
		return this.userses;
	}

	public void setUserses(Set<Users> userses) {
		this.userses = userses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "adminUser")
	public Set<Plane> getPlanes() {
		return this.planes;
	}

	public void setPlanes(Set<Plane> planes) {
		this.planes = planes;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "adminUser")
	public Set<FlightInformation> getFlightInformations() {
		return this.flightInformations;
	}

	public void setFlightInformations(Set<FlightInformation> flightInformations) {
		this.flightInformations = flightInformations;
	}

}