<%
/**
 * file name : za_Opinion_L.jsp
 * date      : 2003/09/12
 * programmer:
 * function  : �ǰߺ���
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.contents.*" %>
<%@ page import = "com.credu.common.*" %>

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String v_subj      = box.getSession("s_subj"); 
    String v_subjnm    = GetCodenm.get_subjnm(v_subj);
    String v_year      = box.getSession("s_year"); 
    String v_subjseq   = box.getSession("s_subjseq"); 
    String v_lesson    = box.getString("p_lesson"); 
    int    v_lessonseq = box.getInt("p_lessonseq"); 
    int    v_seq       = 0;
    String v_userid    = "";
    String v_name      = "";
	String v_answer    = "";
    int i = 0;
    int v_pageno    = box.getInt("p_pageno");
    if (v_pageno == 0) v_pageno = 1;
	int v_dispnum = 0;
	int v_totalpage = 0;

    ArrayList list = (ArrayList)request.getAttribute("selectList");

    String s_gadmin = box.getSession("gadmin");

%>
<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<script language="JavaScript">
<!--
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.contents.OpinionServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.contents.OpinionServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }
-->
</script>
</head>
<body>
<form name="form1" method="post" action="javascript:return;">
    <input type = "hidden" name = "p_process"   value = "">
    <input type = "hidden" name = "p_pageno"    value = "<%=v_pageno %>">

<br>
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr> 
    <td width="13"><img src="/images/user/research/icon2.gif" width="13" height="11" border="0"></td>
    <td><b>������ : [<%=v_subjnm%>] ���� : [<%=v_year%>] ���� : [<%=v_subjseq%>] ���� : [<%=v_lesson%>] </b></td>
  </tr>
  <tr> 
    <td height="5"></td>
  </tr>
</table>
<!----------------- �ǰ߸���Ʈ ���� ---------------->
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr> 
    <td class="board_color_line"></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
  <tr> 
    <td> 
      <table cellspacing="1" cellpadding="3" class="table2">
        <tr> 
          <td class="board_title_bg1" width="10%">�ۼ���</td>
          <td class="board_title_bg1" width="90%">�ǰ�</td>
        </tr>
<%
    for(i = 0; i < list.size(); i++) {
        OpinionData  data = (OpinionData)list.get(i);

        v_userid    = data.getUserid();
        v_name      = data.getName();
        v_answer    = data.getAnswer();
        v_dispnum   = data.getDispnum();
        v_totalpage = data.getTotalpagecount();
        v_answer = StringManager.replace(v_answer,"\r\n","<br>");
%>
        <tr> 
          <td class="board_text2"><%=v_name%></td>
          <td class="board_text4"><%=v_answer%></td>
        </tr>
<%
   }

   if (i == 0 ) { 
%>
        <tr> 
          <td class="board_text2" colspan ="2">��ϵ� ������ �����ϴ�.</td>
        </tr>
<%
    }
%>
      </table>
    </td>
  </tr>
</table>
<!----------------- �н��� �� ---------------->
<br>
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="absmiddle">
              <%= PageUtil.printPageList(v_totalpage, v_pageno, 10) %>
            </td>
          </tr>
        </table>
        <!----------------- total �� ----------------->
<br>
<!----------------- ���� ��ư ���� ---------------->
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr>                
    <td align="right">
       <a href="javascript:self.close()"><img src="/images/admin/exam/close1_butt.gif" alt="�ݱ�" border="0"></a>
    </td>
  </tr>
</table>
<!----------------- ���� ��ư �� ----------------->
<br>
</body>
</form>
</html>
