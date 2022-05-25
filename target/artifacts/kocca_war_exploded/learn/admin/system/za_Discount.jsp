<%
//**********************************************************
//  1. ��      ��: ���η�
//  2. ���α׷��� : za_Discount.jsp
//  3. ��      ��: ���η�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: 06.02.01
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process     = box.getString("p_process");
    String  v_searchtext  = box.getString("p_searchtext");
    String  s_gadmin	  = box.getSession("gadmin");

    int    v_seq     = 0;            // 
    int    v_total   = 0;            // �����

    String v_title   = "";           // Ÿ��Ʋ
    String v_grcode  = "";
    String v_grcodenm= "";
    String v_f_use   = "";           // ��뿩��
		
	String s_grcode = box.getString("s_grcode");
    if( s_grcode == null || s_grcode.equals("") ) {
    	s_grcode = box.getSession("tem_grcode");
    }

	DataBox dbox = null;
	String v_subjcnt	= "";
	String v_discount	= "";

    ArrayList list = (ArrayList)request.getAttribute("DiscountList");

%>

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

	//�˻�
	function whenSelection(p_action) {

		if (document.form1.s_grcode.value=="ALL") {
	        alert("�����׷��� �����ϼ���.");
			document.form1.s_grcode.focus();
	        return ;
		}

		document.form1.p_action.value = p_action;
			if (p_action == 'go') {
				top.ftop.setPam();
			}
		document.form1.action = "/servlet/controller.system.DiscountServlet";
		document.form1.p_process.value = "select";
		document.form1.submit();
	}

	function update(){
		document.form1.action = "/servlet/controller.system.DiscountServlet";
		document.form1.p_process.value = "insert";
		document.form1.submit();
	}
		
		
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_seq"     value = "">
    <input type = "hidden" name = "p_action"  value = "">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

       <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td background="/images/admin/homepage/title_bg.gif" class="page_title"><img src="/images/admin/system/tit_discount.gif"  border="0"></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
			  <td width="27%" align="left" valign="middle">
				<%= SelectEduBean.getGrcode(box, true, true)%>
			  </td>
            <td align="right" width="420"> 

            </td>
            <td width="250" align="right" valign="middle">
				<!--a href='javascript:insert()'><img src="/images/admin/button/btn_add.gif" border="0"></a-->
                <a href='javascript:update()'><img src="/images/admin/button/btn_apply.gif" border="0"></a>
            </td>
          </tr>
          <tr>
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- form �� ----------------->

        <!----------------- CyberPoll���� ���� ----------------->

<%if(list != null){
	for (int i=0; i<list.size(); i++) {
	   dbox = (DataBox)list.get(i);

	   v_subjcnt	= dbox.getString("d_subjcnt");
	   v_discount 	= dbox.getString("d_discount");
	}
}
%>
 		<% if( s_grcode.equals("N000001") ) { %>
 			<table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
	          <tr>
	            <td height="10"></td>
	          </tr>
	          <tr>
				  <td width="27%" align="left" valign="middle">���� ���ȸ�� ���� ������</td>
			  </tr>
	        </table>
	        <table class="table_out" cellspacing="1" cellpadding="5">
	          <tr>
	            <td colspan="3" class="table_top_line"></td>
	          </tr>
	          <tr>
	            <td width="18%" height="25" class="table_title"><b>NO</b></td>
	            <td width="40%" class="table_title"><b>�׸�</b></td>
	            <td class="table_title"><b>��</b></td>
	          </tr>
	          <tr>
	            <td height="25" class="table_02_1"><b>1</b></td>
	            <td class="table_02_1">���ȸ������(������� ����)</td>
	            <td class="table_02_2"><input type="text" width="50" name="p_subjcnt" value="<%=v_subjcnt%>">�� �����̻�</td>
	          </tr>
	          <tr>
	            <td height="25" class="table_02_1"><b>2</b></td>
	            <td class="table_02_1">���ȸ�� ������</td>
	            <td class="table_02_2"><input type="text" width="50" name = "p_discount" value="<%=v_discount%>">%</td>
	          </tr>
	        </table>
 		<% } else { %>
 			<table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
	          <tr>
	            <td height="10"></td>
	          </tr>
	          <tr>
				  <td width="27%" align="left" valign="middle">ASP ���ȸ�� ���� ������</td>
			  </tr>
	        </table>
	        <table class="table_out" cellspacing="1" cellpadding="5">
	          <tr>
	            <td colspan="3" class="table_top_line"></td>
	          </tr>
	          <tr>
	            <td width="18%" height="25" class="table_title"><b>NO</b></td>
	            <td width="40%" class="table_title"><b>�׸�</b></td>
	            <td class="table_title"><b>��</b></td>
	          </tr>
	          <tr>
	            <td height="25" class="table_02_1"><b>1</b></td>
	            <td class="table_02_1">���ȸ�� ������</td>
	            <td class="table_02_2"><input type="text" width="50" name = "p_discount" value="<%=v_discount%>">%</td>
	          </tr>
	        </table>
 		<% } %>
        <br>
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>

