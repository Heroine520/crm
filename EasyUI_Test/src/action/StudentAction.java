package action;

import pojo.Student;
import service.StudentService;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentAction extends ActionSupport implements ModelDriven<Student>{
	//����Studnet���� ��ɾ��ͨ��
	Student stu=new Student();
	//��ɾ��ͨ�÷���
	private String result="error";
	
	//����easyui�ķ�ҳ���� 
	private Integer page;//��ǰҳ��
	private Integer rows;//ҳ���С
	//�û����淵�ص�json����
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

	//��ѯ
	public String show() {
		obj= studentService.findDataForJson(page,rows);
		return "success";
	}
	//ɾ��
	public String remove() {
		int count=studentService.delStuById(stu.getSid());
		if (count>0) {
			result="suc";
		}
		return "success";
	}
	//����
	public String inert() {
		int count=studentService.addStudent(stu);
		if (count>0) {
			result="suc";
		}
		return "success";
	}
	//�޸�
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
