package pojo;

import java.io.Serializable;
/**
 * 学生类
 * @author Heroine
 *
 */
public class Student implements Serializable{
	private Integer sid;
	private String sname;
	//多个学生对应一个班级  一个班级对象
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
