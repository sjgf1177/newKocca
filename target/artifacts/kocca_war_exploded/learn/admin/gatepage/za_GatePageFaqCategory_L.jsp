<%
//**********************************************************
//  1. ��      ��: GatePage FAQ Category
//  2. ���α׷��� : za_GatePageFaqCategory_L.jsp
//  3. ��      ��: GatePage FAQ Category ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �ż�ö 2005. 1. 1
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.gatepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    ArrayList list = (ArrayList)request.getAttribute("selectListGatePageFaqCategory");

	String  v_faqcategory    = "";
    String  v_faqcategorynm  = "";
	String	s_gubun = "";

    v_faqcategorynm = box.getString("p_faqcategorynm2");
	s_gubun = box.getString("p_gubun");
	
	
	System.out.println("list������s_gubun ====**********************>" + s_gubun);
%>

<html>
<head>
<title>GateSystemFAQ</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<SCRIPT LANGUAGE="javascript">
	
	
	function selectListAction() {
		
        document.form1.action = "/servlet/controller.gatepage.GatePageFaqCategoryAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

	function insertno() {
		alert="�����ؾ��մϴ�";		
    }

    function insertPageAction() {
		
			document.form1.action = "/servlet/controller.gatepage.GatePageFaqCategoryAdminServlet";
			document.form1.p_process.value = "insertPage";
			document.form1.submit();
		
    }
	
	 function updatePageAction(faqcategory) {
        document.form1.action = "/servlet/controller.gatepage.GatePageFaqCategoryAdminServlet";
        document.form1.p_faqcategory.value = faqcategory;
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }
	
	function faqListAction(faqcategory) {
        document.form1.action = "/servlet/controller.gatepage.GatePageFaqCategoryAdminServlet";
        document.form1.p_faqcategory.value = faqcategory;
        document.form1.p_process.value = "faqList";
        document.form1.submit();
    }

</SCRIPT>

</head>

<body topmargin=0 leftmargin=0>
		<form name = "form1" method = "post">
		<input type = "hidden" name = "p_process" value = "">
		<input type = "hidden" name = "p_faqcategory" value = "">
		
		

<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
	
	<table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/gatepage/cp_title07.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif"></td>
        </tr>
      </table>
	   <br>     
      <table width="971"  border="0" cellpadding="0" cellspacing="0">
        <tr> 
                        <td width="179" align="right" class=txt_input>
												
                            <p align="left"><select name="p_gubun" size="1" onChange="javascript:selectListAction()">
                                <option value="00">== ���� ==</option>                                
                                <option value="01"	<%if (s_gubun.equals("01")){ %> selected<% }%>>���ְ���</option>
                                <option value="02"  <%if (s_gubun.equals("02")){ %> selected<% }%>>��뺸�����</option>
                                <option value="03"  <%if (s_gubun.equals("03")){ %> selected<% }%>>���հ������</option>
                                <option value="04"  <%if (s_gubun.equals("04")){ %> selected<% }%>>��Ÿ�׽�Ʈ</option>
						 </select></p>
</td>
                        <td width="544" align="right">                            <p>FAQ ī�װ��� �˻� :</p>
</td>
          <td width="156">
			  <input name="p_faqcategorynm2" type="text" class="input" style="width:150" value="<%=v_faqcategorynm%>"></td>
          <td width="10">&nbsp;</td>
          <td width="32" align="right">
			  <a href="javascript:selectListAction()" onfocus=this.blur()>
			  <img src="/images/admin/button/btn_inquiry.gif" border = "0"></td>
          <td width="14">&nbsp;</td>
          <td width="35" align="right">
			  
			  <%if (s_gubun != "00"){%>
			  <a href="javascript:insertPageAction()" onfocus=this.blur()>
			 <%}else{%> 
			  <a href = "javascript:inserno()">
			 <%}%>
			  
			  <img src="/images/admin/button/btn_apply.gif" border = "0"></td>
        </tr>
        <tr> 
          <td height=6 colspan="2" width="723"></td>
          <td height=6 width="156"></td>
          <td height=6 width="10"></td>
          <td align="right" height=6 width="32"></td>
          <td width="14" height=6></td>
          <td align="right" height=6 width="35"></td>
        </tr>
      </table>
      <table width="970"  cellpadding="0" cellspacing="1" class="table_out">
        <tr> 
          <td colspan="2" class="table_top_line"></td>
        </tr>
        <tr> 
          <td class="table_title" width="14%">FAQ ī�װ��ڵ�</td>
          <td class="table_title" width="80%">FAQ ī�װ���</td>
		  <td class="table_title" width="6%">����</td>
        </tr>
<%if(list.size() != 0){%>
<%
            for(int i = 0; i < list.size(); i++) {

				DataBox dbox = (DataBox)list.get(i);
				
				v_faqcategory = dbox.getString("d_faqcategory");
				v_faqcategorynm = dbox.getString("d_faqcategorynm");
%>
        <tr> 
          <td class="table_01"><%=v_faqcategory%></td>
          <td class="table_02_2"><a href="javascript:faqListAction('<%=v_faqcategory%>')"><%=v_faqcategorynm%></a></td>
		  <td class="table_01"><a href="javascript:updatePageAction('<%=v_faqcategory%>')"><u><font color='blue'>����</font></u></td>
        </tr>
<%
        }
%>
<%}else{%>
           

                                                    <tr>
                                                        <td class="table_01" colspan="13" align=center >
															��� �� FAQī�װ��� �����ϴ�.		
														</td>
													</tr>

<%}%>		
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
