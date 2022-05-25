<%
/**
 * file name : za_Finish_E.jsp
 * date      : 2005/10
 * programmer:
 * function  : ����ó�� ����Ʈ �� ó��
 */
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%
	response.setContentType("application/vnd.ms-text");
	response.setHeader("Content-Disposition", "inline; filename=FinishList.xls");   
	response.setHeader("Content-Description", "JSP Generated Data");
	
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getStringDefault("s_grseq","ALL");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����
	  String  v_action       = box.getString("p_action");

   	ArrayList list = null;
   	list = (ArrayList)request.getAttribute("CompleteListExcel");
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���

	int is_complete		= 0;    // ���Ῡ��
	String v_subjnm		= "";
	String v_isclosed	= "";
	String v_approval	= "";
	String v_approvalstatus	= "";
	String v_isonoff	= "";
	String v_subj		= "";
	String v_year		= "";
	String v_subjseq	= "";
	String v_stolddate	= ""; // ����ó����            	
	String v_isoutsrc	= ""; // ���־�ü            	
	String v_subjseqgr	= "";
	String v_eduend		= "";
	String v_date		= "";
	String v_course		= "";
	String v_coursenm	= "";
	String v_tmp_subj	= "";
	String v_iscourseYn	= "";
	String v_finalString = "";
	int		v_subjcnt	= 0;
	int		v_usercnt	= 0;
	int		l			= 0;
	int    v_student  = 0;
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr>
    <td>
      <table border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
        <tr>
          <td align="center" bgcolor="#FFFFFF">

            <!----------------- ���հ��� ���κ� ����ó�� ���� ----------------->
			<table border="1" cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td rowspan="2" width="5%" class="table_title">NO</td>
          <!--td rowspan="2" class="table_title" width="40">����</td-->
		  <td rowspan="2" class="table_title" colspan="2">����</td>
          <td rowspan="2" class="table_title">����</td>
          <td rowspan="2" class="table_title" width="90">�����Ⱓ</td>
          <td colspan="3" class="table_title">�ο�</td>
          <td rowspan="2" class="table_title">����ó��</td>
          <td rowspan="2" class="table_title">���������� ����ó��</td>
          <!--td rowspan="2" class="table_title">���־�ü<br>������</td>
          <td rowspan="2" class="table_title">���־�ü<br>�������</td-->
        </tr>
        <tr> 
          <td class="table_title">����</td>
          <td class="table_title">����</td>
          <td class="table_title">�̼���</td>
        </tr>
			  <% 
			
			for (int i=0; i<list.size(); i++) {
            	DataBox dbox = (DataBox)list.get(i); 
            	is_complete = 0;    // ���Ῡ��
            	v_subjnm	= dbox.getString("subjnm");
            	v_isclosed	= dbox.getString("isclosed");
            	v_approval	= dbox.getString("d_approvalstatus");
            	v_student	= dbox.getInt("d_studentcnt");            	
            	v_isonoff	= dbox.getString("d_isonoff");
            	v_subj		= dbox.getString("d_subj");
            	v_year		= dbox.getString("d_year");
            	v_subjseq	= dbox.getString("d_subjseq");
            	v_stolddate = dbox.getString("d_stolddate"); // ����ó����            	
            	v_isoutsrc	= dbox.getString("d_isoutsourcing"); // ���־�ü
            	v_course	= dbox.getString("d_course");
				v_coursenm	= dbox.getString("d_coursenm");
				v_iscourseYn= dbox.getString("d_isbelongcourse");
				v_subjseqgr = dbox.getString("d_subjseqgr");
				v_subjcnt	= dbox.getInt("d_subjcnt");

            	if(!v_stolddate.equals(""))  v_stolddate = FormatDate.getRelativeDate(FormatDate.getFormatDate(v_stolddate,"yyyyMMdd"),1); // ����ó����+1 


                // ���Ῡ��          
                if (!v_eduend.equals(""))
                    if (Integer.parseInt(v_date) > Integer.parseInt(v_eduend)) is_complete=1;
			  %>
        <tr> 
          <td class="table_01" ><%=(i+1)%></td>
          <!--td class="table_02_1"><%//=dbox.getString("isonoffnm")%></td-->
<% if(v_iscourseYn.equals("Y"))
	{ 
		if(l == v_subjcnt) v_tmp_subj = "";

		if(!v_tmp_subj.equals(v_course) && !v_tmp_subj.equals("000000"))
		{
			l = 1;
			v_usercnt++;
			%>
          <td class="table_02_2" rowspan="<%=v_subjcnt%>"><%=v_coursenm%></td>
          <td class="table_02_2"><%=v_subjnm%></td>
<%	
			v_tmp_subj = v_course;
		}else{ 
			l++;
		%>	
          <td class="table_02_2"><%=v_subjnm%></td>
<%		}
	} else { 
			v_usercnt++;%>
          <td class="table_02_2" colspan="2"><%=v_subjnm%></td>
<% } %>
          <td class="table_02_1"><%=StringManager.cutZero(dbox.getString("subjseqgr"))%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(dbox.getString("edustart"),"yyyy/MM/dd")%>~<%=FormatDate.getFormatDate(dbox.getString("eduend"),"yyyy/MM/dd")%></td>
          <td class="table_02_1"><%=v_student%></td>		<!--����-->
          <td class="table_02_1"><%=dbox.getInt("d_stoldycnt")%></td>			<!--����-->
          <td class="table_02_1"><%=dbox.getInt("d_stoldncnt")%></td>			<!--�̼���-->
          <td class="table_03_1" bgcolor="#FFFFCC"><!-- 1����ó�� -->
          <% if (is_complete==1) { %>
              <% if (v_isclosed.equals("Y")){ %><!--����-->
                  <% if ( !v_stolddate.equals("") && Integer.parseInt(v_stolddate) >= Integer.parseInt(v_date) ){ %><!--����ó����+1 ���� ����ó����� ��ư Ȯ��-->
                    <% if(v_isoutsrc.equals("N")){%>
         			    <% if(v_isonoff.equals("ON")){%>
                        �������
                        <%}else{%>
                        �������
                        <%}%>
                    <%}else{%>
                      �������
                    <%}%>
                  <% }else{%>      
                    ����Ϸ�
                  <% }%>
                    
              <% }else{ %><!--�̼���-->
                 <% if(v_isoutsrc.equals("N")){%>
                    <%if(v_isonoff.equals("ON")){%>
                      ����ó��
                    <%}else{%>
                      ����ó��
                    <%}%>
                  <%}else{%>
                      ����ó��
                  <%} %>
              <% } %>
              
          <% }else{ %>
              <% if (v_isclosed.equals("N")){ %>
                <%if(v_isoutsrc.equals("N")){%>
                 ��������
                <%}else{%>
                  -
                <%}%>
              <% }else{%>
            	  ����Ϸ�
              <% }%>
          <% } %>
          </td> 
      	  <!--<td class="table_02_1"><%if (v_approval.equals("Y")) out.print("����Ϸ�"); else if (v_approval.equals("B")) out.print("�����"); else out.print("");%></td>--> <!-- ���� ���� -->
      	  <td class="table_02_1"><%=dbox.getString("isoutsourcing")%></td> <!-- ��Ź�������� -->
      	  <!--td class="table_02_1"><%=dbox.getString("iscpresult")%></td--> <!-- ���־�ü������ -->
      	  <!--td class="table_02_1"><%=dbox.getString("iscpflag")%></td--> <!-- ���־�ü������� -->
        </tr>

<%  }  %>
			</table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
