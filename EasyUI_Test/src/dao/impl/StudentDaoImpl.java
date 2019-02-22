package dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import pojo.Student;
import dao.StudentDao;

public class StudentDaoImpl implements StudentDao{
	private HibernateTemplate ht;
	
	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}

	@SuppressWarnings("unchecked")//抑制警告
	@Override
	public List<Student> findList(final int start,final int end) {
		
		//不需要手动关闭session
		return this.ht.executeFind(new HibernateCallback<List<Student>>() {

			@Override
			public List<Student> doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql="from Student s left join fetch s.classInfo c";
				Query query=session.createQuery(hql);
				query.setFirstResult(start);
				query.setMaxResults(end);
				return query.list();
			}
		});
		
		
		/*String hql="from Student s left join fetch s.classInfo";
		Query query= this.ht.getSessionFactory().openSession().createQuery(hql);
		query.setFirstResult(start);
		query.setMaxResults(end);
		return query.list();*/
	}

	@Override
	public int getTotal() {
		String hql="from Student s left join fetch s.classInfo";
		return ht.find(hql).size();
	}

	@Override
	public int delById(int sid) {
		int row=0;
		try {
			ht.get(Student.class, sid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return row;
	}

	@Override
	public int addInfo(Student stu) {
		int row=0;
		try {
			ht.get(Student.class, stu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return row;
	}

	@Override
	public int modInfo(Student stu) {
		int row=0;
		try {
			ht.get(Student.class, stu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return row;
	}

}
