
<%
//**********************************************************
//  1. ��      ��: �α���
//  2. ���α׷��� : zu_MainLogin.jsp
//  3. ��      ��: �α���
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
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
<%@ page import = "com.credu.homepage.LoginBean" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    
    box.put("topmenu","1");
	box.put("submenu","1");

    String s_userid  = box.getSession("userid");
	box.put("onLoad","onload=\"winonload();\"");

	String p_eventgubun = box.getString("p_eventgubun");   

	box.put("p_eduservicesul", box.getString("p_eduservicesul"));
	
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>

	<%
	    String v_indexURLGLB = "";     
		String s_tem_grcodeGLB = box.getSession("tem_grcode");
        v_indexURLGLB = "/index" + s_tem_grcodeGLB + ".jsp";


/*         String topWarp_userid = box.getSession("userid");
        String topWarp_usernm = box.getSession("name");
        String topWarp_gadmin = box.getSession("gadmin");
 */
        if (topWarp_gadmin.equals("")) {
        	box.setSession("gadmin", "ZZ");
        	topWarp_gadmin = box.getSession("gadmin");
        }
        String referer ="4124124"+ request.getHeader("REFERER");
        if(referer.indexOf("http://localhost")>0 || referer.indexOf("http://lms.kocca.or.kr")>0)
            referer="Y";
        else
            referer="";

        String mainYN=box.get("mainYn");
        String init_margin="";
        String init_margin1="";
        String init_margin2="";
        if(mainYN.equals(""))
        {
            if(s_tem_grcodeGLB.equals("N000001"))
            {
                init_margin="8";
                init_margin1="0";
                init_margin2="34";
            }
            else
            {
                init_margin="30";
                init_margin1="10";
                init_margin2="30";
            }
        }
        else
        {
            init_margin="20";
            init_margin1="5";
            init_margin2="30";
        }
     %>


<script language="JavaScript" type="text/JavaScript">
<!--
    // ������ �ʱ�ȭ
    function winonload() {
        document.form1.p_userid.focus();
    }

    /* �н����� ����Ű üũ */
    function password_enter(e) {
        if (e.keyCode =='13'){  login();  }
    }

    // �α���
    function login() {    	
        if (input_chk(form1)){

			//�������� ������ Ư�� �ο��� ����..
			/*
      		if( box.getString("p_eduservicesul").equals("Y") ) {  
				form1.p_eduservicesul.value   = "Y";
          	} 
			*/
        	
            form1.p_process.value   = "login";
            form1.p_topuserid.value = form1.p_userid.value;
            form1.p_toppwd.value =  form1.p_pwd.value;

            form1.action            =  https_host() + "/servlet/controller.homepage.LoginServlet";
            form1.submit();
        }
    }

    // �Է� üũ
    function input_chk(form1)  {
        var chk = ( isNull(form1.elements["p_userid"],"���̵�") && isNull(form1.elements["p_pwd"],"��й�ȣ"));
        return (chk);
    }
//-->
</script>

<!-- form ���� -->
<form name="form1"  action="" method="post" action="">
    <input type="hidden" name="p_process"       values="" />
    <input type="hidden" name="p_topuserid"     values="" />
    <input type="hidden" name="p_toppwd"        values="" />
    <input type="hidden" name="p_eduservicesul" values="" />
	<input type="hidden" name="p_eventgubun"    value="<%=p_eventgubun %>" />
	<input type="hidden" name="p_frmURL" 		value="<%=box.getString("p_frmURL")%>" />
	
	  <div class="content">
		<table class="rootinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"><img src="/images/2012/sub/page0/title/member_login.gif" alt="ȸ�� �α���"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > <u>ȸ�� �α���</u></td>
			</tr>
		</table>
		<div class="loginboxline">
			<div class="loginbox">
				<img src="/images/2012/sub/page0/login_msg.gif">
				<table class="loginrable" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td><input type="text" name="p_userid" class="idput" tabindex="171" title="ȸ������ ���̵� �Է����ּ���"></td>
							<td rowspan="2"><a href="javascript:login();" tabindex="173" title="�Է��Ͻ� ���̵�� ��й�ȣ�� �α����մϴ�"><img src="/images/2012/sub/page0/btn_login.gif" class="output" alt="�α���"></a></td>
						</tr>
						<tr>
							<td><input type="password" name="p_pwd" onkeypress="password_enter(event)" class="passput" tabindex="172" title="ȸ������ ��й�ȣ�� �Է����ּ���"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<table class="notlogin" cellspacing="0" cellpadding="0">
			<colgroup><col width="70%"><col width="*"></colgroup>
			<tr>
				<td>���� �ѱ���������ī���� ȸ���� �ƴϽŰ���? ȸ������ �Ͻð� �پ��� ���񽺸� �޾ƺ�����.</td>
				<td class="alignR"><a href="javascript:mainmenu('991');" tabindex="174" title="ȸ�����Խ�û���� �̵��մϴ�."><img src="/images/2012/sub/page0/btn_join.png" class="join" alt="�ű�ȸ������"></a></td>
			</tr>
		</table>
		<table class="notlogin" cellspacing="0" cellpadding="0">
			<colgroup><col width="70%"><col width="*"></colgroup>
			<tr>
				<td>���̵� �Ǵ� ��й�ȣ�� �����̳���?</td>
				<td class="alignR">
					<button type="button" tabindex="175" onClick="javascript:mainmenu('992');" class="idpasssearch" title="���̵� �����̴ٸ� Ŭ�����ּ���.">���̵� ã��</button>&nbsp;
					<button type="button" tabindex="176" onClick="javascript:mainmenu('992');" class="idpasssearch" title="��й�ȣ�� �����̴ٸ� Ŭ�����ּ���.">��й�ȣ ã��</button>
				</td>
			</tr>
		</table>
	</div>
</form>

    <%@ include file="/learn/user/2012/portal/include/footer.jsp" %>
