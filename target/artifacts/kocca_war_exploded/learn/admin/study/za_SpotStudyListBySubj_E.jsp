<%
//**********************************************************
//  1. ��      ��: LEARNING STATUS EXCEL BY GRCODE
//  2. ���α׷���: za_LearningStatusByGrcode_E.jsp
//  3. ��      ��: �����ְ��� �н���Ȳ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.1.28
//  7. ��      ��:
//***********************************************************
%>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<%//@ page language="java" contentType="application/vnd.ms-excel;name=My_Excel;charset=euc-kr" %>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
	response.setContentType("application/vnd.ms-text");
	response.setHeader("Content-Disposition", "inline; filename=za_SpotStudyListBySubj_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

	//DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

	ArrayList list = (ArrayList)request.getAttribute("spotBySubjList");

	String v_subjnm = "";
    String v_tstep = "";
    String v_graduate = "";
    String v_edu = "";
    String v_compl_rate = "";

%>
<HTML>
<HEAD>
<TITLE></TITLE>

</HEAD>

<BODY leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" >

      <!----------------- �����׷캰 �н���Ȳ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out" border="1">
        <tr>
          <td colspan="6" class="table_top_line"></td>
        </tr>
          <tr>
            <td class="table_title" rowspan="2" width="5%"><b>NO</b></td>
            <td class="table_title" rowspan="2" width="27%"><b><a href="javascript:ordering('type')" class="e">����</a></b></td>
            <td class="table_title" colspan="2" width="10%"><b><a href="javascript:ordering('name')" class="e">�ο�</a></b></td>
            <td class="table_title" rowspan="2" width="7%"><b><a href="javascript:ordering('indate')" class="e">���������</a></b></td>
            <td class="table_title" rowspan="2" width="5%"><b><a href="javascript:ordering('upfile')" class="e">������</a></b></td>
          </tr>
		  <tr> 
	          <td width="10%" height="25" class="table_title"><b>����</b></td>
	          <td width="10%" class="table_title"><b>����</b></td>
	      </tr>

<%
			if(list.size() != 0 ){						//������ �ִٸ�
				for(int i = 0; i < list.size(); i++) {
                	DataBox dbox = (DataBox)list.get(i);
            		v_subjnm = dbox.getString("d_subjnm");
            		v_tstep  = dbox.getString("d_tstep");
            		v_edu    = dbox.getString("d_edu");
            		v_graduate = dbox.getString("d_graduate");
            		v_compl_rate    = dbox.getString("d_compl_rate");
%>
          <tr>
             <td class="table_02_1" align="center"><%=(i+1)%></td>
             <td class="table_02_1" align="center"><%=v_subjnm%></td>
             <td class="table_02_1" align="center"><%=v_edu%></td>
             <td class="table_02_1" align="center"><%=v_graduate%></td>
             <td class="table_02_1" align="center"><%=v_tstep%></td>
             <td class="table_02_1" align="center"><%=v_compl_rate%></td>
          </tr>

<%
				}
		}else{		//������ ���ٸ�
%>
              <tr>
                <td align="center" bgcolor="#F7F7F7" height="50" colspan="6">��ϵ� ������ �����ϴ�</td>
              </tr>
<%
		} 
%>
      </table>
      <!----------------- �����׷캰 �н���Ȳ �� ----------------->

</body>
</HTML>

