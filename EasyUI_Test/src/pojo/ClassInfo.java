package pojo;

import java.io.Serializable;
/**
 *∞‡º∂¿‡
 * @author Heroine
 *
 */
public class ClassInfo implements Serializable{
	private Integer cid;
	private String cname;
	public Integer getCid() {
		return cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
}
