<%@ page contentType="text/html;charset=euc-kr" %>
<%
if(!box.getSession("tem_grcode").equals("N000001") && (box.getSession("tem_type").equals("") || box.getSession("tem_type") == null || box.getSession("tem_type").equals("B"))){
		response.sendRedirect("/");
	}
    String topWarp_userid = box.getSession("userid");
    String topWarp_usernm = box.getSession("name");
    String topWarp_gadmin = box.getSession("gadmin");

    boolean isUserLogin = ( !topWarp_userid.equals("") ) ? true : false;

    String titleStr = box.getString("title_str");
    titleStr = (titleStr == null || titleStr.equals("")) ? "�ѱ���������ī����" : titleStr + " - �ѱ���������ī����";

    java.text.SimpleDateFormat headerSdf = new java.text.SimpleDateFormat("yyyyMMdd");
    java.util.Date headerDate = new java.util.Date();
    int currDate = Integer.parseInt( headerSdf.format(headerDate) );
%>
<!DOCTYPE html> 
<html>
	<head> 
    <meta property="og:title" content="<%= box.getString("og_title") %>">
    <meta property="og:url" content="<%= box.getString("og_url") %>">
    <meta property="og:description" content="<%= box.getString("og_description") %>">
    <meta property="og:image" content="<%= box.getString("og_image") %>">

	<meta charset="euc-kr">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title><%= titleStr %></title>

    <link href="/css/jqueryui/1.10.0/themes/base/jquery-ui.css" rel="stylesheet" />
	<link href="/css/2013/common.css" rel="stylesheet">
	<link href="/css/2013/layout.css" rel="stylesheet">

	<link href="/css/2013/header.css" rel="stylesheet">
<%
    if ( box.getString("isMain").equals("Y") ) {
%>
	<link href="/css/2013/main.css" rel="stylesheet">
<%
    }
%>
	<link href="/css/2013/sub.css" rel="stylesheet">

	<script type="text/javascript" src="/js/jquery/1.8.3/jquery.js"></script>
    <script type="text/javascript" src="/js/jqueryui/1.10.0/jquery-ui.js"></script>
    <script type="text/javascript" src="/js/2013/jquery.selectbox-0.6.1.js"></script>
    <script type="text/javascript" src="/js/2013/caption.js"></script>
    <script type="text/javascript" src="/js/2013/common.js"></script>
	<script type="text/javascript" src="/js/2013/header.js"></script>
	<script type="text/javascript" src="/js/2013/lib.js"></script>
	<script type="text/javascript" src="/js/2013/main.js"></script>
    <script type="text/javascript" src="/script/cresys_lib.js"></script>
    <script type="text/javascript" src="/script/mainscript.js"></script>
    <!-- <script type="text/javascript" src="/js/2013/caption.js"></script> //-->
    <!-- <script type="text/javascript" src="/js/2013/jquery.easing.1.3.js"></script> //-->
    <!-- <script type="text/javascript" src="/js/2013/jquery.cycle2.min.js"></script> //-->
	<script>
		/* ������ ��ī���� ����Ʈ ���� �� �ű� B2C ����������ķ�۽��� �̵� rsg20180124 */
		location.href="https://edu.kocca.kr";
	</script>
</head>
<body>
<!-- ��� �⺻ form //-->
<form name="topdefaultForm" method="post" action="/" id="topdefaultForm" >
    <input type="hidden" name="p_process" value="" />
    <input type="hidden" name="gubun" value="0" />
    <input type="hidden" name="menuid" value="" />
    <input type="hidden" name="url" value="" />
    <input type="hidden" name="p_cmuno" value="" />
    <input type="hidden" name="searchClass" value="" />
    <input type="hidden" name="p_auth" value="" />
    <input type="hidden" name="p_topuserid" value="" />
    <input type="hidden" name="p_toppwd" value="" />
    <input type="hidden" name="p_area" value="" />
    <input type="hidden" name="p_lsearchtext" id="oLsearchtext" value="" />
    <input type="hidden" name="p_lecture_cls" value="" /> <!-- ��������(��������) �з��� ��ȸ�� �ʿ��Ͽ� �ش� ������Ʈ �߰� //-->
    <input type="hidden" name="pageNo" value="" /> <!-- ��������(��������) ����¡ ����� �ʿ��Ͽ� �ش� ������Ʈ �߰� //-->
    <input type="submit" class="close" title="����" />
</form>

<!-- topbar -->
<div id="topbar">
	<!-- body -->
	<div class="body">
		<div class="app-link">
			<a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">�ѱ���������ī���̾�</a>
		</div>
		<div class="util">
<%
        if(topWarp_userid.equals("")) {
%>
			<a href="/learn/user/2013/portal/homepage/zu_MainLogin.jsp">�α���</a><span class="line"> | </span>
			<a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a>
<%
        } else {
%>
            <a href="#" class="my-menu-open"><%=topWarp_usernm%>�� ���θ޴�</a><span class="line"> | </span>
			<div class="my-menu-layer">
				<ul>
					<li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">�¶��� ���ǽ�</a></li>
					<li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���屳�� ���ǽ�</a></li>
					<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE">���� �ۼ��� ��</a></li>
					<li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage">��㳻��</a></li>
					<li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">��������</a></li>
				</ul>
			</div>
			<a href="javascript:mainmenu('998');">�α׾ƿ�</a>
<%
        }
%>
		</div>
	</div>
	<!-- /body -->
</div>
<!-- /topbar -->
<!-- header-new -->
<div id="header-new">
	<div class="brand">
		<a href="/servlet/controller.homepage.MainServlet"><img src="/images/common/brand.png" alt="�ѱ���������ī����"></a>
	</div>

<!--
	<div class="search">
		<div class="field">
			<input type="text">
			<input type="image" src="/images/common/btn-search.png" alt="�˻�">
		</div>
		<div class="word">
			<ul id="searchWord">
				<li>
					<span><a href="#">�α�˻���1</a></span>
					<span><a href="#">�α�˻���1</a></span>
					<span><a href="#">�α�˻���1</a></span>
					<span><a href="#">�α�˻���1</a></span>
				</li>
				<li>
					<span><a href="#">�α�˻���2</a></span>
					<span><a href="#">�α�˻���2</a></span>
					<span><a href="#">�α�˻���2</a></span>
					<span><a href="#">�α�˻���2</a></span>
				</li>
			</ul>
		</div>
	</div>

-->
</div>
<!-- /header-new -->
<!-- nav -->
<div id="nav">
	<div class="sub-bg"></div>
	<ul>
		<li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">���ҽ�</a>
			<ul>
				<li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                <li><a href="/servlet/controller.homepage.EventHomePageServlet?p_process=selectList">�̺�Ʈ</a></li>
                <li><a href="/servlet/controller.homepage.TongBoardServlet?p_process=list" >��ī���� �̾߱�</a></li>
                <li><a href="/servlet/controller.homepage.CMUBoardServlet?p_process=list" >CMU ���丮</a></li>
				<!-- 2015-01-09 ������
                <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
                -->				
			</ul>
		</li>
		<li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001">���屳��</a>
			<ul>
				<li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001">������û</a></li>
				<!-- 2015-02-23 ����
                <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=002">������ ���� �缺����</a></li>
                //-->
				<!--<li><a href="/servlet/controller.course.EduScheduleHomePageServlet?p_process=offSchlYearPlanList">�����ȳ�</a></li>
			--></ul>
		</li>
		<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�¶��α���</a>
			<ul>
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�оߺ�</a></li>
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikup">������</a></li>
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem">����ü�赵</a></li>
<%
        if ( currDate < 20160401 ) {
%>
				<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=LiteratureSubjectList">�޳��ι���</a></li>
<%
        }
%>
			</ul>
		</li>
		<li><a href="javascript:fnOpenClassList('ALL');">��������</a>
			<ul>
				<li><a href="javascript:fnOpenClassList('ALL');">�з���</a></li>
				<li><a href="javascript:fnOpenClassThemeList('ALL');">�׸���</a></li>
			</ul>
		</li>
<!--
		<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">�ڷ��</a>
			<ul>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">�¶��α���</a></li>
				<li><a href="/servlet/controller.homepage.CMUBoardServlet?p_process=list" >CMU ���丮</a></li>
				<li><a href="/servlet/controller.homepage.TongBoardServlet?p_process=list">��ī���� �ҽ� ���̾߱�</a></li>
			</ul>
		</li>
-->
        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome">������</a>
			<ul>
				<li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome">�н�����</a></li>
				<li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">�����ϴ� ����</a></li>
				<li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
				<!--
                <li><a href="javascript:alert('������ �߱޾ȳ� �غ����Դϴ�.');">������ �߱޾ȳ�</a></li>
                -->
			</ul>
		</li>
		<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">��ī���̼Ұ�</a>
			<ul>
				<!--<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision">��ī���̼Ұ�</a></li>-->
                <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">�λ縻</a></li>
                <!-- 2015-03-18 ����
                <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                //-->
                <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">��������ȳ�</a></li>
                <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô±�</a></li>
			</ul>
		</li>
	</ul>
</div>
<!-- /nav -->