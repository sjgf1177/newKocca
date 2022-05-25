<%@ page import = "com.credu.homepage.LoginBean" %>
<%@ page import = "com.credu.propose.MainSubjSearchBean" %>
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

    String titleStr = box.getString("title_str");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta property="og:title" content="<%= box.getString("og_title") %>">
<meta property="og:url" content="<%= box.getString("og_url") %>">
<meta property="og:description" content="<%= box.getString("og_description") %>">
<meta property="og:image" content="<%= box.getString("og_image") %>">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta name="subject" content="�ѱ���������ī����" /> 
<meta name="title" content="�ѱ���������ī����" />
<meta name="description" content="�ѱ���������ī����" />
<meta name="keywords" content="<%= titleStr %>, kocca, �ѱ���������ī����" />
<meta name="robots" content="index,follow" />

<title><%= titleStr %> | �ѱ���������ī���� </title>
<link rel="stylesheet" href="/css/jqueryui/1.10.0/themes/base/jquery-ui.css" />
<script src="/js/jquery/1.8.3/jquery.js"></script>
<script src="/js/jqueryui/1.10.0/jquery-ui.js"></script>

<script type="text/javascript" src="/js/2013/caption.js"></script>
<script type="text/javascript" src="/js/2013/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/js/2013/jquery.selectbox-0.6.1.js"></script>
<script type="text/javascript" src="/js/2013/jquery.cycle2.min.js"></script>
<script type="text/javascript" src="/js/2013/common.js"></script>
<!--<script type="text/javascript" src="/js/2013/temp.js"></script>-->
<script type="text/javascript" src="/js/2013/lib.js"></script>

<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" language="JavaScript" src="/script/mainscript.js"></script>
<style type="text/css" media="screen">@import "/css/2013/common.css";</style>
<style type="text/css" media="screen">@import "/css/2013/layout.css";</style>
<style type="text/css" media="screen">@import "/css/2013/sub.css";</style>
<script type="text/javascript">
/* �н����� ����Ű üũ */
function password_enter(e) {
  if (e.keyCode =='13'){  login_main();  }
}
</script>
</head>
<body>
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

<div id="wrap">
    <div id="shortcutmenu">
        <a href="#quickEduMenu">�ָ޴��� �ٷΰ���</a>
        <a href="#contents">�������� �ٷΰ���</a>
    </div>
    <!-- //#shortcutmenu -->

    <div id="header">
        <h1><a href="/servlet/controller.homepage.MainServlet"><img src="/images/2013/common/logo.png" alt="kocca �ѱ���������ī����" /></a></h1>
        <ul class="util">
            <% if(topWarp_userid.equals("")) {%>     <%--�α����� �ȵǾ��� ���--%>
            <li class="login">
            <form method="post" name="login" action="">
                <input type="hidden" name="p_process"   value="" />
                <input type="hidden" name="p_frmURL" value="<%= box.getStringDefault("p_frmURL", "") %>" />
                <label for="p_userid" style="display:none;">�α��� ���̵�</label><input type="text" name="p_userid" id="p_userid" class="id" />
                <label for="p_pwd" style="display:none;">�α��� ��й�ȣ</label><input type="password" name="p_pwd" id="p_pwd" class="pw" onkeypress="password_enter(event)" />
                <a href="javascript:void(0);" onclick="return login_main();" title="�α���"><img src="/images/2013/btn/btn_login.gif" alt="�α���" /></a>
            </form>
            </li>
            <li class="signup"><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
            <li class="idpw"><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">ID/PWã��</a></li>
            <% } else { %>
            <li class="name"><%=topWarp_usernm%> ��</li>
            <li class="myinfo">
                <label for="myInfoMng"><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">������ ����</a></label>
                <%= box.getSession("tem_grcode").equals("N000001") ? LoginBean.getAuthSelect(topWarp_userid, "p_topAuth", topWarp_gadmin, "onChange = 'javascript:topAuthChange();'") : ""%>
                <% if ((!(topWarp_gadmin.equals("ZZ") || topWarp_gadmin.equals("")))) {  %>
                <a href="javascript:topAdminOpenPage()" tabindex="7" title="LMS�� �̵��մϴ�">LMS�̵�</a>
            <% } %>
            </li>
            <li class="logout"><a href="javascript:mainmenu('998');"><img src="/images/2013/btn/btn_logout.gif" alt="�α׾ƿ�" /></a></li>
            <% } %>
            <li class="zoom">
                ũ������
                <span>
                    <a href="javascript:"><img src="/images/2013/btn/btn_plus.gif" alt="ȭ�� Ȯ��" /></a>
                    <a href="javascript:"><img src="/images/2013/btn/btn_minus.gif" alt="ȭ�� ���" /></a>
                </span>
            </li>
        </ul>
    </div>
    <!-- //#header -->

    <hr />

    <div id="sideMenu">
        <div class="search">
            <fieldset>
                <legend>���� �˻�</legend>
                 <label for="topWarp_searchText" style="display:none;">�˻���</label><input type="text" name="topWarp_searchText" onkeypress="searchtotal_enter(event);" id="topWarp_searchText" title="�˻���" class="keyword" />
                <a href="javascript:totalSubjSearch1();"><img src="/images/2013/btn/btn_src.gif" alt="�˻�" /></a>
                <!-- <input type="image" src="/images/2013/btn/btn_src.gif" alt="�˻�" class="btn" onclick="javascript:totalSubjSearch1();"/> //-->
            </fieldset>
        </div>
        <div class="eduSup">
            <h2 style="margin-bottom:5px;"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision"><img src="/images/2013/common/sidemenu_tit2.gif" alt="��ī���� �Ұ�" /></a></h2>
            <h2><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome"><img src="/images/2013/common/sidemenu_tit.gif" alt="�н�����" /></a></h2>
            <ul>
                <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService"><img src="/images/2013/common/sidemenu_1.gif" alt="������������" /></a></li>
                <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp"><img src="/images/2013/common/sidemenu_2.gif" alt="�н�ȯ�漳��" /></a></li>
                <!-- 2014-06-25 ����. �ϴܿ� ���� ����Ʈ ��ʸ� �߰��ϱ� ���� ���� ����� �޴��� ������ //-->
                <!-- <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp"><img src="/images/2013/common/sidemenu_1-2.gif" alt="����Ͼ�" /></a></li> //-->
                <!-- <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList"><img src="/images/2013/common/sidemenu_3.gif" alt="FAQ" /></a></li> //-->
                <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList"><img src="/images/2013/common/sidemenu_4.gif" alt="��������" /></a></li>
                <!-- <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List"><img src="/images/2013/common/sidemenu_5.gif" alt="��������" /></a></li> //-->
                <!-- <li><a href="/servlet/controller.course.EduScheduleHomePageServlet?p_process=offSchlYearPlanList"><img src="/images/2013/common/sidemenu_6.gif" alt="��������" /></a></li> //-->
                <!-- <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome"><img src="/images/2013/common/sidemenu_7.gif" alt="�̿�ȳ�" /></a></li> //-->
            </ul>
        </div>
        <div class="sns">
            <ul>
                <li><a href="https://www.facebook.com/edukocca" target="_blank"><img src="/images/2013/main/btn_sns_fb.gif" alt="���̽���"/></a></li>
                <li><a href="https://twitter.com/edukocca" target="_blank"><img src="/images/2013/main/btn_sns_tw.gif" alt="Ʈ����"/></a></li>
                <li><a href="http://blog.naver.com/kocca02" target="_blank"><img src="/images/2013/main/btn_sns_nv.gif" alt="��α�"/></a></li>
                <li><a href="http://www.youtube.com/KoreanContent" target="_blank"><img src="/images/2013/main/btn_sns_yt.gif" alt="��Ʃ��"/></a></li>
            </ul>
        </div>

        <%@ include file="/learn/user/2013/portal/include/popular_search.html" %>
        <%-- @ include file="/upload/homepage/popularsearch/popular_search.html" --%>

        <div style="padding-top:20px; padding-left:3px;">
            <ul>
                <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp" target="_self" title="����� ���� �ȳ�"><img src="/images/common/right_banner_mobile.jpg" alt="����� ���� �ȳ�" /></a></li>
            </ul>
        </div>

        <div style="padding-top:20px; padding-left:3px;">
            <ul>
                <li><a href="http://www.ckl.or.kr" target="_blank" title="CONTENTS KOREA LAB Ȩ�������� �̵�"><img src="/images/common/right_banner_ckl_20140625.jpg" alt="������ â������, â���� â������. �������ڸ��Ʒ�" /></a></li>
            </ul>
        </div>

    </div>
    <!-- //#sidemenu -->

    <hr />

    <div id="quickEduMenu">
        <ul class="tab">
            <li><a href="#quickEdu1"><img src="/images/2013/common/quick_tab_1.gif" alt="�¶��� ����" /></a></li>
            <li><a href="#quickEdu2"><img src="/images/2013/common/quick_tab_2.gif" alt="���� ����" /></a></li>
            <li><a href="#quickEdu3"><img src="/images/2013/common/quick_tab_3.gif" alt="���� ����" /></a></li>
        </ul>
        <p class="viewAll"><a href="#totalmenu"><img src="/images/2013/btn/btn_all.gif" alt="��ü����" /></a></p>

        <!-- �¶��α��� -->
        <div id="quickEdu1" class="cont">
            <div class="pointer"></div>
            <h3>
<!--                <a href="#">-->
                    <span class="img"><img src="/images/2013/common/quick1_tit.png" alt="�¶��� ����" /></span>
                    <span class="txt">����, ���, ��ȭ�ִϸ��̼�<br />ĳ����, ���ǰ��� �� <strong>�������о�<br /> ���� �¶��� ����</strong>�� �����մϴ�.</span>
<!--                </a>-->
            </h3>
            <ul>
                <li>
                    <a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">
                        <span class="img"><img src="/images/2013/common/quick1_tit2.png" alt="���� ���ǽ�" /></span>
                        <span class="txt">���� �н����� ����, ��û����<br />���� Ȯ�� �� �н��Ϸ� ������<br /> �������� �߱� ���� �� �ֽ��ϴ�.</span>
                    </a>
                </li>
                <li>
                    <a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">
                        <span class="img"><img src="/images/2013/common/quick1_tit3.png" alt="�����ȳ�" /></span>
                        <span class="txt">������, ������, �оߺ�, ������<br /> ���ϴ� ������ ã�� �� ������,<br />���� ������ �� �� �ֽ��ϴ�.</span>
                    </a>
                </li>
                <li>
                    <a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">
                        <span class="img"><img src="/images/2013/common/quick1_tit4.png" alt="Ŀ�´�Ƽ" /></span>
                        <span class="txt">Ʃ�Ϳ� �н���,<br />�н��ڿ� �н��ڰ��� ������<br /> �����ϰ� ����ϴ� �����Դϴ�.</span>
                    </a>
                </li>
            </ul>
<!--            <p class="link"><span><a href="#">�Ŵ� 3���� ������ ���� �� �� �ֽ��ϴ�. ������ �ʿ��� <strong>�������� �˾ƺ���</strong></a></span></p>-->
            <p class="closeBtn"><a href="#"><img src="/images/2013/btn/quick_close.gif" alt="â�ݱ�" /></a></p>
        </div>
        <!-- //�¶��α��� -->

        <!-- ���屳�� -->
        <div id="quickEdu2" class="cont">
            <div class="pointer"></div>
            <h3>
<!--                <a href="#">-->
                    <span class="img"><img src="/images/2013/common/quick2_tit.png" alt="���� ����" /></span>
                    <span class="txt">�������о� <strong>�����η�</strong>��<br /> ��������� <strong>������</strong>�� ���� <br /><strong>���� ���屳��</strong>�� �����մϴ�.  </span>
<!--                </a>-->
            </h3>
            <ul>
                <li>
                    <a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">
                        <span class="img"><img src="/images/2013/common/quick2_tit2.png" alt="���� ���ǽ�" /></span>
                        <span class="txt">����  ��û���� ����, ��������<br />���� Ȯ�� �� �����Ϸ� ������<br /> �������� �߱� ���� �� �ֽ��ϴ�.</span>
                    </a>
                </li>
                <li>
                    <!-- 2014-04-23 ���� 3D������ �̷�â���η� �̰� �Ϸ������ ���Ͽ� �ּ�ó��
                    <a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=004">
                    //-->
                    <a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001">
                        <span class="img"><img src="/images/2013/common/quick2_tit3.png" alt="������û" /></span>
                        <span class="txt">�����η±���, ������ �������� ��<br /> ���� ���� ������ Ȯ���ϰ�, ���ϴ�<br />������ ��û �� �� �ֽ��ϴ�.</span>
                    </a>
                </li>
                <li>
                    <a href="/servlet/controller.course.EduScheduleHomePageServlet?p_process=offSchlYearPlanList">
                        <span class="img"><img src="/images/2013/common/quick2_tit4.png" alt="�����ȳ�" /></span>
                        <span class="txt">��,�� ������ ���屳�� �������� <br />�ȳ��� Ȯ�� �Ͻ� �� �ֽ��ϴ�.</span>
                    </a>
                </li>
            </ul>
<!--            <p class="link"><span><a href="#">9�� ���屳�� ���� �ȳ��� Ȯ�� �� �� �ֽ��ϴ�. ������ �ʿ��� <strong>�������� �˾ƺ���</strong></a></span></p>-->
            <p class="closeBtn"><a href="#"><img src="/images/2013/btn/quick_close.gif" alt="â�ݱ�" /></a></p>
        </div>
        <!-- //���屳�� -->

        <!-- 2014-06-12 new ��������(��������) start //-->
		<div id="quickEdu3" class="cont">
			<div class="pointer"></div>
			<div class="bgTopRight"></div>
			<h3>
				<span class="img"><img src="/images/2013/common/quick3_tit.png" alt="���� ����" /></span>
				<span class="txt">��ۿ���, ��ȭ����, ���� ��<br /> <strong>�����Ӱ� �� �� �ִ� ������ </strong>��<br /> ���� �ϰ� �ֽ��ϴ�.</span>
			</h3>
			<div>
				<span class="img" style="float:left; margin-top:13px;"><img src="/images/common/line_v.png" alt="" /></span>
				<div>
					<h4>
						<span class="img" style="float:left; padding:30px 10px 10px 20px;"><img src="/images/common/list01.png" alt="�з���" /></span>
					</h4>
					<div style="float:left; margin-top:60px; padding-left:7px;">
						<a href="javascript:fnOpenClassList('ALL');" style="margin:15px; color:#865d21">��ü</a><font style="color:#dadada;">|</font>
						<a href="javascript:fnOpenClassList('GC01');" style="margin:15px; color:#865d21">��ۿ���</a><font style="color:#dadada;">|</font>
						<a href="javascript:fnOpenClassList('GC02');" style="margin:15px; color:#865d21">����</a><font style="color:#dadada;">|</font>
						<a href="javascript:fnOpenClassList('GC03');" style="margin:15px; color:#865d21">��ȭ�ִ�ĳ����</a><font style="color:#dadada;">|</font>
						<a href="javascript:fnOpenClassList('GC04');" style="margin:15px; color:#865d21">����/����</a><font style="color:#dadada;">|</font>
						<a href="javascript:fnOpenClassList('GC05');" style="margin:15px; color:#865d21">��Ÿ</a>
					</div>
				</div>
				<span class="img" style="float:left; width:550px; height:10px;"><img src="/images/common/line_h.png" alt="" /></span>
				<div>
					<h4>
						<span class="img" style="float:left; padding:10px 10px 10px 20px;"><img src="/images/common/list02.png" alt="�׸���" /></span>
					</h4>
					<div style="float:left; margin-top:38px; padding-left:7px;">
						<a href="javascript:fnOpenClassList('GC06');" style="margin:15px; color:#521e87">�������λ���Ʈ</a><font style="color:#dadada;">|</font>
						<a href="javascript:fnOpenClassList('GC07');" style="margin:15px; color:#521e87">������Ŭ����</a><font style="color:#dadada;">|</font>
						<a href="javascript:fnOpenClassList('GC08');" style="margin:15px; color:#521e87">�޳ݿ�������</a><font style="color:#dadada;">|</font>
					</div>
				</div>
					
			</div>
            <!-- <p class="link"><span><a href="#">������û ���� �������� �н��� ������ ���� �����Դϴ�. <strong>�ű� �������� �ѷ�����</strong></a></span></p> //-->
			<p class="closeBtn"><a href="#"><img src="/images/2013/btn/quick_close.gif" alt="â�ݱ�" /></a></p>
		</div>

        <!-- 2014-06-12 new ��������(��������) end //-->

        <!-- �������� 2014-06-10 �������¸� �з����� ��ȸ�ϴ� ������ ����Ǿ� ���� ������ �ּ�ó�� �� //-->
        <!--
        <div id="quickEdu3" class="cont">
            <div class="pointer"></div>
            <h3>
            //-->

                <!-- <a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage">-->
                <!--
                <span class="img"><img src="/images/2013/common/quick3_tit.png" alt="���� ����" /></span>
                <span class="txt">��ۿ���, ��ȭ����, ���� ��<br /><strong>�����Ӱ� �� �� �ִ� ������</strong>��<br />�����ϰ� �ֽ��ϴ�.</span>
                //-->
                <!-- </a>-->

            <!--
            </h3>
            <ul>
                <li class="top">
                    <a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G01">
                        <span class="img"><img src="/images/2013/common/quick3_tit2.png" alt="��ۿ���" /></span>
                        <span class="txt">1��2��, ���۽�Ÿ,<br />�����, ���� ��</span>
                    </a>
                </li>
                <li class="top">
                    <a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G02">
                        <span class="img"><img src="/images/2013/common/quick3_tit3.png" alt="��ȭ" /></span>
                        <span class="txt">������, ��â������<br />�̵̹� ������ ��</span>
                    </a>
                </li>
                <li class="top">
                    <a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G03">
                        <span class="img"><img src="/images/2013/common/quick3_tit4.png" alt="��ť����" /></span>
                        <span class="txt">�����Ҹ�, �Ƹ�����<br />���� ��</span>
                    </a>
                </li>
                <li>
                    <a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G04">
                        <span class="img"><img src="/images/2013/common/quick3_tit5.png" alt="��ȭ����" /></span>
                        <span class="txt">������, ��â������<br />�̵̹� ������ ��</span>
                    </a>
                </li>
                <li>
                    <a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G06">
                        <span class="img"><img src="/images/2013/common/quick3_tit6.png" alt="����" /></span>
                        <span class="txt">��޽��� ���̳�,<br />�ؿ��������� �� </span>
                    </a>
                </li>
                <li>
                    <a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage&p_genre=G05">
                        <span class="img"><img src="/images/2013/common/quick3_tit7.png" alt="��Ÿ" /></span>
                        <span class="txt">������ â��������,<br />�������� ���۱� ��</span>
                    </a>
                </li>
            </ul>
            //-->
            <!-- <p class="link"><span><a href="#">������û ���� �������� �н��� ������ ���� �����Դϴ�. <strong>�ű� �������� �ѷ�����</strong></a></span></p> //-->
            <!--
            <p class="closeBtn"><a href="#"><img src="/images/2013/btn/quick_close.gif" alt="â�ݱ�" /></a></p>
        </div>
        //-->

        <!-- �������� ��//-->

        <div id="totalmenu" class="totalmenu">
            <ul class="group">
                <li class="d1"><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><strong>�� ���ǽ�</strong></a>
                    <ul>
                       <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">- �н����� ����</a></li>
                       <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">- ���� ����</a></li>
                       <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">- ���� ����</a></li>
                       <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">- ���� ����</a></li>
                    </ul>
                </li>
                <li class="d1"><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList"><strong>�����ȳ�</strong></a>
                    <ul>
                       <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">- ������ �Ұ�</a></li>
                       <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikup">- ������ �з�</a></li>
                       <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikmu">- ������ �з�</a></li>
                       <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem">- ����ü�赵</a></li>
                    </ul>
                </li>
                <li class="d1"><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage"><strong>Ŀ�´�Ƽ</strong></a></li>
            </ul>
            <ul class="group">
                <li class="d1"><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage"><strong>�� ���ǽ�</strong></a>
                    <ul>
                       <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">- ��û���� ����</a></li>
                       <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">- ����� ����</a></li>
                    </ul>
                </li>
                <li class="d1"><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001"><strong>�����ȳ�</strong></a>
                    <ul>
                        <!-- 2014-04-23 ���� 3D������ �̷�â���η� �̰� �Ϸ������ ���Ͽ� �ּ�ó��
                        <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=004">- 3D ��ü������</a></li>
                        //-->
                        <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001">- �����������米��</a></li>
                        <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=002">- ������ ����缺����</a></li>
                    </ul>
                </li>
                <li class="d1"><a href="/servlet/controller.course.EduScheduleHomePageServlet?p_process=offSchlYearPlanList"><strong>�����ȳ�</strong></a></li>
            </ul>
            <ul class="group">
                <li class="d1"><a href="/servlet/controller.infomation.GoldClassHomePageServlet"><strong>�з���</strong></a>
                    <ul>
                       <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet">- ��ü</a></li>
                       <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_lecture_cls=GC01">- ��ۿ���</a></li>
                       <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_lecture_cls=GC02">- ����</a></li>
                       <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_lecture_cls=GC03">- ��ȭ�ִ�ĳ����</a></li>
                       <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_lecture_cls=GC04">- ����/����</a></li>
                       <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_lecture_cls=GC05">- ��Ÿ</a></li>
                    </ul>
                </li>

                <li class="d1"><a href="/servlet/controller.infomation.GoldClassHomePageServlet"><strong>�׸���</strong></a>
                    <ul>
                       <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_lecture_cls=GC06">- �������λ���Ʈ</a></li>
                       <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_lecture_cls=GC07">- ������Ŭ����</a></li>
                       <li><a href="/servlet/controller.infomation.GoldClassHomePageServlet?p_lecture_cls=GC08">- �޳ݿ�������</a></li>
                    </ul>
                </li>
            </ul>
            <p class="closeBtn"><a href="#"><img src="/images/2013/btn/quick_close.gif" alt="â�ݱ�" /></a></p>
        </div>
    </div>
    <!-- //#quickEduMenu -->

    <hr />
    <div id="container">