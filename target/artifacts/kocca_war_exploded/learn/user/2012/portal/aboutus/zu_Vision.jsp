<%
//**********************************************************
//  1. ��      ��: ����������޹�ħ
//  2. ���α׷��� : zu_Personal.jsp
//  3. ��      ��: ����������޹�ħ
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>

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
	box.put("topmenu","7");
	box.put("submenu","2");
%>


<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�Դϴ�">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ��ī���� �Ұ� > <u>��ī���� �Ұ�</u></td>
			</tr>
		</table>
		<div class="concept">
			<div>
				<img src="/images/2012/sub/page7/title/vision.gif" alt="��ī���� �Ұ�">
			</div>
		</div>
		<div class="allimagepage">
<!--			<img src="/images/2012/sub/page7/vision_01.gif" alt="�������� : ���� 5�� ������ ���� ���� - ����Ը� 100����, ����Ը� 78���, ���Ը� 100����">-->
<!--			<img src="/images/2012/sub/page7/vision_02.gif" alt="����� ���� : â�������� �����ϴ� �۷ι� ������ ����">-->
<!--			<img src="/images/2012/sub/page7/vision_03.gif" alt="��ǥ : �帣 Ư��ȭ ���սó��� ���� ���ڸ� â�� - ������ ������ �Ž��� â��, ���ѹα� �������� �۷ι�ȭ, ���� 5�� ĳ���Ͱ���, 2012�� 3�� ���Ӱ��� ����, 2012 ������ ��ۿ��� BIG6 ����, ���� �ִϸ��̼� ���� ����, ��������� �����ϴ� �ѱ���ȭ">-->
<!--			<img src="/images/2012/sub/page7/vision_04.gif" alt="������ȹ : �۷ι� ���� �� ������ Ȯ������, �����η� �缺 �� ���ڸ� â��, �̷� ���������� �������� ��å������ȭ, CT������ȭ ����, ������ ������ �̿� ��ȭ����">-->
			<img src="/images/2012/sub/page7/vision_1234.gif" alt="����������缺���� : -������ â������ ���ݻ�� -�������� ���������� ���� -S3D����Ʈ â������ �缺 ����, �¶���������� : -���� ��ۿ��� ��ȭ�о� ���̹���������ī���� � -http://edu.kocca.or.kr, �����������米�� : -â�� ������ Ŭ���� -�������� ������ �ؿܿ��� -3D��ü ������ �����η¾缺 ���� -����Ʈ ������ �����η¾缺 ���� -��ȹ���ε༭�缺 ����">
		</div>
	</div>
	
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>