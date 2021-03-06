package bishe.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bishe.dao.MessageDao;
import bishe.model.Message;








public class MessageDaoImpl extends HibernateDaoSupport implements  MessageDao{


	public void deleteBean(Message Message) {
		this.getHibernateTemplate().delete(Message);
		
	}

	public void insertBean(Message Message) {
		this.getHibernateTemplate().save(Message);
		
	}

	@SuppressWarnings("unchecked")
	public Message selectBean(String where) {
		List<Message> list = this.getHibernateTemplate().find("from Message " +where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public int selectBeanCount(String where) {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from Message "+where).get(0);
		return (int)count;
	}

	@SuppressWarnings("unchecked")
	public List<Message> selectBeanList(final int start,final int limit,final String where) {
		return (List<Message>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<Message> list = session.createQuery("from Message "+where)
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public void updateBean(Message Message) {
		this.getHibernateTemplate().update(Message);
		
	}
	
	
}
