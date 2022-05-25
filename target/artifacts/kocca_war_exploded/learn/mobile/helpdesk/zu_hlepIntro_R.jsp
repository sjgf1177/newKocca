<%@ page language = "java" contentType = "text/html; charset=euc-kr" pageEncoding = "euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<% 
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
%>
<%@ include file="/learn/mobile/include/common.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta name="format-detection" content="telephone=no"/>
<title><%=v_title.toString()%></title>
<link rel="stylesheet" type="text/css" href="/css/m_common.css" />
<script type="text/javascript" language="javascript" src="/js/common.js"></script>
</head>
<body class="other_sub">
<div id="sub_header">	
	<%@ include file="/learn/mobile/include/header.jsp" %>
</div>
<div id="kocca_subContent">				

	<div class="infor_area">
		<h3 class="icon_t">�ֿ伭�� �ȳ�</h3>
	</div>

	<div class="infor_Contents">
		<ul>
			<li>���� ���ǽ��� ���� �������� ������ ������, ������� �� �н��Ⱓ ������ Ȯ�� �� �� �ֽ��ϴ�. </li>
			<li>�н�/��� �̷¿����� ����Ͻ� ���뿡 ���� �亯���ο� ������ Ȯ�� �Ͻ� �� �ֽ��ϴ�.</li>
			<li>���Ŭ���������� ���� ������ ������ �������� ī�װ�ȭ�Ͽ� ������ ���� �Ұ� �� �������� �����մϴ�.  </li>
		</ul>
	</div>	

	<div class="infor_area">
		<h3 class="icon_t">������û �� �н�����</h3>
	</div>

	<div class="infor_Contents">
		<ul>
			<li>������û �� �н��� PC�� ���� ��ī���� ����Ʈ���� �̿��Ͻ� �� ������, ����Ͽ����� �������� �ʽ��ϴ�.</li>			
		</ul>
	</div>
	
	<div class="infor_area">
		<h3 class="icon_t">�α���/ȸ������ �ȳ�</h3>
	</div>

	<div class="infor_Contents">
		<ul>
			<li>�޴����� ���� ��ī���� ���ø����̼� ���񽺸� �̿��Ͻ÷��� ��ī���� ȸ���̼ž� �մϴ�.</li>
			<li>ȸ�������� ��ī���� ����Ʈ���� �Ͻ� �� �ֽ��ϴ�.</li>
			<li>�α��� �� ��ī���� ����Ʈ�� ���� ���̵�/��й�ȣ�� �̿��Ͻø� �˴ϴ�. </li>
			<li class="li_last">���̵�/��й�ȣ�� ������ ��� ��ī���� ����Ʈ���� ��ȸ�Ͻ� �� �ֽ��ϴ�. </li>
		</ul>
	</div>

	<div class="infor_area">
		<h3 class="icon_t">������ ��ȭ��� �ȳ�</h3>
	</div>

	<div class="customer_area">
		<ul>
			<li class="phone"><img src="/images/mobile/phone.png"></li>			
			<li>�¶��� ���� : <a href="tel:02-2161-0077">02)2161-0077</a></li>
			<li>�������� ���� : <a href="tel:02-2161-0072">02)2161-0072</a></li>			
		</ul>
	</div>
	
	<!--Footer-->
	<jsp:include page="/learn/mobile/include/footer.jsp" flush="true" />
	<!--Footer-->

</div>

</body>
</html>