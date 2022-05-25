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

    //box.put("title_str", "�����������米�� - ������� �ȳ� - ��ī���̼Ұ�");
    box.put("title_str", "�����������米�� - ���屳��");
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
                        ������� �ȳ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                        <ul style="z-index: 1;">
                            <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision">��ī���̼Ұ�</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">�λ縻</a></li>
                            <!-- 2015-03-18 ����
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                            //-->
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu" class="active">������� �ȳ�</a></li>
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
<!--2015-01-08 �������
				<div class="introCategory">
					<ul>
						<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">������� �λ縻</a></li>
						<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
						<li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu"><strong><u>������� �ȳ�</u></strong></a></li>
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
            <h2 class="subTit">������� �ȳ�<!--<img src="../images/2013/introduce/edubusiness_title.gif" alt="�������" />//--></h2>

            <div id="subCont">
                <ul class="tabCus">
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=1"><img src="/images/2013/introduce/tabbs1_off.jpg" alt="������ ���� �缺����" /></a></li>
                    <li><a href="#"><img src="/images/2013/introduce/tabbs2_on.jpg" alt="������ ���� �米��" /></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=3"><img src="/images/2013/introduce/tabbs3_off.jpg" alt="�¶��� ����" /></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_gubun=4"><img src="/images/2013/introduce/tabbs4_off.jpg" alt="â������ �缺���" /></a></li>
                </ul>
                <h3 class="blind">������ ���� �米��</h3>

                <h4 class="subTit_h4_gray">��������</h4>
                <div class="tableWrap2">
                    <table class="layoutTable2 space3">
                        <colgroup>
                            <col width="17%"/>
                            <col width="*"/>
                            <col width="21%"/>
                            <col width="9%"/>
                        </colgroup>
                        <tr>
                            <th scope="col" class="thtit">�о�</th>
                            <th scope="col">������</th>
                            <th scope="col">����</th>
                            <th scope="col">�ο�(��)</th>
                        </tr>
                        <tr class="line2">
                            <td rowspan="9" class="tdtit"><strong>��ȭ������<br />�����η¾缺</strong></td>
                            <td>KOCCA â�� ������Ŭ���� [������ ��ȹ]</td>
                            <td>6/25, 7/2, 7/9, 7/13, 7/16</td>
                            <td class="center">25</td>
                        </tr>
                        <tr class="line2">
                            <td>KOCCA â�� ������Ŭ���� [������ ������]</td>
                            <td>6/27, 7/4, 7/11, 7/18, 7/20</td>
                            <td class="center">25</td>
                        </tr>
                        <tr class="line2">
                            <td>KOCCA â�� ������Ŭ���� [������ ����A]</td>
                            <td>8/8, 8/16, 8/22, 8/24</td>
                            <td class="center">25</td>
                        </tr>
                        <tr class="line2">
                            <td>KOCCA â�� ������Ŭ���� [������ ����B]</td>
                            <td>8/13, 8/20, 8/27, 8/31</td>
                            <td class="center">25</td>
                        </tr>
                        <tr class="line2">
                            <td>KOCCA â�� ������Ŭ���� [������ �����Ͻ�] (�ؿ� ������ ��û ����)</td>
                            <td>9/7</td>
                            <td class="center">100</td>
                        </tr>
                        <tr class="line2">
                            <td>�������� ������ �ؿܿ��� [������] (�Ϻ�)</td>
                            <td>5/20, 5/25</td>
                            <td class="center">21</td>
                        </tr>
                        <tr class="line2">
                            <td>�������� ������ �ؿܿ��� [���] (������)</td>
                            <td>9��(����)</td>
                            <td class="center">20</td>
                        </tr>
                        <tr class="line2">
                            <td>�������� ������ �ؿܿ��� [K-POP] (�̱�)</td>
                            <td>11��(����)</td>
                            <td class="center">15</td>
                        </tr>
                        <tr>
                            <td>�հ�</td>
                            <td></td>
                            <td class="center">256</td>
                        </tr>
                        <tr class="line2">
                            <td rowspan="2" class="tdtit"><strong>��ȹ���ε༭<br />����</strong></td>
                            <td>��ȹ���ε༭ �缺����</td>
                            <td>2013. 4 ~ 2013. 12 (9����)</td>
                            <td class="center">20</td>
                        </tr>
                        <tr>
                            <td>��ȹ���ε༭ ������Ʈ ����</td>
                            <td>2013. 5 ~ 2013. 10 (6����)</td>
                            <td class="center">10</td>
                        </tr>
                    </table>
                </div>
                <!-- //tableWrap2 -->

                <h4 class="subTit_h4_gray">������û/����</h4>
                <div class="tableWrap2">
                    <table class="layoutTable2 space3">
                        <colgroup>
                            <col width="22%"/>
                            <col width="*"/>
                        </colgroup>
                        <tr>
                            <th scope="col" class="thtit">����</th>
                            <th scope="col">����</th>
                        </tr>
                        <tr>
                            <td class="tdtit">��û ���</td>
                            <td>
                                <ul>
                                    <li>�¶��� ��û / http://edu.kocca.or.kr</li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdtit">���� ����</td>
                            <td>
                                <ul>
                                    <li>�� ������ �����ڰ� ���ռ� ����(��������), �Ҽӱ���� �ο� �ȹ� ��</li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- //tableWrap2 -->

                <h4 class="subTit_h4_gray">��������</h4>
                <div class="tableWrap2 noclose">
                    <table class="layoutTable2 space3">
                        <colgroup>
                            <col width="*"/>
                        </colgroup>
                        <tr>
                            <td class="line">
                                �ѱ������������ â������缺�� T : 02-2161-0072
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