package br.com.kolss.model.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "configuracao_email")
public class ConfiguracaoEmail extends AbstractEntity<Long> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 6568227475168586235L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_config_email", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "host_name", nullable = true)
	private String hostName;
	
	
	@Column(name = "smtp_port", nullable = false)
	private Integer smtpPort;
	
	
	@Column(name = "user_id", nullable = true)
	private String userId;
	
	
	@Column(name = "password", nullable = true)
	private String password;
	
	
	@Column(name = "from_sender", nullable = true)
	private String fromSender;
	
	
	@Column(name = "from_name", nullable = true)
	private String fromName;
	
	
	@Column(name = "ssl_on_Connect", nullable = false)
	private boolean sslOnConnect = false;
	
	
	@Column(name = "start_tls_enable", nullable = false)
	private boolean startTlsEnable = false;
	
	
	/** Método Construtor padrão. */
	public ConfiguracaoEmail() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param contratante
	 * @param hostName
	 * @param smtpPort
	 * @param sslOnConnect
	 * @param startTlsEnable
	 */
	public ConfiguracaoEmail(Long id, String hostName, Integer smtpPort,
			boolean sslOnConnect, boolean startTlsEnable) {
		this(id, hostName, smtpPort, null, null, null, null,
				sslOnConnect, startTlsEnable);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param hostName
	 * @param smtpPort
	 * @param userId
	 * @param password
	 * @param fromSender
	 * @param fromName
	 * @param sslOnConnect
	 * @param startTlsEnable
	 */
	public ConfiguracaoEmail(Long id, String hostName, Integer smtpPort,
			String userId, String password, String fromSender, String fromName,
			boolean sslOnConnect, boolean startTlsEnable) {
		this();
		this.hostName = hostName;
		this.smtpPort = smtpPort;
		this.userId = userId;
		this.password = password;
		this.fromSender = fromSender;
		this.fromName = fromName;
		this.sslOnConnect = sslOnConnect;
		this.startTlsEnable = startTlsEnable;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((fromName == null) ? 0 : fromName.hashCode());
		result = prime * result
				+ ((fromSender == null) ? 0 : fromSender.hashCode());
		result = prime * result
				+ ((hostName == null) ? 0 : hostName.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result
				+ ((smtpPort == null) ? 0 : smtpPort.hashCode());
		result = prime * result + (sslOnConnect ? 1231 : 1237);
		result = prime * result + (startTlsEnable ? 1231 : 1237);
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ConfiguracaoEmail other = (ConfiguracaoEmail) obj;
		if (fromName == null) {
			if (other.fromName != null)
				return false;
		} else if (!fromName.equals(other.fromName))
			return false;
		if (fromSender == null) {
			if (other.fromSender != null)
				return false;
		} else if (!fromSender.equals(other.fromSender))
			return false;
		if (hostName == null) {
			if (other.hostName != null)
				return false;
		} else if (!hostName.equals(other.hostName))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (smtpPort == null) {
			if (other.smtpPort != null)
				return false;
		} else if (!smtpPort.equals(other.smtpPort))
			return false;
		if (sslOnConnect != other.sslOnConnect)
			return false;
		if (startTlsEnable != other.startTlsEnable)
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ConfiguracaoEmail [id=" + id
				+ ", hostName=" + hostName
				+ ", smtpPort=" + smtpPort
				+ ", userId=" + userId
				+ ", password=" + password
				+ ", fromSender=" + fromSender
				+ ", fromName=" + fromName
				+ ", sslOnConnect=" + sslOnConnect
				+ ", startTlsEnable=" + startTlsEnable
				+ "]";
	}
	
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getHostName() {
		return hostName;
	}
	
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	
	public Integer getSmtpPort() {
		return smtpPort;
	}
	
	public void setSmtpPort(Integer smtpPort) {
		this.smtpPort = smtpPort;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getFromSender() {
		return fromSender;
	}
	
	public void setFromSender(String fromSender) {
		this.fromSender = fromSender;
	}
	
	public String getFromName() {
		return fromName;
	}
	
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	
	public boolean isSslOnConnect() {
		return sslOnConnect;
	}
	
	public void setSslOnConnect(boolean sslOnConnect) {
		this.sslOnConnect = sslOnConnect;
	}
	
	public boolean isStartTlsEnable() {
		return startTlsEnable;
	}
	
	public void setStartTlsEnable(boolean startTlsEnable) {
		this.startTlsEnable = startTlsEnable;
	}
	
}
