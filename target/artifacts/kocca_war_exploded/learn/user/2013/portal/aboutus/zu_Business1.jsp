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
    String  p_subgubun     = box.getString("p_subgubun");

    box.put("title_str", "������� �ȳ� - ��ī���̼Ұ�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- container-new ���� //-->
<div id="container-new">

        <div id="mainMenu">
            <!-- ��ī���� �Ұ� -->
            <div>
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
            </div>

            <div class="introCategory">
                <ul>
                    <li style="width:445px;<%= p_subgubun.equals("1")? "font-weight:bold;" : "" %>"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_subgubun=1">������ â������ ������ ���� ���� ���</a></li>
                    <li style="width:445px;<%= p_subgubun.equals("2")? "font-weight:bold;" : "" %>"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_subgubun=2">������ ���� ��ī���� ��������</a></li>
                    <li style="width:445px;<%= p_subgubun.equals("3")? "font-weight:bold;" : "" %>"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_subgubun=3">�������� ������ ���� �������</a></li>
                    <li style="width:445px;<%= p_subgubun.equals("4")? "font-weight:bold;" : "" %>"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_subgubun=4">������ ���� �米������</a></li>
                    <li style="width:445px;<%= p_subgubun.equals("5")? "font-weight:bold;" : "" %>"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_subgubun=5">�ؿܼ�������������</a></li>
                    <li style="width:445px;<%= p_subgubun.equals("6")? "font-weight:bold;" : "" %>"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_subgubun=6">�¶��� ��������</a></li>
                    <li style="width:445px;<%= p_subgubun.equals("7")? "font-weight:bold;" : "" %>"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu&p_subgubun=7">������ â������ ���ݻ��</a></li>
                </ul>
            </div>

        </div>
        <!-- //#mainMenu -->

        <!-- ������ ���� ���� -->
        <div id="contents">


            <div id="subCont">
                <div class="privaterule">

                <%
                    if(p_subgubun.equals("1") || p_subgubun.equals("") ){
                %>

                <h2 class="subTit">�� ������ â������ ������ ���� �������</h2>


                 û�ҳ��� ������ â�� ���߿����� ���� �߱� �� ü���� ������ ���� û�ҳ� ��� ������ â�� �������� �����ϰ�, ������ â��ü�轺�� � ����, ������ Ư��ȭ�� ���п���<br/>������Ʈ�� ������� �����ϴ� ���<br/><br/>

                <p class="title">�� ������� </p><br/>
                <div class="txt">
                    �������� Ȱ���� ü�豳���� ���� û�ҳ��� ������ â�� ���߿��� ����߱� �� ü���� ����<br/><br/>
                </div>

                <p class="title">�� �������</p><br/>
                <div class="txt">
                    - û�ҳ� ��� ������ â�� ������ ���� : ������ �о߸� �߽����� �� û�ҳ� ��� ���� �Ը��� ������ �ǽ�<br/>
                    - ������ â��ü�轺�� � ���� : û�ҳ���� ������ �о߿� ���� �����ؼҿ� ����ü�� �� ��� �߱��� ���� ������ â��ü�轺�� ������������ � ����(3����)<br/>
                    - ������ Ư��ȭ�� ���п��� ������Ʈ�� ����� ���� : ������ â������ ���� ������ ���� ������ Ư��ȭ �� �������� ���α׷� � ����(4����)<br/><br/>
                </div>

                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    - ������ â�� ������ : 5�� ���� <br/>
                    - ������ â��ü�轺�� ������������ ���� : 6�� ���� ����<br/>
                    - ������ Ư��ȭ�� ����� ���� : 4�� ���� <br/><br/>
                </div>

                <p class="title">�� �����ڰ�</p><br/>
                <div class="txt">
                    - û�ҳ� ��� ������ â�� ������ : ���� ��&middot;����б� ���л� <br/>
                    - ������ â��ü�轺�� � ���� : û�ҳ�鿡�� ������ �о� �پ��� â�۱����� ���� ü���� ������ �� �ִ� ���α׷� ����<br/>
                    - ������ Ư��ȭ�� ���п��� ������Ʈ�� ����� ���� : ���� ������ ���� Ư��ȭ��<br/><br/>
                </div>

                    <p class="title">�� ��������</p> - �ѱ������������ â������缺�� (02-2161-0065, shcheon@kocca.kr)<br/>
                </div>

                <%
                } else if(p_subgubun.equals("2")){
                %>


                <!-- ������ ��ī���� ��������------>
                <h2 class="subTit">�� ������ ���� ��ī���� ��������</h2>
                <div class="txt">��ų�� �������� ������ �� �ִ� �����, �������� ���ձ����� ���� �ʼ��������, ���� ���丵, ����ǰ ������ ���� ������Ʈ�� ���������� ���� ������ â������缺�� ����
                </div>

                <p class="title">�� ��������</p><br/>
                <div class="txt">������ �帣��, ����� ���� ������ ���� ���ο� ������������ �߱��������� �� �ִ� â���� �缺 �� ��ŸƮ�� ����</div>

				<p class="title">�� ��������</p><br/>
                <div class="txt">�پ��� ������Ʈ�� ������ �� �ִ� �ʼ�������� + ���丵(������Ʈ ������ ��� �� ����Ͻ����� ��) + ������Ʈ(����ǰ ��������)</div>
                
                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    <table border="1" width="640px">
                        <tr>
                            <th>Ʈ��</th>
                            <th>����</th>
                            <th>�Ⱓ</th>
                            <th>��������</th>
                        </tr>
                        <tr>
                            <td rowspan="4">����</td>
                            <td>Pre ķ��<br/>(���� ���ε� �Ծ�)</td>
                            <td>2��</td>
                            <td>(����)����� ����, ���Ʈ����, �̷���, ������, UX, ����м� ��</td>
                        </tr>
                        <tr>
                            <td>1�ܰ�</td>
                            <td>3����<br/>(�帣 ���� ����)</td>
                            <td>(����) ������ �帣�� �������, ������Ȳ, �Һ���Ȳ �� ����<br/>
                            	(3�� ��Ʈ��) �ʼ� ��� ����<br/>
                                (��������Ʈ) ������ �帣�� �Ż�� �߱� ���� ����<br/>
                            </td>
                        </tr>
                        <tr>
                            <td>2�ܰ�<br/>(�帣 ���� ����)</td>
                            <td>3����</td>
                            <td>(����) �帣 ���� �����������, ����������, �ݶ� ���� �� ����<br/>
                                (5�� ������) �ʼ� ��� ����<br/>
                                (��������Ʈ) �帣 ������ �Ż�� �߱� ���� ����<br/>
                            </td>
                        </tr>
                        <tr>
                            <td>3�ܰ�<br/>(���ȭ ����)</td>
                            <td>2.5����</td>
                            <td>(��������Ʈ) �Ż�� ������ ������Ÿ�� ����<br/>
                                (������Ʈ��) ��� ���丵<br/>
                            </td>
                        </tr>
                        <tr>
                            <td>â��</td>
                            <td>������ġ��<br/>������Ÿ������</td>
                            <td>9����</td>
                            <td>(��������Ʈ) ������ġ�� ������Ÿ�� ����<br/>
                                (������Ʈ��) �繫 �� �濵 ������, ������ġ���, �����ȹ�� ��
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="txt">
                    - ������ �������(īī��, ���̹�, ��ŧ����VR, ���Ӱ��߻� ��)�� ���� ������Ʈ ����<br/>
                    - ���� ������Ʈ�� ������� ������ ����ý��� ����, ��� �������� ���� ����������� ������� ����
                </div>

                <p class="title">�� �����ڰ�</p><br/>
                <div class="txt">
                    �����, IOT, ����ȯ��, ��Ʈ��ũ, �κ�ƽ�� �� ���Ӱ� ������ �о��� ���� ������ â�ۿ� ������ ���� ����� ������ ���� û�� 70�� ����
                </div>

                <p class="title">�� ��������</p><br/>
                - â������缺�� �蹮�� ���� 02-2161-0067 / gale@kocca.kr
                - â������缺�� ������ ��� 02-2161-0072 / jkwind22@kocca.kr
                </div>

                <%
                } else if(p_subgubun.equals("5")){
                %>

                <h2 class="subTit">�� �ؿܼ������ �������</h2>

                <div class="txt">
                    ������ ������Ʈ �߽��� ������ ���� �ؿܼ��� ���л������ ī�ױ��д��б�(CMU) ������� ETC(�������θ�Ʈ���)/HCII(�ΰ�-��ǻ�� ���ͷ���) ������ ����
                </div>
                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    �������о� ������ ���������� ���� â�Ƿ°� �۷ι� ������� ���� �ٽ����� �缺</div>

                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    - CMU ��ϱ�(tuition) 50% ����(�б�� �� $10,000)<br/>
                      �� ���κδ� : ��ϱ� ����, ����ü��� ��<br/>
                    - �������л� ���� �� ��ü�л� ��� ���������̼� ���α׷� �ǽ�<br/>
                      &middot; [���������̼�] ���� ������ ���� ���� �ȳ�, ������ ���丵<br/>
                      &middot; [Ư��] ��������� ������ ���� �� ����<br/>
                      &middot; [����-��Ƽ �] ���⵵ ���л�-�ݳ⵵ ���л� ����</div>

                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    - CMU ETC<br/>
                      &middot; Masters of Entertainment Technology<br/>
                      &middot; ������ ����� ������ ��Ư�� Ŀ��ŧ������ �������θ�Ʈ��� �о� ��� ���� �缺 ����<br/>
                      &middot; 2�� ����(4�б�)<br/>
                    - CMU HCII<br/>
                      &middot; Masters in Human-Computer Interaction<br/>
                      &middot; �ΰ��� ��ǻ���� ��ȣ�ۿ뿡 ���� �̷а� ������ �����й� ���� ��� ���� �缺 ����<br/>
                      &middot; 1�� ����(3�б�)</div>

                <p class="title">�� �����ڰ�</p><br/>
                <div class="txt">
                    �ѱ� �����ڷμ� ������ ���� ���� ����������(����������) �Ǵ� �̿� ������ �з��� ����� �ڷ� �ش���� �̼� ������<br/>
                    �� ���� �� ������ �о� ���� ��� ��� �Ǵ� â��&middot;â�� �ǹ�ȭ ��õ ������</div>

                <p class="title">�� ��������</p><br/>
                - �ѱ������������ â������缺��(02-3219-6527, ejkim@kocca.kr)</div>
                </div>
                <%
                } else if(p_subgubun.equals("3")){
                %>

                <h2 class="subTit">�� �������� ������ ���� �������</h2>
                <div class="txt">
                    ������ �о��� �۷ι� ����ȯ���� �����ϰ� ������ â������ �缺�� ���� ����-�ι�-����� ������&middot;����&middot;�ؿ� ���� �������� ��� �����ϴ� ���<br/>
                </div>

                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    �������о� ������ ���������� ���� â�Ƿ°� �۷ι� ������� ���� �ٽ����� �缺<br/><br/>
                </div>

                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    �ܳ⵵ / �ٳ⵵(2��) �����Ͽ� ����/�������� ���� â���� Ŀ��ŧ�� ��ȹ / ������ ���� ����    ��� ������ ���п� 1��� ����<br/><br/>
                </div>

                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    4~5�� �� ���� ������ ������ �����򰡸� ���� �������� ���� Ȯ�� <br/><br/>
                </div>

                <p class="title">�� �����ڰ�</p><br/>
                <div class="txt">
                    ������ �о� ������ ���� ���α׷� ���� �� �����а� ��� ������ �������� ���� ���� ����(��) (���п� ����)<br/><br/>
                </div>

                <p class="title">�� ��������</p><br/>
                - �ѱ������������ â������缺��(02-2161-0066, ejkim@kocca.kr)</div>


                <%
                } else if(p_subgubun.equals("4")){
                %>

                <!---------------------->
                <h2 class="subTit">�� ������ ���� �米������</h2>
                <div class="txt">������ �о� ������ ��� ������ Ư��, �������߰���, �ؿܿ��� ���� ���� �������� ��ȭ�� ������ ����� �����ϴ� ��������
                </div>

                <p class="title">�� ��������</p><br/>
                <div class="txt">������ �о� �������� �������� ��ȭ �� ������ ���</div>

                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    <table border="1" width="640px">
                        <tr>
                            <th>������</th>
                            <th>��������</th>
                            <th>��������</th>
                            <th>��������</th>
                        </tr>
                        <tr>
                            <td rowspan="3">������<br/>â�Ǹ�����Ŭ����</td>
                            <td>������ �� 1ȸ<br/>(6��~11��)</td>
                            <td>������ Ư��</td>
                            <td>&middot; ������ �帣��ȭ&middot;������ ���߱������� �<br/>
                                - Ʈ����/ȯ�� ����, �űԱ��/�÷��� ��ʺм� �� 12�� ����</td>
                        </tr>
                        <tr>
                            <td>�� 2ȸ</td>
                            <td>ã�ư��� ���屳��</td>
                            <td>&middot; ã�ư��� �系����<br/>
                                - ������ �帣Ưȭ ��� �系���� ���� (2ȸ)
                            </td>
                        </tr>
                        <tr>
                            <td>�� 1ȸ</td>
                            <td>�ؿܿ���</td>
                            <td>&middot;  ������ �帣�� �������� �ؿܿ������� � (1ȸ)<br/>
                                - ���� ����湮, ����Ͻ�����ȸ �� ����
                            </td>
                        </tr>
                        <tr>
                            <td>������ �λ���Ʈ</td>
                            <td>�� 1ȸ �̻�<br/>(5��~12��)</td>
                            <td>���̳�</td>
                            <td>&middot; �������о� ����, ������� ���� ���� ���̳� (8ȸ)<br/>
                                - ������ ��ȹ, ������ ���� ���Ͽ� ����
                            </td>
                        </tr>
                    </table>
                </div>

                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    - ������ â�Ǹ�����Ŭ������������ �λ���Ʈ ������ ���� : �ſ� ��°�� ������ �¶��� ���� <br/>
                    - ã�ư��� ���屳�����ؿܿ��� : 6�� ��
                </div>

                <p class="title">�� �����ڰ�</p><br/>
                <div class="txt">
                    ������ �о� ������, �������� �� ���������� �����ڰ� ����(���� ����� �ڼ��� ���� �ȳ�����)
                </div>

                <p class="title">�� ��������</p><br/>
                - �ѱ������������ â������缺�� 02-2161-0072, imim@kocca.kr
                </div>

                <%
                } else if(p_subgubun.equals("5")){
                %>

                <h2 class="subTit">�� �ؿܼ������ �������</h2>

                <div class="txt">
                    ������ ������Ʈ �߽��� ������ ���� �ؿܼ��� ���л������ ī�ױ��д��б�(CMU) ������� ETC(�������θ�Ʈ���)/HCII(�ΰ�-��ǻ�� ���ͷ���) ������ ����
                </div>
                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    �������о� ������ ���������� ���� â�Ƿ°� �۷ι� ������� ���� �ٽ����� �缺</div>

                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    - CMU ��ϱ�(tuition) 50% ����(�б�� �� $10,000)<br/>
                      �� ���κδ� : ��ϱ� ����, ����ü��� ��<br/>
                    - �������л� ���� �� ��ü�л� ��� ���������̼� ���α׷� �ǽ�<br/>
                      &middot; [���������̼�] ���� ������ ���� ���� �ȳ�, ������ ���丵<br/>
                      &middot; [Ư��] ��������� ������ ���� �� ����<br/>
                      &middot; [����-��Ƽ �] ���⵵ ���л�-�ݳ⵵ ���л� ����</div>

                <p class="title">�� ��������</p><br/>
                <div class="txt">
                    - CMU ETC<br/>
                      &middot; Masters of Entertainment Technology<br/>
                      &middot; ������ ����� ������ ��Ư�� Ŀ��ŧ������ �������θ�Ʈ��� �о� ��� ���� �缺 ����<br/>
                      &middot; 2�� ����(4�б�)<br/>
                    - CMU HCII<br/>
                      &middot; Masters in Human-Computer Interaction<br/>
                      &middot; �ΰ��� ��ǻ���� ��ȣ�ۿ뿡 ���� �̷а� ������ �����й� ���� ��� ���� �缺 ����<br/>
                      &middot; 1�� ����(3�б�)</div>

                <p class="title">�� �����ڰ�</p><br/>
                <div class="txt">
                    �ѱ� �����ڷμ� ������ ���� ���� ����������(����������) �Ǵ� �̿� ������ �з��� ����� �ڷ� �ش���� �̼� ������<br/>
                    �� ���� �� ������ �о� ���� ��� ��� �Ǵ� â��&middot;â�� �ǹ�ȭ ��õ ������</div>

                <p class="title">�� ��������</p><br/>
                - �ѱ������������ â������缺��(02-3219-6527, ejkim@kocca.kr)</div>


                <!---�� �¶��α�������------------------->
                <%
                } else if(p_subgubun.equals("6")){
                %>
                <h2 class="subTit">�� �¶��� ��������</h2>
                <h4 class="subTit_h4_gray">���̹���������ī����  http://edu.kocca.or.kr</h4>
                <!--
                <div class="academiSec gray">
                    <ul>
                        <li> ��������� ���� �η� �� ����������, �ѱ���������ī���� ȸ�� ����� ���� ���¿� ���� ����</li>
                        <li> ���԰��� �о� 131�� ���� ����</li>
                        <li> �������� 199�� ���� ����</li>
                        <li> �оߺ� ���� Ʃ����  Ʃ�͸� ���� ����</li>
                        <li> ������ ���� ����</li>
                    </ul>
                </div>
                <h4 class="subTit_h4_gray">�����о� �� ü��</h4>
                <div class="academiSec gray gimg">
                    <ul>
                        <li>��ɰ� ����� ����� ���ߺз�ü�� ����</li>
                    </ul>
                </div>
                <h4 class="subTit_h4_gray">���� ��û/����</h4>
                <div class="academiSec gray">
                    <ul>
                        <li>��û��� : �¶��� ��û / http://edu.kocca.or.kr</li>
                        <li>��û���� : �ѱ���������ī���� ȸ��, ��û ȸ���� ���� ����</li>
                    </ul>
                </div>

                <h4 class="subTit_h4_gray">���������</h4>
                <div class="academiSec gray">
                    <ul>
                        <li>������� : �н��� ���� PC �Ǵ� ����Ͽ��� �¶��� �н�</li>
                        <li>����� : �ſ� 2ȸ ����(1��, 15��</li>
                        <li>����� : ��ۿ��� / ���� / ��ȭ������ ��ȹ, ����, ����Ͻ� �о� �� 131�� ���� � (�������� 199�� ���� �)</li>
                        <li>�н��Ⱓ : ���� ������ ���� �н� 1����, ���� ������ ���� ���� 3����</li>
                        <li>������� : ����</li>
                    </ul>
                </div>
                //-->
                <div style="padding: 15px 0 0 24px; margin-bottom: 25px;line-height: 18px;">
                    <ul>
                        <li> 1. ��������� �����η°� ���������� ����� ��������</li>
                        <li> 2. ����, ��ۿ���, ��ȭ �о� ���� ����</li>
                        <li> 3. �оߺ� ���� Ʃ���� Ʃ�͸� ���� ����</li>
                        <li> 4. <b>������ ����</b> ����. �ſ� 1��, 15�� 2ȸ ���� ����</li>
                        <li> 5. �н��Ⱓ : �н� 1����, ���� 3����</li>
                    </ul>
                </div>

                <h4 class="subTit_h4_gray">�оߺ� ���� ü��</h4>
                <div style="padding: 15px 0 0 24px; margin-bottom: 25px;line-height: 18px;">
                    <ul>
                        <li>������ ������� ������ ����� Learning Map</li>
                        <li><img src="/images/2013/introduce/intro_gaphic6.jpg"></li>
                    </ul>
                </div>

                <h4 class="subTit_h4_gray">���/��ü ���㱳��</h4>
                <div style="padding: 15px 0 0 24px; margin-bottom: 25px;line-height: 18px;">
                    <ul>
                        <li><img src="/images/2013/introduce/intro_gaphic7.jpg"></li>
                        <li style="float: right;margin-right: 140px;margin-bottom: 25px;">
                            <a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus"><img src="/images/2013/introduce/btn_contact.jpg"></a>
                        </li>
                    </ul>
                </div>



                <h4 class="subTit_h4_gray">��������</h4>
                <div class="academiSec gray">
                    <ul>
                        <li>�ѱ���������ī���� �¶��α�����<br/>
                        Tel : 02-2161-0077<br/>
                        e-Mail : academy@kocca.kr</li>
                    </ul>
                </div>
                </div>
                <!---�� �ؿܼ������ �������------------------->
                <%
                } else if(p_subgubun.equals("7")){
                %>

                <!---------------------->
                <h2 class="subTit">�� ������ â������ ���ݻ��</h2>

                <div class="txt">
                    ������ â���о߿� Ưȭ�� ��Ⱓ�� ���丵 ���ð����� ���� ��Ͽ� â�������� ����� ������ û�����ڸ� â���� ����
                </div>

                <p class="title">�� �������� </p><br/>
                <div class="txt">������ �оߺ� ������(����)�� ������ â�Ǽ��������� ���� û�� ������ â�۴ɷ� ���߰� ���ڸ� â�� 
                </div>

                <p class="title">�� �������� </p><br/>
                <div class="txt">
                - �̷� ���ɼ� �ִ� â���� �缺�� ���� �÷�������� ��Ʈ��ŷ�� �������о��� �ְ� �������� ���� ������Ʈ �߽��� ���� ������ ���丵 ����<br/>
				- â�Ǳ�����(��Ƽ)�� �÷��� ����� �ٷΰ���� ü���ϰ�, ����� �÷��� ����� �����ϴ� �پ��� ������Ʈ�� ����(�ſ� �� 116���� ����, 4�뺸�� ����)<br/>
                - �÷��� ����� ���並 ���� â�Ǳ������� ������Ʈ ���� �� â��, ���λ��, �������, �� �پ��� ��°�� ��Ī 
                </div>

                <p class="title">�� �������� </p><br/>
                <div class="txt">
                    ���� ������Ʈ ���� �� ��Ƽ ������Ʈ ����, �÷�������� â�Ǽ��ð��� ���� ���� â�ۿ��� �������α׷� � 
                </div>

                <p class="title">�� �����ڰ� </p><br/>
                <div class="txt">
                - �÷��� ��� : ������ â���о��� ������ ���丵/�Ʒ��� ������ ���� 3�� �̻��� ����<br/>
                - ���� : �ش�о� 10�� ������ ����� ���� ������(�÷��� ������� ����)<br/>
                - â�Ǳ�����(��Ƽ) : â���� ������ �Ҿ��� ���� ���������(�� 18����35���� â�ۺо� ���� ����ڸ� ����/������ ���� ����)<br/>
                </div>

                <p class="title">�� ��������</p><br/>
                - �ѱ������������ â������缺��(02-2161-0061, hskim@kocca.kr)
                </div>
                <%
                }
                %>



            </div>
            <!-- //#subCont -->

        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>