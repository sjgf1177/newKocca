<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "com.credu.homepage.LoginBean" %>
<%@ page import="java.net.InetAddress" %>
<%
	InetAddress inet= InetAddress.getLocalHost();
	String ipSplit = inet.getHostAddress();
	String [] ipnum=ipSplit.replace(".","/").split("/");

	String topmenu = box.getString("topmenu");
	if ((topmenu == null) || (topmenu.equals("")) ) topmenu = "1";
	String submenu1 = box.getString("submenu");
	
	String notSelected = "ratemenu";
	String selected = "ratemenuon";
	int zindex = 0;
	
	String topWarp_userid = box.getSession("userid");
  	String topWarp_usernm = box.getSession("name");
  	String topWarp_gadmin = box.getSession("gadmin");
%>
<html lang="ko">
<head>
<title>�ѱ������������ ��ī����(<%=ipnum[3]%>)</title>
<style type="text/css" media="screen">@import "/css/2012/common.css";</style>
<% if (topmenu.equals("0")) { %>
<style type="text/css" media="screen">@import "/css/2012/main.css";</style>
<% } else { %>
<style type="text/css" media="screen">@import "/css/2012/sub.css";</style>
<% } %>
<link href="/css/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/js/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/js/jqueryui/1.9.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/2012/lib.js"></script>
<script type="text/javascript" src="/js/2012/caption.js"></script>
<script type="text/javascript" src="/js/2012/jquery.banner.js"></script>
<script type="text/javascript" src="/script/mainscript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Content-Language" content="euc-kr">
<meta http-equiv="imagetoolbar" content="false">
<meta name="robots" content="all">
<meta name="MSSmartTagsPreventParsing" content="true">
<meta name="description" content="">
</head>
<body>
<form name="topdefaultForm" method="post" action="/" id="topdefaultForm" >
  <input type='hidden' name='p_process'   value="">
  <input type='hidden' name='gubun'       value='0'>
  <input type='hidden' name='menuid'      value=''>
  <input type='hidden' name='url'         value=''>
  <input type='hidden' name='p_cmuno'     value=''>
  <input type='hidden' name='searchClass' value=''>
  <input type='hidden' name='p_auth'      value=''>
  <input type='hidden' name='p_topuserid' value=''>
  <input type='hidden' name='p_toppwd'    value=''>
  <input type='hidden' name='p_area'    value=''>
  <input type='hidden' name='p_lsearchtext'    value=''>
  <input type="submit" class="close" title="����">
</form>
<%@ include file="/learn/user/2012/portal/include/sitemap.jsp"%>
<!-- viewer start -->
<table id="viewralbe" cellspacing="0" cellpadding="0">
	<colgroup><col width="15%"><col width="*"><col width="15%"></colgroup>
	<tr>
		<td class="alignR"><a href="javascript:changefacilityimage('prev');"><img src="/images/2012/sub/page7/arrow_left_normal.png" style="cursor:pointer;" class="imageprev" alt="���� ����"></a></td>
		<td class="alignC">
			<div class="facilityImageBox">
				<img src="/images/2012/sub/page7/facilityImage/1.jpg" class="facilityImage" alt="�ü��Ұ� ����"><br>
				<p class="photoname"></p>
			</div>
		</td>
		<td class="alignL"><a href="javascript:changefacilityimage('next');"><img src="/images/2012/sub/page7/arrow_right_normal.png" style="cursor:pointer;" class="imagenext" alt="���� ����"></a></td>
	</tr>
</table>
<img src="/images/2012/sub/page7/btn_close.png" class="viewclose" alt="��� �ݱ�"/>
<div id="facilityview"></div>
<!-- viewer end -->
<div id="header">
	<div class="topheader">
		<img src="/images/2012/common/bg_header_deco.png" border="0" alt="��� �ٹ� �̹���" style="margin-top: -4px;"/>
		<div class="logo"><a href="/servlet/controller.homepage.MainServlet" tabindex="1" title="Ȩ���� ���ư��ϴ�"><img src="/images/2012/common/logo.png" alt="�ѱ���������ī����"></a></div>
		<ul class="memberoption">
			<li class="leftbg"></li>
			<li class="centerbg">
				<div class="fastmenu"><a href="javascript:sitemap();" tabindex="2" title="���ϴ� �������� ���� ������ �̵��� �� �ֽ��ϴ�"><img src="/images/2012/common/btn_fastmenu.png" alt="�����޴�"></a></div>
				<dl class="search">
					<dd class="intext"><input type="text" name="topWarp_searchText" tabindex="2" onkeypress="searchtotal_enter(event);" id="topWarp_searchText" onfocus="this.style.background='#000000';" title="�˻�� �Է����ּ���."></dd>
					<dd class="outsearch"><a href="javascript:totalSubjSearch1();" tabindex="3" title="���հ˻��� �����մϴ�"><img src="/images/2012/common/btn_search.png" alt="�˻�" title="�˻��� �����մϴ�."></a></dd>
				</dl>
				<dl class="option">
				<% if(topWarp_userid.equals("")) {%>     <%--�α����� �ȵǾ��� ���--%>	
					<dd><a href="javascript:menuMainForward('90','/servlet/controller.homepage.MainServlet?p_process=MainLogin');" tabindex="4" title="�α���ȭ������ �̵��մϴ�"><img src="/images/2012/common/option_btn_login.png" alt="�α���"></a></dd>
					<dd><a href="javascript:menuForward('90','01');" tabindex="5" title="���� ȸ�������� �غ�����"><img src="/images/2012/common/option_btn_join.png" alt="ȸ������"></a></dd>
				<% } else { %>	
					<!-- �α��� �� -->
					<dd class="membername"><b><%=topWarp_usernm%></b>�� �������.</dd>
					<dd><a href="javascript:mainmenu('998');" tabindex="4" title="�α׾ƿ��մϴ�"><img src="/images/2012/common/option_btn_logout.png" alt="�α׾ƿ�"></a></dd>
					<dd><a href="javascript:menuForward('90','03');" tabindex="5" title="ȸ������ ������ �����մϴ�"><img src="/images/2012/common/option_btn_modify.png" alt="ȸ����������"></a></dd>
					<!-- ������ ��� -->
					<dd class="select" tabindex="6">
						<%= box.getSession("tem_grcode").equals("N000001") ? LoginBean.getAuthSelect(topWarp_userid, "p_topAuth", topWarp_gadmin, "onChange = 'javascript:topAuthChange();'") : ""%>
					</dd>
					<dd>
					<% if ((!(topWarp_gadmin.equals("ZZ") || topWarp_gadmin.equals("")))) {  %>
					<a href="javascript:topAdminOpenPage()" tabindex="7" title="LMS�� �̵��մϴ�"><img src="/images/2012/common/option_btn_lms.png" alt="LMS"></a>
					<% } %>
					</dd>
					<% if ((!(topWarp_gadmin.equals("ZZ") || topWarp_gadmin.equals("")))) {  %>
					<!--<dd class="select">
						<select name="p_project" id="p_project" title="�⵵�� �������ּ���" tabindex="8">
							<option>����</option>
							<option value="2011000011">2010</option>
							<option value="2011000006">2011</option>
							<option value="2011000010">2012</option>								
						</select>
					</dd>
					<dd>
						<a href="javascript:goSubIndex()" tabindex="9" title="������Ʈ�Խ������� �̵��մϴ�"><img src="/images/2012/common/option_btn_project.png" alt="������Ʈ�Խ���"></a>
					</dd>-->
					<% } %>
				<% } %>
				</dl>
			</li>
			<li class="rightbg"></li>
		</ul>
		<ul class="navi">
			<li><a href="javascript:menuMainForward('3', '/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage');" id="top1" tabindex="11" title="���ǰ��ǽǷ� �̵��մϴ�. �̿��Ͻñ� ���� �α����� ���ּ���."><img src="/images/2012/common/menu/menu1.png" id="navi1" alt="���ǰ��ǽ�"></a></li>
			<li><a href="javascript:menuMainForward('1', '/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList');" id="top2" tabindex="21" title="�¶��� ���������� Ȯ�� �� ��û�� �� �ֽ��ϴ�."><img src="/images/2012/common/menu/menu2.png" id="navi2" alt="�¶��ΰ���"></a></li>
			<li><a href="javascript:menuMainForward('2', '/servlet/controller.off.ProposeOffServlet?p_process=SubjectList');" id="top3" tabindex="31" title="�������� ���������� Ȯ�� �� ��û�� �� �ֽ��ϴ�."><img src="/images/2012/common/menu/menu3.png" id="navi3" alt="�������ΰ���"></a></li>
			<li><a href="javascript:menuMainForward('4', '/servlet/controller.homepage.HomeNoticeServlet?p_process=List');" id="top4" tabindex="41" title="�н� ��/��/�� �ʿ��� ������ �ڷḦ �����մϴ�."><img src="/images/2012/common/menu/menu4.png" id="navi4" alt="�н�����"></a></li>
			<li><a href="javascript:menuForward('5','12');" id="top5" tabindex="51" title="�����λ���� �������Ǹ� ������ �� �ֽ��ϴ�."><img src="/images/2012/common/menu/menu5.png" id="navi5" alt="��������"></a></li>
			<li><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage');" id="top6" tabindex="61" title="���� �� �ñ��� ���� �ִٸ� �����̵� �������. �̿��Ͻñ� ���� �α����� ���ּ���."><img src="/images/2012/common/menu/menu6.png" id="navi6" alt="�������丮"></a></li>
			<li><a href="javascript:menuForward('7','01');" id="top7" tabindex="71" title="�ѱ������������ ��ī���̸� �Ұ��մϴ�."><img src="/images/2012/common/menu/menu7.png" id="navi7" alt="��ī���̼Ұ�"></a></li>
		</ul>
	</div>
</div>
<div id="submenuline" class="submenubox">
	<div class="subnavibox">
		<table id="submenu1" class="subnavi smenu1" summary="���� ���ǽ��� ��Ӹ޴��Դϴ�">
			<tr>
				<td><a href="javascript:menuForward('3','11');" tabindex="12" title="���� �н����� ������ Ȯ�� �Ǵ� �н��� �� �ֽ��ϴ�.">�������� ����</a></td>
				<td><a href="javascript:menuForward('3','02');" tabindex="13" title="ȸ������ �� ������� �н��� �̷��� Ȯ���� �� �ֽ��ϴ�.">���Ǳ����̷�</a></td>
				<td><a href="javascript:menuForward('3','17');" tabindex="14" title="��û�� ������ Ȯ���ϰų� ����� �� �ֽ��ϴ�.">������û Ȯ��/���</a></td>
<!--				<td><a href="javascript:menuForward('3','19');" tabindex="15" title="���� ��ȸ �Ǵ� ��Ҹ� �� �� �ֽ��ϴ�.">������ ��������</a></td>-->
				<td><a href="javascript:menuForward('3','12');" tabindex="16" title="����Ͻ� ������ Ȯ���� �� �ֽ��ϴ�.">���� ��㳻��</a></td>
				<td><a href="javascript:menuForward('3','07');" tabindex="17" title="ȸ������ �����Ͻ� ������ Ȯ���� �� �ֽ��ϴ�.">���� ����</a></td>
				<td><a href="javascript:menuMainForward('4','/servlet/controller.study.MyClassServlet?p_process=StudyHistoryListSyuro');" tabindex="18" title="������ �����Ͻ� ��� �������� ����� �� �ֽ��ϴ�.">������ ���</a></td>
<!--				<td><a href="/servlet/controller.study.MyClassServlet?p_process=celp" tabindex="18" title="�ڽ��� ������ �� ������ ������ �����غ� �� �ֽ��ϴ�.">�ڱ⿪������</a></td>-->
			</tr>
		</table>
		<table id="submenu2" class="subnavi smenu2" summary="�¶��ΰ����� ��Ӹ޴��Դϴ�">
			<tr>
				<td><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList')" tabindex="22" title="��ۿ��� �о� �¶��ΰ����� �ȳ��մϴ�.">��ü</a></td>
				<td><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&amp;p_area=B0')" tabindex="23" title="��ۿ��� �о� �¶��ΰ����� �ȳ��մϴ�.">��ۿ���</a></td>
				<td><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&amp;p_area=G0')" tabindex="24" title="���Ӱ��� �о� �¶��ΰ����� �ȳ��մϴ�.">���Ӱ���</a></td>
				<td><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&amp;p_area=K0')" tabindex="25" title="��ȭ������ �о� �¶��ΰ����� �ȳ��մϴ�.">��ȭ������</a></td>
				<td><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=Curriculum')" tabindex="26" title="�¶��� ���������� Ȯ���մϴ�">Ŀ��ŧ��</a></td>
			</tr>
		</table>
		<table id="submenu3" class="subnavi smenu3" summary="�������ΰ����� ��Ӹ޴��Դϴ�">
			<tr>
				<td><a href="javascript:menuMainForward('2', '/servlet/controller.off.ProposeOffServlet?p_process=SubjectList');" tabindex="32" title="��ü �������ΰ����� �ȳ��մϴ�.">��ü</a></td>
				<td><a href="javascript:menuForward('2','01');" tabindex="33" title="��ۿ��� �о� �������ΰ����� �ȳ��մϴ�.">��ۿ���</a></td>
				<td><a href="javascript:menuForward('2','02');" tabindex="34" title="���Ӱ��� �о� �������ΰ����� �ȳ��մϴ�.">��������</a></td>
				<td><a href="javascript:menuForward('2','03');" tabindex="35" title="��ȹâ�� �о� �������ΰ����� �ȳ��մϴ�.">��ȹâ��</a></td>
<!--				<td><a href="javascript:menuForward('2','04');" tabindex="36" title="�н� �� �ʿ��� �ڷḦ �����մϴ�.">�����ڷ��</a></td>-->
<!--				<td><a href="javascript:menuForward('2','05');" tabindex="37" title="�������� ������ ���� �� ���� ���������� Ȯ���� �� �ֽ��ϴ�.">��������</a></td>-->
				<!-- <td><a href="#" title="������, �������, �޽İ��� �� �н�ȯ���� �Ұ��մϴ�.">����ȯ��Ұ�</a></td> -->
			</tr>
		</table>
		<table id="submenu4" class="subnavi smenu4" summary="�н������� ��Ӹ޴��Դϴ�">
			<tr>
				<td><a href="javascript:menuForward('4','07');" tabindex="42" title="�ѱ������������ ��ī������ ���ҽ��� �˷��帳�ϴ�.">��������</a></td>
				<td><a href="javascript:menuForward('4','01');" tabindex="43" title="���� ���� ������ ��Ƶξ����ϴ�.">FAQ</a></td>
				<td><a href="javascript:menuForward('4','02');" tabindex="44" title="�ñ��� ���� �ִٸ� �������.">������ϱ�</a></td>
				<td><a href="javascript:menuForward('4','05');" tabindex="45" title="�¶��� �н� �� �������� �н��� ���� �н�ȯ���� �����մϴ�.">�н�ȯ�浵���</a></td>
				<td><a href="javascript:menuForward('4','10');" tabindex="46" title="�������� ���� �� ���Ǵ� ���縦 �Ұ��մϴ�.">����Ұ�</a></td>
				<td><a href="javascript:menuForward('4','09');" tabindex="47" title="����� ������ ���ϽŴٸ� �̰� 1:1���Ǹ� �̿����ּ���.">1:1����</a></td>
				<td><a href="javascript:menuForward('4','12');" tabindex="48" title="��ī���̿��� �����ϴ� �پ��� �̺�Ʈ�� Ȯ���� �� �ֽ��ϴ�.">�̺�Ʈ</a></td>
				<!-- <td><a href="javascript:menuForward('4','07');" title="������û�� ������ ��� ���̵带 ���� �����غ�����.">������û���</a></td> -->
				<!-- <td><a href="javascript:menuForward('4','07');" title="�¶���/�������� ���� ���� �� �ñ��� ���� �ִٸ� �ȳ��� �޾ƺ�����.">�������̵�</a></td> -->
			</tr>
		</table>
		<table id="submenu5" class="subnavi smenu5" summary="���������� ��Ӹ޴��Դϴ�">
			<tr>
				<td><a href="javascript:menuForward('5','12');" tabindex="52" title="��ۿ��� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ۿ���</a></td>
				<td><a href="javascript:menuForward('5','13');" tabindex="53" title="��ȭ ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ȭ</a></td>
				<td><a href="javascript:menuForward('5','14');" tabindex="54" title="��ť���͸� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ť���͸�</a></td>
				<td><a href="javascript:menuForward('5','15');" tabindex="55" title="��ȭ���� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ȭ����</a></td>
				<td><a href="javascript:menuForward('5','17');" tabindex="56" title="���� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">����</a></td>
				<td><a href="javascript:menuForward('5','16');" tabindex="57" title="��Ÿ ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��Ÿ</a></td> 
				<!-- <td><a href="javascript:menuForward('5','17');" title="��ȹ ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ȹ</a></td>
				<td><a href="javascript:menuForward('5','17');" title="��Ÿ ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��Ÿ</a></td> -->
			</tr>
		</table>
		<table id="submenu6" class="subnavi smenu6" summary="Ŀ�´�Ƽ�� ��Ӹ޴��Դϴ�">
			<tr>
				<td><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage')" tabindex="62" title="Ŀ�´�Ƽ�� ��ü ������ �����غ��ҽ��ϴ�.">����</a></td>
				<td><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&amp;p_area=B0')" tabindex="63" title="��ۿ��� �о� Ŀ�´�Ƽ �����Դϴ�.">��ۿ���</a></td>
				<td><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&amp;p_area=G0')" tabindex="64" title="���Ӱ��� �о� Ŀ�´�Ƽ �����Դϴ�.">���Ӱ���</a></td>
				<td><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&amp;p_area=K0')" tabindex="65" title="��ȭ������ �о� Ŀ�´�Ƽ �����Դϴ�.">��ȭ������</a></td>
<!--				<td><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&amp;p_area=C0')" tabindex="66" title="�н� �� Ŀ�´�Ƽ �����Դϴ�.">����</a></td>-->
				<td><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&amp;p_area=MINE')" tabindex="67" title="ȸ���Բ��� �����Ͻ� ������ �̿��� �� �ֽ��ϴ�.">���� �ۼ��� ��</a></td>
			</tr>
		</table>
		<table id="submenu7" class="subnavi smenu7" summary="��ī���̼Ұ��� ��Ӹ޴��Դϴ�">
			<tr>
				<td><a href="javascript:menuForward('7','01');" tabindex="72" title="�ѱ��������������Բ��� ȸ���Ե鲲 �帮�� �λ縻�Դϴ�.">������� �λ縻</a></td>
				<td><a href="javascript:menuForward('7','02');" tabindex="73" title="��ī������ ���������� ������ ���� �Ұ��մϴ�.">��ī���̼Ұ�</a></td>
				<td><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=facility" tabindex="74" title="�ѱ� ������ ��ī������ �ü��� �ȳ��մϴ�.">�ü��Ұ�</a></td>
				<td><a href="javascript:menuForward('7','05');" tabindex="75" title="��ī���� ��������� �ȳ��մϴ�.">�������</a></td>
				<td><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList" tabindex="76" title="�ѱ������������ ��ī������ ȫ��Ȱ���� �����մϴ�">��ī���̼ҽ�</a></td>
				<td><a href="javascript:menuForward('7','06');" tabindex="77" title="��ī���̿� ���°����� ����� �Ұ��մϴ�.">�������±��</a></td>
				<td><a href="javascript:menuForward('7','04');" tabindex="78" title="�ѱ������������ ��ī���̿� ���ô±��� �ȳ��մϴ�.">���ô±�</a></td>
				<td><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus" tabindex="79" title="��ü�������� �� �������,���ȵ��� �� �� �ֽ��ϴ�">Contact Us</a></td>
			</tr>
		</table>
	</div>
</div>
<div id="container">
<% if(topmenu.equals("1")) { // �α��� %>	
	<div class="submenutool">
		<ul class="ratemenutool">
			<li><button type="button" tabindex="107" onclick="javascript:menuForward('90','06');" class="<%=submenu1.equals("7")?selected:notSelected%>" title="�ѱ���������ī���̿����� ������ ������ ���������� �̷��� ���� �� �̿��մϴ�."><p>��������<br>ó����ħ</p></button></li>
			<li><button type="button" tabindex="106" onclick="javascript:menuForward('90','05');" class="<%=submenu1.equals("6")?selected:notSelected%>" title="�ѱ���������ī���̸� �̿��Ͻñ� ���� ����Դϴ�."><p>�̿���</p></button></li>
			<li><button type="button" tabindex="105" onclick="javascript:menuForward('90','04');" class="<%=submenu1.equals("5")?selected:notSelected%>" title="ȸ��Ż�� �ϰ� ���� ��� Ŭ�����ּ���."><p>ȸ��Ż��</p></button></li>
			<li><button type="button" tabindex="104" onclick="javascript:menuForward('90','03');" class="<%=submenu1.equals("4")?selected:notSelected%>" title="ȸ������ ��й�ȣ �� ���������� �����ϰ��� �Ͻ� �� �̿����ּ���."><p>ȸ������<br>����</p></button></li>
			<li><button type="button" tabindex="103" onclick="javascript:menuForward('90','02');" class="<%=submenu1.equals("3")?selected:notSelected%>" title="���̵� �Ǵ� ��й�ȣ�� �����̴ٸ� �̰��� �̿����ּ���."><p>���̵�<br>��й�ȣ<br>ã��</p></button></li>
			<li><button type="button" tabindex="102" onclick="javascript:menuForward('90','01');" class="<%=submenu1.equals("2")?selected:notSelected%>" title="�ѱ���������ī���̿� ó�� ���̳���? ����ȸ���������� �پ��� ���񽺸� �޾ƺ�����."><p>ȸ������</p></button></li>
			<li><button type="button" tabindex="101" onclick="javascript:menuMainForward('90','/servlet/controller.homepage.MainServlet?p_process=MainLogin');" class="<%=submenu1.equals("1")?selected:notSelected%>" title="�̹� ȸ���̽� �в����� ȸ���α����� ���ּ���."><p>ȸ���α���</p></button></li>
		</ul>
	</div>
<%  } else if (topmenu.equals("2")) { //���� ���ǽ�%>	
	<div class="submenutool">
		<ul class="ratemenutool">
<!--			<li><button type="button" tabindex="108" onclick="javascript:menuMainForward('4','/servlet/controller.study.MyClassServlet?p_process=celp');" class="<%=submenu1.equals("8")?selected:notSelected%>" title="���� ���ܰ� ������ ������ ����  ������ ���� �� ��ǥ�� �ʿ��� ������ Ȯ���մϴ�"><p>�ڱ⿪��<br>����</p></button></li>-->
			<li><button type="button" tabindex="107" onclick="javascript:menuMainForward('4','/servlet/controller.study.MyClassServlet?p_process=StudyHistoryListSyuro');" class="<%=submenu1.equals("7")?selected:notSelected%>" title="������ �����Ͻ� ��� �������� ����� �� �ֽ��ϴ�."><p>������<br>���</p></button></li>
			<li><button type="button" tabindex="106" onclick="javascript:menuForward('3','07');" class="<%=submenu1.equals("6")?selected:notSelected%>" title="ȸ������ �����Ͻ� ������ Ȯ���� �� �ֽ��ϴ�."><p>���� ����</p></button></li>
			<li><button type="button" tabindex="105" onclick="javascript:menuForward('3','12');" class="<%=submenu1.equals("5")?selected:notSelected%>" title="����Ͻ� ������ Ȯ���� �� �ֽ��ϴ�."><p>����<br>��㳻��</p></button></li>
<!--			<li><button type="button" tabindex="104" onclick="javascript:menuForward('3','19');" class="<%=submenu1.equals("4")?selected:notSelected%>" title="���� ��ȸ �Ǵ� ��Ҹ� �� �� �ֽ��ϴ�."><p>������<br>��������</p></button></li>-->
			<li><button type="button" tabindex="103" onclick="javascript:menuForward('3','17');" class="<%=submenu1.equals("3")?selected:notSelected%>" title="��û�� ������ Ȯ���ϰų� ����� �� �ֽ��ϴ�."><p>������û<br>Ȯ��/���</p></button></li>
			<li><button type="button" tabindex="102" onclick="javascript:menuForward('3','02');" class="<%=submenu1.equals("2")?selected:notSelected%>" title="ȸ������ �� ������� �н��� �̷��� Ȯ���� �� �ֽ��ϴ�."><p>����<br>�����̷�</p></button></li>
			<li><button type="button" tabindex="101" onclick="javascript:menuForward('3','11');" class="<%=submenu1.equals("1")?selected:notSelected%>" title="���� �н����� ������ Ȯ�� �Ǵ� �н��� �� �ֽ��ϴ�."><p>��������<br>����</p></button></li>
		</ul>
	</div>
<%  } else if (topmenu.equals("3")) { //�¶��ΰ���%>		
	<div class="submenutool">
		<ul class="ratemenutool">
			<%-- <li><button type="button" onclick="getlink('page2_online_course.html');" class="<%=submenu1.equals("5")?selected:notSelected%>" title="������û ����� �ȳ��մϴ�"><p>������û<br>�ȳ�</p></button></li> --%>
			<li><button type="button" tabindex="105" onclick="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=Curriculum')" class="<%=submenu1.equals("5")?selected:notSelected%>" title="�¶��� �������� ������� �̵��մϴ�"><p>Ŀ��ŧ��</p></button></li>
			<li><button type="button" tabindex="104" onclick="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&amp;p_area=K0')" class="<%=submenu1.equals("4")?selected:notSelected%>" title="��ȭ������ �о� �¶��ΰ��� ������� �̵��մϴ�"><p>��ȭ������</p></button></li>
			<li><button type="button" tabindex="103" onclick="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&amp;p_area=G0')" class="<%=submenu1.equals("3")?selected:notSelected%>" title="���Ӱ��� �о� �¶��ΰ��� ������� �̵��մϴ�"><p>���Ӱ���</p></button></li>
			<li><button type="button" tabindex="102" onclick="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&amp;p_area=B0')" class="<%=submenu1.equals("2")?selected:notSelected%>" title="��ۿ��� �о� �¶��ΰ��� ������� �̵��մϴ�"><p>��ۿ���</p></button></li>
			<li><button type="button" tabindex="101" onclick="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList')" class="<%=submenu1.equals("1")?selected:notSelected%>" title="�¶��ΰ��� ��ü ����� Ȯ���մϴ�"><p>��ü ����</p></button></li>
		</ul>
	</div>
<%  } else if (topmenu.equals("4")) { //�������ΰ���%>		
	<div class="submenutool">
		<ul class="ratemenutool">
			<%-- <li><button type="button" onclick="getlink('page3_offline_course.html');" class="<%=submenu1.equals("6")?selected:notSelected%>" title="������û ����� �ȳ��մϴ�"><p>������û<br>�ȳ�</p></button></li> --%>
<!--			<li><button type="button" tabindex="106" onclick="javascript:menuForward('2','05');" class="<%=submenu1.equals("5")?selected:notSelected%>" title="������û ����� �ȳ��մϴ�"><p>��������</p></button></li>-->
<!--			<li><button type="button" tabindex="105" onclick="javascript:menuForward('2','04');" class="<%=submenu1.equals("4")?selected:notSelected%>" title="��ȭ������ �о� �¶��ΰ��� ������� �̵��մϴ�"><p>�����ڷ��</p></button></li>-->
			<li><button type="button" tabindex="104" onclick="javascript:menuForward('2','03');" class="<%=submenu1.equals("3")?selected:notSelected%>" title="���Ӱ��� �о� �¶��ΰ��� ������� �̵��մϴ�"><p>��ȹâ��</p></button></li>
			<li><button type="button" tabindex="103" onclick="javascript:menuForward('2','02');" class="<%=submenu1.equals("2")?selected:notSelected%>" title="��ۿ��� �о� �¶��ΰ��� ������� �̵��մϴ�"><p>��������</p></button></li>
			<li><button type="button" tabindex="102" onclick="javascript:menuForward('2','01');" class="<%=submenu1.equals("1")?selected:notSelected%>" title="�¶��ΰ��� ��ü ����� Ȯ���մϴ�"><p>��ۿ���</p></button></li>
			<li><button type="button" tabindex="101" onclick="javascript:menuMainForward('2', '/servlet/controller.off.ProposeOffServlet?p_process=SubjectList');" class="<%=submenu1.equals("0")?selected:notSelected%>" title="��ü ����� Ȯ���մϴ�"><p>��ü</p></button></li>
		</ul>
	</div>
<%  } else if (topmenu.equals("5")) { //�н�����%>		

	<div class="submenutool">
		<ul class="ratemenutool">
			<%-- <li><button type="button" onclick="javascript:menuForward('4','01');" class="<%=submenu1.equals("8")?selected:notSelected%>" title="�¶���/�������� ���� ���� �� �ñ��� ���� �ִٸ� �ȳ��� �޾ƺ�����"><p>�������̵�</p></button></li> --%>
			<li><button type="button" tabindex="107" onclick="javascript:menuForward('4','12');" class="<%=submenu1.equals("7")?selected:notSelected%>" title="��ī���̿��� �����ϴ� �پ��� �̺�Ʈ�� Ȯ���� �� �ֽ��ϴ�"><p>�̺�Ʈ</p></button></li>
			<li><button type="button" tabindex="106" onclick="javascript:menuForward('4','09');" class="<%=submenu1.equals("6")?selected:notSelected%>" title="����� ������ ���ϽŴٸ� �̰� 1:1���Ǹ� �̿����ּ���"><p>1:1����</p></button></li>
			<li><button type="button" tabindex="105" onclick="javascript:menuForward('4','10');" class="<%=submenu1.equals("5")?selected:notSelected%>" title="�������� ���� �� ���Ǵ� ���縦 �Ұ��մϴ�"><p>����Ұ�</p></button></li>
			<li><button type="button" tabindex="104" onclick="javascript:menuForward('4','05');" class="<%=submenu1.equals("4")?selected:notSelected%>" title="�¶��� �н� �� �������� �н��� ���� �н�ȯ���� �����մϴ�"><p>�н�ȯ��<br>�����</p></button></li>
			<li><button type="button" tabindex="103" onclick="javascript:menuForward('4','02');" class="<%=submenu1.equals("3")?selected:notSelected%>" title="�ñ��� ���� �ִٸ� �������"><p>������ϱ�</p></button></li>
			<li><button type="button" tabindex="102" onclick="javascript:menuForward('4','01');" class="<%=submenu1.equals("2")?selected:notSelected%>" title="���� ���� ������ ��Ƶξ����ϴ�"><p>FAQ</p></button></li>
			<li><button type="button" tabindex="101" onclick="javascript:menuForward('4','07');" class="<%=submenu1.equals("1")?selected:notSelected%>" title="�ѱ������������ ��ī������ ���ҽ��� �˷��帳�ϴ�"><p>��������</p></button></li>
		</ul>
	</div>

<%  } else if (topmenu.equals("6")) { //��������%>		
	<div class="submenutool">
		<ul class="ratemenutool">
			<li><button type="button" tabindex="106" onclick="javascript:menuForward('5','16');" class="<%=submenu1.equals("5")?selected:notSelected%>" title="��Ÿ ���� �������Ǹ� ������ �� �ֽ��ϴ�."><p>��Ÿ</p></button></li>
			<li><button type="button" tabindex="105" onclick="javascript:menuForward('5','17');" class="<%=submenu1.equals("6")?selected:notSelected%>" title="���� ���� �������Ǹ� ������ �� �ֽ��ϴ�."><p>����</p></button></li>
			<li><button type="button" tabindex="104" onclick="javascript:menuForward('5','15');" class="<%=submenu1.equals("4")?selected:notSelected%>" title="��ȭ���� ���� �������Ǹ� ������ �� �ֽ��ϴ�."><p>��ȭ����</p></button></li>
			<li><button type="button" tabindex="103" onclick="javascript:menuForward('5','14');" class="<%=submenu1.equals("3")?selected:notSelected%>" title="��ť���͸� ���� �������Ǹ� ������ �� �ֽ��ϴ�."><p>��ť���͸�</p></button></li>
			<li><button type="button" tabindex="102" onclick="javascript:menuForward('5','13');" class="<%=submenu1.equals("2")?selected:notSelected%>" title="��ȭ ���� �������Ǹ� ������ �� �ֽ��ϴ�."><p>��ȭ</p></button></li>
			<li><button type="button" tabindex="101" onclick="javascript:menuForward('5','12');" class="<%=submenu1.equals("1")?selected:notSelected%>" title="����ۿ��� ���� �������Ǹ� ������ �� �ֽ��ϴ�."><p>��ۿ���</p></button></li>
		</ul>
	</div>
	
<%  } else if (topmenu.equals("7")) { //��ī���̼Ұ�%>		
	<div class="submenutool">
		<ul class="ratemenutool">
			<li><button type="button" tabindex="107" onclick="javascript:menuMainForward('7','/servlet/controller.homepage.HomePageContactServlet?p_process=contactus')" class="<%=submenu1.equals("7")?selected:notSelected%>" title="��ü�������� �� �������,���ȵ��� �� �� �ֽ��ϴ�."><p>Contact<br>Us</p></button></li>
			<li><button type="button" tabindex="106" onclick="javascript:menuForward('7','04');" class="<%=submenu1.equals("6")?selected:notSelected%>" title="�ѱ������������ ��ī���̿� ���ô±��� �ȳ��մϴ�."><p>���ô±�</p></button></li>
			<li><button type="button" tabindex="105" onclick="javascript:menuForward('7','06');" class="<%=submenu1.equals("5")?selected:notSelected%>" title="��ī���̿� ���°����� ����� �Ұ��մϴ�."><p>��������<br>���</p></button></li>
			<li><button type="button" tabindex="104" onclick="javascript:menuMainForward('7','/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList')" class="<%=submenu1.equals("4")?selected:notSelected%>" title="�ѱ���������ī������ ��� Ȱ�� �ҽ��� ���ص帳�ϴ�"><p>��ī����<br>�ҽ�</p></button></li>
			<li><button type="button" tabindex="103" onclick="javascript:menuForward('7','05');" class="<%=submenu1.equals("3")?selected:notSelected%>" title="��ī���� ��������� �ȳ��մϴ�."><p>�������</p></button></li>
			<li><button type="button" tabindex="108" onclick="javascript:menuMainForward('7','/servlet/controller.homepage.HomePageAboutUsServlet?p_process=facility')" class="<%=submenu1.equals("8")?selected:notSelected%>" title="�ѱ� ������ ��ī������ �ü��� �ȳ��մϴ�."><p>�ü��Ұ�</p></button></li>
			<li><button type="button" tabindex="102" onclick="javascript:menuForward('7','02');" class="<%=submenu1.equals("2")?selected:notSelected%>" title="��ī������ ���������� ������ ���� �Ұ��մϴ�."><p>��ī����<br>�Ұ�</p></button></li>
			<li><button type="button" tabindex="101" onclick="javascript:menuForward('7','01');" class="<%=submenu1.equals("1")?selected:notSelected%>" title="�ѱ��������������Բ��� ȸ���Ե鲲 �帮�� �λ縻�Դϴ�."><p>�������<br>�λ縻</p></button></li>
		</ul>
	</div>

<% }else if (topmenu.equals("8")) { //�������%>		
	<div class="submenutool">
	<ul class="ratemenutool">
		<li><button type="button" tabindex="101" onclick="javascript:menuForward('7','01');" class="<%=submenu1.equals("1")?selected:notSelected%>" title="�ѱ��������������Բ��� ȸ���Ե鲲 �帮�� �λ縻�Դϴ�."><p>����<br>������</p></button></li>
	</ul>
</div>

<% } %>