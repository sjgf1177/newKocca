<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import = "com.credu.homepage.LinkSiteBean" %>
<%@ page import = "com.credu.homepage.LoginBean" %>
<head>
<title>�ѱ������������ ��ī����</title>
<style type="text/css" media="screen">@import "/css/2012/common.css";</style>
<style type="text/css" media="screen">@import "/css/2012/main.css";</style>
<script type="text/javascript" src="/js/jquery/1.4/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="/js/2012/lib.js"></script>
<script language="javascript" type="text/javascript" src="/js/2012/jquery.banner.js"></script>
<script language="javascript" src="/script/mainscript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Content-Language" content="euc-kr">
<meta http-equiv="imagetoolbar" content="false">
<meta name="robots" content="all">
<meta name="MSSmartTagsPreventParsing" content="true">
<meta name="description" content="">
</head>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");    
    ArrayList<DataBox> noticeListTop = (ArrayList) request.getAttribute("noticeListTop"); // ��������    
    ArrayList<DataBox> noticeListPopup = (ArrayList) request.getAttribute("noticePopup");// �˾� ��������
    
    ArrayList<DataBox> onLineSubjList  = (ArrayList)request.getAttribute("onLineSubjList");// �¶��� �α����    
    ArrayList<DataBox> onLineGameSubjList  = (ArrayList)request.getAttribute("onLineGameSubjList");// ����
    ArrayList<DataBox> onLineBroadSubjList  = (ArrayList)request.getAttribute("onLineBroadSubjList");// ���
    ArrayList<DataBox> onLineCultureSubjList  = (ArrayList)request.getAttribute("onLineCultureSubjList");// ��ȭ
    
    ArrayList<DataBox> DimensionOffSubjectList  = (ArrayList)request.getAttribute("DimensionOffSubjectList");// 3D ��ü������
    ArrayList<DataBox> IndustryOffSubjectList  = (ArrayList)request.getAttribute("IndustryOffSubjectList");// �����
    ArrayList<DataBox> NextOffSubjectList  = (ArrayList)request.getAttribute("NextOffSubjectList");// ������
    ArrayList<DataBox> SuTakOffSubjectList  = (ArrayList)request.getAttribute("SuTakOffSubjectList");// ��Ź����
    
    String topWarp_userid = box.getSession("userid");
    String topWarp_usernm = box.getSession("name");
    String topWarp_gadmin = box.getSession("gadmin");
    
    HashMap<String, String> upperMap = null;    // ��з� �� �޴�ID ���� �� HashMap<upperlcass, menuid>

    upperMap   = ClassifySubjectBean.getMenuId(box);
   
%>    
<script type="text/javascript">
/* �н����� ����Ű üũ */
   function password_enter(e) {
        if (e.keyCode =='13'){  login_main();  }
    }

    // �α���
    function login_main() {    	
        if (input_chk()){       
        	//alert('test');
            document.login.p_process.value   = "login";
            //form1.p_topuserid.value = form1.p_userid.value;
            //form1.p_toppwd.value =  form1.p_pwd.value;

            document.login.action            = "/servlet/controller.homepage.LoginServlet";
            document.login.submit();
        } else {
        	return;
        }
    }
    
    function input_chk()  {    	    	
        if (document.getElementById('p_userid').value == "" || document.getElementById('p_userid').value == null )
        {
            document.login.p_userid.value="";  //��â�� NULL�� ����
            alert( "���̵��� �Է��Ͻʽÿ�.");
            document.login.p_userid.focus();
            return(false);
        }
        if (document.getElementById('p_pwd').value == "" || document.getElementById('p_pwd').value == null )
        {
            document.login.p_pwd.value="";  //��â�� NULL�� ����
            alert( "��й�ȣ �Է��Ͻʽÿ�.");
            document.login.p_pwd.focus();
            return(false);
        }
        return(true);
    }
    
    function logout() {
	    document.form1.p_process.value = "gologout";
	    document.form1.action          = "/servlet/controller.homepage.LoginServlet";
	    document.form1.submit();
    }
    
 // �������� �󼼺���
    function viewNotice(seq) {
       document.form1.action = "/servlet/controller.homepage.HomeNoticeServlet";
       document.form1.p_process.value = "selectView";
       document.form1.menuid.value = "07";
       document.form1.gubun.value = "4";
       document.form1.p_seq.value= seq;
       document.form1.target = "_self";
       document.form1.submit();
    }
    
    function view_On_Subj(subj,subjnm,courseyn,upperclass,upperclassnm, year, subjseq, menuid){
        var p_process="";
        var action="";
        var gubun="";
        if(courseyn=="ON")
        {
            p_process="SubjectPreviewPage";
            action="/servlet/controller.propose.ProposeCourseServlet";
            gubun="1";
        }
        else
        {
            p_process="SubjectPreviewPage";
            action="/servlet/controller.off.ProposeOffServlet";
            gubun="2";
        }

	    document.form1.p_subj.value = subj;
	    document.form1.p_subjnm.value = subjnm;
	    document.form1.p_iscourseYn.value = courseyn;
	    document.form1.p_upperclass.value = upperclass;
	    document.form1.p_upperclassnm.value = upperclassnm;
	    document.form1.p_year.value = year;
	    document.form1.p_subjseq.value = subjseq;
        $("[name='p_seq']").val(upperclassnm);
	    document.form1.menuid.value = menuid;
	    document.form1.gubun.value = gubun;
	    document.form1.p_process.value = "SubjectPreviewPage";
	    document.form1.p_rprocess.value = 'SubjectList';
	    document.form1.action=action;
	    document.form1.target = "_self";
	    document.form1.submit();
    }
    
    
  //��ü �����˻�
    function totalSubjSearch() {
        var searchText = $("#topWarp_searchText").val();
         var gubun   = "1";
         var url     = "/servlet/controller.propose.MainSubjSearchServlet?p_process=SubjSearch&p_lsearchtext="+searchText;
         menuMainForward(gubun, url);
       
 
    }
  
 // ����������
    function topAdminOpenPage() {
        window.self.name = "winSelectView";
        farwindow = window.open("", "openWinAdmin", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 1024, height = 768, top=0, left=0");
        document.topdefaultForm.target = "openWinAdmin"
        document.topdefaultForm.action = "/learn/admin/system/mScreenFset.jsp";
        document.topdefaultForm.submit();

        farwindow.window.focus();
        document.topdefaultForm.target = window.self.name;
    }

    // ���Ѻ���
    function topAuthChange() {
        var sAuth   = document.getElementById("p_topAuth").value;

        document.topdefaultForm.p_auth.value    = sAuth;
        document.topdefaultForm.p_process.value = "authChange";
        document.topdefaultForm.action          = "/servlet/controller.homepage.MainServlet";
        document.topdefaultForm.submit();
    }

    
    
</script>
<form name="topdefaultForm" method="post" action="javascript:return;" id="topdefaultForm">
  <input type='hidden' name='p_process'   value=''>
  <input type='hidden' name='gubun'       value='0'>
  <input type='hidden' name='menuid'      value=''>
  <input type='hidden' name='url'         value=''>
  <input type='hidden' name='p_cmuno'     value=''>
  <input type='hidden' name='searchClass' value=''>
  <input type='hidden' name='p_auth'      value=''>
  <input type='hidden' name='p_topuserid' value=''>
  <input type='hidden' name='p_toppwd'    value=''>
  <input type='hidden' name='p_area'    value=''>
</form>	
<form name="form1" method="post" id="form1" style="margin-top: -206px;">
    <input type="hidden" name="p_process" value="" />
    <input type="hidden" name="p_rprocess" value="" />
    <input type="hidden" name="menuid" value="" />
    <input type="hidden" name="gubun" value="" />
    <input type="hidden" name="p_seq" value="" />
    <input type="hidden" name="p_subj" value="" />
    <input type="hidden" name="p_subjnm" value="" />
    <input type="hidden" name="p_iscourseYn" value="" />
    <input type="hidden" name="p_upperclass" value="" />
    <input type="hidden" name="p_upperclassnm" value="" />
    <input type="hidden" name="p_year" value="" />
    <input type="hidden" name="p_subjseq" value="" />
    <input type="hidden" name="p_topuserid"	value=""/>
    <input type="hidden" name="p_toppwd"	value=""/>
    <input type="hidden" name="p_edusulUserid" values="" />
    <input type = "hidden" name = "p_prePage"     value = "">
</form> 
<body>
<div id="header">
	<div class="topheader">
		<div class="logo"><img src="/images/2012/common/logo.png" alt="�ѱ���������ī����"></div>
		
		<ul class="navi">
			<li><a href="javascript:menuMainForward('3', '/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage');" title="���ǰ��ǽǷ� �̵��մϴ�. �̿��Ͻñ� ���� �α����� ���ּ���."><img src="/images/2012/common/menu/menu1.png" onmouseover="slideCateScroll('on','1');" id="navi1" alt="���ǰ��ǽ�"></a></li>
			<li><a href="javascript:menuMainForward('1', '/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList');" title="�¶��� ���������� Ȯ�� �� ��û�� �� �ֽ��ϴ�."><img src="/images/2012/common/menu/menu2.png" onmouseover="slideCateScroll('on','2');" id="navi2" alt="�¶��ΰ���"></a></li>
			<li><a href="javascript:menuMainForward('2', '/servlet/controller.off.ProposeOffServlet?p_process=SubjectList');" title="�������� ���������� Ȯ�� �� ��û�� �� �ֽ��ϴ�."><img src="/images/2012/common/menu/menu3.png" onmouseover="slideCateScroll('on','3');" id="navi3" alt="�������ΰ���"></a></li>
			<li><a href="javascript:menuMainForward('4', '/servlet/controller.homepage.HomeNoticeServlet?p_process=List&menuid=07');" title="�н� ��/��/�� �ʿ��� ������ �ڷḦ �����մϴ�."><img src="/images/2012/common/menu/menu4.png" onmouseover="slideCateScroll('on','4');" id="navi4" alt="�н�����"></a></li>
			<li><a href="javascript:menuMainForward('5', '/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage');" title="�����λ���� �������Ǹ� ������ �� �ֽ��ϴ�."><img src="/images/2012/common/menu/menu5.png" onmouseover="slideCateScroll('on','5');" id="navi5" alt="��������"></a></li>
			<li><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage');" title="���� �� �ñ��� ���� �ִٸ� �����̵� �������. �̿��Ͻñ� ���� �α����� ���ּ���."><img src="/images/2012/common/menu/menu6.png" onmouseover="slideCateScroll('on','6');" id="navi6" alt="�������丮"></a></li>
			<li><a href="javascript:menuForward('7','01');" title="�ѱ������������ ��ī���̸� �Ұ��մϴ�."><img src="/images/2012/common/menu/menu7.png" onmouseover="slideCateScroll('on','7');" id="navi7" alt="��ī���̼Ұ�"></a></li>
		</ul>
		
		
		<ul class="memberoption">
			<li class="leftbg"></li>
			<li class="centerbg">
				<form method="post" action="">
					<dl class="search">
						<dd class="intext"><input type="text" name="topWarp_searchText" id="topWarp_searchText" onfocus="this.style.background='#000000';" title="�˻�� �Է����ּ���."></dd>
						<dd class="outsearch"><a href="javascript:totalSubjSearch();"><img src="/images/2012/common/btn_search.png" alt="�˻�" title="�˻��� �����մϴ�."></a></dd>
					</dl>
					<dl class="option">
					<% if(topWarp_userid.equals("")) {%>     <%--�α����� �ȵǾ��� ���--%>	
						<dd><a href="javascript:menuMainForward('90','/servlet/controller.homepage.MainServlet?p_process=MainLogin');" title="�α���ȭ������ �̵��մϴ�"><img src="/images/2012/common/option_btn_login.png" alt="�α���"></a></dd>
						<dd><a href="javascript:menuForward('90','01');" title="���� ȸ�������� �غ�����"><img src="/images/2012/common/option_btn_join.png" alt="ȸ������"></a></dd>
					<% } else { %>	
						<!-- �α��� �� -->
						<dd class="membername"><b><%=topWarp_usernm%></b>�� �������.</dd>
						<dd><a href="javascript:logout();" title="�α׾ƿ��մϴ�"><img src="/images/2012/common/option_btn_logout.png" alt="�α׾ƿ�"></a></dd>
						<dd><a href="javascript:menuForward('90','03');" title="ȸ������ ������ �����մϴ�"><img src="/images/2012/common/option_btn_modify.png" alt="ȸ����������"></a></dd>
						<!-- ������ ��� -->
						<dd class="select">
							<%= box.getSession("tem_grcode").equals("N000001") ? LoginBean.getAuthSelect(topWarp_userid, "p_topAuth", topWarp_gadmin, "onChange = 'javascript:topAuthChange();'") : ""%>
						</dd>
						<dd>
						<% if ((!(topWarp_gadmin.equals("ZZ") || topWarp_gadmin.equals("")))) {  %>
						<a href="javascript:topAdminOpenPage()" title="LMS�� �̵��մϴ�"><img src="/images/2012/common/option_btn_lms.png" alt="LMS"></a>
						<% } %>
						</dd>
						<% if ((!(topWarp_gadmin.equals("ZZ") || topWarp_gadmin.equals("")))) {  %>
						<dd class="select">
							<select name="p_project" title="�⵵�� �������ּ���">
								<option>����</option>
								<option value="2011000011">2010</option>
								<option value="2011000011">2011</option>
								<option value="2011000011">2012</option>
							</select>
						</dd>
						<dd><a href="javascript:goSubIndex()" title="������Ʈ�Խ������� �̵��մϴ�"><img src="/images/2012/common/option_btn_project.png" alt="������Ʈ�Խ���"></a></dd>
						<% } %>
					<% } %>
					</dl>
				</form>
			</li>
			<li class="rightbg"></li>
		</ul>
	</div>
	
</div>
<div id="submenuline" class="submenubox">
	<div class="subnavibox">
		<table id="submenu1" class="subnavi smenu1">
		
			<tr>
				<td><a href="javascript:menuForward('3','11');" title="���� �н����� ������ Ȯ�� �Ǵ� �н��� �� �ֽ��ϴ�.">�������� ����</a></td>
				<td><a href="javascript:menuForward('3','02');" title="ȸ������ �� ������� �н��� �̷��� Ȯ���� �� �ֽ��ϴ�.">���Ǳ����̷�</a></td>
				<td><a href="javascript:menuForward('3','17');" title="��û�� ������ Ȯ���ϰų� ����� �� �ֽ��ϴ�.">������û Ȯ��/���</a></td>
				<td><a href="javascript:menuForward('3','19');" title="���� ��ȸ �Ǵ� ��Ҹ� �� �� �ֽ��ϴ�.">������ ��������</a></td>
				<td><a href="javascript:menuForward('3','12');" title="����Ͻ� ������ Ȯ���� �� �ֽ��ϴ�.">���� ��㳻��</a></td>
				<td><a href="javascript:menuForward('3','07');" title="ȸ������ �����Ͻ� ������ Ȯ���� �� �ֽ��ϴ�.">���� ����</a></td>
				<td><a href="javascript:menuForward('3','17');" title="������ �����Ͻ� ��� �������� ����� �� �ֽ��ϴ�.">������ ���</a></td>
			</tr>
		</table>
		<table id="submenu2" class="subnavi smenu2">
			<tr>
				<td><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList')" title="��ۿ��� �о� �¶��ΰ����� �ȳ��մϴ�.">��ü</a></td>
				<td><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_area=B0')" title="��ۿ��� �о� �¶��ΰ����� �ȳ��մϴ�.">��ۿ���</a></td>
				<td><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_area=G0')" title="���Ӱ��� �о� �¶��ΰ����� �ȳ��մϴ�.">���Ӱ���</a></td>
				<td><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_area=K0')" title="��ȭ������ �о� �¶��ΰ����� �ȳ��մϴ�.">��ȭ������</a></td>
			</tr>
		</table>
		<table id="submenu3" class="subnavi smenu3">
			<tr>
				<td><a href="javascript:menuForward('2','01');" title="��ۿ��� �о� �������ΰ����� �ȳ��մϴ�.">��ۿ���</a></td>
				<td><a href="javascript:menuForward('2','02');" title="���Ӱ��� �о� �������ΰ����� �ȳ��մϴ�.">��������</a></td>
				<td><a href="javascript:menuForward('2','03');" title="��ȹâ�� �о� �������ΰ����� �ȳ��մϴ�.">��ȹâ��</a></td>
				<td><a href="javascript:menuForward('2','04');" title="�н� �� �ʿ��� �ڷḦ �����մϴ�.">�����ڷ��</a></td>
				<td><a href="javascript:menuForward('2','05');" title="�������� ������ ���� �� ���� ���������� Ȯ���� �� �ֽ��ϴ�.">��������</a></td>
				<!-- <td><a href="#" title="������, �������, �޽İ��� �� �н�ȯ���� �Ұ��մϴ�.">����ȯ��Ұ�</a></td> -->
			</tr>
		</table>
		<table id="submenu4" class="subnavi smenu4">
			<tr>
				<td><a href="javascript:menuForward('4','07');"  title="�ѱ������������ ��ī������ ���ҽ��� �˷��帳�ϴ�.">��������</a></td>
				<td><a href="javascript:menuForward('4','01');" title="���� ���� ������ ��Ƶξ����ϴ�.">FAQ</a></td>
				<td><a href="javascript:menuForward('4','02');" title="�ñ��� ���� �ִٸ� �������.">������ϱ�</a></td>
				<td><a href="javascript:menuForward('4','05');" title="�¶��� �н� �� �������� �н��� ���� �н�ȯ���� �����մϴ�.">�н�ȯ�浵���</a></td>
				<td><a href="javascript:menuForward('4','09');" title="����� ������ ���ϽŴٸ� �̰� 1:1���Ǹ� �̿����ּ���.">1:1����</a></td>
				<td><a href="javascript:menuForward('4','10');" title="�������� ���� �� ���Ǵ� ���縦 �Ұ��մϴ�.">����Ұ�</a></td>
				<td><a href="javascript:menuForward('4','12');" title="��ī���̿��� �����ϴ� �پ��� �̺�Ʈ�� Ȯ���� �� �ֽ��ϴ�.">�̺�Ʈ</a></td>
				<!-- <td><a href="javascript:menuForward('4','07');" title="������û�� ������ ��� ���̵带 ���� �����غ�����.">������û���</a></td> -->
				<!-- <td><a href="javascript:menuForward('4','07');" title="�¶���/�������� ���� ���� �� �ñ��� ���� �ִٸ� �ȳ��� �޾ƺ�����.">�������̵�</a></td> -->
			</tr>
		</table>
		<table id="submenu5" class="subnavi smenu5">
			<tr>
				<td><a href="javascript:menuForward('5','12');" title="��ۿ��� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ۿ���</a></td>
				<td><a href="javascript:menuForward('5','13');" title="��ȭ ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ȭ</a></td>
				<td><a href="javascript:menuForward('5','14');" title="��ť���͸� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ť���͸�</a></td>
				<td><a href="javascript:menuForward('5','15');" title="��ȭ���� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ȭ����</a></td>
				<td><a href="javascript:menuForward('5','16');" title="���� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">����</a></td>
				<!-- <td><a href="javascript:menuForward('5','17');" title="��ȹ ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ȹ</a></td>
				<td><a href="javascript:menuForward('5','17');" title="��Ÿ ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��Ÿ</a></td> -->
			</tr>
		</table>
		<table id="submenu6" class="subnavi smenu6">
			<tr>
				<td><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage')" title="�������丮�� ��ü ������ �����غ��ҽ��ϴ�.">����</a></td>
				<td><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=CB')" title="��ۿ��� �о� ���� �����Դϴ�.">��ۿ���</a></td>
				<td><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=CG')" title="��ۿ��� �о� ���� �����Դϴ�.">���Ӱ���</a></td>
				<td><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=CK')" title="��ۿ��� �о� ���� �����Դϴ�.">��ȭ������</a></td>
				<td><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=MINE')" title="ȸ���Բ��� �����Ͻ� ������ �̿��� �� �ֽ��ϴ�.">���� �ۼ��� ��</a></td>
			</tr>
		</table>
		<table id="submenu7" class="subnavi smenu7">
			<tr>
				<td><a href="javascript:menuForward('7','01');" title="�ѱ��������������Բ��� ȸ���Ե鲲 �帮�� �λ縻�Դϴ�.">������� �λ縻</a></td>
				<td><a href="javascript:menuForward('7','02');" title="��ī������ ���������� ������ ���� �Ұ��մϴ�.">�������� �� ����</a></td>
				<td><a href="javascript:menuForward('7','05');" title="��ī���� ��������� �ȳ��մϴ�.">�������</a></td>
				<!-- <td><a href="javascript:menuForward('7','03');" title="��ī���� �����ü��� �ȳ��մϴ�.">�����ü�</a></td> -->
				<td><a href="javascript:menuForward('7','06');" title="��ī���̿� ���°����� ����� �Ұ��մϴ�.">�������±��</a></td>
				<td><a href="javascript:menuForward('7','04');" title="�ѱ������������ ��ī���̿� ���ô±��� �ȳ��մϴ�.">���ô±�</a></td>
			</tr>
		</table>
	</div>
	<div onmouseover="slideCateScroll('off','0');" id="blockbox" style="margin-top:7px; height:10px; display:none;"></div>
</div>
<div id="container">
	<div class="topcontent">
		<ul class="contentA">
			<li class="leftspace">
				
				<% if(topWarp_userid.equals("")) {%>     <%--�α����� �ȵǾ��� ���--%>	
				<div class="loginput">
				<form method="post" name="login" action=""> 
						<input type='hidden' name='p_process'   value=''>			
						<input name="p_userid" id="p_userid" type="text" class="id" onfocus="this.style.background='#ffffff';" title="���̵� �Է����ּ���.">
						<input name="p_pwd" id="p_pwd" type="password" onkeypress="password_enter(event)" class="pass" onfocus="this.style.background='#ffffff';" title="��й�ȣ�� �Է����ּ���.">
						<input type="image"  onClick="return login_main();" src="/images/2012/main/btn_login.png" class="login" alt="�α���" title="ȸ�� �α����� �����մϴ�.">
				</form> 
				</div>
				<% } else  { %>
					<dl class="logafter">
					<dd><a href="javascript:menuForward('90','03');"><img src="/images/2012/main/member_modify.png"></a></dd>
					<dd><a href="javascript:logout();"><img src="/images/2012/main/logout.png"></a></dd>
					<dd><b><%=topWarp_usernm%></b>�� &nbsp;</dd>
					</dl>
				<%  }  %>
				
				<a href="javascript:menuForward('90','02');" title="���̵� �Ǵ� ��й�ȣ�� �ؾ��� �� Ŭ���ϼ���."><img src="/images/2012/main/btn_idpass.png" class="idpass" alt="���̵�/��й�ȣ ã��"></a>
				<a href="javascript:mainmenu('991');" title="�ű�ȸ�������� �����մϴ�."><img src="/images/2012/main/btn_join.png" class="join" alt="ȸ������"></a>
				<dl class="titlenewspost">
					<dt><img src="/images/2012/main/subject_news.png" alt="��ī���� ���ҽ�"></dt>
					<dt class="more"><a href="javascript:menuForward('4','07');" title="������������ �̵��մϴ�."><img src="/images/2012/main/btn_more.png" alt="��ü����"></a></dt>
				</dl>
				<table class="newspost" cellpadding="0" cellspacing="0" summary="��ī���� ���ҽ�">
					<colgroup><col width="8"><col width="*"></colgroup>
					<tbody>
					
					 <%  // ��������
                        if(noticeListTop.size()!=0)
                        {
                            for(int i=0;i<noticeListTop.size();i++)
                            {   
                            	if (i > 5) break;
                                DataBox dbox =  noticeListTop.get(i);
                     %>
                     			<tr>
									<td><img src="/images/2012/main/icon_dot.png" alt="������"></td>
									<td><a href="javascript:viewNotice('<%=dbox.getString("d_seq")%>');" title="<%=StringManager.formatTitle(StringManager.removeHTML(dbox.getString("d_adtitle")), 35)%>"><%=StringManager.formatTitle(StringManager.removeHTML(dbox.getString("d_adtitle")), 30)%></a></td>
									<td class="date"><%=dbox.getString("d_addate").substring(4,6)%>-<%=dbox.getString("d_addate").substring(6,8)%></td>
								</tr>
                     <%
                            }
                        }
                        else
                        {
                            out.print("<tr><td><img src='/images/2012/main/icon_dot.png' alt='������'></td>");
                            out.print("<td colspan=2>�� �ҽ��� �����ϴ�.</td>");                           
                            out.print("</tr>");
                        }                                      
             		%>
                                     
					</tbody>
				</table>
			</li>
			<li class="rightspace">
				<!-- ��� ���� -->
				<script type="text/javascript">
				<!--
				$(function() {
					$("#cyberbanner").jQBanner({nWidth:589,nHeight:245,nCount:5,isActType:"left",nOrderNo:1,isStartAct:"N",isStartDelay:"Y",nDelay:4000,isBtnType:"img"});
				});
				//-->
				</script>
				<div id="cyberbanner">
					<div class="clsBannerScreen">
						<div class="images"><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectPreviewPage&gubun=2&menuid=03&p_subj=SK12017&p_year=2012&p_subjseq=0001&p_seq=1"><img src="/images/2012/main/banner/showimage/opencast.png" alt="<20�� ��ǥ��Ʈ>�ڽſ��۰��� û���� �Ѱ踦 ���ϴ�! ����? 201�� 10�� 9��(ȭ) 19:00 ~ 20:30 ��𿡼�? �� �ѱ����ȸ�� 3�� ȸ����"></a></div>
						<div class="images"><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=selectView&menuid=07&gubun=4&p_seq=1570&tem_grcode=N000001"><img src="/images/2012/main/banner/showimage/kpop.png" alt="k-pop,��ȭ�� ������ ���� �ؿ� ����Ͻ� ���� : ���� 9.25(ȭ)~10.15(��) (17:00 ����)"></a></div>
						<div class="images"><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectPreviewPage&gubun=2&menuid=03&p_subj=SK12018&p_year=2012&p_subjseq=0001&p_seq=1"><img src="/images/2012/main/banner/showimage/jung.png" alt="���ʵ�2, �ڹ����� ����ִ��� 3D��ü���� ���۹����� �� �� ����Ʈ ��û ���� : 2012. 10. 15 (��) �� ���ȸ�� 3�� ȸ���忡��. ���� ���� ��û�� 2012.9.24(��) ~ 10.12(��)"></a></div>
						<div class="images"><img src="/images/2012/main/banner/showimage/thanks.png" alt="ǳ���� �Ѱ��� - �ٰ����� �Ѱ����� ��̰� ǳ��Ӱ� ��������. �ѱ���������ī���� �ϵ�"></div>
						<div class="images"><a href="javascript:viewNotice('1568');"><img src="/images/2012/main/banner/showimage/renewal.png" alt="�ѱ���������ī���� Ȩ������ ������, ����������? ������ ������ ���� �н�ȯ�� ����, ������ �̿��� �� �ִ� �����ټ� �ؼ�"></a></div>
					</div>
					<ul class="clsBannerButton" id="label_3">
						<li><img src="/images/2012/main/banner/number/num01on.png" oversrc="/images/2012/main/banner/number/num01on.png" outsrc="/images/2012/main/banner/number/num01.png" alt="1"></li>
						<li><img src="/images/2012/main/banner/number/num02.png" oversrc="/images/2012/main/banner/number/num02on.png" outsrc="/images/2012/main/banner/number/num02.png" alt="2"></li>
						<li><img src="/images/2012/main/banner/number/num03.png" oversrc="/images/2012/main/banner/number/num03on.png" outsrc="/images/2012/main/banner/number/num03.png" alt="3"></li>
						<li><img src="/images/2012/main/banner/number/num04.png" oversrc="/images/2012/main/banner/number/num04on.png" outsrc="/images/2012/main/banner/number/num04.png" alt="4"></li>
						<li><img src="/images/2012/main/banner/number/num05.png" oversrc="/images/2012/main/banner/number/num05on.png" outsrc="/images/2012/main/banner/number/num05.png" alt="5"></li>
					</ul>
				</div>
				<!-- ��� ���� �� -->
			</li>
		</ul>
		<ul class="contentB">
			<li class="online">
				<dl class="titleonline">
					<dd><img src="/images/2012/main/subject_onlinecourse.png" alt="�¶��� ����"></dd>
					<dd class="more"><a href="javascript:menuMainForward('1', '/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList');" title="��ü����"><img src="/images/2012/main/btn_more.png" alt="�¶��� ���� ��ü����"></a></dd>
				</dl>
				<dl class="onlinetab">
					<dd><button type="button" onmouseover="onlinetab('1')" onclick="document.location='#'" class="over" id="online1" title="�¶��� ��õ����">�¶��� ��õ����</button></dd>
					<dd><button type="button" onmouseover="onlinetab('2')" onclick="document.location='#'" class="out" id="online2" title="��������">��������</button></dd>
					<dd><button type="button" onmouseover="onlinetab('3')" onclick="document.location='#'" class="out" id="online3" title="��ۿ���">��ۿ���</button></dd>
					<dd><button type="button" onmouseover="onlinetab('4')" onclick="document.location='#'" class="out" id="online4" title="��ȭ������">��ȭ������</button></dd>
				</dl>
				<table id="onlinelist1" class="courselist" cellpadding="0" cellspacing="0" summary="�¶��� ��õ���� ����Ʈ">
					<colgroup><col width="60"><col width="*"></colgroup>
					<tbody>
					
					 <%  // �¶��� ��õ����
                        if(onLineSubjList.size()!=0)
                        {
                            for(int i=0;i<onLineSubjList.size();i++)
                            {                               
                                DataBox dbox =  onLineSubjList.get(i);
                                String biyong="";
                                String aHref_SubjValues="";
                                DecimalFormat df = new DecimalFormat("#,###");

                                String tmp=upperMap !=null && upperMap.get(dbox.get("d_scupperclass")) != null ?  upperMap.get(dbox.get("d_scupperclass")).toString() : "00";
                                aHref_SubjValues="'"+dbox.get("d_subj")+"','"+dbox.get("d_subjnm")+"','"+dbox.get("d_isonoff")+"','"+dbox.get("d_scupperclass")+"','"+dbox.get("d_uclassnm")+"','"+dbox.get("d_scyear")+"','"+dbox.get("d_subjseq")+"','";
                                aHref_SubjValues+=tmp+"'";
                     %>
                     	<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="javascript:view_On_Subj(<%=aHref_SubjValues%>);" title="[<%=dbox.getString("d_EDUSTART")%> ~ <%=dbox.getString("d_EDUEND")%>] <%=StringManager.formatTitle(dbox.get("d_subjnm"), 26)%>"><%=StringManager.formatTitle(dbox.get("d_subjnm"), 26)%></a></td>
							<td class="date"><%=dbox.getString("d_EDUSTART")%> ~ <%=dbox.getString("d_EDUEND")%></td>
						</tr>
                     <%
                            }
                        }
                        else
                        {
                            out.print("<tr>");
                            out.print("<td colspan=3>���� ��û ������ ���°� �����ϴ�.</td>");                           
                            out.print("</tr>");
                        }                                      
             		%>
						<!-- <tr>
							<td><img src="/images/2012/main/icon/icon_bl.gif" alt="BL��ȭ����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 11���� ��Ģ���� ������ ���丮�ڸ�">11���� ��Ģ���� ������ ���丮�ڸ�</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D Data Exporting Techniques">3D Data Exporting Techniques</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						 -->
					</tbody>
				</table>
				<table id="onlinelist2" class="courselist" style="display:none;" cellpadding="0" cellspacing="0" summary="�������ۺо� ���� ����Ʈ">
					<colgroup><col width="60"><col width="*"></colgroup>
					<tbody>
					<%  // �������ۺо�
                       for(int i=0;i<onLineGameSubjList.size();i++)
                            {                               
                                DataBox gamedbox =  onLineGameSubjList.get(i);
                                String biyong="";
                                String aHref_SubjValues="";
                                DecimalFormat df = new DecimalFormat("#,###");

                                String tmp=upperMap !=null && upperMap.get(gamedbox.get("d_scupperclass")) != null ?  upperMap.get(gamedbox.get("d_scupperclass")).toString() : "00";
                                aHref_SubjValues="'"+gamedbox.get("d_subj")+"','"+gamedbox.get("d_subjnm")+"','"+gamedbox.get("d_isonoff")+"','"+gamedbox.get("d_scupperclass")+"','"+gamedbox.get("d_uclassnm")+"','"+gamedbox.get("d_scyear")+"','"+gamedbox.get("d_subjseq")+"','";
                                aHref_SubjValues+=tmp+"'";
                                
                                String v_edustart = FormatDate.getFormatDate(gamedbox.getString("d_EDUSTART"),"yyyy.MM.dd");
                                String v_eduend = FormatDate.getFormatDate(gamedbox.getString("d_EDUEND"),"yyyy.MM.dd");
                                
                     %>
                     	<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="javascript:view_On_Subj(<%=aHref_SubjValues%>);" title="[<%=v_edustart%> ~ <%=v_eduend%>] <%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%>"><%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%></a></td>
							<td class="date"><%=v_edustart%> ~ <%=v_eduend%></td>
						</tr>
                     <%
                       }
                       
                        if (onLineGameSubjList.size() == 0)
                        {
                            out.print("<tr>");
                            out.print("<td colspan=3>���� ��û ������ ���°� �����ϴ�.</td>");                           
                            out.print("</tr>");
                        }                                      
             		%>
						
					</tbody>
				</table>
				<table id="onlinelist3" class="courselist" style="display:none;" cellpadding="0" cellspacing="0" summary="��ۿ���о� ���� ����Ʈ">
					<colgroup><col width="60"><col width="*"></colgroup>
					<tbody>
					<%  // ��ۿ���
                       for(int i=0;i<onLineBroadSubjList.size();i++)
                            {                               
                                DataBox gamedbox =  onLineBroadSubjList.get(i);
                                String biyong="";
                                String aHref_SubjValues="";
                                DecimalFormat df = new DecimalFormat("#,###");

                                String tmp=upperMap !=null && upperMap.get(gamedbox.get("d_scupperclass")) != null ?  upperMap.get(gamedbox.get("d_scupperclass")).toString() : "00";
                                aHref_SubjValues="'"+gamedbox.get("d_subj")+"','"+gamedbox.get("d_subjnm")+"','"+gamedbox.get("d_isonoff")+"','"+gamedbox.get("d_scupperclass")+"','"+gamedbox.get("d_uclassnm")+"','"+gamedbox.get("d_scyear")+"','"+gamedbox.get("d_subjseq")+"','";
                                aHref_SubjValues+=tmp+"'";
                                
                                String v_edustart = FormatDate.getFormatDate(gamedbox.getString("d_EDUSTART"),"yyyy.MM.dd");
                                String v_eduend = FormatDate.getFormatDate(gamedbox.getString("d_EDUEND"),"yyyy.MM.dd");
                     %>
                     	<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="javascript:view_On_Subj(<%=aHref_SubjValues%>);" title="[<%=v_edustart%> ~ <%=v_eduend%>] <%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%>"><%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%></a></td>
							<td class="date"><%=v_edustart%> ~ <%=v_eduend%></td>
						</tr>
                     <%
                       }
                       
                        if (onLineBroadSubjList.size() == 0)
                        {
                            out.print("<tr>");
                            out.print("<td colspan=3>���� ��û ������ ���°� �����ϴ�.</td>");                           
                            out.print("</tr>");
                        }                                      
             		%>
					</tbody>
				</table>
				<table id="onlinelist4" class="courselist" style="display:none;" cellpadding="0" cellspacing="0" summary="��ȭ�������о� ���� ����Ʈ">
					<colgroup><col width="60"><col width="*"></colgroup>
					<tbody>
					<%  // ��ȭ�������о�
                       for(int i=0;i<onLineCultureSubjList.size();i++)
                            {                               
                                DataBox gamedbox =  onLineCultureSubjList.get(i);
                                String biyong="";
                                String aHref_SubjValues="";
                                DecimalFormat df = new DecimalFormat("#,###");

                                String tmp=upperMap !=null && upperMap.get(gamedbox.get("d_scupperclass")) != null ?  upperMap.get(gamedbox.get("d_scupperclass")).toString() : "00";
                                aHref_SubjValues="'"+gamedbox.get("d_subj")+"','"+gamedbox.get("d_subjnm")+"','"+gamedbox.get("d_isonoff")+"','"+gamedbox.get("d_scupperclass")+"','"+gamedbox.get("d_uclassnm")+"','"+gamedbox.get("d_scyear")+"','"+gamedbox.get("d_subjseq")+"','";
                                aHref_SubjValues+=tmp+"'";
                                
                                String v_edustart = FormatDate.getFormatDate(gamedbox.getString("d_EDUSTART"),"yyyy.MM.dd");
                                String v_eduend = FormatDate.getFormatDate(gamedbox.getString("d_EDUEND"),"yyyy.MM.dd");
                     %>
                     	<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="javascript:view_On_Subj(<%=aHref_SubjValues%>);" title="[<%=v_edustart%> ~ <%=v_eduend%>] <%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%>"><%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%></a></td>
							<td class="date"><%=v_edustart%> ~ <%=v_eduend%></td>
						</tr>
                     <%
                       }
                       
                        if (onLineCultureSubjList.size() == 0)
                        {
                            out.print("<tr>");
                            out.print("<td colspan=3>���� ��û ������ ���°� �����ϴ�.</td>");                           
                            out.print("</tr>");
                        }                                      
             		%>
					</tbody>
				</table>
			</li>
			<li class="offline">
				<dl class="titleonline">
					<dd><img src="/images/2012/main/subject_offlinecourse.png" alt="�������� ����"></dd>
					<dd class="more"><a href="javascript:menuMainForward('2', '/servlet/controller.off.ProposeOffServlet?p_process=SubjectList');" title="��ü����"><img src="/images/2012/main/btn_more.png" alt="�������� ���� ��ü����"></a></dd>
				</dl>
				<dl class="onlinetab">
					<dd><button type="button" onmouseover="offlinetab('1')" onclick="document.location='#'" class="over" id="offline1" title="3D ��ü������">3D ��ü������</button></dd>
					<dd><button type="button" onmouseover="offlinetab('2')" onclick="document.location='#'" class="out" id="offline2" title="����� �����米��">����� �����米��</button></dd>
					<dd><button type="button" onmouseover="offlinetab('3')" onclick="document.location='#'" class="out" id="offline3" title="������ ����缺">������ ����缺</button></dd>
					<dd><button type="button" onmouseover="offlinetab('4')" onclick="document.location='#'" class="out" id="offline4" title="��Ź����">��Ź����</button></dd>
				</dl>
				<table id="offlinelist1" class="courselist" cellpadding="0" cellspacing="0" summary="�������� ����Ʈ">
					<colgroup><col width="50"><col width="*"></colgroup>
					<tbody>
					<%  // 3D ��ü������
                       for(int i=0;i<DimensionOffSubjectList.size();i++)
                            {                               
                                DataBox gamedbox =  DimensionOffSubjectList.get(i);
                                String biyong="";
                                String aHref_SubjValues="";
                                DecimalFormat df = new DecimalFormat("#,###");                               

                                aHref_SubjValues="'"+gamedbox.get("d_subj")+"','"+gamedbox.get("d_subjnm")+"','"+gamedbox.get("d_isonoff")+"','"+gamedbox.get("d_scupperclass")+"','"+gamedbox.get("d_seq")+"','"+gamedbox.get("d_year")+"','"+gamedbox.get("d_subjseq")+"','";
                                aHref_SubjValues+=gamedbox.get("d_scupperclass")+"'";
                                
                                String v_edustart = FormatDate.getFormatDate(gamedbox.getString("d_EDUSTART"),"yyyy.MM.dd");
                                String v_eduend = FormatDate.getFormatDate(gamedbox.getString("d_EDUEND"),"yyyy.MM.dd");
                     %>
                     	<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="javascript:view_On_Subj(<%=aHref_SubjValues%>);" title="[<%=v_edustart%> ~ <%=v_eduend%>] <%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%>"><%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%></a></td>
							<td class="date"><%=v_edustart%> ~ <%=v_eduend%></td>
						</tr>
                     <%
                       }
                       
                        if (DimensionOffSubjectList.size() == 0)
                        {
                            out.print("<tr>");
                            out.print("<td colspan=3>���� ��û ������ ���°� �����ϴ�.</td>");                           
                            out.print("</tr>");
                        }                                      
             		%>
					
					</tbody>
				</table>
				<table id="offlinelist2" class="courselist" style="display:none;" cellpadding="0" cellspacing="0" summary="�¶��ΰ��� ����Ʈ">
					<colgroup><col width="50"><col width="*"></colgroup>
					<tbody>
					<%  // �����
                       for(int i=0;i<IndustryOffSubjectList.size();i++)
                            {                               
                                DataBox gamedbox =  IndustryOffSubjectList.get(i);
                                String biyong="";
                                String aHref_SubjValues="";
                                DecimalFormat df = new DecimalFormat("#,###");                               

                                aHref_SubjValues="'"+gamedbox.get("d_subj")+"','"+gamedbox.get("d_subjnm")+"','"+gamedbox.get("d_isonoff")+"','"+gamedbox.get("d_scupperclass")+"','"+gamedbox.get("d_seq")+"','"+gamedbox.get("d_year")+"','"+gamedbox.get("d_subjseq")+"','";
                                aHref_SubjValues+=gamedbox.get("d_scupperclass")+"'";
                                
                                String v_edustart = FormatDate.getFormatDate(gamedbox.getString("d_EDUSTART"),"yyyy.MM.dd");
                                String v_eduend = FormatDate.getFormatDate(gamedbox.getString("d_EDUEND"),"yyyy.MM.dd");
                     %>
                     	<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="javascript:view_On_Subj(<%=aHref_SubjValues%>);" title="[<%=v_edustart%> ~ <%=v_eduend%>] <%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%>"><%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%></a></td>
							<td class="date"><%=v_edustart%> ~ <%=v_eduend%></td>
						</tr>
                     <%
                       }
                       
                        if (IndustryOffSubjectList.size() == 0)
                        {
                            out.print("<tr>");
                            out.print("<td colspan=3>���� ��û ������ ���°� �����ϴ�.</td>");                           
                            out.print("</tr>");
                        }                                      
             		%>
						<!-- <tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Avid MC6�� Ȱ���� 3D��ü">Avid MC6�� Ȱ���� 3D��ü</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_close.gif" alt="����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Avid MC6�� Ȱ���� 3D��ü">1Avid MC6�� Ȱ���� 3D��ü</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3ALITY���� ��ũ�ϼ� ����">3ALITY���� ��ũ�ϼ� ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr> -->
					</tbody>
				</table>
				<table id="offlinelist3" class="courselist" style="display:none;" cellpadding="0" cellspacing="0" summary="�¶��ΰ��� ����Ʈ">
					<colgroup><col width="50"><col width="*"></colgroup>
					<tbody>
					<%  // ������
                       for(int i=0;i<NextOffSubjectList.size();i++)
                            {                               
                                DataBox gamedbox =  NextOffSubjectList.get(i);
                                String biyong="";
                                String aHref_SubjValues="";
                                DecimalFormat df = new DecimalFormat("#,###");                               

                                aHref_SubjValues="'"+gamedbox.get("d_subj")+"','"+gamedbox.get("d_subjnm")+"','"+gamedbox.get("d_isonoff")+"','"+gamedbox.get("d_scupperclass")+"','"+gamedbox.get("d_seq")+"','"+gamedbox.get("d_year")+"','"+gamedbox.get("d_subjseq")+"','";
                                aHref_SubjValues+=gamedbox.get("d_scupperclass")+"'";
                                
                                String v_edustart = FormatDate.getFormatDate(gamedbox.getString("d_EDUSTART"),"yyyy.MM.dd");
                                String v_eduend = FormatDate.getFormatDate(gamedbox.getString("d_EDUEND"),"yyyy.MM.dd");
                     %>
                     	<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="javascript:view_On_Subj(<%=aHref_SubjValues%>);" title="[<%=v_edustart%> ~ <%=v_eduend%>] <%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%>"><%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%></a></td>
							<td class="date"><%=v_edustart%> ~ <%=v_eduend%></td>
						</tr>
                     <%
                       }
                       
                        if (NextOffSubjectList.size() == 0)
                        {
                            out.print("<tr>");
                            out.print("<td colspan=3>���� ��û ������ ���°� �����ϴ�.</td>");                           
                            out.print("</tr>");
                        }                                      
             		%>
						<!-- <tr>
							<td><img src="/images/2012/main/icon/icon_close.gif" alt="����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Avid MC6�� Ȱ���� 3D��ü">1Avid MC6�� Ȱ���� 3D��ü</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] ������ �������� ����">������ �������� ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr> -->
					</tbody>
				</table>
				<table id="offlinelist4" class="courselist" style="display:none;" cellpadding="0" cellspacing="0" summary="�¶��ΰ��� ����Ʈ">
					<colgroup><col width="50"><col width="*"></colgroup>
					<tbody>
					<%  // ������
                       for(int i=0;i<SuTakOffSubjectList.size();i++)
                            {                               
                                DataBox gamedbox =  SuTakOffSubjectList.get(i);
                                String biyong="";
                                String aHref_SubjValues="";
                                DecimalFormat df = new DecimalFormat("#,###");                               

                                aHref_SubjValues="'"+gamedbox.get("d_subj")+"','"+gamedbox.get("d_subjnm")+"','"+gamedbox.get("d_isonoff")+"','"+gamedbox.get("d_scupperclass")+"','"+gamedbox.get("d_seq")+"','"+gamedbox.get("d_year")+"','"+gamedbox.get("d_subjseq")+"','";
                                aHref_SubjValues+=gamedbox.get("d_scupperclass")+"'";
                                
                                String v_edustart = FormatDate.getFormatDate(gamedbox.getString("d_EDUSTART"),"yyyy.MM.dd");
                                String v_eduend = FormatDate.getFormatDate(gamedbox.getString("d_EDUEND"),"yyyy.MM.dd");
                     %>
                     	<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="javascript:view_On_Subj(<%=aHref_SubjValues%>);" title="[<%=v_edustart%> ~ <%=v_eduend%>] <%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%>"><%=StringManager.formatTitle(gamedbox.get("d_subjnm"), 26)%></a></td>
							<td class="date"><%=v_edustart%> ~ <%=v_eduend%></td>
						</tr>
                     <%
                       }
                       
                        if (SuTakOffSubjectList.size() == 0)
                        {
                            out.print("<tr>");
                            out.print("<td colspan=3>���� ��û ������ ���°� �����ϴ�.</td>");                           
                            out.print("</tr>");
                        }                                      
             		%>
             		
						<!-- <tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Avid MC6�� Ȱ���� 3D��ü">Avid MC6�� Ȱ���� 3D��ü</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_close.gif" alt="����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Avid MC6�� Ȱ���� 3D��ü">1Avid MC6�� Ȱ���� 3D��ü</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_close.gif" alt="����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Smoke�� Ȱ���� 3D��ü ���� ����">Smoke�� Ȱ���� 3D��ü ���� ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3ALITY���� ��ũ�ϼ� ����">3ALITY���� ��ũ�ϼ� ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr> -->
					</tbody>
				</table>
			</li>
		</ul>
		<div style="clear:left;"></div>
	</div>
	<div class="bottomcontent">
		<div class="contentbox">
			<ul class="content">
				<li class="leftspace">
					<div class="detail">
						<a href="javascript:menuForward('5','12');" title="������ ���ϴ�! <��������> �ٷΰ���"><img src="/images/2012/main/subject_opencast.png" alt="������ ���ϴ�! ��������"></a>
						<div class="opencastment">���, ����, ��ȭ, ��ť���͸�, ��ȭ, ����, ����, ���� �� �پ��� �о��� �����λ���� ���ڸ��� �� ���ϴ�.</div>
						<div class="banner"><a href="javascript:menuForward('4','05');" title="�¶��ΰ��� ���� �� ����ȯ�� �����Ϸ� �ٷΰ���"><img src="/images/2012/main/banner_config.gif" alt="�¶��ΰ��� ���� �� ����ȯ�� �����ϱ�"></a></div>
						<div class="talent"><img src="/images/2012/main/subject_talent.png" alt="������ ���縦 ���� ����ȭ�� �����ü�"></div>
						<script type="text/javascript">
						<!--
						$(function() {
							$("#learningroom").jQBanner({	nWidth:370, nHeight:76, nCount:5,	isActType:"up", nOrderNo:1, nDelay:5000 });
						});
						//-->
						</script>
						<div id="learningroom">
							<div class="clsBannerScreen">
								<div class="images" style="display:block"><img src="/images/2012/main/sample_learningroom.png" alt="���ñ�����"></div>
								<div class="images"><img src="/images/2012/main/sample_learningroom.png" alt="���ñ�����"></div>
								<div class="images"><img src="/images/2012/main/sample_learningroom.png" alt="���ñ�����"></div>
								<div class="images"><img src="/images/2012/main/sample_learningroom.png" alt="���ñ�����"></div>
								<div class="images"><img src="/images/2012/main/sample_learningroom.png" alt="���ñ�����"></div>
							</div>
						</div>
					</div>
				</li>
				<li class="rightspace">
					<dl class="steprable">
						<dd class="msg"><img src="/images/2012/main/step_msg.png" alt="�ѱ���������ī������ ó�����̳���? ���������� ����� �޾ƺ�����."></dd>
						<dd class="step1"><a href="javascript:menuForward('90','01');" title="ȸ������ �ٷΰ���"><img src="/images/2012/main/step1.png" alt="1�ܰ� ȸ������"></a></dd>
						<dd class="step2"><a href="javascript:menuMainForward('90','/servlet/controller.homepage.MainServlet?p_process=MainLogin');" title="�α��� �ٷΰ���"><img src="/images/2012/main/step2.png" alt="2�ܰ� �α���"></a></dd>
						<dd class="step3"><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList')" title="�������� �ٷΰ���"><img src="/images/2012/main/step3.png" alt="3�ܰ� ��������"></a></dd>
						<dd class="step4"><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList')" title="������û �ٷΰ���"><img src="/images/2012/main/step4.png" alt="4�ܰ� ������û"></a></dd>
					</dl>
					<dl class="support">
						<dd><a href="http://kocca.anyhelp.net" target="remote" title="�������� ���񽺷� �̵��մϴ�."><img src="/images/2012/main/banner_support.gif" alt="�н� �� PC������ �߻��ϼ̳���? ������������ �̿��ϱ�"></a></dd>
						<dd><a href="javascript:menuForward('4','02');" title="������ϱ� �Խ������� �̵��մϴ�."><img src="/images/2012/main/banner_sms.gif" alt="������ϱ� �亯 �˸� SMS : ���� �� �亯 �ȳ� ���ڰ� �߼۵˴ϴ�."></a></dd>
					</dl>
					<dl class="business">
						<dd class="learning">
							<table class="businessfield" cellpadding="0" cellspacing="0" summary="�ѱ���������ī���� ������� �о� �ȳ�">
								<thead>
									<tr>
										<th colspan="2"><img src="/images/2012/main/subject_business.png" alt="�ѱ���������ī���� �������"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=1" title="������ ���� �缺������� �ȳ��� �̵��մϴ�.">������ ���� �缺����</a></td>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=5" title="3D��ü ������ �����η� �缺��� �ȳ��� �̵��մϴ�.">3D��ü ������ �����η� �缺</a></td>
									</tr>
									<tr>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=2" title="����� ���� �米����� �ȳ��� �̵��մϴ�.">����� ���� �米��</a></td>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=6" title="â������ �缺��� �ȳ��� �̵��մϴ�.">â������ �缺���</a></td>
									</tr>
									<tr>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=3" title="�¶��� ������� �ȳ��� �̵��մϴ�.">�¶��� ����</a></td>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=7" title="��� ���ε༭ ������ �ȳ��� �̵��մϴ�.">��� ���ε༭ ����</a></td>
									</tr>
									<tr>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=4" title="���� ����������� �ȳ��� �̵��մϴ�.">���� ��������</a></td>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=8" title="���� ������� �ڰ� ������� �ȳ��� �̵��մϴ�.">���� ������� �ڰ� ����</a></td>
									</tr>
								</tbody>
							</table>
						</dd>
						<dd class="another">
							<a href="#" title="�¶��� ��ü ���������� Ȯ���� �� �ֽ��ϴ�"><img src="/images/2012/main/banner_curriculum.gif" alt="�¶��ΰ��� Ŀ��ŧ��"></a><br>
							<a href="#" title="�帲���� â������ ���ݻ�� �ٷΰ���"><img src="/images/2012/main/sample_banner1.gif" alt="�帲���� â������ ���ݻ��"></a>
						</dd>
					</dl>
				</li>
			</ul>
			<div class="clearscript"></div>
		</div>
		<div class="smarticon">
		<table class="icon" cellspacing="0" cellpadding="0" summary="�����̿��ϴ� ��ɵ��� ��ҽ��ϴ�.">
			<tbody>
				<tr>
					<!-- <td class="icon1"><a href="#" title="�¶���/�������� ���� ���� �� �ñ��� ���� �ִٸ� �ȳ��� �޾ƺ�����."><img src="/images/2012/common/smarticon/icon_guide.png" alt="�������̵�"></a></td> -->
					<td class="icon2"><a href="javascript:menuForward('3','19');" title="�����Ͻ� ������ ������ �ʿ��Ͻ� ��� ������ ������ �� �ֽ��ϴ�."><img src="/images/2012/common/smarticon/icon_payment.png" alt="�����ϱ�"></a></td>
					<!-- <td class="icon3"><a href="#" title="���������� ��ƴٸ�? ���������� ���� �˸´� ������ �����غ�����."><img src="/images/2012/common/smarticon/icon_level.png" alt="�ڱ⿪������"></a></td> -->
					<td class="icon4"><a href="javascript:menuForward('4','05');" title="�¶��� �н� �� �������� �н��� ���� �н�ȯ���� �����մϴ�."><img src="/images/2012/common/smarticon/icon_config.png" alt="�н�ȯ�浵���"></a></td>
					<td class="icon5"><a href="javascript:menuForward('4','09');" title="����� ������ ���ϽŴٸ� �̰� 1:1���Ǹ� �̿����ּ���."><img src="/images/2012/common/smarticon/icon_1n1.png" alt="1:1����"></a></td>
					<td class="icon6"><a href="javascript:menuMainForward('4','/servlet/controller.study.MyClassServlet?p_process=StudyHistoryListSyuro');" title="������ �����Ͻ� ��� �������� ����� �� �ֽ��ϴ�."><img src="/images/2012/common/smarticon/icon_cert.png" alt="������ ���"></a></td>
					<td class="icon7"><a href="javascript:menuForward('4','10');" title="�������� ���� �� ���Ǵ� ���縦 �Ұ��մϴ�."><img src="/images/2012/common/smarticon/icon_book.png" alt="����ȳ�"></a></td>
					<td class="icon8"><a href="javascript:menuForward('4','01');" title="���� ���� ������ ��Ƶξ����ϴ�."><img src="/images/2012/common/smarticon/icon_faq.png" alt="�����亯"></a></td>
					<td class="icon9"><a href="javascript:menuForward('4','02');" title="�ñ��� ���� �ִٸ� �������."><img src="/images/2012/common/smarticon/icon_qna.png" alt="������ϱ�"></a></td>
					<td class="icon10"><a href="javascript:menuForward('7','04');" title="�ѱ������������ ��ī���̿� ���ô±��� �ȳ��մϴ�."><img src="/images/2012/common/smarticon/icon_location.png" alt="ã�ƿ��ô±�"></a></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div id="footer">
	<div class="supportbox">
		<div class="support">
			<div class="supportcontent">
				<ul class="supportmenu">
					<li class="startline"><a href="javascript:menuMainForward('90','/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&p_code=FOOTER_EMAIL');" title="��������ó����ħ���� �̵��մϴ�."><img src="/images/2012/common/btn_member_terms.png" alt="��������ó����ħ"></a></li>
					<li><a href="javascript:menuForward('90','05');" title="�̿������� �̵��մϴ�."><img src="/images/2012/common/btn_use_terms.png" alt="�̿���"></a></li>
					<li><a href="javascript:menuMainForward('90','/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&p_code=FOOTER_EMAIL');" title="�̸��Ϲ��ܼ����źη� �̵��մϴ�."><img src="/images/2012/common/btn_email_denial.png" alt="�̸��Ϻδܼ����ź�"></a></li>
					<li><a href="javascript:menuForward('90','09');" title="����Ʈ������ �̵��մϴ�."><img src="/images/2012/common/btn_sitemap.png" alt="����Ʈ��"></a></li>
				</ul>
				<ul class="certification">
					<li><img src="/images/2012/common/icon_inicis.png" alt="�̴Ͻý� ���� �ý���" Onclick="javascript:window.open('https://mark.inicis.com/mark/popup_v1.php?no=19844&st=1322725008','mark','scrollbars=no,resizable=no,width=530,height=670');"></li>
					<li><img src="/images/2012/common/icon_goodcontent.png" alt="�������������� ǰ������" Onclick="javascript:window.open('http://edu.kocca.or.kr/contents/temp/gcs.html','mark','scrollbars=no,resizable=no,width=715,height=900');"></li>
					<li><img src="/images/2012/common/icon_eprivacy.png" alt="����������ȣ�������Ʈ ����" Onclick="javascript:window.open('http://edu.kocca.or.kr/contents/temp/eprivacy.html','mark','scrollbars=no,resizable=no,width=700,height=965');"></li>
					<li><img src="/images/2012/common/icon_isafe.png" alt="����������ȣ���� ����" Onclick="javascript:window.open('http://edu.kocca.or.kr/contents/temp/i_safe.html','mark','scrollbars=no,resizable=no,width=700,height=965');"></li>
				</ul>
			</div>
		</div>
		<div class="about">
			<ul class="information">
				<li><img src="/images/2012/common/bottom_logo.png" alt="�ѱ������������ ��ī����"></li>
				<li class="copy">
					<dl class="copyright">
						<dd class="address">����Ư���� ��õ�� �񵿵��� 203-1 ���ȸ�� 8��<br>����ڵ�Ϲ�ȣ : 117-82-04412      ����Ǹž��Ű��ȣ : ��õ 00471</dd>
						<dd class="corp">�ѱ������������(��) ���� ȫ��ǥ</dd>
						<dd class="maker">COPYRIGHT�� 2012 KOCCA ALL RIGHTS RESERVED.</dd>
					</dl>
				</li>
				<li class="servicecenter">
					<img src="/images/2012/common/bottom_servicecenter.png" alt="�¶��� �������� 02-2161-0077��, �������� �������� 02-2161-0072">
					<dl class="familysite">
						<dt onclick="showsite();">���û���Ʈ �ٷΰ���</dt>
						<dd id="url1" style="top:-20px;"><a href="http://www.mcst.go.kr/main.jsp" target="_blank">��ȭü��������</a></dd>
						<dd id="url2" style="top:-40px;"><a href="http://www.kocca.kr/main2.html" target="_blank">�ѱ������������</a></dd>
						<dd id="url3" style="top:-60px;"><a href="http://library.kocca.or.kr/index.jsp" target="_blank">������������</a></dd>
						<dd id="url4" style="top:-80px;"><a href="http://www.gamehub.or.kr/main/main.jsp" target="_blank">�۷ι�������꼾��</a></dd>
						<dd id="url5" style="top:-100px;"><a href="http://www.culturecontent.com/main.do" target="_blank">��ȭ����������</a></dd>
						<dd id="url6" style="top:-120px;"><a href="http://www.dccenter.kr/main_ft.jsp?syscd=FT" target="_blank">�������̿뺸ȣ����</a></dd>
						<dd id="url7" style="top:-140px;"><a href="http://www.contentright.or.kr/index.jsp" target="_blank">���۱���Ź�����ý���</a></dd>
						<dd id="url8" style="top:-160px;"><a href="http://www.uci.or.kr/kor/file/main/main.jsp" target="_blank">�������ĺ�ü��(UCI)</a></dd>
						<dd id="url9" style="top:-180px;"><a href="http://www.kgq.or.kr/service/pub/IntroServlet" target="_blank">���ӱ����ڰݱ������</a></dd>
						<dd id="url10" style="top:-200px;"><a href="http://www.culturist.or.kr/" target="_blank">�����η������ý���</a></dd>
						<dd id="url11" style="top:-220px;"><a href="http://www.koccamusic.or.kr" target="_blank">���Ǿ�ī�̺�</a></dd>
						<!-- <dd id="url12" style="top:-240px;"><a href="http://card.mct.go.kr/waf/welcome?q=AC1A0F34189E00B963E3DC34C9231C1B2F543B08D1668A')">���������ī������ý���</a></dd> -->
					</dl>
				</li>
			</ul>
		</div>
	</div>
</div>

</body>
</html>