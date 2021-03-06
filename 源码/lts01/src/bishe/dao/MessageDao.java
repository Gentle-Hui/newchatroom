package bishe.dao;

import java.util.List;

import bishe.model.Message;

public interface MessageDao  {
	
	
	
	public void insertBean(Message Message);
	
	public void deleteBean(Message Message);
	
	public void updateBean(Message Message);

	public Message selectBean(String where);
	
	public List<Message> selectBeanList(final int start, final int limit,final String where);
	
	public int selectBeanCount(final String where);
	
	
}
