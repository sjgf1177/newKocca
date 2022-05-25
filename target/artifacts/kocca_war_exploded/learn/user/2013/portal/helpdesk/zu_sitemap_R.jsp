<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    box.put("title_str", "����Ʈ��-�̿�ȳ�, �н�����");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<style>

.siteamp-header {padding:12px 0 20px 120px; color:#444; line-height:18px; background:url(/images/2013/support/icon-header.png) no-repeat 50px 0;}
.sitemap-body {padding:0 10px;}
.sitemap-body .row {margin-top:60px; zoom:1;}
.sitemap-body .row:after {content:""; display:block; clear:both;}
.sitemap-body .col {float:left; width:170px; margin-left:40px;}
.sitemap-body h3 {padding:9px 0; text-align:center; color:#fff; font-size:14px; font-family:'�������','nanumgothic','���� ���','malgun gothic',sans-serif; font-weight:600; background:#ce0000;}
.sitemap-body li {line-height:16px; border-bottom:1px solid #dedede; background:url(/images/2013/support/icon1.png) no-repeat 10px 12px;}
.sitemap-body li a {display:block; padding:8px 0 8px 23px; color:#444;}
.sitemap-body li ul {margin-bottom:10px;}
.sitemap-body li li {border:0; background:url(/images/2013/support/icon2.png) no-repeat 30px 10px;}
.sitemap-body li li a {padding:5px 0 5px 43px; color:#969696;}
</style>
<!-- container-new ���� //-->
<div id="container-new">

    <div id="mainMenu">
        <!-- �н����� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>����Ʈ��</li>
            <!-- 2015-01-19 �������
            <li>�н�����</li>
            <li>
                �̿�ȳ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active"
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                    <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome" class="active">�̿�ȳ�</a></li>
                </ul>
            </li>
            <li>
                ����Ʈ�� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap" class="active">����Ʈ��</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">�� ���� ����</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                </ul>
            </li>
            
            //-->
        </ul>
        <!-- ������ο� -->
        <!-- 2015-01-19 ������� 
        <div class="introCategory">
            <ul>
                <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap"><strong><u>����Ʈ��</u></strong></a></li>
                <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
                <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">�� ���� ����</a></li>
                <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
            </ul>
        </div>
        -->
    </div>
    <!-- //#mainMenu -->

    <!-- ������ ���� ���� -->
    <div id="contents">

        <div id="subCont">
        <h2 class="subTit">����Ʈ��<!-- <img src="/images/2013/support/sitemap_title.gif" alt="����Ʈ��" /> //--></h2>

            <!-- sitemap-body-->
            <div class="siteamp-header">
                ����Ʈ�� ���� ���ϰ� �̿��ϼ���.<br>
                �׻� ����ϰ� �����ϴ� �ѱ���������ī���̰� �ǰڽ��ϴ�.
            </div>
            <div class="sitemap-body">
                <!-- row -->
                <div class="row">
                    <!-- col -->
                    <div class="col">
                        <h3>���ҽ�</h3>
                        <ul>
                            <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                            <li><a href="javascript:alert('�غ��� �Դϴ�.');">�̺�Ʈ</a></li>
                            <li><a href="/servlet/controller.homepage.TongBoardServlet?p_process=list">��ī���� �̾߱�</a></li>
                            <li><a href="/servlet/controller.homepage.CMUBoardServlet?p_process=list">CMU���丮</a></li>
                        </ul>
                    </div>
                    <!-- /col -->
                    <!-- col -->
                    <div class="col">
                        <h3>���屳��</h3>
                        <ul>
                            <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001">������û</a></li>
                            <!--
                            <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=002">������ ����缺����</a></li>
                            //-->
                            <li><a href="/servlet/controller.course.EduScheduleHomePageServlet?p_process=offSchlYearPlanList">�����ȳ�</a></li>
                        </ul>
                    </div>
                    <!-- /col -->
                    <!-- col -->
                    <div class="col">
                        <h3>�¶��α���</h3>
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
                    </div>
                    <!-- /col -->
                    <!-- col -->
                    <div class="col">
                        <h3>��������</h3>
                        <ul>
                            <li><a href="javascript:fnOpenClassList('ALL');">�з���</a></li>
                            <li><a href="javascript:fnOpenClassList('ALL');">�׸���</a></li>
                        </ul>
                    </div>
                    <!-- /col -->
                </div>
                <!-- /row -->
                <!-- row -->
                <div class="row">
                    <!-- col -->
                    <div class="col">
                        <h3>������</h3>
                        <ul>
                            <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome">�н�����</a>
                                <ul>
                                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome">�н����̵�</a></li>
                                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelpSWDown">����Ʈ���� �ٿ�ε�</a></li>
                                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">������������</a></li>
                                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����Ͼ�  ����</a></li>
                                </ul>
                            </li>
                            <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">�����ϴ� ����</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a>
                                <ul>
                                    <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">������ϱ�</a></li>
                                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=insertPage;">1:1����</a></li>
                                </ul>
                            </li>
                            <li><a href="javascript:alert('������ �߱޾ȳ� �غ����Դϴ�.');">������ �߱޾ȳ�</a></li>
                        </ul>
                    </div>
                    <!-- /col -->
                    <!-- col -->
                    <div class="col">
                        <h3>��ī���̼Ұ�</h3>
                        <ul>
                            <!--<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision">��ī���̼Ұ�</a></li>-->
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">�λ縻</a></li>
                            <!-- 2015-03-18 ����
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                            //-->
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
                        </ul>
                    </div>
                    <!-- /col -->
                    <!-- col -->
                    <div class="col">
                        <h3>���θ޴�</h3>
                        <ul>
                            <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">�¶��� ���ǽ�</a>
                                <ul>
                                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                                    <li><a href="/servlet/controller.study.FavorOpenClassServlet?p_process=favorOpenClassList">����</a></li>
                                    <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew">����</a></li>
                                    <li><a href="/servlet/controller.study.ProposeReviewServlet?p_process=selectReviewList">�����ı�</a></li>
                                </ul>
                            </li>
                            <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���屳�� ���ǽ�</a></li>
                            <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE">���� �ۼ��� ��</a></li>
                            <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage">��㳻��</a></li>
                            <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">��������</a></li>
                        </ul>
                    </div>
                    <!-- /col -->
                    <!-- col -->
                    <div class="col">
                        <h3>�̿�ȳ�</h3>
                        <ul>
                            <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                            <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
                            <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                            <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                        </ul>
                    </div>
                    <!-- /col -->
                </div>
                <!-- /row -->
            </div>
            <!--// sitemap-body-->
        </div>

    </div>
    <!-- //#contents -->
    <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>