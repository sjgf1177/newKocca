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

    box.put("title_str", "���ô� �� - ��ī���̼Ұ�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<!-- container-new ���� //-->
<div id="container-new">

        <div id="mainMenu">
            <!-- ��ī���� �Ұ� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>��ī���̼Ұ�</li>
                <li>
                    ���ô� �� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision">��ī���� �Ұ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">�λ縻</a></li>
                        <!-- 2015-03-18 ����
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                        //-->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction" class="active">���ô� ��</a></li>
<!-- 2015-01-08 �������
                        <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
-->

                    </ul>
                </li>
            </ul>
            <!-- 2015-01-08 �������
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">������� �λ縻</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction"><strong><u>���ô� ��</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                    <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
                </ul>
            </div>
            //-->

        </div>


        <div id="contents">
            <h2 class="subTit">���ô� ��<!--<img src="/images/2013/introduce/map_title.gif" alt="���ô� ��" />//--></h2>
            <div id="subCont">
                <div class="mapLocation">
                    <div class="situation"><img src="/images/2013/introduce/img_map.gif" alt="" /></div>
                    <p class="address">158-715 ����� ���α� ���ߵ� ���з� 57 ȫ�ʹ� ��Ʈ���� �ǹ� 1�� (��ȭ 02-2161-0077(�¶��� ����), 02-2161-0072(�������� ����) / �ѽ� 02-2161-0078)</p>
                    <p class="tit"><img src="/images/2013/introduce/tit_guide_road.gif" width="132" height="17" alt="���߱��� �̿�ȳ�" /></p>

                    <dl class="subway">
                        <dt>����ö �̿� ��</dt>
                        <dd>
                        	<ul>
                                <li>
                                <!--<img src="/images/2013/introduce/img_1line.gif" alt="1ȣ����ũ" /> --> 1ȣ�� ����5���� ���� : 2�� �ⱸ ������� �̵�  ��ȭ��Ÿ� ������� �� 800m ���� (���� 7��)
                                </li>
                                <li>
                        		<!-- <img src="/images/2013/introduce/img_4line.gif" alt="4ȣ����ũ" /> --> 4ȣ�� ��ȭ�� ����: 3�� �ⱸ ������� �̵�  ��ȭ��Ÿ� ������� �� 800m ���� (���� 7��)�� Ⱦ�ܺ��� �̿�
                        		</li>
                        	</ul>
						</dd>
                    </dl>
                    <p class="tit"></p>
                    <dl class="bus">
                        <dt>���� �̿� ��</dt>
                        <dd>
                            <ul>
                                <li>
									��ȭ��Ÿ�(01572) ���� : ���� 05�� ��������(��ȭ�� 3���ⱸ  ȫ�ʹ� ���з� ķ�۽� ����)
                                </li>
                                <li>
									��ȭ��(01-223) ���� : 109, 273, 601, 2112, 7025 
                                </li>
                                <li>
									��Ŵ�(01-219) ���� : 104, 106, 107, 140, 143, 150, 160, 273, 710, 2112 
                                </li>
                                <li>
									����׷����(01-218) ���� : 102, 107, 108, 109, 162, 301, 7025 
                                </li>
                            </ul>
                        </dd>
                    </dl>
                </div>
                <!-- //mapLocation -->
            </div>
            <!-- //#subCont -->

        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>