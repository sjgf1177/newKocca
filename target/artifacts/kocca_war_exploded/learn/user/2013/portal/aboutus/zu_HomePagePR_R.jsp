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

    box.put("title_str", "ȫ������ - ��ī���̼Ұ�");
    String userAgent = request.getHeader("User-Agent").toLowerCase();
    boolean isUnderIE9 = ( userAgent.indexOf("msie 8") > -1 || userAgent.indexOf("msie 7") > -1 || userAgent.indexOf("msie 6") > -1 );
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- container-new ���� //-->
<div id="container-new">

        <div id="mainMenu">
        <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>��ī���̼Ұ�</li>
                <li>
                    ȫ������ <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision">��ī���̼Ұ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage" > �λ縻</a></li>
                        <!-- 2015-03-18 ����
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                        //-->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR" class="active">ȫ������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
<!-- 2015-01-08 �������
                        <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
-->

                    </ul>
                </li>
            </ul>
            <!-- //�н����� -->
<!--
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">������� �λ縻</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR"><strong><u>ȫ������</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                    <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
                </ul>
            </div>

-->
            <!-- //������ο� -->
        </div>


        <!-- ������ ���� ���� -->
        <div id="contents">
        <h2 class="subTit">ȫ������<!--<img src="/images/2013/introduce/academi_pr.gif" alt="ȫ������" />//--></h2>

            <div id="subCont">

				<div class="intro">
					<p class="aboutTxt">
                        â������ ����! ��ȭ��� �����η¾缺! �ѱ���������ī���� &lt;�¶��α���&gt;���� �Ұ��մϴ�.<br />
                        �ѱ���������ī���̴� ����, ��ۿ���, ��ȭ�ִ�ĳ����, ���ǰ��� �о��� 154�� �¶��� ���԰�����<br />
                        �����η°� ���������� ����� ���������� ������ ���Ἥ���ϰ� �ֽ��ϴ�.
                    </p>
					<div class="aboutImg">
<%
        if ( isUnderIE9 ) {
%>
                        <object type="video/x-ms-wmv" data="mms://211.201.145.102/pr/kocca_pr_movie_640.wmv" width="640" height="405">
                            <param name="src" value="mms://211.201.145.102/pr/kocca_pr_movie_640.wmv" /> 
                            <param name="autostart" value="true" /> 
                            <param name="controller" value="true" />
                            <param name="showcontrols" value="true" />
                        </object>
<%
        } else {
%>
                        <video id="Video1" controls autoplay width="640" height="360">
                            <source src="/contents/pr_movie/kocca_pr_movie_640.mp4" type="video/mp4" />
                        </video>
<%
        }
%>

						<div class="blind">
							<dl>
								<dt>�ѱ���������ī����</dt>
								<dd>ȫ������</dd>
							</dl>
						</div>
						<!-- //blind -->
					</div>
					<!-- //aboutImg -->
				</div>

            </div>
            <!-- //#subCont -->

        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>