<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<%//@ page language="java" contentType="application/vnd.ms-excel;name=My_Excel;charset=euc-kr" %>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
System.out.println("1");
	response.setContentType("application/vnd.ms-text");
	response.setHeader("Content-Disposition", "inline; filename=za_SpotStudyListByUser_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

	//DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

	ArrayList list = (ArrayList)request.getAttribute("completeList");

	String v_subjnm = "";
    String v_membergubun = "";
    String v_userid = "";
    String v_name = "";
    String v_edustart = "";
    String v_edulatest = "";
    String v_eduend = "";
    String v_tstep = "";
    String v_isgraduated = "";
%>
<HTML>
<HEAD>
<TITLE></TITLE>

</HEAD>

<BODY leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" >

      <!----------------- �����׷캰 �н���Ȳ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out" border="1">
        <tr>
          <td colspan="10" class="table_top_line"></td>
        </tr>
          <tr>
            <td class="table_title" width="5%"><b>NO</b></td>
            <td class="table_title" width="17%"><b>����</b></td>
            <td class="table_title" width="6%"><b>ȸ������</b></td>
            <td class="table_title" width="8%"><b>ID</b></td>
            <td class="table_title" width="5%"><b>����</b></td>
            <td class="table_title" width="9%"><b>�н�������</b></td>
            <td class="table_title" width="9%"><b>�ֱ��н���</b></td>
            <td class="table_title" width="7%"><b>������</b></td>
            <td class="table_title" width="9%"><b>�н�������</b></td>
            <td class="table_title" width="6%"><b>���Ῡ��</b></td>
          </tr>

<%

		if(list.size() != 0 ){						//������ �ִٸ�
		    if (box.getString("s_action").equals("go")) {
		    	for(int i = 0; i < list.size(); i++) {
		    		DataBox dbox = (DataBox)list.get(i);
		            v_subjnm       = dbox.getString("d_subjnm");
		            v_membergubun = dbox.getString("d_membergubun");
		            v_userid       = dbox.getString("d_userid");
		            v_name         = dbox.getString("d_name");
		            v_edustart     = dbox.getString("d_edustart");
		            v_eduend       = dbox.getString("d_eduend");
		            v_tstep        = dbox.getString("d_tstep");
		            v_edulatest    = dbox.getString("d_edulatest");
		            v_isgraduated  = dbox.getString("d_isgraduated_txt");
		            v_edustart = FormatDate.getFormatDate(v_edustart,"yyyy.MM.dd");
		            v_eduend = FormatDate.getFormatDate(v_eduend,"yyyy.MM.dd");
		            v_edulatest = FormatDate.getFormatDate(v_edulatest,"yyyy.MM.dd");

%>
          <tr>
            <td class="table_02_1" align="center"><%=(i+1)%></td>
			<td class="table_02_1" align="center"><%=v_subjnm%></td>
			<td class="table_02_1" align="center"><%=v_membergubun%></td>
			<td class="table_02_1" align="center"><%=v_userid%></td>
			<td class="table_02_1" align="center"><%=v_name%></td>
			<td class="table_02_1" align="center"><%=v_edustart%></td>
			<td class="table_02_1" align="center"><%=v_edulatest%></td>
			<td class="table_02_1" align="center"><%=v_tstep%></td>
			<td class="table_02_1" align="center"><%=v_eduend%></td>			
			<td class="table_02_1" align="center"><%=v_isgraduated%></td>
          </tr>

<%
		    	}
	    	}
		}else{		//������ ���ٸ�
%>
              <tr>
                <td align="center" bgcolor="#F7F7F7" height="50" colspan="10">��ϵ� ������ �����ϴ�</td>
              </tr>
<%
		} 
%>
      </table>
      <!----------------- �����׷캰 �н���Ȳ �� ----------------->

</body>
</HTML>

