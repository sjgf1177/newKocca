<%
//**********************************************************
//  1. ��      ��: �����ı� - ���� �ı�
//  2. ���α׷���: postscript_list.jsp
//  3. ��      ��: �����ı�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2007.12.15
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if (box == null) box = RequestManager.getBox(request);
	
	int v_pageno = box.getInt("p_pageno");
	int v_dispnum = 0;
	int v_totalpage = 0;
	int v_rowcount = 1;
	
	String v_grcode = box.getString("p_grcode");
	String v_subj = box.getString("p_subj");
	String v_subjnm = box.getString("p_subjnm");

	List list = (ArrayList) request.getAttribute("list");
	boolean isPostscript = ((Boolean) request.getAttribute("is_postscript")).booleanValue();
%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/css/user_style1.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function insertPage( subj, subjnm ) {
		var form1 = document.form1;
		form1.p_process.value = "insertPage";
		form1.p_subj.value = subj;
		form1.p_subjnm.value = subjnm;
		
		form1.submit();
	}

	function detail( seq ) {
		var form1 = document.form1;
		form1.p_process.value = "select";
		form1.p_seq.value = seq;
		
		form1.submit();
	}
	
	//������ �̵�
	function goPage(pageNum) {
		 document.form1.p_pageno.value = pageNum;
		 document.form1.p_process.value = "list";
		 document.form1.submit();
	}
</script>
</head>

<body bgcolor="F6F6F6">
<table width="700" border="0" cellpadding="0" cellspacing="0" bgcolor="F6F6F6">
<form name="form1" method="post" action="/servlet/controller.course.PostScriptServlet">
  <input type="hidden" name="p_process">
  <input type="hidden" name="p_next_process" value="list">
  <input type="hidden" name="p_grcode" value="<%=v_grcode%>">
  <input type="hidden" name="p_seq">
  <input type="hidden" name="p_subj">
  <input type="hidden" name="p_subjnm" value="v_subjnm">
  <input type="hidden" name="p_pageno" value="<%=v_pageno%>">
</form>
  <tr>
    <td><img src="/images/user/game/course/pop_tit_feedback.gif"></td>
  </tr>
  <tr>
    <td>
      <table width="700" height="540" border="0" cellspacing="0" cellpadding="0">
        <tr background="/images/user/game/apply/pop_box_topbg.gif">
          <td width="22" height="10" valign="top" background="/images/user/game/apply/pop_box_topbg.gif"><img src="/images/user/game/apply/pop_box_toph.gif" width="22" height="10"></td>
          <td width="657" height="10" background="/images/user/game/apply/pop_box_topbg.gif"></td>
          <td width="21" height="10" align="right" background="/images/user/game/apply/pop_box_topbg.gif"><img src="/images/user/game/apply/pop_box_toptail.gif" width="21" height="10"></td>
        </tr>
        <tr>
          <td valign="top" background="/images/user/game/apply/pop_box_lbg.gif">&nbsp;</td>
          <td align="center" valign="top" bgcolor="#FFFFFF">
            <!-- ����Ÿ��Ʋ -->
            <table width="620" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="5"></td>
              </tr>
              <tr>
                <td><img src="/images/user/game/course/feed_img.jpg" width="620" height="70"></td>
              </tr>
              <tr>
                <td valign="bottom" style="padding-top:10"><img src="/images/user/game/course/b1_note.gif" align="absmiddle"><font color="#000000"><%=v_subjnm%></font></td>
              </tr>
              <!--
              <tr>
                <td valign="bottom" ><img src="/images/user/game/course/b1_note.gif" align="absmiddle"><font color="#000000"></font></td>
              </tr>-->
              <tr>
                <td height="5"></td>
              </tr>
            </table>
            <!-- �����ȳ� -->
            <table width="620" border="2" cellspacing="0"
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
              <tr>
                <td height="3" colspan="4" class="linecolor_board6"></td>
              </tr>
              <tr>
                <td width="470" class="tbl_gtit3"><b>�����ı�</b></td>
                <td width="150" class="tbl_gtit3"><b>�ۼ���(ID)</b></td>
              </tr>
              <tr>
                <td height="5" colspan="4" ></td>
              </tr>
              <%
              		DataBox dbox = null;
              
              		String v_seq = "";
              		String v_title = "";
              		String v_userid = "";
              		String v_usernm = "";

              		if ( list != null && list.size() > 0 ) {
              			for ( int i=0; i<list.size(); i++ ) {
	              			dbox = (DataBox) list.get(i);
	              			
	              			v_seq = dbox.getString("d_seq");
	              			v_title = dbox.getString("d_title");
	              			v_userid = dbox.getString("d_userid");
	              			v_usernm = dbox.getString("d_usernm");

	              			v_totalpage	= dbox.getInt("d_totalpage");
	                        v_rowcount	= dbox.getInt("d_rowcount");  
	              			
              %>              
              <tr>
                <td class="tbl_bleft"><a href="javascript:detail('<%=v_seq%>')"><%=StringManager.formatTitle(v_title, 30)%></a></td>
                <td align="center"><%=v_usernm%>(<%=v_userid%>)</td>
              </tr>
              <%
              			}
              		} else {
              %>
              <tr>
                <td colspan="4" align="center">�����ıⰡ �����ϴ�.</td>
              </tr>
              <%
              		}
              %>
            </table>
            <table width="620" border="0" cellspacing="0" cellpadding="0">
              <tr>
              	<td align="center" colspan="3" style="padding:4px 0px 0px 4px"><%= PageUtil.printPageListGame(v_totalpage, v_pageno, 10) %></td>
              </tr>
              <tr>
                <td height="5" colspan="3" align="right"></td>
              </tr>
              <tr>
                <td colspan="3" align="center"></td>
              </tr>
              <tr>
                <td colspan="3" align="right">
                <%
                	if ( isPostscript ) {
                %>
                <a href="javascript:insertPage('<%=v_subj%>', '<%=v_subjnm%>');"><img src="/images/user/game/button/btn_write01.gif" border="0"></a>
                <%
                	}
                %>
                <a href="javascript:self.close()"><img src="/images/user/game/button/btn_close.gif" border="0"></a>
                </td>
              </tr>
            </table>
          </td>
          <td background="/images/user/game/apply/pop_box_rbg.gif">&nbsp;</td>
        </tr>
        <tr>
          <td valign="bottom" background="/images/user/game/apply/pop_box_lbg.gif"><img src="/images/user/game/apply/pop_box_boh.gif" width="22" height="21"></td>
          <td valign="bottom" background="/images/user/game/apply/pop_box_bobg.gif" height="21">&nbsp;</td>
          <td valign="bottom" background="/images/user/game/apply/pop_box_rbg.gif"><img src="/images/user/game/apply/pop_box_botail.gif" width="21" height="21"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>

</body>
</html>
