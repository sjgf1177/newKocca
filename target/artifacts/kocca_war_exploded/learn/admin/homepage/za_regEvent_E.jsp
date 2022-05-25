<%
//**********************************************************
//  1. ��      ��: ������������������
//  2. ���α׷���: za_SubjGong_L.jsp
//  3. ��      ��: ���ð��������� ���� ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 23
//  7. ��      ��:
//**********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.dunet.common.util.*" %>
  
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    response.setHeader("Content-Disposition", "attachment; filename=za_regEvent_E.xls");
    response.setHeader("Content-Description", "JSP Generated Data");
	
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");
    int     v_totalrowcount =  0;

    int     v_seq       = 0;
    String  v_title     = "";
    String  v_strdate   = "";
    String  v_enddate   = "";
    String  v_answer    = "";
    String  v_userid    = "";
    String  v_name      = "";
    String  v_handphone = "";
    String  v_email     = "";
    String  v_addr      = "";
    String  v_addr2     = "";
    String  v_win_yn    = "";
    String  v_indate    = "";
    String	v_job		= "";
    String 	v_ldate		= "";
    String 	v_jobdate	= "";
        
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    
    ArrayList selectRegList    = (ArrayList)request.getAttribute("selectList");       // �̺�Ʈ ��û�� ����Ʈ

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body>
    <table border=1>
          <tr>            
          	<td><b>NO</b></td>
          	<td><b>����</b></td>
          	<td><b>���̵�</b></td>
            <td><b>ȸ��</b></td>
            <td><b>�����</b></td>
            <td><b>�����</b></td>
            <td><b>�ڵ���</b></td>
            <td><b>E-Mail</b></td>
            <td><b>�ּ�</b></td>
          </tr>

          <%
            for(int i = 0; i < selectRegList.size(); i++) {

                DataBox dbox = (DataBox)selectRegList.get(i);
                
                v_dispnum   = dbox.getInt("d_dispnum");
                v_userid    = dbox.getString("d_userid");
                v_name      = dbox.getString("d_name");
                v_handphone = dbox.getString("d_handphone");
                v_email     = dbox.getString("d_email");
                v_addr      = dbox.getString("d_addr");
                v_addr2     = dbox.getString("d_addr2");
                v_job		= dbox.getString("d_job");
                v_ldate		= dbox.getString("d_ldate");
                v_jobdate	= dbox.getString("d_jobdate");
                
%>
          <tr>                    
          	<td><%=v_dispnum%></td>          	
            <td><%=v_name%></td>  
            <td><%=v_userid%></td>
            <td><%=v_job%></td>
            <td><%=FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd")%></td>
            <td><%=FormatDate.getFormatDate(v_jobdate,"yyyy/MM/dd")%></td>
            <td><%=v_handphone%></td>
            <td><%=v_email%></td>
            <td><%=v_addr + v_addr2%></td>
          </tr>
<%
        }
%>
        </table>
      
</body>
</html>

