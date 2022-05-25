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

	String serverName  = box.getString("request.serverName");
	
	if(serverName.equals("edu.kocca.or.kr")){
	    response.sendRedirect("http://edu.kocca.kr/learn/user/2013/portal/homepage/zu_MainLogin.jsp");     
	}
	        
    box.put("topmenu","1");
    box.put("submenu","1");

    String s_userid  = box.getSession("userid");
    box.put("onLoad","onload=\"winonload();\"");

    String p_eventgubun = box.getString("p_eventgubun");

    box.put("p_eduservicesul", box.getString("p_eduservicesul"));

    box.put("title_str", "ȸ�� �α���");

%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<%
    if ( isUserLogin ) {
        response.sendRedirect("/");
    } else {

        String v_indexURLGLB = "";
        String s_tem_grcodeGLB = box.getSession("tem_grcode");
        v_indexURLGLB = "/index" + s_tem_grcodeGLB + ".jsp";

        /*
        String topWarp_userid = box.getSession("userid");
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

        if(mainYN.equals("")) {
            if(s_tem_grcodeGLB.equals("N000001")) {
                init_margin="8";
                init_margin1="0";
                init_margin2="34";
            } else {
                init_margin="30";
                init_margin1="10";
                init_margin2="30";
            }
        } else {
            init_margin="20";
            init_margin1="5";
            init_margin2="30";
        }
%>


<script language="JavaScript" type="text/JavaScript">
<!--


    /**
     * Ű ���� ����Ű�� �ش� �ϴ� ���� �Ѿ���� �α��� �Լ� ����
     */
    function enter_key(e)  {
        if (e.keyCode == "13") {
            login();
        }
    }

    /**
     * ������ �ʱ�ȭ
     */
    function winonload() {
        document.form1.p_userid.focus();
    }

    /**
     * �α���
     */
    function login() {
        var loginForm = document.form1;
        
        if ( loginForm.p_userid.value == "") {
            loginForm.p_userid.focus();
            alert("���̵� �Է��Ͻʽÿ�");
            return;
        } else if ( loginForm.p_pwd.value == "") {
            loginForm.p_pwd.focus();
            alert("��й�ȣ�� �Է��Ͻʽÿ�");
            return;
        } else {

            loginForm.p_process.value = "login";
            loginForm.p_topuserid.value = form1.p_userid.value;
            loginForm.p_toppwd.value =  form1.p_pwd.value;

            loginForm.action = https_host() + "/servlet/controller.homepage.LoginServlet";
            loginForm.submit();
        }
    }

//-->
</script>
<!-- container-new ���� //-->
<div id="container-new">

<!-- form ���� -->
<form name="form1"  action="" method="post" action="">
    <input type="hidden" name="p_process"       value="" />
    <input type="hidden" name="p_topuserid"     value="" />
    <input type="hidden" name="p_toppwd"        value="" />
    <input type="hidden" name="p_eduservicesul" value="" />
    <input type="hidden" name="p_eventgubun"    value="<%=p_eventgubun %>" />
    <input type="hidden" name="p_frmURL"        value="<%=box.getString("p_frmURL")%>" />


    <div id="mainMenu">
        <!-- �н����� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>ȸ�� �α���</li>
        </ul>
        <!-- ������ο� -->
    </div>
    <!-- //#mainMenu -->


    <!-- ������ ���� ���� -->
        <div id="contents">
            <h2 class="subTit"><img src="/images/2013/online_edu/join_login_title.gif" alt="ȸ�� �α���" /></h2>

            <div id="subCont" class="member">
                <div class="join_login">
                    <!-- <p class="tit"><img src="/images/2013/online_edu/login_title.gif" alt="login ȸ������ ���� ���� 02-2161-0077" /></p> -->
                    <dl>
                        <dt><img src="/images/2013/online_edu/login_title.jpg" alt="login ȸ������ ���� ���� 02-2161-0077" /></dt>
                        <dd><input type="text" name="p_userid" id="oUserLoginId" onfocus="javascript:this.select();"/><label for="oUserLoginId"></label></dd>
                        <dd><input type="password" name="p_pwd" id="oUserPasword" onfocus="javascript:this.select();" onkeypress="enter_key(event);" /><label for="oUserPasword"></label></dd>
                        <dd class="btn_login"><a href="javascript:login();"><img src="/images/2013/btn/btn_login_join.gif" alt="�α���" /></a></dd>
                    </dl>
                </div>
                <p class="service_qs">
                    ���� �ѱ���������ī���� ȸ���� �ƴϽŰ���? ȸ������ �Ͻð� �پ��� ���񽺸� �޾ƺ�����.
                    <span class="btn_right first"><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin&menuid=01&gubun=90"><img src="/images/2013/btn/btn_newjoin.gif" alt="�ű�ȸ������" /></a></span>
                </p>

                <p class="service_qs">
                    ���̵� �Ǵ� ��й�ȣ�� �����̳���?
                    <span class="btn_right">
                        <a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd&menuid=02&gubun=90"><img src="/images/2013/btn/btn_idsch.gif" alt="���̵� ã��" /></a>
                        <a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd&menuid=02&gubun=90"><img src="/images/2013/btn/btn_pwsch.gif" alt="��й�ȣ ã��" /></a>
                    </span>
                </p>

            </div>
            <!-- //#subCont -->
        </div>
        <!-- //#contents -->
        <!-- ������ ���� �� -->
</form>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>

<%
    }
%>