<%
//**********************************************************
//  1. ��      ��: ����й���Ȳ
//  2. ���α׷���: za_TutorClass_L.jsp 
//  3. ��      ��: ����й���Ȳ ��ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.tutor.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");

    String v_subj		=  box.getString("p_subj");
    String v_year		=  box.getString("p_year");
    String v_subjseq	=  box.getString("p_subjseq");
    String v_class		=  box.getString("p_class");


	String  v_tuserid  =  "";
	String  v_tusernm  =  "";
	String  v_compnm   =  "";
	String  v_userid   =  "";
	String  v_usernm   =  "";
	String  v_deptnm   =  "";
	String  v_jikwinm  =  "";
    int     i          =  0;
   
	String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���

    ArrayList list      = null;
    //DEFINED class&variable END

	list = (ArrayList)request.getAttribute("TutorClassStudentList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language = "javascript">
<!--          
  
    function whenOrder(column) {
		if (document.form1.p_orderType.value == " asc") {
			document.form1.p_orderType.value = " desc";
		} else {
			document.form1.p_orderType.value = " asc";
		}

        document.form1.target = "_self";
        document.form1.action='/servlet/controller.tutor.TutorAdminServlet';
        document.form1.p_process.value = 'TutorClassStudentList';   
        document.form1.p_orderColumn.value = column;
        document.form1.submit();
    }    
-->    
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type="hidden" name="p_process" value="">
    <input type="hidden" name="p_subj" value="<%=v_subj%>">
    <input type="hidden" name="p_year" value="<%=v_year%>">
    <input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
    <input type="hidden" name="p_class" value="<%=v_class%>">
    <input type="hidden" name="p_orderColumn">
	<input type="hidden" name="p_orderType" value="<%=v_orderType%>">

	
  <table width="780" border="0" cellspacing="0" cellpadding="0" height="500">
    <tr>
    <td align="center" valign="top"> 

	  <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
            <td><img src="/images/admin/tutor/tit_name_search.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>

      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7" width="99%"></td>
              </tr>
              <tr>
                <td align="center" width="99%" valign="middle">
                  <table width="99%" cellspacing="0" cellpadding="0" class="form_table">
                    <tr>
                      <td>
						<b>����</b> : <%=GetCodenm.get_subjnm(v_subj)%>
					  </td>
                      <td>
						<b>�⵵</b> : <%=v_year%> �� 
					  </td>
                      <td>
						<b>��������</b> : <%=v_subjseq%> ��
					  </td>
					</tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7" width="99%"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br> 

	  <!----------------- �й���Ȳ��ȸ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
          <tr> 
            <td colspan="7" class="table_top_line"></td>
          </tr>
          <tr> 
            <td class="table_title">No</td>
            <td class="table_title"><a href="javascript:whenOrder('tusernm')" class="e">�����</a></td>
            <td class="table_title"><a href="javascript:whenOrder('compnm')" class="e">ȸ��</a></td>
            <td class="table_title"><a href="javascript:whenOrder('userid')" class="e">���̵�</a></td>
            <td class="table_title"><a href="javascript:whenOrder('usernm')" class="e">����</a></td>
            <td class="table_title"><a href="javascript:whenOrder('deptnm')" class="e">�μ�</a></td>
            <td class="table_title"><a href="javascript:whenOrder('jikwinm')" class="e">����</a></td>
          </tr>

<%                          					  
		for( i = 0 ; i < list.size() ; i++ ){
			DataBox dbox = (DataBox)list.get(i);		  
					
			v_tuserid	= dbox.getString("d_tuserid");
			v_tusernm	= dbox.getString("d_tusernm");
			v_compnm    = dbox.getString("d_compnm");
			v_userid    = dbox.getString("d_userid");
			v_usernm    = dbox.getString("d_usernm");
			v_deptnm    = dbox.getString("d_deptnm");
			v_jikwinm   = dbox.getString("d_jikwinm");
			
%>
			        <tr> 
			            <td class="table_02_1"><%=list.size()-i%></td>
			            <td class="table_02_1"><%=v_tusernm%></td>
			            <td class="table_02_1"><%=v_compnm%></td>
			            <td class="table_02_1"><%=v_userid%></td>
			            <td class="table_02_1"><%=v_usernm%></td>
			            <td class="table_02_1"><%=v_deptnm%></td>
			            <td class="table_02_1"><%=v_jikwinm%></td>
			         </tr>
<%		}   %>
<%if(i == 0){ %>
          <tr>
            <td class="table_02_1" colspan="7">��ϵ� ������ �����ϴ�</td>
          </tr>
<%}%>
      </table>      
      <!----------------- �԰���� ��ȸ �� ----------------->
     <br>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>      
</table>
</form>
</body>
</html>
