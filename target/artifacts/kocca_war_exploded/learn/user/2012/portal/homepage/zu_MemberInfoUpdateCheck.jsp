<%
//**********************************************************
//  1. ��      ��: ȸ������_ȸ������ ����
//  2. ���α׷��� :zu_MemberInfo_Ujsp
//  3. ��      ��: ȸ������_ȸ������ ����
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%@ page import = "com.credu.homepage.LoginBean" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />

<%

	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if (box == null) box = RequestManager.getBox(request);
	box.setSession("s_gubun", 90);
%>


<%@ include file="/learn/user/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<!--<style type="text/css">
body {
	padding: 50px;
	}
h1 a {
	color: #000;
	}
input {
	border: 1px solid #999;
	margin: 0 5px;
	}
.password_strength {
	padding: 0 5px;
	display: inline-block;
	}
.password_strength_1 {
	background-color: #fcb6b1;
	}
.password_strength_2 {
	background-color: #fccab1;
	}
.password_strength_3 {
	background-color: #fcfbb1;
	}
.password_strength_4 {
	background-color: #dafcb1;
	}
.password_strength_5 {
	background-color: #bcfcb1;
	}
</style>-->

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--//

function nextChange(){

	document.form1.target="_self";
    document.form1.action="/servlet/controller.homepage.MainServlet";
    document.form1.p_process.value="nextChange";
    document.form1.submit();
}


//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- form ���� -->
<form name="form1"  action="" method="post">
	<input type="hidden"	name="p_process"	value="" />
	<input type="hidden"	name="p_handphone" />
    <input type="hidden"	name="p_hometel" />
    <input type="hidden"	name="p_email" />
	<input type="hidden"	name="p_postgubun"  value=""/>
	<input type="hidden"	name="p_chk" />
    <input type="hidden"	name="p_kor_name"   value="" />
    <input type="hidden"	name="p_userid"	    value="" />
    <input type="hidden"	name="p_pwd_old"	value="" />

        <!-- �ΰ����� �Է� -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="" style="margin-top: 10px;">
          <tr>
            <td>
            <img src="/images/portal/member/membership/member_info_event.gif" alt="�������� ���� �̺�Ʈ ����" usemap="#Map">
            </td>
          </tr>
        </table>   
        
        <!-- table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
        <tr>
         <td height="50" align="center">
             <a href="javascript:mainmenu('993');"><img src="/images/portal/member/membership/Yes_C_off.gif" name="Image12" id="Image12" alt="���� �����ϱ�" /></a>
             <a href="/servlet/controller.homepage.MainServlet"><img src="/images/portal/member/membership/No_C_off.gif" width="150" height="29" alt="������ �����ϱ�" /></a>
         </td>
        </tr>
        </table -->
</form>
<!-- form �� -->

<map name="map">
    <area alt="���� �����ϱ�"   shape="rect" coords="130,358,280,388" href="javascript:mainmenu('993');" >
    <area alt="������ �����ϱ�" shape="rect" coords="340,358,490,388" href="javascript:nextChange();">
</map>

<script type='text/javascript' src='/script/jquery.password_strength.js'></script>
<script language="JavaScript" type="text/JavaScript">
    $('form1').attr('autocomplete', 'off');
    $('#p_pwd').password_strength();
</script>

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->