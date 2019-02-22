package service.impl;

import java.util.List;

import pojo.Student;

import dao.StudentDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import service.StudentService;

public class StudentServiceImpl implements StudentService{
	//引用StudentDao
	private StudentDao studentDao;
	
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	@Override
	public JSONObject findDataForJson(int pageIndex,int pageSize) {
		//创建JSONObject
		JSONObject obj=new JSONObject();
		//调用查询方法
		List<Student> list=studentDao.findList((pageIndex-1)*pageSize,pageSize);
		//将集合转换成JSON数据 保证必须有两个key 分别为total和rows
		obj.put("total", findCount());
		//借助JSONArray将集合转换成数组
		obj.put("rows", JSONArray.fromObject(list).toString());
		return obj;
	}

	@Override
	public int findCount() {
		return studentDao.getTotal();
	}

	@Override
	public int delStuById(int sid) {
		return studentDao.delById(sid);
	}

	@Override
	public int addStudent(Student stu) {
		return studentDao.addInfo(stu);
	}

	@Override
	public int modStudent(Student stu) {
		return studentDao.modInfo(stu);
	}

}
