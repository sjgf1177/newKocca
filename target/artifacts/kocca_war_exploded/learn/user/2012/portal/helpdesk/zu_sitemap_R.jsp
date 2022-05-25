<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String  v_process     = box.getString("p_process");
    String  v_tem_grcode   = box.getSession("tem_grcode");
    
    String v_content    = "";
    String v_code       = "";
    String v_title      = "";
    box.put("topmenu","1");
    box.put("submenu","8");
    
    DataBox dbox = (DataBox)request.getAttribute("selectView");
    if (dbox != null) {
    	v_content    = dbox.getString("d_content");
        v_code       = dbox.getString("d_code");
        v_title      = dbox.getString("d_title");
    }
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->
	<div class="content">
		<table class="rootinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"><img src="/images/2012/sub/page0/title/sitemap.gif" alt="����Ʈ��"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > <u>����Ʈ��</u></td>
			</tr>
		</table>
		<div class="sitemap">
			<ul class="mapbox">
				<li class="topmenu">���� ���ǽ�</li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('3','11');" tabindex="171" title="���� �н����� ������ Ȯ�� �Ǵ� �н��� �� �ֽ��ϴ�.">�������� ����</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('3','02');" tabindex="172" title="ȸ������ �� ������� �н��� �̷��� Ȯ���� �� �ֽ��ϴ�.">���Ǳ����̷�</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('3','17');" tabindex="173" title="��û�� ������ Ȯ���ϰų� ����� �� �ֽ��ϴ�.">������û Ȯ��/���</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('3','19');" tabindex="174" title="���� ��ȸ �Ǵ� ��Ҹ� �� �� �ֽ��ϴ�.">������ ��������</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('3','12');" tabindex="175" title="����Ͻ� ������ Ȯ���� �� �ֽ��ϴ�.">���� ��㳻��</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('3','07');" tabindex="176" title="ȸ������ �����Ͻ� ������ Ȯ���� �� �ֽ��ϴ�.">���� ����</a></li>
				<!-- <li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="#" title="">�ڱ⿪�� ����</a></li> -->
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuMainForward('4','/servlet/controller.study.MyClassServlet?p_process=StudyHistoryListSyuro');" tabindex="177" title="������ �����Ͻ� ��� �������� ����� �� �ֽ��ϴ�.">������ ���</a></li>
			</ul>
			<ul class="mapbox margin20">
				<li class="topmenu">�¶��ΰ���</li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_area=B0')" tabindex="181" title="��ۿ��� �о� �¶��ΰ����� �ȳ��մϴ�.">��ۿ���</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_area=G0')" tabindex="182" title="���Ӱ��� �о� �¶��ΰ����� �ȳ��մϴ�.">��������</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList&p_area=K0')" tabindex="183" title="��ȭ������ �о� �¶��ΰ����� �ȳ��մϴ�.">��ȭ������</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuMainForward('4','/servlet/controller.propose.ProposeCourseServlet?p_process=Curriculum')" tabindex="184" title="��ȭ������ �о� �¶��ΰ����� �ȳ��մϴ�.">Ŀ��ŧ��</a></li>
			</ul>
			<ul class="mapbox margin20">
				<li class="topmenu">�������ΰ���</li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('2','01');" tabindex="191" title="��ۿ��� �о� �������ΰ����� �ȳ��մϴ�.">��ۿ���</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('2','02');" tabindex="192" title="���Ӱ��� �о� �������ΰ����� �ȳ��մϴ�.">���Ӱ���</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('2','03');" tabindex="193" title="��ȹâ�� �о� �������ΰ����� �ȳ��մϴ�">��ȹâ��</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('2','04');" tabindex="194" title="�н� �� �ʿ��� �ڷḦ �����մϴ�.">�����ڷ��</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('2','05');" tabindex="195" title="�������� ������ ���� �� ���� ���������� Ȯ���� �� �ֽ��ϴ�.">��������</a></li>
				<!-- <li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="#" title="">����ȯ��Ұ�</a></li> -->
			</ul>
			<ul class="mapbox margin20">
				<li class="topmenu">�н�����</li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('4','07');" tabindex="201" title="�ѱ������������ ��ī������ ���ҽ��� �˷��帳�ϴ�.">��������</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('4','01');" tabindex="202" title="���� ���� ������ ��Ƶξ����ϴ�.">FAQ</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('4','02');" tabindex="203" title="�ñ��� ���� �ִٸ� �������.">������ϱ�</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('4','05');" tabindex="204" title="�¶��� �н� �� �������� �н��� ���� �н�ȯ���� �����մϴ�.">�н�ȯ�浵���</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('4','09');" tabindex="205" title="�������� ���� �� ���Ǵ� ���縦 �Ұ��մϴ�.">1:1����</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('4','10');" tabindex="206" title="����� ������ ���ϽŴٸ� �̰� 1:1���Ǹ� �̿����ּ���.">����Ұ�</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('4','12');" tabindex="207" title="��ī���̿��� �����ϴ� �پ��� �̺�Ʈ�� Ȯ���� �� �ֽ��ϴ�.">�̺�Ʈ</a></li>
				<!-- <li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="#" title="">������û���</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="#" title="">�������̵�</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="#" title="">�ڱ⿪������</a></li> -->
			</ul>
			<div class="clears"></div>
			<dl class="topgrid">
				<dd class="frist"></dd>
				<dd class="twoend"></dd>
				<dd class="twoend"></dd>
				<dd class="twoend"></dd>
			</dl>
			<div class="centerlogo"><img src="/images/2012/sub/page0/sitemap_logo.gif"></div>
			<dl class="bottomgrid">
				<dd class="frist"></dd>
				<dd class="twoend"></dd>
				<dd class="twoend"></dd>
				<dd class="twoend"></dd>
			</dl>
			<ul class="mapbox">
				<li class="topmenu">��������</li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('5','12');" tabindex="211" title="��ۿ��� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ۿ���</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('5','13');" tabindex="212" title="��ȭ ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ȭ</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('5','14');" tabindex="213" title="��ť���͸� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ť���͸�</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('5','15');" tabindex="214" title="��ȭ���� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ȭ����</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('5','17');" tabindex="215" title="���� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">����</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('5','16');" tabindex="215" title="��Ÿ ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��Ÿ</a></li>
				<!-- <li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="#" title="">��ȹ</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="#" title="">��Ÿ</a></li> -->
			</ul>
			<ul class="mapbox margin20">
				<li class="topmenu">�������丮</li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage')" tabindex="221" title="�������丮�� ��ü ������ �����غ��ҽ��ϴ�.">����</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=CB')" tabindex="222" title="��ۿ��� �о� ���� �����Դϴ�.">��ۿ���</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=CG')" tabindex="223" title="���Ӱ��� �о� ���� �����Դϴ�.">���Ӱ���</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=CK')" tabindex="224" title="��ȭ������ �о� ���� �����Դϴ�.">��ȭ������</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuMainForward('7','/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=MINE')" tabindex="225" title="ȸ���Բ��� �����Ͻ� ������ �̿��� �� �ֽ��ϴ�.">���� �ۼ��� ��</a></li>
			</ul>
			<ul class="mapbox margin20">
				<li class="topmenu">��ī���̼Ұ�</li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('7','01');" tabindex="231" title="�ѱ��������������Բ��� ȸ���Ե鲲 �帮�� �λ縻�Դϴ�.">������� �λ縻</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('7','02');" tabindex="232" title="��ī������ ���������� ������ ���� �Ұ��մϴ�.">�������� �� ����</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('7','05');" tabindex="233" title="��ī���� ��������� �ȳ��մϴ�.">��������ȳ�</a></li>
				<!-- <li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="#" title="">�����ü��ȳ�</a></li> -->
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('7','06');" tabindex="235" title="��ī���̿� ���°����� ����� �Ұ��մϴ�.">�������±��</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('7','04');" tabindex="236" title="�ѱ������������ ��ī���̿� ���ô±��� �ȳ��մϴ�.">���ô±�</a></li>
			</ul>
			<ul class="mapbox margin20">
				<li class="topmenu">ȸ������</li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuMainForward('90','/servlet/controller.homepage.MainServlet?p_process=MainLogin');" tabindex="241" title="�̹� ȸ���̽� �в����� ȸ���α����� ���ּ���.">ȸ�� �α���</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('90','01');" tabindex="242" title="�ѱ���������ī���̿� ó�� ���̳���? ����ȸ���������� �پ��� ���񽺸� �޾ƺ�����.">ȸ������</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('90','02');" tabindex="243" title="���̵� �Ǵ� ��й�ȣ�� �����̴ٸ� �̰��� �̿����ּ���.">���̵�/��й�ȣ ã��</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('90','03');" tabindex="244" title="ȸ������ ��й�ȣ �� ���������� �����ϰ��� �Ͻ� �� �̿����ּ���.">ȸ����������</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('90','04');" tabindex="245" title="ȸ��Ż�� �ϰ� ���� ��� Ŭ�����ּ���.">ȸ��Ż��</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('90','05');" tabindex="246" title="�ѱ���������ī���̸� �̿��Ͻñ� ���� ����Դϴ�.">�̿���</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('90','06');" tabindex="247" title="�ѱ���������ī���̿����� ������ ������ ���������� �̷��� ���� �� �̿��մϴ�.">��������ó����ħ</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('90','02');" tabindex="248" title="�ѱ���������ī���̴� �̸��Ϲ��ܼ����� �ź��մϴ�">�̸��Ϲ��ܼ����ź�</a></li>
				<li class="middlemenu"><img src="/images/2012/sub/icon_dot.png" align="absmiddle" alt="dot"><a href="javascript:menuForward('90','09');" tabindex="249" title="�ѱ���������ī���� Ȩ������ ���񽺸� �Ѵ��� Ȯ���Ͻ� �� �ֽ��ϴ�.">����Ʈ��</a></li>
			</ul>
			<div class="clearL"></div>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>