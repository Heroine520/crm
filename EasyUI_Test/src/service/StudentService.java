package service;

import pojo.Student;
import net.sf.json.JSONObject;

public interface StudentService {
	//在色绿i邪恶层将数据保存到jsonObject对象中
	public JSONObject findDataForJson(int pageIndex,int pageSize);
	public int findCount();
	//删除
	public int delStuById(int sid);
	//增加
	public int addStudent(Student stu);
	//修改
	public int modStudent(Student stu);
}
