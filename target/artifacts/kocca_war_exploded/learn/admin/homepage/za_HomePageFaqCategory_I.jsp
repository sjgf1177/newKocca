
<%
//**********************************************************
//  1. 제      목: HomePage FAQ Category 등록
//  2. 프로그램명 : za_HomePageFaqCategory_I.jsp
//  3. 개      요: HomePage FAQ Category 등록
//  4. 환      경: JDK 1.3
//  5. 버      젼: 1.0
//  6. 작      성: 신선철 2005. 1. 1
//  7. 수      정:
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

	DataBox dbox = (DataBox)request.getAttribute("HomePageFaqCategorySetting");
    String  v_faqcategorynm  = "";

    String s_userid = box.getSession("userid");
	String v_grcode = box.getString("p_grcode");
	System.out.println("jsp insert v_grcode : "+v_grcode);

	String v_faqcategory = dbox.getString("d_faqcategory");

	// 교육그룹
    ArrayList list1 = (ArrayList)request.getAttribute("GrcodeList");

%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc_kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language="javascript" type="text/javascript">

function insertAction() {

	if(document.form1.p_faqcategorynm.value == ""){
		alert("카테고리명을 입력하세요!");
		document.form1.p_faqcategorynm.focus();
		return;
	}

	var radioObj = document.getElementsByName("p_grcode");
	var objLen     = radioObj.length;
    var cnt = 0;
	
	for(var i = 0 ; i < objLen ; i++) {
	    if(radioObj[i].checked){
		    cnt++;
	    }
	}

	if(cnt == 0 ){
        alert("교육그룹을 선택하세요!");
        return;
    }

	if (confirm("저장하시겠습니까?")) {
		document.form1.action = "/servlet/controller.homepage.HomePageFaqCategoryAdminServlet";
		document.form1.p_process.value = "insert";
		document.form1.submit();
	}else{
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
					<table width="970" border="0" cellpadding="0" cellspacing="1" class="table_out">
						<tr>
							<td class="table_title" width="25%">FAQ 카테고리코드</td>
							<td class="table_02_2" width="75%"><%=v_faqcategory%></td>
						</tr>
						<tr>
							<td class="table_title">FAQ 카테고리명</td>
							<td class="table_02_2"><input name="p_faqcategorynm" type="text" class="input" style="width: 300"></td>
						</tr>
						<tr class="table_02_2">
							<td height="25" class="table_title"><strong>대상교육그룹</strong></td>
							<td height="25" class="table_02_2">
							<%  
							for(int i=0;i<list1.size();i++){
								EduGroupData edudata = (EduGroupData)list1.get(i);
							%> 
								<div style="width:25%;float: left">
									<input name="p_grcode" type=radio value="<%=edudata.getGrcode()%>"><%=edudata.getGrcodenm()%>&nbsp; 
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
							<td width="14" height=6></td>
							<td align="right" height=6></td>
						</tr>

						<tr>
							<td width="722" align="right"></td>
							<td width="150"></td>
							<td width="10">&nbsp;</td>
							<td width="32" align="right">
								<a href="javascript:insertAction()" onfocus=this.blur()>
									<img src="/images/admin/button/btn_save.gif" border="0">
								</a>
							</td>
							<td width="14">&nbsp;</td>
							<td width="32" align="right">
								<a href="javascript:history.back();" onfocus=this.blur()>
									<img src="/images/admin/button/btn_cancel.gif" border="0">
								</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="/learn/library/getJspName.jsp"%>
</body>
</html>
