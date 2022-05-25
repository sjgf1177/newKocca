<%
//**********************************************************
//  1. ��      ��: ȸ�� �˻� ����Ʈ
//  2. ���α׷��� : searchGrpComp.jsp
//  3. ��      ��: ȸ�� �˻� ����Ʈ(�˾�)
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 16
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.budget.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process = box.getString("p_process");
    String  v_id	  = box.getString("p_id");
    
    int  v_pageno     = box.getInt("p_pageno");
    if (v_pageno == 0) v_pageno = 1;

    String  v_tutorgubun    = box.getStringDefault("p_tutorgubun","I"); //���籸��(I:�系����,O:��ܰ���,C:�������
    String  v_searchtext 	= box.getStringDefault("p_searchtext","");

	System.out.println("v_tutorgubun="+v_tutorgubun);

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������

    ArrayList list = (ArrayList)request.getAttribute("searchTutorList");
%>
<html>
<head>
<title>�� ȸ�� ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/hhi_lib.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function init() {
        //this.moveTo(0,0);
        //this.resizeTo(560,470);
    }

    function selectTutor(tutorGubun , tutorName, tutorID ) {
        opener.receiveTutor('<%=v_id%>', tutorGubun , tutorName, tutorID);
        self.close();
    }

    function enter(e) {
        if (e.keyCode =='13'){
            search();
        }
    }

    function search() {
    	 document.form1.target = "_self";
         document.form1.action = "/servlet/controller.budget.BudgetAdminServlet";
         document.form1.p_process.value = "searchTutor";
         document.form1.submit();
    }

    function go(index) {
    	 document.form1.target = "_self";
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.budget.BudgetAdminServlet";
         document.form1.p_process.value = "searchTutor";
         document.form1.submit();
    }

    function goPage(pageNum) {
    	 document.form1.target = "_self";
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.budget.BudgetAdminServlet";
         document.form1.p_process.value = "searchTutor";
         document.form1.submit();
    }
    
    function insertComp() {
   		window.self.name = "winCompInsert";
	    farwindow = window.open("", "openWinTutorInsert", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 980, height = 680, top=0, left=0");
	    document.form1.target = "openWinTutorInsert";
	    document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
	    document.form1.p_process.value="OutCompInsertPage";
	    document.form1.submit();
	    
	    farwindow.window.focus();
	    document.form1.target = window.self.name;
    }
    
    function insertTutor() {
		window.self.name = "winTutorInsert";
	    farwindow = window.open("", "openWinTutorInsert", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 980, height = 680, top=0, left=0");
	    document.form1.target = "openWinTutorInsert";
	    document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
	    document.form1.p_process.value="SaneTutorInsertPage";
	    document.form1.submit();
	    
	    farwindow.window.focus();
	    document.form1.target = window.self.name;    
    }

	function insert() {
		if (document.form1.p_tutorgubun.value=="C") {
			insertComp();
		} else {
			insertTutor();
		}
	}
//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onLoad='init();'>
<form name="form1" method="post">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_pageno"  value="<%=v_pageno%>">
    <input type="hidden" name="p_id"	  value="<%=v_id%>">
    <input type="hidden" name="p_pagegubun"	  value="popup">

<table width="582" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr>
    <td><table width="580" height="420" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
        <tr>
          <td align="center" valign='top' bgcolor="#FFFFFF">
            <table width="570" height="26" border="0" cellpadding="0" cellspacing="0">
              <tr>
              <tr>
                <td height="10"></td>
              </tr>
                <td align="right"> 
				����: <select name="p_tutorgubun">
						<option value="I" <%if (v_tutorgubun.equals("I")) out.print("selected"); %>>�系����</option>
						<option value="O" <%if (v_tutorgubun.equals("O")) out.print("selected"); %>>��ܰ���</option>
						<option value="C" <%if (v_tutorgubun.equals("C")) out.print("selected"); %>>�������</option>
					</select>
				�̸�/��������� :
                  <input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>" onkeypress=enter(event)>
                </td>
                <td width="45" align="right" valign="bottom">
                	<a href="javascript:search()"><img src="/images/admin/system/search1_butt.gif" border="0"></a>
                </td>
				<td width="45" align="right" valign="bottom">
                	<a href="javascript:insert()"><img src="/images/admin/button/btn_apply.gif" border="0"></a>
                </td>
              </tr>
              <tr>
                <td height="3"></td>
              </tr>
            </table>
              <table width="570" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td colspan="8" class="table_top_line"></td>
                </tr>
                <tr> 
                  <td width="5%" class="table_title"><b>NO</b></td>
                  <td width="20%" class="table_title"><b>���/����ڹ�ȣ</b></td>
                  <td width="30%" class="table_title"><b>����/���������</b></td>
                  <td width="20%" class="table_title"><b>���Ǻо�</b></td>
                  <td width="30%" class="table_title"><b>�Ҽ�</b></td>
                </tr>
                <%
                String v_userid    		= ""; //���/����ڹ�ȣ
                String v_name  			= ""; //����/���������
                String v_subjclassnm  	= ""; //���Ǻо�
                String v_compnm  		= ""; //�Ҽ�/��Ϻμ�
                
	            for(int i = 0; i < list.size(); i++) {
					DataBox dbox 	= (DataBox)list.get(i); 
					v_userid 		= dbox.getString("d_userid");
					v_name 			= dbox.getString("d_name");
					v_subjclassnm 	= dbox.getString("d_subjclassnm");
					v_compnm 		= dbox.getString("d_compnm");

				%>
                <tr> 
                  <td class="table_02_1"><%=(i+1)%></td>
                  <td class="table_02_1">
                  <a href="#" onclick="selectTutor('<%=v_tutorgubun%>', '<%=v_name%>', '<%=v_userid%>')">
                  <% if (v_tutorgubun.equals("O")) {
                  	  if (v_userid.length()==13) {
                  			out.print(v_userid.substring(0, 6)+"-"+v_userid.substring(6, 7) + "******");
                  	   } else {
                  			out.print(v_userid);
                  	   }
                     } else { %>
                  	<%=v_userid%>
                  <% } %>
                  </a></td>
                  <td class="table_02_1"><%=v_name%></td>
                  <td class="table_02_1"><%=v_subjclassnm%></td>
                  <td class="table_02_1"><%=v_compnm%></td>
                </tr>
                <%
          }
%>
                <% if(list.size() == 0){ %>
                <tr> 
                  <td height='40' colspan="8" class="table_02_1">�˻��� ���簡 �����ϴ�</td>
                </tr>
                <% } %>
              </table>

            <!----------------- total ���� ----------------->
            <table width="510" height="26" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="right" valign="absmiddle">
                  <%= PageUtil.printPageList(v_totalpage, v_pageno, 10) %>
                </td>
              </tr>
            </table>
            <!----------------- total �� ----------------->

            <table width="510" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="right" style="padding-top=10"><a href='javascript:self.close()'><img src="/images/admin/system/close1_butt.gif"  border=0></a></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

</form>

<%@ include file = "/learn/library/getJspName.jsp" %>

</body>
</html>
