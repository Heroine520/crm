package dao;

import java.util.List;

import pojo.Student;

public interface StudentDao {
	//��ѯ����
	public List<Student> findList(int start,int end);
	//��ѯ����
	public int getTotal();
	//ɾ��
	public int delById(int sid);
	//����
	public int addInfo(Student stu);
	//�޸�
	public int modInfo(Student stu);
}
