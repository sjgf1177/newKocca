<%@ page language = "java" contentType = "text/html; charset=euc-kr" pageEncoding = "euc-kr" %>
<%@ page import = "com.credu.mobile.common.MenuMobileBean" %>
<%
	String s_userid = box.getSession("userid");
	String s_resno = box.getSession("resno");
	String s_name = box.getSession("name");
	
	String v_menuid = box.getString("p_menuid");
	
	MenuMobileBean menubean = new MenuMobileBean();
	
	DataBox menuInfo= (DataBox)menubean.getMenuUserData(box);
	if(menuInfo == null) menuInfo = new DataBox("request");
	
	// Title
	StringBuffer v_title = new StringBuffer();
	
	if(!menuInfo.getString("d_menunm").equals(""))
		v_title.append(menuInfo.getString("d_menunm") + " &gt; ");
	
	if(!menuInfo.getString("d_depth2nm").equals(""))
		v_title.append(menuInfo.getString("d_depth2nm") + " &gt; ");
	
	if(!menuInfo.getString("d_depth1nm").equals(""))
		v_title.append(menuInfo.getString("d_depth1nm") + " &gt; ");
	
	v_title.append("�ѱ���������ī����");
	
	// Title �������̳� �Խ��� ������� �ʿ��� ���
	String v_title_detail = "";	
	
	
	// MENU IMG
	StringBuffer v_menuimg = new StringBuffer(); 
	
	// MENU NM
	String v_menunm = menuInfo.getString("d_menunm");
	
	// DIRECTORY
	String v_directory = menuInfo.getString("d_directory");		
	
	// DISTCODE
	String v_distcode = menuInfo.getString("d_distcode");			
	
	//levels 
	int v_levels = menuInfo.getInt("d_levels");	
	
	//����
	String v_etc = menuInfo.getString("d_etc");
	
	// Line Map
	StringBuffer v_map = new StringBuffer();
	
	//v_map.append("Ȩ");
	if(!menuInfo.getString("d_depth1nm").equals(""))
	{
		v_map.append(menuInfo.getString("d_depth1nm"));
	}
	if(!menuInfo.getString("d_depth2nm").equals(""))
	{	
		v_map.append(menuInfo.getString("d_depth2nm"));
		
	}
	if(!menuInfo.getString("d_depth3nm").equals(""))
	{	
		v_map.append(menuInfo.getString("d_depth3nm"));
	}
	if(!menuInfo.getString("d_depth4nm").equals(""))
	{	
		v_map.append(menuInfo.getString("d_depth4nm"));
		
	}
	if(!menuInfo.getString("d_menunm").equals(""))
	{
		v_map.append(" <br/>" + menuInfo.getString("d_menunm"));
	}
	//v_dmap.append(" &gt; <span class=\"now\">�����󼼺���</span>");
	
	if(!menuInfo.getString("d_menuimg").equals("") && menuInfo.getString("d_menuimg") != null)
	{
		v_menuimg.append("/images/user/img/" + menuInfo.getString("d_menuimg"));
	}	
%>	