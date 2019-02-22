package action;

import pojo.Student;
import service.StudentService;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentAction extends ActionSupport implements ModelDriven<Student>{
	//声明Studnet对象 增删改通用
	Student stu=new Student();
	//增删改通用方法
	private String result="error";
	
	//接收easyui的分页参数 
	private Integer page;//当前页码
	private Integer rows;//页面大小
	//用户保存返回的json数据
	private JSONObject obj;
	private StudentService studentService;

	public JSONObject getObj() {
		return obj;
	}

	public void setObj(JSONObject obj) {
		this.obj = obj;
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	public Integer getPage() {
		return page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	//查询
	public String show() {
		obj= studentService.findDataForJson(page,rows);
		return "success";
	}
	//删除
	public String remove() {
		int count=studentService.delStuById(stu.getSid());
		if (count>0) {
			result="suc";
		}
		return "success";
	}
	//增加
	public String inert() {
		int count=studentService.addStudent(stu);
		if (count>0) {
			result="suc";
		}
		return "success";
	}
	//修改
	public String modify() {
		int count=studentService.modStudent(stu);
		if (count>0) {
			result="suc";
		}
		return "success";
	}
	@Override
	public Student getModel() {
		return stu;
	}
	
}
