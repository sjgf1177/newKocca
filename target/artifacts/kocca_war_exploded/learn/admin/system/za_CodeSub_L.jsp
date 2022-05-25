<%
//**********************************************************
//  1. ��      ��: �Һз��ڵ� ����Ʈ
//  2. ���α׷��� : za_CodeSub_L.jsp
//  3. ��      ��: �Һз��ڵ� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 8
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_searchtext    = box.getString("p_searchtext");
    
    int    v_levels   = box.getInt("p_levels");
    
    String  v_gubun   = box.getString("p_gubun");
    String  v_upper   = box.getString("p_upper");
    String  v_uppernm = CodeAdminBean.getCodeName(v_gubun, v_upper, v_levels-1);
    String  v_parent  = box.getString("p_parent");

    String v_gubunnm  = CodeAdminBean.getCodeName(v_gubun);
    
    

    String v_code   = "";
    String v_codenm = "";

    ArrayList list = (ArrayList)request.getAttribute("selectSubList");
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE="JavaScript">
<!--

    var currentLevels = <%=v_levels%>;

    function up_list() {
    	currentLevels--;

    	if (<%=v_levels - 1%> > 0 ) {
	    	document.form1.p_levels.value   = <%= v_levels - 1%>;
	    	document.form1.p_code.value     = "";
	    	document.form1.p_parent.value     = "";
	    	document.form1.p_upper.value    = "<% if(v_levels > 2) { 
	    		                                     DataBox dbox = CodeAdminBean.getUpperCode(v_gubun, v_upper);
	    		                                     out.print(dbox.getString("d_upper"));
	    	                                      } //else out.print(v_upper); %>";
	        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
	        document.form1.p_process.value = "selectSubList";
	        document.form1.submit();
    	} else {
    		document.form1.p_levels.value   = 0;
            document.form1.action = "/servlet/controller.system.CodeAdminServlet";
            document.form1.p_gubun.value   = "";
            document.form1.p_process.value = "select";
            document.form1.submit();
    	}
    }

    function view(code) {
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
        document.form1.p_code.value   = code;
        document.form1.p_process.value = "selectSubView";
        document.form1.submit();
    }

    function insert() {
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
        document.form1.p_process.value = "insertSubPage";
        document.form1.submit();
    }

    function search() {
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
        document.form1.p_process.value = "selectSubList";
        document.form1.submit();
    }

    function sub_list(code) {
    	currentLevels++;
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";

        if (<%= v_levels + 1%> == 2) {
           document.form1.p_parent.value = code;   
        }
        document.form1.p_upper.value  = code;
        document.form1.p_levels.value   = currentLevels;
        document.form1.p_process.value  = "selectSubList";
        document.form1.submit();
    }

//-->
</SCRIPT>
</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"  value = "<%= v_process %>">
    <input type = "hidden" name = "p_gubun"    value = "<%=v_gubun%>">
    <input type = "hidden" name = "p_code"     value = "">
    <input type = "hidden" name = "p_levels"   value = "<%=v_levels%>">
    <input type = "hidden" name = "p_upper"    value = "<%=v_upper%>">
    <input type = "hidden" name = "p_parent"   value = "<%=v_parent%>">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="768">
  <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/system/unite_title07.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
        <table class="form_table_out" cellspacing="0" cellpadding="1">
          <tr> 
            <td align="center"> 
              <table class="form_table_bg" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="7"></td>
                </tr>
                <tr> 
                  <td height="26" style="padding-left=10;padding-right=10">��з��ڵ� : <strong><%=v_gubun%></strong> </td>
                </tr>
              </table>
              <table class="form_table_bg" cellspacing="0" cellpadding="0">
                <tr valign="middle"> 
                  <td width="400" height="26" style="padding-left=10;padding-right=10">��з��ڵ�� 
                    : <%=v_gubunnm%>&nbsp;&nbsp; </td>
                  <td align="right">�Һз��ڵ�� 
                    <input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>"> 
                  </td>
				  <td width=4></td>
                  <td><a href='javascript:search()'><img src="/images/admin/button/btn_inquiry.gif" border=0></a></td> 
				  <td width=4></td>
                  <td><a href='javascript:insert()'><img src="/images/admin/button/btn_add.gif" border=0></a></td> 
				  <td width=4></td>
				  <td>
				    <a href='javascript:up_list()'>
				    <% if (v_levels == 1 ) { %>
				    <img src="/images/admin/button/btn_bigcode.gif"  border=0>
				    <% } else { %>
				    <img src="/images/admin/button/up_b.gif"  border=0>
				    <% } %>
				    </a>
				  </td> 
                </tr>
                <tr> 
                  <td height="7"></td>
				  <td height="7"></td>
				  <td height="7"></td>
				  <td height="7"></td>
				  <td height="7"></td>
				  <td height="7"></td>
				  <td height="7"></td>
				   <td height="7"></td>
                </tr>
              </table></td>
          </tr>
        </table>
        <br>
        <!----------------- List ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="3" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="30%" height="25" class="table_title"><b>�Һз��ڵ�</b></td>
            <td width="40%" class="table_title"><b>�Һз��ڵ��</b></td>
            <td width="20%" class="table_title"><b>�����Һз��ڵ�</b></td>
          </tr>

<%
            for(int i = 0; i < list.size(); i++) {

                CodeData data  = (CodeData)list.get(i);
                v_code       = data.getCode();
                v_codenm     = data.getCodenm();
                v_upper      = data.getUpper();
                v_parent     = data.getParent();

%>
          <tr> 
            <td height="25" class="table_01"><%=v_code%></td>
            <td class="table_02_2"><a href="javascript:view('<%=v_code%>')"><%=v_codenm%></a></td>
            <td class="table_02_1"><a href="javascript:sub_list('<%=v_code%>')"><img src="/images/admin/button/b_downcodeb.gif" align="absmiddle" border="0"></a></td>
          </tr>
<%
        }
%>

        </table>
        <!----------------- List �� ----------------->
      </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %> 
</form>
</body>
</html>
