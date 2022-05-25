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

    String v_grseqnm = "";
    String v_gyear = "";
    String v_grseq = "";
    String v_subj = "";
    String v_subjnm = "";
    String v_year = "";
    String v_subjseqgr = "";
    String v_subjseq = "";
    String v_subjseqgr_1 = "";
    String v_propstart = "";
    String v_propend = "";
    String v_edustart = "";
    String v_eduend = "";
    String v_course = "";
    String v_coursenm = "";
    String v_cyear = "";
    String v_courseseq = "";
    String v_subjcnt = "";
    String v_isonoff = "";
    String v_biyong = "";
    String v_isonoffnm = "";
    String v_rowspan_grseq = "";
    String v_cnt_propose = "";
    String v_cnt_student = "";
    String v_cnt_stold = "";
    String v_autoconfirm = "";
    String v_reviewdays = "";
    String v_studentlimit = "";
    

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
        
    
    ArrayList selectRegList    = (ArrayList)request.getAttribute("GrseqList");     

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body>
    <table border=1>
          <tr>            
          	<td><b>����</b></td>
          	<td><b>�����׷�<br/>��������</b></td>
          	<td><b>�����ڵ�</b></td>
          	<td><b>�����׷쳻<br/>��������</b></td>
          	<td><b>��û�Ⱓ</b></td>
          	<td><b>�����Ⱓ</b></td>
          	<td><b>����</b></td>
          	<td><b>��û�ο�</b></td>
          	<td><b>�����ο�</b></td>
          	<td><b>�����ο�</b></td>
          	<td><b>������</b></td>
          	<td><b>�ڵ����ο���</b></td>
          	<td><b>�����Ⱓ</b></td>          	
          </tr>
          
          <%
            for(int i = 0; i < selectRegList.size(); i++) {

                DataBox dbox = (DataBox)selectRegList.get(i);
                
                  v_grseqnm				= dbox.getString("d_grseqnm");
			      v_grseq				= dbox.getString("d_grseq");
			      v_subj				= dbox.getString("d_subj");
			      v_subjnm				= dbox.getString("d_subjnm");
			      v_year				= dbox.getString("d_year");
			      v_subjseqgr			= dbox.getString("d_subjseqgr");
			      v_subjseq				= dbox.getString("d_subjseq");
			      v_subjseqgr_1			= dbox.getString("d_subjseqgr_1");
			      v_propstart			= dbox.getString("d_propstart");
			      v_propend				= dbox.getString("d_propend");
			      v_edustart			= dbox.getString("d_edustart");
			      v_eduend				= dbox.getString("d_eduend");
			      v_course				= dbox.getString("d_course");
			      v_coursenm			= dbox.getString("d_coursenm");
			      v_cyear				= dbox.getString("d_cyear");
			      v_courseseq			= dbox.getString("d_courseseq");
			      v_subjcnt				= dbox.getString("d_subjcnt");
			      v_isonoff				= dbox.getString("d_isonoff");
			      v_biyong				= dbox.getString("d_biyong");
			      v_isonoffnm			= dbox.getString("d_isonoffnm");
			      v_rowspan_grseq		= dbox.getString("d_rowspan_grseq");
			      v_cnt_propose			= dbox.getString("d_cnt_propose");
			      v_cnt_student			= dbox.getString("d_cnt_student");
			      v_cnt_stold  			= dbox.getString("d_cnt_stold");
			      v_autoconfirm  		= dbox.getString("d_autoconfirm");
			      v_reviewdays 			= dbox.getString("d_reviewdays");
			      v_studentlimit		= dbox.getString("d_studentlimit");
%>
          <tr>          	
             	  <td><%= v_subjnm %></td>			
			      <td><%= v_grseq %></td>				
			      <td><%= v_subj %></td>
			      <td><%= v_subjseqgr %></td>
			      <td><%= FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd")%> ~ <%=FormatDate.getFormatDate(v_propend,"yyyy/MM/dd") %></td>
			      <td><%= FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")%> ~ <%=FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd") %></td>
			      <td><%= v_studentlimit %></td>
			      <td><%= v_cnt_propose %></td>
			      <td><%= v_cnt_student %></td>
			      <td><%= v_cnt_stold %></td>
			      <td><%= v_biyong %></td>
			      <td><%= v_autoconfirm %></td>
			      <td><%= v_reviewdays %></td>			      				
          </tr>
<%
        }
%>
        </table>
      
</body>
</html>

