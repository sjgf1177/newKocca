<%
//**********************************************************
//  1. ��      ��: Ŀ�´�Ƽ ����Ʈ
//  2. ���α׷��� : za_CmuRoom_L.jsp
//  3. ��      ��: �������� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��:  2003. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_searchtext    = box.getString("p_searchtext");
    String  v_select        = box.getString("p_select");
    String  v_str_fg   = box.getStringDefault("p_str_fg","1");

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");


    int v_dispnum    = 0;
    int v_totalpage  = 0;
    int v_rowcount   = 1;
    int v_upfilecnt  = 0;
    int v_pageno             = box.getInt("p_pageno");
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));


    ArrayList list       = (ArrayList)request.getAttribute("list");
    
   
%>
<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
	//�������̵�
	function goPage(pageNum) {
		document.form1.p_pageno.value = pageNum;
		document.form1.action = "/servlet/controller.community.CommunityAdminPoliceServlet";
		document.form1.p_process.value = "listPage";
		document.form1.submit();
	}
	//�˻�
	function uf_searchOK(pageNum) {
		if(document.form1.p_searchtext.value ==''){
		   alert('�˻�� �Է��Ͽ����մϴ�.');document.form1.p_searchtext.focus();return;
		}

		document.form1.p_pageno.value = pageNum;
		document.form1.action = "/servlet/controller.community.CommunityAdminPoliceServlet";
		document.form1.p_process.value = "listPage";
		document.form1.submit();
	}

	//�������������̵�
	function uf_viewOK(policeno) {
		document.form1.p_policeno.value = policeno;
		document.form1.action = "/servlet/controller.community.CommunityAdminPoliceServlet";
		document.form1.p_process.value = "viewPage";
		document.form1.submit();
	}

	//�˻�
	function whenGrtype(p_action) {
	  document.form1.action='/servlet/controller.community.CommunityAdminPoliceServlet';
	  document.form1.p_process.value = 'listPage';    
	  document.form1.submit();
	}

	// �˻����� üũ
	function chkParam() {
	  if (document.form1.p_grtype.value == '' || document.form1.p_grtype.value == '----' || document.form1.p_grtype.value == '') {
		alert("�����׷��� �����ϼ���.");
		return false;
	  }
	}

//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
<input type = "hidden" name = "p_process"     value = "">
<input type = "hidden" name = "p_pageno"      value = "">
<input type = "hidden" name = "p_userid"      value = "">
<input type = "hidden" name = "p_upfilecnt"   value = "">
<input type="hidden" name="p_policeno" value="">
<input type = "hidden" name = "p_close_fg"   value = "">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
 <tr>
  <td align="center" valign="top">
   <!----------------- title ���� ----------------->
   <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
    <tr> 
     <td><img src="../../../images/admin/homepage/tit_comm_singo.gif" ></td>
     <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
    </tr>
   </table>
   <!----------------- title �� ----------------->
   <br>
   <!-----------------  ���̺���� ----------------->
   <br> 
   <table width="97%" border="0" cellpadding="0" cellspacing="0" >
    <tr> 
	 <td><!-- 
		<% if (StringManager.substring(box.getSession("gadmin"), 0, 1).equals("A")) { %> 
			<%=CodeConfigBean.getCodeGubunSelect("0060","",1,"p_grtype",box.getString("p_grtype"),"onChange=\"whenGrtype()\"",3) %>
		<% } else  {                                                   %>
				<%//=CodeConfigBean.getCodeName("grtype",box.getSession("grtype")) %>
				<input type="hidden" name="p_grtype" value="<%=box.getSession("grtype")%>">
		 <% } %>   -->
	 </td>
     <td align="right">&nbsp;<input type=radio name="p_str_fg" value="1" <% if("1".equals(v_str_fg))out.print(" checked");%> onclick="javascript:goPage(1);">��û
     <input type=radio name="p_str_fg" value="2" <% if("2".equals(v_str_fg))out.print(" checked");%>  onclick="javascript:goPage(1);">ó���Ϸ�
     &nbsp;&nbsp;&nbsp;
     </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
     <td height="5" colspan="2"></td>
    </tr>
   </table>

   <table class="table_out" cellspacing="1" cellpadding="5">
    <tr><td colspan="8" class="table_top_line"></td></tr>
    <tr> 
      <td width="29%"  class="table_title"><strong>Ŀ�´�Ƽ��</strong></td>
      <td width="7%"   class="table_title"><strong>����</strong></td>
      <td width="7%"   class="table_title"><strong>ȸ����</strong></td>
      <td width="8%"  class="table_title"><strong>��������</strong></td>
      <td width="13%"  class="table_title"><strong>�Ű���</strong></td>
      <td width="10%"  class="table_title"><strong>�Ű�����</strong></td>
      <td width="15%"  class="table_title"><strong>ó����</strong></td>
      <td width="10%"  class="table_title"><strong>ó������</strong></td>
    </tr>
<%  if(list.size() != 0){
       for(int i = 0; i < list.size(); i++) {
           DataBox dbox = (DataBox)list.get(i);
           v_totalpage = dbox.getInt("d_totalpage");
%>
    <tr> 
      <td   class="table_02_1"  align=left><a href="javascript:uf_viewOK('<%=dbox.getString("d_policeno")%>');">
		<!-- ������ ���� <>�ȿ� _ �ڿ� �Ұ� ��Ÿ���� --><strong> <<%=dbox.getString("d_cmu_nm")%>></strong><br><%=dbox.getString("d_intro")%></a></td>
      <td   class="table_02_1"><%=dbox.getString("d_room_master")%></td>
      <td   class="table_02_1"><%=dbox.getString("d_member_cnt")%></td>
      <td   class="table_02_1"><%=FormatDate.getFormatDate(dbox.getString("d_accept_dte"), "yyyy/MM/dd")%></td>
      <td   class="table_02_1"><%=dbox.getString("d_bname")%>
      	<!--&nbsp;<%=dbox.getString("d_bjikwinm")%>/<%=dbox.getString("d_bjikupnm")%>&nbsp;<%=dbox.getString("d_bdeptnam")%>-->
      </td>
      <td   class="table_02_1"><%=FormatDate.getFormatDate(dbox.getString("d_singo_dte"), "yyyy/MM/dd")%></td>
      <td   class="table_02_1"><%=dbox.getString("d_cname")%>
      	<!--&nbsp;<%=dbox.getString("d_cjikwinm")%>/<%=dbox.getString("d_cjikupnm")%>&nbsp;<%=dbox.getString("d_cdeptnam")%>-->
      </td>
      <td   class="table_02_1"><%=FormatDate.getFormatDate(dbox.getString("d_str_dte"), "yyyy/MM/dd")%></td>
    </tr>


<%     }                 
    } else {%>
		<tr>
			<td class="table_02_1" colspan="8">�ش� �����Ͱ� �����ϴ�.</td>
		</tr>
<% } %>
   </table> 
      <!----------------- ���̺� �� ----------------->

   <!----------------- total ���� ----------------->
   <br>
   <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width=80% align="right" valign="absmiddle"> 
        <%= PageUtil.printPageList(v_totalpage, v_pageno, 10) %>
      </td>
    </tr>
   </table>
   <!----------------- total �� ----------------->
   <br>
  </td>
 </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
