package pojo;

import java.io.Serializable;
/**
 * ѧ����
 * @author Heroine
 *
 */
public class Student implements Serializable{
	private Integer sid;
	private String sname;
	//���ѧ����Ӧһ���༶  һ���༶����
	private ClassInfo classInfo;
	public Integer getSid() {
		return sid;
	}
	public String getSname() {
		return sname;
	}
	public ClassInfo getClassInfo() {
		return classInfo;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public void setClassInfo(ClassInfo classInfo) {
		this.classInfo = classInfo;
	}
	
}
