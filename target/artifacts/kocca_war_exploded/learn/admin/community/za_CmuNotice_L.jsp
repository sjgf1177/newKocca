	<%
//**********************************************************
//  1. ��      ��: �������� ����Ʈ
//  2. ���α׷��� : za_CmuNotice_L.jsp
//  3. ��      ��: �������� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005. 8. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process    = box.getString("p_process");
    String  v_faq_type   = box.getStringDefault("p_faq_type","DIRECT");
    String  v_grtype     = box.getString("p_grtype");
    
    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    String  ss_grcode	 = box.getString("s_grcode");		//�����׷�

    int v_dispnum    = 0;
    int v_totalpage  = 0;
    int v_rowcount   = 1;
    int v_upfilecnt  = 0;
    int v_pageno             = box.getInt("p_pageno");
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));


    ArrayList list       = (ArrayList)request.getAttribute("list");
    ArrayList viewfaq    =new ArrayList();
    ArrayList viewfaqfile=new ArrayList();
    
   
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript"><!--

	//�������̵�
	function goPage(pageNum) {
		document.form1.p_pageno.value = pageNum;
		document.form1.action = "/servlet/controller.community.CommunityAdminFaqServlet";
		document.form1.p_process.value = "selectlist";
		document.form1.submit();
	}
	//�˻�
	function uf_searchOK(pageNum) {

		document.form1.p_pageno.value = pageNum;
		document.form1.action = "/servlet/controller.community.CommunityAdminFaqServlet";
		document.form1.p_process.value = "selectlist";
		document.form1.submit();
	}

	//�������������̵�
	function uf_viewOK(faqno,rowseq) {
		document.form1.p_faqno.value = faqno;
		document.form1.p_rowseq.value = rowseq;
		document.form1.action = "/servlet/controller.community.CommunityAdminFaqServlet";
		document.form1.p_process.value = "viewPage";
		document.form1.submit();
	}

	//������������̵�
	function uf_insertOK() {
		//if (chkParam() == false) {
		//  return;
		//}
		document.form1.action = "/servlet/controller.community.CommunityAdminFaqServlet";
		document.form1.p_process.value = "insertPage";
		document.form1.submit();
	}

	//�˻�
	function whenGrtype(p_action) {
		if (chkParam() == false) {
		  return;
		}
	  document.form1.action='/servlet/controller.community.CommunityAdminFaqServlet';
	  document.form1.p_process.value = 'selectlist';    
	  document.form1.submit();
	}

	// �˻����� üũ
	function chkParam() {
	  if (document.form1.p_grtype.value == 'ALL' || document.form1.p_grtype.value == '----' || document.form1.p_grtype.value == '') {
		alert("�����׷��� �����ϼ���.");
		return false;
	  }
	}

//
--></SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
	<input type = "hidden" name = "p_process"   value="">
	<input type = "hidden" name = "p_action"	value="">
	<input type = "hidden" name = "p_faq_type"  value="<%=v_faq_type%>">
	<input type = "hidden" name = "p_pageno"    value = "">
	<input type = "hidden" name = "p_userid"    value = "">
	<input type = "hidden" name = "p_upfilecnt" value = "">
	<input type = "hidden" name = "p_faqno"     value = "">
	<input type = "hidden" name = "p_rowseq"    value = "">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
 <tr>
  <td align="center" valign="top"> 
   <!----------------- title ���� ----------------->
   <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
    <tr> 
     <td><img src="/images/admin/homepage/tit_comm_notice.gif"></td>
     <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
    </tr>
   </table>
   <!----------------- title �� ----------------->

   <br>
   <!----------------- form ���� ----------------->
   <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
    <tr> 
     <td align="left"><!-- 
<% //if (StringManager.substring(box.getSession("gadmin"), 0, 1).equals("A")) { %>
     
          <%=CodeConfigBean.getCodeGubunSelect("0060","",1,"p_grtype", v_grtype,"onChange=\"whenGrtype()\"",3) %>
<% //} else  {                                                   %>
        <%//=CodeConfigBean.getCodeName("grtype",box.getSession("grtype")) %>
        <input type="hidden" name="p_grtype" value="<%=box.getSession("grtype")%>">  -->
 <% //} %></td>
	 <td align="right">
		&nbsp;<select name="p_select">
         <option value="title"   <%if("title".equals(v_select)) out.print(" selected");%>>����</option>
         <option value="content" <%if("content".equals(v_select)) out.print(" selected");%>>����</option>
         <option value="name"    <%if("name".equals(v_select)) out.print(" selected");%>>�۾���</option>
       </select></td>
     <td width="134"><input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>" size="20"></td>
     <td width="100"><a href="javascript:uf_searchOK(1);"><img src="/images/admin/button/btn_inquiry.gif" border = "0"></a>
      <a href="javascript:uf_insertOK();"><img src="/images/admin/button/btn_add.gif" border="0"></a>
     </td>
    </tr>

    <tr> 
      <td height="3"></td>
    </tr>
   </table>
   <!----------------- form �� ----------------->


   <!----------------- �������� ���� ���� ----------------->
   <table class="table_out" cellspacing="1" cellpadding="5">
    <tr><td colspan="6" class="table_top_line"></td></tr>
    <tr> 
      <td width="6%" class="table_title">��ȣ</td>
      <td width="51%" class="table_title">����</td>
      <td width="20%" class="table_title">�ۼ���</td>
      <td width="10%" class="table_title">�Խ���</td>
      <td width="8%" class="table_title">��ȸ��</td>
    </tr>
<%  if(list.size() != 0){
		for(int i = 0; i < list.size(); i++) {
			  DataBox dbox = (DataBox)list.get(i);
			  v_totalpage = dbox.getInt("d_totalpage");
			String v_title=dbox.getString("d_title");
			String v_name=dbox.getString("d_name");
			if (!v_searchtext.equals("")&&v_select.equals("title")) {
				v_title = StringManager.replace(dbox.getString("d_title"), v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			} else if(!v_searchtext.equals("")&&v_select.equals("name")){
				v_name = StringManager.replace(dbox.getString("d_name"), v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			}

%>
     <tr> 
       <td class="table_02_1" ><%=dbox.getInt("d_dispnum")%></td>
       <td class="table_02_2" align=left><a href="javascript:uf_viewOK(<%=dbox.getInt("d_faqno")%>,<%=dbox.getInt("d_rowseq")%>);"><%for(int j=1;j<dbox.getInt("d_lv");j++)out.print("&nbsp;&nbsp;");%><%=v_title%></a></td>
       <td class="table_02_1" ><%=v_name%>
       	<!--&nbsp; <%=dbox.getString("d_jikupnm")%>/<%=dbox.getString("d_jikwinm")%>&nbsp;<%=dbox.getString("d_deptnam")%>-->
       </td>
       <td class="table_02_1"><%=FormatDate.getFormatDate(dbox.getString("d_register_dte"), "yyyy/MM/dd")%></td>
       <td class="table_02_1"><%=dbox.getInt("d_read_cnt")%></td>
     </tr>
<%    }   
   } else {     %>
		<tr>
			<td class="table_02_1" colspan="5">�ش� �����Ͱ� �����ϴ�.</td>
		</tr>
<% } %>
   </table>
   <!----------------- �������� ���� �� ----------------->

   <!----------------- total ���� ----------------->
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
  </td>
 </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
