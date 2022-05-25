<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    box.put("title_str", "�ü��Ұ� - ��ī���̼Ұ�");
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
                    �ü��Ұ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision">��ī���̼Ұ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">�λ縻</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility" class="active">�ü��Ұ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
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
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility"><strong><u>�ü��Ұ�</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                    <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
                </ul>
            </div>
-->
        </div>


        <!-- ������ ���� ���� -->
        <div id="contents">
            <h2 class="subTit">�ü��Ұ�<!--<img src="../images/2013/introduce/facility_title.gif" alt="�ü��Ұ�" />//--></h2>

            <div id="subCont">

                <!-- <h4 class="subTit_h4_gray">�����Կ� �� ���� �����ü�</h4>
                <div class="tableWrap2">
                    <table class="layoutTable space3">
                        <colgroup>
                            <col width="22%"/>
                            <col width="36%"/>
                            <col width="*"/>
                        </colgroup>
                        <tr>
                            <th scope="col">�ֿ�ü�</th>
                            <th scope="col">����, �Ը�</th>
                            <th scope="col">��ġ���</th>
                        </tr>
                        <tr>
                            <td>�Կ����� ��</td>
                            <td class="left">
                                �Կ���� �� �δ����
                            </td>
                            <td class="left">
                                <ul>
                                    <li>- ������ ī�޶� �� ���� ����</li>
                                    <li>��HDW Carmera (HDW-750 3��, HDW-F900 2��),</li>
                                    <li>- HDTV Digital Recorder & Player</li>
                                    <li>��HDTV Monitor, HDTV Waveform Monitor, CG (HD)</li>
                                    <li>��HDTV W / S, V / S Monitor, PGM Monitor,</li>
                                    <li>- SYC PLUSE GEN / Astro</li>
                                    <li>��HDV Camera (HVR-ZIN 19��, HVR-V1 5��),</li>
                                    <li>- DVCAMī�޶�</li>
                                    <li>��HDV Camera (JVC 100U 1��) Tripod,</li>
                                    <li>- ���Ĵٵ�, �е���Ż ��</li>
                                    <li>��CAMERA (CanonEOS7D,<br />
                                    &nbsp;&nbsp;&nbsp;CannonEOS5DMarkII 3D�Կ� ��Ʈ)</li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </div>-->
                <!-- //tableWrap2 -->

                <h4 class="subTit_h4_gray">��ī���̽ü�</h4>
                <div class="tableWrap2 noclose">
                    <table class="layoutTable space4">
                        <colgroup>
                            <col width="15%"/>
                            <col width="*"/>
                        </colgroup>
                        <tr class="line2">
                            <th scope="row" class="th_tit">8F</th>
                            <td class="left">
                                <ul class="listTy">
                                    <li>â������缺��</li>
                                </ul>
                                <ul class="listTy">
                                    <li>��ī���� ������</li>
                                </ul>
                                <ul class="listTy">
                                    <li>������ �������� ���ǽ�</li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="line2">
                            <th scope="row" class="th_tit">7F</th>
                            <td class="left">
                                <ul class="listTy">
                                    <li>���� �׷��� ���ǽ�</li>
                                    <li>���� ������Ʈ ���ǽ�</li>
                                </ul>
                                <ul class="listTy">
                                    <li>���� ������ ��ȹ</li>
                                    <li>���� ������Ʈ ���߽�</li>
                                </ul>
                                <ul class="listTy">
                                    <li>���� ���̳���</li>
                                    <li>��ȹâ�� ���ǽ�</li>
                                </ul>
                                <ul class="listTy">
                                    <li>���� ���α׷��� ���ǽ�</li>
                                    <li>��� ����</li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="line2">
                            <th scope="row" class="th_tit">5F</th>
                            <td class="left">
                                <ul class="listTy">
                                    <li>Digital Editing Room</li>
                                </ul>
                                <ul class="listTy">
                                    <li>S3D Graphic Room</li>
                                </ul>
                                <ul class="listTy">
                                    <li>��Ƽ�̵��ǽ�</li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="line2">
                            <th scope="row" class="th_tit">4F</th>
                            <td class="left">
                                <ul class="listTy">
                                    <li>Digital Editing Room I</li>
                                </ul>
                                <ul class="listTy">
                                    <li>Digital Editing Room II</li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="line2">
                            <th scope="row" class="th_tit">3F</th>
                            <td class="left">
                                <ul class="listTy">
                                    <li>ȸ����</li>
                                </ul>
                                <ul class="listTy">
                                    <li>ȸ����</li>
                                </ul>
                                <ul class="listTy">
                                    <li>����ȸ����</li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="line2">
                            <th scope="row" class="th_tit">2F</th>
                            <td class="left">
                                <ul class="listTy">
                                    <li>S3D Post-Production</li>
                                </ul>
                                <ul class="listTy">
                                    <li>S3D Pre-Production</li>
                                </ul>
                                <ul class="listTy">
                                    <li>S3D Production</li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="line2">
                            <th scope="row" class="th_tit">1F</th>
                            <td class="left">
                                <ul class="listTy">
                                    <li>S3D Training Center</li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- //tableWrap2 -->
            </div>
            <!-- //#subCont -->



        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>