package service;

import pojo.Student;
import net.sf.json.JSONObject;

public interface StudentService {
	//��ɫ��iа��㽫���ݱ��浽jsonObject������
	public JSONObject findDataForJson(int pageIndex,int pageSize);
	public int findCount();
	//ɾ��
	public int delStuById(int sid);
	//����
	public int addStudent(Student stu);
	//�޸�
	public int modStudent(Student stu);
}
