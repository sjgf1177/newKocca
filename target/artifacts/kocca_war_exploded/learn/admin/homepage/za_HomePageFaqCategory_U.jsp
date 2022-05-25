
<%
//**********************************************************
//  1. ��      ��: HomePage FAQ Category ����
//  2. ���α׷��� : za_HomePageFaqCategory_U.jsp
//  3. ��      ��: HomePage FAQ Category ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �ż�ö 2005. 1. 1
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType="text/html;charset=MS949"%>
<%@page errorPage="/learn/library/error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.credu.homepage.*"%>
<%@ page import="com.credu.library.*"%>
<%@ page import="com.credu.course.*"%>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    
	DataBox dbox = (DataBox)request.getAttribute("selectHomePageFaqCategory");

	String  v_faqcategory    = "";
    String  v_faqcategorynm  = "";
   
    String s_userid = box.getSession("userid");

	String  v_grcode	  = box.getString("p_grcode");
	String  v_grcodenm	  = box.getString("p_grcodenm");
	v_faqcategory = dbox.getString("d_faqcategory");
	v_faqcategorynm = dbox.getString("d_faqcategorynm");
	
	// �����׷�
    ArrayList list1 = (ArrayList)request.getAttribute("GrcodeList");

%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<SCRIPT LANGUAGE="javascript">
function updateAction() {
	if(document.form1.p_faqcategorynm.value == ""){
		alert("ī�װ����� �Է��ϼ���!");
		document.form1.p_faqcategorynm.focus();
		return;
	}

	if (confirm("�����Ͻðڽ��ϱ�?")) {
		document.form1.action = "/servlet/controller.homepage.HomePageFaqCategoryAdminServlet";
		document.form1.p_process.value = "update";
		document.form1.submit();
	}else{
		return;
	}
}

function deleteAction() {
	if (confirm("�����Ͻðڽ��ϱ�?")) {
		document.form1.action = "/servlet/controller.homepage.HomePageFaqCategoryAdminServlet";
		document.form1.p_process.value = "delete";
		document.form1.submit();
	}
	else {
		return;
	}
}

</script>

</head>

<body topmargin=0 leftmargin=0>
	<form name="form1" method="post">
		<input type="hidden" name="p_process" value=""> <input type="hidden" name="p_faqcategory" value="<%=v_faqcategory%>">

		<table width="1000" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center">

					<table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
						<tr>
							<td><img src="/images/admin/homepage/h_title01.gif"></td>
							<td align="right"><img src="/images/admin/common/sub_title_tail.gif"></td>
						</tr>
					</table> <br>
					<table width="970" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="10%" class=txt_input align="left">�� �����׷� :</td>
							<td width="35%" align="left"><%=v_grcodenm%></td>
							<td width="55%"></td>
						</tr>
					</table> <br>
					<table width="970" border="0" cellpadding="0" cellspacing="1" class="table_out">

						<tr>
							<td class="table_title" width="25%">FAQ ī�װ��ڵ�</td>
							<td class="table_02_2" width="75%"><%=v_faqcategory%></td>
						</tr>
						<tr>
							<td class="table_title">FAQ ī�װ���</td>
							<td class="table_02_2"><input name="p_faqcategorynm" type="text" class="input" style="width: 300" value="<%=v_faqcategorynm%>"></td>
						</tr>
						<tr class="table_02_2">
							<td height="25" class="table_title"><strong>������׷�</strong></td>
							<td height="25" class="table_02_2">
							<%  
							for(int i=0;i<list1.size();i++){
								EduGroupData edudata = (EduGroupData)list1.get(i);
							%> 
								<div style="width:25%;float: left">
									<input name="p_grcode" type=radio value="<%=edudata.getGrcode()%>" <%=v_grcode.equals(edudata.getGrcode()) ? "checked" : "" %>><%=edudata.getGrcodenm()%>&nbsp; 
								</div>
							<%
								if(i>0 && i%4==0){
							%>
									<br/>
							<%
								}
							}
							%>
							</td>
						</tr>
					</table>
					<table width="970" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height=6></td>
							<td height=6></td>
							<td height=6></td>
							<td align="right" height=6></td>
							<td width="12" height=6></td>
							<td align="right" height=6></td>
						</tr>

						<tr>
							<td width="823" align="right"></td>
							<td width="45" align="right">
								<a href="javascript:updateAction()" onfocus=this.blur()> <img src="/images/admin/button/btn_save.gif" border="0"></a>
							</td>
							<td width="14">&nbsp;</td>
							<td width="32" align="right"><a href="javascript:deleteAction()" onfocus=this.blur()> <img src="/images/admin/button/btn_del.gif" border="0"></a></td>
							<td width="12">&nbsp;</td>
							<td width="44" align="right"><a href="javascript:history.back();" onfocus=this.blur()> <img src="/images/admin/button/btn_list.gif" border="0"></a></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="/learn/library/getJspName.jsp"%>
</body>
</html>