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

    box.put("title_str", "��������ó����ħ - �̿�ȳ�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<style type="text/css">
td .tdText1 { margin:0px; padding: 6px 10px 6px 10px; }
</style>
<!-- container-new ���� //-->
<div id="container-new">

        <div id="mainMenu">
            <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>�̿�ȳ� 
                    <!--
                    <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                    -->
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <!--
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                        
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome" class="active">�̿�ȳ�</a></li>
                    </ul>
                    -->
                </li>
                <li>
                    ��������ó����ħ <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <!--<li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap">����Ʈ��</a></li>-->
<%
    if ( !isUserLogin ) {
%>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
<%
    }
%>
                        <!--<li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">�� ���� ����</a></li>-->
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew" class="active">��������ó����ħ</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                    </ul>
                </li>
            </ul>
            <!-- ������ο� -->
            <div class="introCategory">
                <ul>
                    <!--<li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap">����Ʈ��</a></li>-->
<%
    if ( !isUserLogin ) {
%>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd">���̵�/�н����� ã��</a></li>
<%
    }
%>
                    <!--<li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">�� ���� ����</a></li>-->
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew"><strong><u>��������ó����ħ</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                </ul>
            </div>
        </div>
        <!-- //#mainMenu -->


        <!-- ������ ���� ���� -->
        <div id="contents">

            <h2 class="subTit">��������ó����ħ<!--<img src="/images/2013/support/privaterule_title.gif" alt="��������ó����ħ" />//--></h2>

            <div id="subCont">
                <div class="noticBox lt">
                    �ѱ���������ī����(���� "��ī����")�� �������� ��ȣ�� ��30���� ���� ������ü�� ���������� ��ȣ�ϰ� �̿� ������ ������ �ż��ϰ� ��Ȱ�ϰ� ó���� �� �ֵ��� �ϱ� ���Ͽ� ������ ���� �������� ó����ħ�� ����&middot;�����մϴ�.
                </div>

                <div class="privaterule">
                    <h3 class="subTit2">��1��(���������� ó������)</h3>
                    <div class="txt">
                        �� ��ī���̴� ������ ������ ���Ͽ� ���������� ó���մϴ�. ó���ϰ� �ִ� ���������� ������ ���� �̿��� �뵵�δ� �̿���� ������, �̿� ������ ����Ǵ� ��쿡�� �������� ��ȣ�� ��18���� ���� ������ ���Ǹ� �޴� �� �ʿ��� ��ġ�� ������ �����Դϴ�.
                    </div>

                    <div class="txt">
                        <p class="title">1. Ȩ������ ȸ�� ���� �� ����</p>
                        ȸ�� ���� �ǻ� Ȯ��, ȸ���� ���� ������ ���� ���� �ĺ�&middot;����, ȸ���ڰ� ����&middot;����, ���� ����&middot;����, ����ó�� ���� �������� ���������� ó���մϴ�.
                    </div>

                    <div class="txt">
                        <p class="title">2. Ʃ��, ���� ���� ����</p>
                        ��ī���� ��� ���� Ʃ�� ����, ���� ���� ���� �������� ���������� ó���մϴ�.
                    </div>

                    <div class="txt">
                        <p class="title">3. ���� �ο��繫 ó��</p>
                        �������� ����, �������� ����������, �������� ó������ �䱸, �������� ������ �Ű�, �������� ħ�� �Ű� ����&middotó�� �� �ο�ó���� �������� ���������� ó���մϴ�.
                    </div>

                    <div class="txt">
                        <p class="title">4. ������ �� ���� Ȱ��</p>
                        ��ī���̿��� �����ϴ� ���ϸ� ����, SMS �˸� ����, �̺�Ʈ, ������� �� ȫ���������� ���������� ó���մϴ�.
                    </div>

                    <div class="txt">
                        �� ��ī���̰� �������� ��ȣ�� ��32���� ���� ���&middot;�����ϴ� �������������� �����ٰ� �� ó�������� ������ �����ϴ�.
                    </div>

                    <table class="dataTable7" summary="�� ǥ�� �������� ��ȣ�� ��32���� ���� ��� �����ϴ� �������������� �����ٰ� �� ó������ ǥ�� ������������ ��Ī, �����ٰ�/ó������, �������� �׸�, �����Ⱓ ���� �����Ǿ� �ֽ��ϴ�.">
                        <caption>���������� ���� �� ����</caption>
                        <colgroup>
                            <col style="width:7%" />
                            <col style="width:18%" />
                            <col style="width:22%" />
                            <col style="width:30%" />
                            <col />
                        </colgroup>
                        <tr class="first">
                            <th scope="col" style="margin:0; padding:8px 0px 8px 0px; text-align:center;">����</th>
                            <th scope="col" style="margin:0; padding:8px 0px 8px 0px; text-align:center;">������������ ��Ī</th>
                            <th scope="col" style="margin:0; padding:8px 0px 8px 0px; text-align:center;">�����ٰ�/ó������</th>
                            <th scope="col" style="margin:0; padding:8px 0px 8px 0px; text-align:center;">���������׸�</th>
                            <th scope="col" style="margin:0; padding:8px 0px 8px 0px; text-align:center;">�����Ⱓ</th>
                        </tr>
                        <tr>
                            <td class="seq">1</td>
                            <td>ȸ�����</td>
                            <td>������ü�� ����/ Ȩ������ ȸ�� �Ż� ���� ����</td>
                            <td>
                                - ����ȸ�� : ����, �޴�����ȣ, �̸����ּ�, �������, ��ȭ��ȣ, ����, ����, ����о�, ���԰��<br/>
                                - ���ȸ�� : ����� �̸���, ����� �޴���ȭ, ��� �� ���� �̿� ȸ�� ����(�޴���ȭ��ȣ, �̸����ּ�, ���νĺ�����(CI))
                            </td>
                            <td>
                                Ż�� �� �Ǵ� ���� �����Ϸκ��� 3��<br/>
                                ��� ȸ���� ��� ����� ������ ���� ��û �ñ���
                            </td>
                        </tr>
                        <tr>
                            <td class="seq">2</td>
                            <td>�������� ������û ����</td>
                            <td>������ü�� ����/ ��û�� �� �� ����</td>
                            <td>
                                ���, ���� �� ���� ����, ���� ����, �ڰ��� ����, �з�, �ڱ�Ұ�, ��������
                            </td>
                            <td>
                                Ż�� �� �Ǵ� 3��
                            </td>
                        </tr>
                        <tr>
                            <td class="seq">3</td>
                            <td>�����̷�����</td>
                            <td>������ü�� ����/ ���� ���� � �� ��� ó��</td>
                            <td>
                                ������û ����, ������Ȳ ����, ���� ����, �������, ����
                            </td>
                            <td>
                                ���� �����Ϸκ��� 5��
                            </td>
                        </tr>
                        <tr>
                            <td class="seq">4</td>
                            <td>Ʃ������</td>
                            <td>������ü�� ����/ Ʃ�͸� ���� ����</td>
                            <td>
                                ����, �޴�����ȣ, �̸����ּ�, �Ҽ�, �̷�
                            </td>
                            <td>
                                ��� ���� ��
                            </td>
                        </tr>
                        <tr>
                            <td class="seq">5</td>
                            <td>��������</td>
                            <td>������ü�� ���� / ���� ���� ���� �� ����</td>
                            <td>
                                ����, �޴�����ȣ, �̸����ּ�, �Ҽ�
                            </td>
                            <td>
                                ���� ���� ���� ���� �ñ���
                            </td>
                        </tr>

                    </table>
                    <p class="tblbtm">�� ��Ÿ ��ī������ �������� ���� ��ϻ��� ������ ���������� ����������ȣ �������� ����(www.privacy.go.kr) -> ���� -> ���������ο� -> �������������� �䱸 -> ������������ ��ϰ˻� �޴��� Ȱ���� �ֽñ� �ٶ��ϴ�. </p>


                    <h3 class="subTit2">��2��(���������� ó�� �� �����Ⱓ)</h3>
                    <div class="txt">
                        �� ��ī���̴� ���ɿ� ���� �������� ����&middot;�̿�Ⱓ �Ǵ� ������ü�κ��� ���������� ���� �ÿ� ���� ���� �������� ����&middot;�̿�Ⱓ ������ ���������� ó��&middot;�����մϴ�. ������ �������� ó�� �� ���� �Ⱓ�� ������ �����ϴ�.
                    </div><br/>

                    <div class="txt">
                        <p class="title">1. Ȩ������ ȸ�� ���� �� ����</p>
                        - ����ȸ�� : ȸ�� Ż�� �� �Ǵ� ���� �������� 3���� ����� ����<br/>
                        - ���ȸ�� : ����� ������ ���� ��û �ñ���, ��� �� ���� �̿� ȸ���� ��� ȸ�� Ż�� �� �Ǵ� ������������ 3���� ����� ����<br/>
                        �ٸ�, ������ ������ �ش��ϴ� ��쿡�� �ش� ���� ���� �ñ���<br/>
                        1) ���� ���� ���ݿ� ���� ����&middot;���� ���� �������� ��쿡�� �ش� ����&middot;���� ���� �ñ���<br/>
                        2) Ȩ������ �̿뿡 ���� ä��&middot;ä������ ���� �ÿ��� �ش� ä��&middot;ä������ ���� �ñ���<br/>
                        2. Ʃ��, ���� ���� : �ֹε�Ϲ�ȣ, ���¹�ȣ, �ּҴ� ��� ���� �ñ���, ����, �޴�����ȣ, �̸��� �ּ�, �Ҽ� ������ ���� ��û �ñ���<br/>

                    </div>


                    <h3 class="subTit2">��3��(���������� ��3�� ����)</h3>
                    <div class="txt">
                        ��ī���̴� ������ü�� ���� ���̴� �����������ϰ� �ִ� ���������� ��3�ڿ��� �������� �ʽ��ϴ�. �ٸ�, ������������ȣ���� ��17�� ��1�� �� ��18�� ��2�׿� �ش��ϴ� ��쿡�� ������ü�� ���� ���� ���������� ��3�ڿ��� ������ �� �ֽ��ϴ�.
                    </div>

                    <h3 class="subTit2">��4��(��������ó���� ��Ź)</h3>
                    <div class="txt">
                        �� ��ī���̴� �������� ȸ���� �������񽺸� �����ϱ� ���Ͽ� ������ ���� �������� ó�������� ��Ź�ϰ� �ֽ��ϴ�.
                    </div>

                    <table class="dataTable7" summary="�� ǥ�� �������� ó������ ��Ź��ü ���� ǥ�� ��Ź��ü, ��Ź��������, ���������׸�, ���� �� �̿�Ⱓ���� �����Ǿ� �ֽ��ϴ�.">
                        <caption>���������� ���� �� ����</caption>
                        <colgroup>
                            <col style="width:25%" />
                            <col style="width:22%" />
                            <col style="width:28%" />
                            <col style="width:25%" />
                        </colgroup>
                        <tr class="first">
                            <th scope="col" style="margin:0; padding:8px 0px 8px 0px; text-align:center;">��Ź��ü</th>
                            <th scope="col" style="margin:0; padding:8px 0px 8px 0px; text-align:center;">��Ź��������</th>
                            <th scope="col" style="margin:0; padding:8px 0px 8px 0px; text-align:center;">���������׸�</th>
                            <th scope="col" style="margin:0; padding:8px 0px 8px 0px; text-align:center;">���� �� �̿�Ⱓ</th>
                        </tr>
                        <tr>
                            <td>(��)�޳�</td>
                            <td>Ȩ������ �� ȸ�� ����</td>
                            <td>ȸ�����, �����̷�</td>
                            <td>��Ź��� ���� �ñ���</td>
                        </tr>
                        <tr>
                            <td>(��)�޳�</td>
                            <td>Ʃ�� ����</td>
                            <td>����, �ֹε�Ϲ�ȣ, �ּ�, �Ҽ�, �޴�����ȣ, �̸����ּ�, �̷»���, ���¹�ȣ</td>
                            <td>��Ź��� ���� �ñ���</td>
                        </tr>
                        <tr>
                            <td>(��)�޳�</td>
                            <td>���� ����</td>
                            <td>����, �ֹε�Ϲ�ȣ, �ּ�, �Ҽ�, �޴�����ȣ, �̸����ּ�, �̷»���, ���¹�ȣ</td>
                            <td>��Ź��� ���� �ñ���</td>
                        </tr>
                        <!--<tr>
                            <td>(��)�����������</td>
                            <td>��������ó�� �� �ϵ�������</td>
                            <td>ȸ�����, �����̷�</td>
                            <td>��Ź��� ���� �ñ���</td>
                        </tr>
                    --></table>
                    <br/>

                    <div class="txt">
                        �� ��ī���̴� ��Ź��� ü�� �� �������� ��ȣ�� ��25���� ���� ��Ź���� ������� �� �������� ó������, �����&middot;������ ��ȣ��ġ, ����Ź ����, ��Ź�ڿ� ���� ����&middot;����, ���ع�� �� å�ӿ� ���� ������ ��༭ �� ������ ����ϰ�, ��Ź�ڰ� ���������� �����ϰ� ó���ϴ����� �����ϰ� �ֽ��ϴ�.
                    </div>
                    <div class="txt">
                        �� ��Ź������ �����̳� ��Ź�ڰ� ����� ��쿡�� ��ü���� �� �������� ó����ħ�� ���Ͽ� �����ϵ��� �ϰڽ��ϴ�.
                    </div>


                    <h3 class="subTit2">��5��(������ü�� �Ǹ�&middot;�ǹ� �� �����)</h3>
                    <div class="txt">
                        �� ������ü�� ��ī���̿� ���� �������� ���� �� ȣ�� �������� ��ȣ ���� �Ǹ��� ����� �� �ֽ��ϴ�.
                    </div>

                    <p class="title">1. �������� �����䱸</p>
                    <p class="title">2. ���� ���� ���� ��� ���� �䱸</p>
                    <p class="title">3. �����䱸</p>
                    <p class="title">4. ó������ �䱸</p>

                    <div class="txt">
                        �� ��1�׿� ���� �Ǹ� ���� ��ī���̿� ���� ����, ��ȭ, ���ڿ���, �������(FAX) ���� ���Ͽ� �Ͻ� �� ������ ��ī���̴� �̿� ���� ��ü���� ��ġ�ϰڽ��ϴ�.
                    </div>
                    <div class="txt">
                        �� ������ü�� ���������� ���� � ���� ���� �Ǵ� ������ �䱸�� ��쿡�� ��ī���̴� ���� �Ǵ� ������ �Ϸ��� ������ ���� ���������� �̿��ϰų� �������� �ʽ��ϴ�.
                    </div>
                    <div class="txt">
                        �� ��1�׿� ���� �Ǹ� ���� ������ü�� �����븮���̳� ������ ���� �� �� �븮���� ���Ͽ� �Ͻ� �� �ֽ��ϴ�. �� ��� �������� ��ȣ�� �����Ģ ���� ��11ȣ ���Ŀ� ���� �������� �����ϼž� �մϴ�.
                    </div>
                    <div class="txt">
                        �� ������ü�� �������� ��ȣ�� �� ��������� �����Ͽ� ��ī���̰� ó���ϰ� �ִ� ������ü �����̳� Ÿ���� �������� �� ���Ȱ�� ħ���Ͽ����� �ƴ� �˴ϴ�.
                    </div>


                    <h3 class="subTit2">��6��(ó���ϴ� �������� �׸�)</h3>
                    <div class="txt">
                        ��ī���̴� ������ �������� �׸��� ó���ϰ� �ֽ��ϴ�.
                    </div>
                    <div class="txt">
                        �� Ȩ������ ȸ�� ���� �� ����
                    </div>
                    <div class="txt">
                        <p class="title">1. �Ϲ� ȸ��</p>
                        - �ʼ��׸� : ����, ����, ����ó, �޴�����ȣ, ����, �̸���, ����, ����о�, ���԰��, �������<br/>
                        - �����׸� : �����ڰ��� ��������, ���� ���ſ���
                    </div>
                    <div class="txt">
                        <p class="title">2. 14�� �̸� ȸ��</p>
                        - �ʼ��׸� : ����, ����, ����ó, �޴�����ȣ, ����, �̸���, ����, ����о�, ���԰��, �������, ��ȣ�ڼ���, ��ȣ�� �̸���<br/>
                        - �����׸� : �����ڰ��� ��������, ���� ���ſ���
                    </div>
                    <div class="txt">
                        <p class="title">3. ��� ȸ��</p>
                        - �ʼ��׸� : ����� �̸���, ����� �޴���ȭ, ��� �� ���� �̿� ȸ�� ����(�޴���ȭ��ȣ, �̸����ּ�, ���νĺ�����(CI))
                    </div>

                    <div class="txt">
                        �� �������� ���� ��û
                    </div>
                    <div class="txt">
                        <p class="title">1. �������� ���� ��û</p>
                        - �ʼ��׸� : ���, ���� �� ���� ����, ���� ����, �ڰ��� ����, �з�, �ڱ�Ұ�, ��������
                    </div>

                    <div class="txt">
                        �� �����̷� ����
                    </div>
                    <div class="txt">
                        <p class="title">1. ������û ����</p>
                        - �ʼ��׸� : ���κ� ������û ����
                    </div>
                    <div class="txt">
                        <p class="title">2. ���� ����</p>
                        - �ʼ��׸� : ���κ� ���� ����
                    </div>

                    <div class="txt">
                        �� Ʃ��, ���� ���� ���� �� ����
                    </div>
                    <div class="txt">
                        <p class="title">1. Ʃ��</p>
                        - �ʼ��׸� : ����, �޴�����ȣ, �̸����ּ�, �Ҽ�, �̷»���
                    </div>
                    <div class="txt">
                        <p class="title">2. ����</p>
                        - �ʼ��׸� : ����, �޴�����ȣ, �̸����ּ�, �Ҽ�, �̷»���
                    </div>

                    <div class="txt">
                        �� ��� �� �¶��� ��û ����
                    </div>
                    <div class="txt">
                        <p class="title">1. Ȩ������ �����ǰ�</p>
                        - �ʼ��׸� : �̸����ּ�
                    </div>

                    <div class="txt">
                        �� ���ͳ� ���� �̿�������� �Ʒ� �������� �׸��� �ڵ����� �����Ǿ� ������ �� �ֽ��ϴ�.
                    </div>
                    <p class="title">1. IP�ּ�, ���� ��� ��</p>
                    <br/>


                    <h3 class="subTit2">��7��(���������� �ı�)</h3>
                    <div class="txt">
                        �� ��ī���̴� �������� �����Ⱓ�� ���, ó������ �޼� �� ���������� ���ʿ��ϰ� �Ǿ��� ������ ��ü���� �ش� ���������� �ı��մϴ�.
                    </div>
                    <div class="txt">
                        �� ������ü�κ��� ���ǹ��� �������� �����Ⱓ�� ����ϰų� ó�������� �޼��Ǿ������� �ұ��ϰ� �ٸ� ���ɿ� ���� ���������� ��� �����Ͽ��� �ϴ� ��쿡��, �ش� ��������(�Ǵ� ������������)�� ������ �����ͺ��̽�(DB)�� �ű�ų� ������Ҹ� �޸��Ͽ� �����մϴ�.
                    </div>
                    <div class="txt">
                        �� �������� �ı��� ���� �� ����� ������ �����ϴ�.
                    </div>
                    <div class="txt">
                        <p class="title">1. �ı�����</p>
                        ������ü�� �Է��� ������ ���� �޼� �� ������ DB�� �Ű���(������ ��� ������ ����) ���� ��ħ �� ��Ÿ ���� ���ɿ� ���� �����Ⱓ ����� �� Ȥ�� ��� �ı�˴ϴ�. �� ��, DB�� �Ű��� ���������� ������ ���� ��찡 �ƴϰ��� �ٸ� �������� �̿���� �ʽ��ϴ�.
                    </div>
                    <div class="txt">
                        <p class="title">2. �ı����</p>
                        ������ü�� ���������� ���������� �����Ⱓ�� ����� ��쿡�� �����Ⱓ�� �����Ϸκ��� 15�� �̳���, ���������� ó�� ���� �޼�, �ش� ������ ����, ����� ���� �� �� ���������� ���ʿ��ϰ� �Ǿ��� ������ ���������� ó���� ���ʿ��� ������ �����Ǵ� ���κ��� 30�� �̳��� �� ���������� �ı��մϴ�.
                    </div>
                    <div class="txt">
                        <p class="title">3. �ı���</p>
                        ���������� ��ϵ� ��¹��� �м��ϰų� �Ұ��մϴ�. ������ ���� ���·� ����� ���������� ����� ����� �� ���� ����� ����� ����մϴ�.
                    </div>


                    <h3 class="subTit2">��8��(���������� ������ Ȯ����ġ)</h3>
                    <div class="txt">
                        �� ��ī���̴� ���������� ������ Ȯ���� ���� ������ ���� ��ġ�� ���ϰ� �ֽ��ϴ�.
                    </div>
                    <div class="txt">
                        <p class="title">1. �������� ��� ������ �ּ�ȭ</p>
                        ���������� ����ϴ� ������ �����ϰ� ����ڿ� �������� �ּ�ȭ �Ͽ� ���������� �����ϴ� ��å�� �����ϰ� �ֽ��ϴ�.
                    </div>
                    <div class="txt">
                        <p class="title">2. �������� ��ü ���� �ǽ�</p>
                        �������� ��� ���� ������ Ȯ���� ���� ������(�� 2ȸ)���� ��ü ���縦 �ǽ��ϰ� �ֽ��ϴ�.
                    </div>

                    <div class="txt">
                        <p class="title">3. ���ΰ�����ȹ�� ���� �� ����</p>
                        ���������� ������ ó���� ���Ͽ� ���ΰ�����ȹ�� �����ϰ� �����ϰ� �ֽ��ϴ�.
                    </div>

                    <div class="txt">
                        <p class="title">4. ���������� ��ȣȭ</p>
                        ������ü�� ���������� ��й�ȣ�� ��ȣȭ �Ǿ� ���� �� �����ǰ� �־�, ���θ��� �� �� ������ �߿��� �����ʹ� ���� �� ���� �����͸� ��ȣȭ �ϰų� ���� ��� ����� ����ϴ� ���� ���� ���ȱ���� ����ϰ� �ֽ��ϴ�.
                    </div>
                    <div class="txt">
                        <p class="title">5. ��ŷ � ����� ����� ��å</p>
                        ��ī���̴� ��ŷ�̳� ��ǻ�� ���̷��� � ���� �������� ���� �� �Ѽ��� ���� ���Ͽ� �������α׷��� ��ġ�ϰ� �ֱ����� ����&middot;������ �ϸ� �ܺηκ��� ������ ������ ������ �ý����� ��ġ�ϰ� �����/���������� ���� �� �����ϰ� �ֽ��ϴ�.
                    </div>
                    <div class="txt">
                        <p class="title">6. ���������� ���� ���� ����</p>
                        ���������� ó���ϴ� �����ͺ��̽��ý��ۿ� ���� ���ٱ����� �ο�, ����, ���Ҹ� ���Ͽ� ���������� ���� ���������� ���Ͽ� �ʿ��� ��ġ�� �ϰ� ������ ħ�����ܽý����� �̿��Ͽ� �ܺηκ����� ���� ������ �����ϰ� �ֽ��ϴ�.
                    </div>
                    <div class="txt">
                        <p class="title">7. ���������� ���� �����ġ ���</p>
                        ���������� ���Ե� ����, ���������ü ���� �����ġ�� �ִ� ������ ��ҿ� �����ϰ� �ֽ��ϴ�.
                    </div>
                    <div class="txt">
                        <p class="title">8. ���ΰ��ڿ� ���� ���� ����</p>
                        ���������� �����ϰ� �ִ� ������ ���� ��Ҹ� ������ �ΰ� �̿� ���� �������� ������ ����, ��ϰ� �ֽ��ϴ�.
                    </div>


                    <h3 class="subTit2">��9��(�������� ��ȣå����)</h3>
                    <div class="txt">
                        ��ī���̴� �������� ó���� ���� ������ �Ѱ��ؼ� å������, �������� ó���� ������ ������ü�� �Ҹ�ó�� �� ���ر��� ���� ���Ͽ� �Ʒ��� ���� �������� ��ȣå���ڸ� �����ϰ� �ֽ��ϴ�.
                    </div>
                    <div class="txt">
                        <p class="title">�� �������� ��ȣå����</p>
                            ���� : ���Ѱ� <br />
                            ��å : �������� �ο��� <br />
                            ����ó : ��ȭ��ȣ 02-3153-1253, �ѽ� 02-3153-1108, �̸����ּ� privacy@kocca.kr<br />
                            �� �������� ��ȣ ���μ��� ����˴ϴ�.
                    </div>
                    <div class="txt">
                        <p class="title">�� �������� ��ȣ ���μ� å����</p>
                            �μ��� : â������缺�� <br />
                            ����� : ��ȣ�� <br />
                            ����ó : ��ȭ��ȣ 02-2161-0063, �ѽ� : 02-2161-0078, lakelim@kocca.kr
                    </div>

                    <h3 class="subTit2">��10��(�������� ����û��)</h3>
                    <div class="txt">
                        �� ������ü�� �������� ��ȣ�� ��35���� ���� ���������� ���� û���� �������� ��ȣ ���μ��� �� �� �ֽ��ϴ�. ��ī���̴� ������ü�� �������� ����û���� �ż��ϰ� ó���ǵ��� ����ϰڽ��ϴ�.
                    </div>
                    <div class="txt">
                        �� ������ü������ ��1���� ����û�� ����&middot;ó���μ� �̿ܿ�, ������������ '����������ȣ �������� ����' ������Ʈ(www.privacy.go.kr)�� ���Ͽ����� �������� ����û���� �Ͻ� �� �ֽ��ϴ�.
                    </div>
                    <div class="txt">
                        �� ���������� ����������ȣ �������� ���� �� �������� �ο� �� �������� ���� �� �䱸 (������������ ���� �Ǹ����� �ʿ�)
                    </div>


                    <h3 class="subTit2">��11��(����ħ�� �������)</h3>
                    <div class="txt">
                        ������ü�� �Ʒ��� ����� ���� �������� ħ�ؿ� ���� ���ر���, ��� ���� �����Ͻ� �� �ֽ��ϴ�.<br/>
                        &lt;�Ʒ��� ����� ��ī���̿ʹ� ������ ������μ�, ��ī������ ��ü���� �������� �Ҹ�ó��, ���ر��� ����� �������� ���Ͻðų� ���� �ڼ��� ������ �ʿ��Ͻø� �����Ͽ� �ֽñ� �ٶ��ϴ�&gt;
                    </div>
                    <div class="txt">
                        <p class="title">�� �������� ħ�ؽŰ��� (�ѱ����ͳݾ�ī���� �)</p>
                            - �Ұ����� : �������� ħ�ػ�� �Ű�, ��� ��û<br/>
                            - Ȩ������ : privacy.kisa.or.kr <br/>
                            - ��ȭ : (��������) 118 <br/>
                            - �ּ� : (138-950) ����� ���ı� �ߴ�� 135 �ѱ����ͳݾ�ī���� ��������ħ�ؽŰ���
                    </div>
                    <div class="txt">
                        <p class="title">�� �������� ������������ȸ (�ѱ����ͳݾ�ī���� �)</p>
                        - �Ұ����� : �������� ����������û, ���ܺ������� (�λ��� �ذ�)<br/>
                        - Ȩ������ : privacy.kisa.or.kr<br/>
                        - ��ȭ : (��������) 118<br/>
                        - �ּ� : (138-950) ����� ���ı� �ߴ�� 135 �ѱ����ͳݾ�ī���� ��������ħ�ؽŰ���
                    </div>
                    <div class="txt">
                        <p class="title">�� �����û ���̹����˼���� : 02-3480-3573 (<a href="http://www.spo.go.kr" target="_blank">www.spo.go.kr</a>)</p>
                    </div>
                    <div class="txt">
                        <p class="title">�� ����û ���̹��׷��������� :1566-0112 (<a href="http://www.netan.go.kr" target="_blank">www.netan.go.kr</a>)</p>
                    </div>

                    <h3 class="subTit2">��12��(�������� ó����ħ ����)</h3>
                    <div class="txt">
                        �� �� �������� ó����ħ�� 2014. 5. 21 �����մϴ�.
                    </div>
                    <div class="txt">
                        �� �� �������� ó����ħ�� 2014. 5. 28 ���� ����˴ϴ�.
                    </div>
                    <div class="txt">
                        �� ������ �������� ó����ħ�� �Ʒ����� Ȯ���Ͻ� �� �ֽ��ϴ�.
                    </div>
                    <div class="txt">
                        - 2014�� 5�� 20�� ���� ���� <a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=Personal" target="_self">[����]</a>
                    </div>

                </div>
            </div>
            <!-- //#subCont -->





        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>