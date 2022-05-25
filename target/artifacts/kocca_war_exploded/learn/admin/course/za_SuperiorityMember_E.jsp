<%
/**
 * file name : za_SuperiorityMember_E.jsp
 * date      :
 * programmer:
 * function  : ��� ȸ�� ����� ����Ʈ ���� ȭ��
 */
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%
	response.setContentType("application/vnd.ms-text");
	response.setHeader("Content-Disposition", "inline; filename=za_SuperiorityMember_E.xls");
	  response.setHeader("Content-Description", "JSP Generated Data");
	  
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    int     v_pageno    = box.getInt("p_pageno");
	String v_membergubun = box.getStringDefault("p_membergubun","P");
	String ss_userid	= box.getString("p_userid");
	String ss_username	= box.getString("p_username");
	String v_isunum		= box.getString("p_isunum");

    String  v_userid    =  "";
    String  v_name      =  "";
    String  v_email     =  "";

	String v_dispnum	= "";

    int     v_totalpage =  0;
    int     v_rowcount  =  0;
    int     v_rowspan   =  0;
    int     v_total     =  0;
    int     i           =  0;

    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
    String  v_orderColumn  = box.getString("p_orderColumn");           //������ �÷���

    ArrayList list      = null;

    String  ss_action    = box.getString("s_action");
    String  v_ongo      = "whenSelection('go')";


    if (ss_action.equals("go")) {    //go button ���ýø� list ���
        list = (ArrayList)request.getAttribute("selectList");
    }

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
	<tr>
		<td align="center" height="30"><font size="3"><b>���ȸ�� ����Ʈ</b></font></td>
	</tr>
  <tr>
    <td align="center" valign="top">
        <!----------------- ����������ȸ ���� ----------------->
        <table cellspacing="1" cellpadding="5" border="1">
          <tr>
            <td></td>
          </tr>
          <tr>
            <td width="10%"><b>No</b></td>
            <td width="20%"><b>ȸ������</b></td>
            <td width="25%"><b>ID</b></td>
            <td width="35%"><b>����</b></td> 
          </tr>
        <%
            if (ss_action.equals("go")) {    //go button ���ýø� list ���
                for(i = 0; i < list.size(); i++) 
				{
					DataBox dbox = (DataBox)list.get(i);

                    v_userid        = dbox.getString("d_userid");
                    v_name          = dbox.getString("d_name");
                    v_email         = dbox.getString("d_email");
                    //v_ismailing     = dbox.getString("d_ismailing");
                    v_membergubun	= dbox.getString("d_membergubun");

					v_dispnum		= dbox.getString("d_dispnum");
                    v_totalpage     = dbox.getInt("d_totalpage");
                    v_rowcount      = dbox.getInt("d_rowcount");

					//ȸ������
					if(v_membergubun.equals("C")) {v_membergubun = "���";}
					else if(v_membergubun.equals("U")) {v_membergubun = "����";}
					else  {v_membergubun = "����";}

               %>
        <tr>
            <td ><%= (i + 1) %></td>
            <td ><%= v_membergubun %></td>
            <td ><%= v_userid %></a></td>
            <td ><%= v_name %></td>
        </tr>
         <%
               }
            }
         if(i == 0 && ss_action.equals("go")){ %>
              <tr>
                <td class="table_02_1" colspan="4">��ϵ� ������ �����ϴ�</td>
              </tr>
        <% } %>
			 </table>
      </td>
  </tr>
</table>
</body>
</html>