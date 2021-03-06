package bishe.action;


import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bishe.dao.MessageDao;
import bishe.dao.UserDao;
import bishe.model.Message;
import bishe.model.User;
import bishe.util.Pager;
import bishe.util.Util;

import com.opensymphony.xwork2.ActionSupport;

public class ManageAction extends ActionSupport{
	
	
	private static final long serialVersionUID = -4304509122548259589L;
	
	private UserDao userDao;
	
	private String url = "./";
	
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	//程序入口界面
	public String index(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user==null){
			int zaixianrenshu = userDao.selectBeanCount(" where dengluzhuangtai='已登录' ");
			request.setAttribute("zaixianrenshu",zaixianrenshu );
			return "success2";
		}else{
			return "success1";
		}
	}
	
	
	//用户注册操作
	public void register() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		
		User user = new User();
		
		user.setUsername(request.getParameter("username"));
		
		user.setPassword(request.getParameter("password"));
		
		user.setTruename(request.getParameter("truename"));
		
		user.setPhone(request.getParameter("phone"));
		
		user.setEmail(request.getParameter("email"));
		
		user.setQq(request.getParameter("qq"));
		
		user.setXingbie(request.getParameter("xingbie"));

		user.setCreatetime(new Date());
		
		user.setTouxiang("touxiang.jpg");
		
		User u = userDao.selectBean(" where username='"+user.getUsername()+"'");
		
		if(u==null){
			userDao.insertBean(user);
			response.setCharacterEncoding("gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('注册成功，您的用户名是"+user.getUsername()+",请妥善保管');window.location.href='index';</script>");
		}else{
			response.setCharacterEncoding("gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('注册失败！该用户名已经存在！');window.location.href='register.jsp';</script>");
		}
		
	}
	
	
	//用户登录操作
	public String login() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = userDao.selectBean(" where username = '"+username +"' and password= '"+password +"' and userlock=0 ");
		if (user!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			user.setDengluzhuangtai("已登录");
			userDao.updateBean(user);
			
			Message bean =  messageDao.selectBean(" where user.id= "+user.getId());
			if(bean !=null){
				messageDao.deleteBean(bean);
			}
			bean = new Message();
			bean.setUser(user);
			messageDao.insertBean(bean);
			
			List<Message> list = messageDao.selectBeanList(0, 9999, " where user.dengluzhuangtai='已登录' ");
			for(Message message :list){
				if(message.getUser().getId()==user.getId()){
					message.setContent("["+Util.getTime3()+"]  <a href='method!touser?id="+user.getId()+"'  target='liaotian2'>"+user.getTruename() 
					+"</a><span >进入了聊天室</span><br/>");
				}else{
					message.setContent(message.getContent()+"["+Util.getTime3()+"]  <a href='method!touser?id="+user.getId()+"' target='liaotian2'>"
							+user.getTruename()+"</a><span >进入了聊天室</span><br/>");
				}
				messageDao.updateBean(message);
			}
			
			int zaixianrenshu = userDao.selectBeanCount(" where dengluzhuangtai='已登录' ");
			session.setAttribute("sessionzaixianrenshu", zaixianrenshu);
			this.setUrl("index");
			return "redirect";
		} else {
			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('用户名或者密码错误');window.location.href='login.jsp';</script>");
		}
		return null;
	}
	
	//用户退出操作
	public String loginout() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		if(user!=null){
			user.setDengluzhuangtai("未登录");
			userDao.updateBean(user);
			
			Message bean = messageDao.selectBean(" where user.id= "+user.getId());
			messageDao.deleteBean(bean);
			
			

			List<Message> list = messageDao.selectBeanList(0, 9999, " where user.dengluzhuangtai='已登录' ");
			for(Message message :list){
				message.setContent(message.getContent()+"["+Util.getTime3()+"]  "+user.getTruename()+"：<span >离开了聊天室</span><br/>");
				messageDao.updateBean(message);
			}
		}
		
		
		session.removeAttribute("user");
		int zaixianrenshu = userDao.selectBeanCount(" where dengluzhuangtai='已登录' ");
		request.setAttribute("zaixianrenshu",zaixianrenshu );
		this.setUrl("login.jsp");
		return SUCCESS;
	}
	
	
	//跳转到修改密码页面
	public String changepwd() {
		this.setUrl("user/password.jsp");
		return SUCCESS;
	}
	
	//修改密码操作
	public void changepwd2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		User bean = userDao.selectBean(" where username= '"+u.getUsername()+"' and password= '"+password1+"'");
		if(bean!=null){
			bean.setPassword(password2);
			userDao.updateBean(bean);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('修改成功');</script>");
		}else{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('用户名或者密码错误');</script>");
		}
	}
	
	//跳转到用户资料管理页面
	public String userupdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		User bean = userDao.selectBean(" where id= "+u.getId());
		request.setAttribute("bean", bean);
		this.setUrl("user/userupdate.jsp");
		return SUCCESS;
	}
	
	
	//跳转到更新用户资料页面
	public String userupdate3() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		User bean = userDao.selectBean(" where id= "+u.getId());
		request.setAttribute("bean", bean);
		this.setUrl("user/userupdate3.jsp");
		return SUCCESS;
	}
	
	
	//更新用户资料操作
	public void userupdate4() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		user.setTruename(request.getParameter("truename"));
		
		user.setPhone(request.getParameter("phone"));
		
		user.setEmail(request.getParameter("email"));
		
		user.setQq(request.getParameter("qq"));
		
		user.setXingbie(request.getParameter("xingbie"));

		user.setCreatetime(new Date());
		
		String path = this.uploadImg(uploadfile);
		user.setTouxiang(path);
		user.setGerenjianjie(request.getParameter("gerenjianjie"));
		
		user.setGexingqianming(request.getParameter("gexingqianming"));
		
		userDao.updateBean(user);
		
		response.setCharacterEncoding("utf-8");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!userupdate';</script>");
		
		
	}
	
	private File uploadfile;

	public File getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(File uploadfile) {
		this.uploadfile = uploadfile;
	}
	
//图片上传操作
	
	public  String  uploadImg(File uploadImg) throws IOException {
		if(uploadImg==null){
			return null;
		}
		
		String savaPath = ServletActionContext.getServletContext().getRealPath(
				"/")+ "/img/";

		String time = new java.text.SimpleDateFormat("yyyyMMddHHmmssSSS")
				.format(new Date()).toString();
		String imageFileName = time+".jpg";
		File imageFile = new File(savaPath + imageFileName);
		Util.copyFile(uploadImg, imageFile);
		return imageFileName;
	}
	
	

	private MessageDao messageDao;


	public MessageDao getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}
	
	//添加聊天内容操作
	public void messageadd() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String talkto = request.getParameter("talkto");
		String act = request.getParameter("act");
		String color = request.getParameter("color");
		String font = request.getParameter("font");
		String msg = request.getParameter("msg");
		
		String talktoid = request.getParameter("talktoid");
		
		
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		
		List<Message> list = messageDao.selectBeanList(0, 9999, " where user.dengluzhuangtai='已登录' ");
		for(Message bean :list){
			if("所有人".equals(talkto)){
				bean.setContent(bean.getContent()+"["+Util.getTime3()+"]  <a href='method!touser?id="+u.getId()+"' target='liaotian2'>"+u.getTruename() 
						+"</a>对"+talkto+act+"：" +
								"<span style='color:"+color+" ;font-size: "+font+"'>"+msg+"</span><br/>");
			}else{
				bean.setContent(bean.getContent()+"["+Util.getTime3()+"]  <a href='method!touser?id="+u.getId()+"' target='liaotian2'>"+u.getTruename() 
						+"</a>对<a href='method!touser?id="+talktoid+"' target='liaotian2'>"+talkto+"</a>"+act+"：" +
								"<span style='color:"+color+" ;font-size: "+font+"'>"+msg+"</span><br/>");
			}
			
			messageDao.updateBean(bean);
		}
	
		HttpServletResponse response = ServletActionContext.getResponse();
		
		response.setCharacterEncoding("gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>window.location.href='index';</script>");
		
		
	}
	
	//指定聊天用户
	public String touser() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		if(u.getId()==Integer.parseInt(request.getParameter("id"))){
			response.setCharacterEncoding("utf-8");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('不能指定自己为聊天对象');window.location.href='liaotian2.jsp';</script>");
			return null;
		}
		
		
		User bean = userDao.selectBean(" where dengluzhuangtai='已登录'  and id= "+request.getParameter("id"));
		if(bean==null){
			response.setCharacterEncoding("utf-8");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('该用户已退出');window.location.href='liaotian2.jsp';</script>");
			return null;
		}
		
		request.setAttribute("bean", bean);
		this.setUrl("liaotian2.jsp");
		return SUCCESS;
	}
	
	
	//清屏操作
	public void qingping() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Message message = messageDao.selectBean(" where user.id= "+user.getId());
		message.setContent("");
		messageDao.updateBean(message);
		response.setCharacterEncoding("gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>window.location.href='method!messagelist';</script>");
		
	}
	
	//聊天版信息
	public void messagelist() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Message message = messageDao.selectBean(" where user.id= "+user.getId());
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(message.getContent());
		
	}
	
	
	//在线用户信息
	public String userlist()  {
		HttpServletRequest request = ServletActionContext.getRequest();
		String truename = request.getParameter("truename");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");
		StringBuffer sb2 = new StringBuffer();
		sb2.append(" where ");

		if(truename!=null&&!"".equals(truename)){
			sb.append("truename like '%"+truename+"%'");
			sb.append(" and ");
			sb2.append("truename like '%"+truename+"%'");
			sb2.append(" and ");

			request.setAttribute("truename", truename);
		}
		
	
		sb.append("    role=0 and dengluzhuangtai='已登录' order by id desc");
		String where = sb.toString();
		sb2.append("  role=0 and dengluzhuangtai='已登录' ");
		String where2 = sb2.toString();
		
		int currentpage = 1;
		int pagesize =10;
		if(request.getParameter("pagenum")!=null){
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = userDao.selectBeanCount(where2);
		request.setAttribute("list", userDao.selectBeanList((currentpage - 1) * pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "method!userlist", "共有" + total + "条记录"));
		HttpSession session = request.getSession();
		session.setAttribute("sessionzaixianrenshu", total);
		this.setUrl("user/userlist.jsp");
		return SUCCESS;
	}
	
	
	//查看用户信息
	public String userupdate5() {
		HttpServletRequest request = ServletActionContext.getRequest();
		User bean = userDao.selectBean(" where id= "+request.getParameter("id"));
		request.setAttribute("bean", bean);
		this.setUrl("user/userupdate5.jsp");
		return SUCCESS;
	}
	
	
}
