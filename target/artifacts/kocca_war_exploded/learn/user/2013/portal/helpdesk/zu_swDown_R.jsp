<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    box.put("title_str", "����Ʈ���� �ٿ�ε� - �н����� - ������");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- container-new ���� //-->
<div id="container-new">

        <div id="mainMenu">
        <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>������</li>
                <li>�н����� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome" class="active">�н�����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">�����ϴ� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
<!--
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp" >�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelpSWDown">����Ʈ����ٿ�ε�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� �� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
-->
                    </ul>
                </li>
            </ul>
            <!-- //�н����� -->
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome">�н� ���̵�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelpSWDown"><strong><u>����Ʈ���� �ٿ�ε�</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� �� ����</a></li>
<!--
                    <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                    <li><a href="#">��������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
-->                </ul>
            </div>
            <!-- //������ο� -->
        </div>
        <!-- //#mainMenu -->

        <!-- ������ ���� ���� -->
        <div id="contents">

        <h2 class="subTit">����Ʈ���� �ٿ�ε�<!--<img src="/images/2013/support/swdown_title.gif" alt="����Ʈ����ٿ�ε�" />//--></h2>

            <div id="subCont">
<!-- �ǻ���
                <ul class="tabCus">
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp"><img src="/images/2013/support/tabenvi1_off.jpg" alt="�н�ȯ�� �׽�Ʈ" /></a></li>
                    <li><a href="#"><img src="/images/2013/support/tabenvi2_on.jpg" alt="��ƮƮ���� �ٿ�ε�" /></a></li>
                </ul>
-->
                <div class="imgList2 first">
                    <dl>
                        <dt><img src="/images/2013/support/sf_img1.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">Adobe Flash Player</p>
                            <p class="text">�¶��ΰ����� ������ ��κ� �÷��÷� ���۵Ǿ� �ֽ��ϴ�. �н��� �ϱ� ���ؼ��� �� S/W�� �ʼ��Դϴ�.</p>
                            <a href="http://get.adobe.com/kr/flashplayer/" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><img src="/images/2013/support/sf_img2.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">Adobe ShockWave Player</p>
                            <p class="text">ShockWave�� ���۵� ���� �Ǵ� �̵� ���� ���ؼ��� �� S/W�� �ʿ��մϴ�.</p>
                            <a href="http://get.adobe.com/kr/shockwave/" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                </div>

                <div class="imgList2">
                    <dl>
                        <dt><img src="/images/2013/support/sf_img3.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">RealPlayer</p>
                            <p class="text">ra, rm ������ �̷���� ���Ǹ� �� �� �ִ� ���α׷��Դϴ�.</p>
                            <a href="http://kr.real.com/" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><img src="/images/2013/support/sf_img4.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">ORACLE Java 7</p>
                            <p class="text">XP�ʱ���� ����ڴ� �ڹ� ����ӽ��� ��ġ�Ǿ� ���� �ʽ��ϴ�. ���Ǹ� �ޱ� ���ؼ��� �ʼ��� S/W�Դϴ�.</p>
                            <a href="http://java.com/ko/download/index.jsp" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                </div>

                <div class="imgList2">
                    <dl>
                        <dt><img src="/images/2013/support/sf_img5.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">Windows Media Player</p>
                            <p class="text">���� �� �������� ������ ���� ��� �� S/W�� ��ġ�ؾ� �ϴ� ��찡 �ֽ��ϴ�.</p>
                            <a href="http://www.microsoft.com/ko-KR/download/details.aspx?id=20426" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><img src="/images/2013/support/sf_img6.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">�ѱ۰� ��ǻ�� ���ǽ� ��� 2010 SE+</p>
                            <p class="text">�����ڷ� �� �ѱ�����(hwp)�� �ۼ��� �ڷᰡ �ֽ��ϴ�. �ڷḦ Ȯ���Ͻ� �� ��ġ�մϴ�.</p>
                            <a href="http://www.hancom.com/downLoad.downPU.do?mcd=002" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                </div>

                <div class="imgList2">
                    <dl>
                        <dt><img src="/images/2013/support/sf_img7.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">Adobe Reader X</p>
                            <p class="text">�����ڷ� �� PDF���Ϸ� �� ��ũ�ι�� ������ �ֽ��ϴ�. �ڷḦ Ȯ���Ͻ� �� ��ġ�մϴ�.</p>
                            <a href="http://get.adobe.com/kr/reader/?promoid=HTEHD" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><img src="/images/2013/support/sf_img8.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">MS Office PowerPoint Viewer</p>
                            <p class="text">�����ڷ� �� �Ŀ�����Ʈ(ppt)���Ϸ� �ۼ��� �ڷᰡ �ֽ��ϴ�. �ڷḦ Ȯ���Ͻ� �� ��ġ�մϴ�.</p>
                            <a href="http://www.microsoft.com/ko-kr/download/details.aspx?id=13" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                </div>

                <div class="imgList2">
                    <dl>
                        <dt><img src="/images/2013/support/sf_img9.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">Adobe Flash CS6 (���� �������)</p>
                            <p class="text">����,��ȭ �� �ִϸ��̼� �� �پ��� �о߿��� �ַ� ���Ǵ� ���Դϴ�.</p>
                            <a href="http://www.adobe.com/cfusion/tdrc/index.cfm?product=flash&loc=ko" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><img src="/images/2013/support/sf_img10.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">Adobe After Effect CS6 (���� �������)</p>
                            <p class="text">���� Ư��ȿ���� ������ �� �ִ� ���Դϴ�. ��ȭ �� ���ӿ��� �������� �ſ� �����ϴ�.</p>
                            <a href="http://www.adobe.com/cfusion/tdrc/index.cfm?product=after_effects" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                </div>

                <div class="imgList2">
                    <dl>
                        <dt><img src="/images/2013/support/sf_img11.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">Adobe Premiere Pro CS6 (���� �������)</p>
                            <p class="text">��ȭ, �ִϸ��̼ǵ��� ������ ������ ���ڵ��� �� �� �ִ� ���� ���Դϴ�.</p>
                            <a href="http://www.adobe.com/cfusion/tdrc/index.cfm?product=premiere_pro" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><img src="/images/2013/support/sf_img12.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">Adobe Photoshop CS6 (���� �������)</p>
                            <p class="text">��� �̹��� �� ������ �����ϰų� ������ �� �ִ� ��ǥ���� ���Դϴ�.</p>
                            <a href="http://www.adobe.com/cfusion/tdrc/index.cfm?product=photoshop" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                </div>


                <div class="imgList2">
                    <dl>
                        <dt><img src="/images/2013/support/sf_img13.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">Autodesk 3ds Max (����ü����)</p>
                            <p class="text">����,��ȭ,�ִϸ��̼�,�̹��� �� 3D������ ���� �θ� ���Ǵ� ���Դϴ�.</p>
                            <a href="http://www.autodesk.co.kr/adsk/servlet/download/item?siteID=1169528&id=17089546" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><img src="/images/2013/support/sf_img14.jpg" alt="adobe flash player" /></dt>
                        <dd>
                            <p class="title">Autodesk Maya (����ü����)</p>
                            <p class="text">3D�ִϸ��̼� ���ۿ� Ưȭ�� ��ǥ���� 3D�׷��� ���Դϴ�.</p>
                            <a href="http://www.autodesk.co.kr/adsk/servlet/download/item?siteID=1169528&id=17089766" target="_blank"><img src="/images/2013/btn/btn_down.gif" alt="�ٿ�ε� �ٷΰ���" /></a>
                        </dd>
                    </dl>
                </div>

            </div>
            <!-- //#subCont -->

        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>