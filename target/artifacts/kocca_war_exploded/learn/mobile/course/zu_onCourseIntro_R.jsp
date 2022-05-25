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
	<h3 class="cource_step">1) �ѱ������������ �ѱ���������ī���� Ȩ�������� �����մϴ�.</h3>
	<h4 id="step_arrow" class="step_arrow"></h4>
	<h3 class="cource_step">2)<span class="color_red"> ȸ������ �������� �α���</span> �մϴ�.(ȸ�� �̰��Խ� ������û�� �Ұ��մϴ�.)</h3>
	<h4 id="step_arrow" class="step_arrow"></h4>
	<h3 class="cource_step">3) ��޴� �� <span class="color_red">�¶��ΰ���</span>�� Ŭ���Ͽ� �¶��ΰ��� Ȩ�� �����մϴ�.</h3>
	<h4 id="step_arrow" class="step_arrow"></h4>
	<h3 class="cource_step">4) �¶��ΰ��� ī�װ�(��ȹ/����/����/�濵����/Ư��)���� ������û�� ���ϴ� ������ Ž��(�˻�)�մϴ�.</h3>
	<h4 id="step_arrow" class="step_arrow"></h4>
	<h3 class="cource_step">5) Ž��(�˻�) ��� ��Ͽ� ��Ÿ���� �������� Ŭ���ϸ� ������ �������� �̵��մϴ�. ������û�� Ȩ������������ �����Ͻʴϴ�.</h3>
	<h4 id="step_arrow" class="step_arrow"></h4>
	<h3 class="cource_step">6)<span class="color_red"> 1. ��û���Ȯ�� ? 2. ��������Ȯ�� ? 3. �����Ϸ�</span> �� ������ ������û�� �����մϴ�.(��������� ��쿡 �������μ����� �����մϴ�.)</h3>
	<h4 id="step_arrow" class="step_arrow"></h4>
	<h3 class="cource_step">7) ������ �Ϸ�Ǹ�, <span class="color_red">���ǰ��ǽ� > ������û Ȯ��/��� �޴��� �̵��Ͽ� ������û ��Ȳ�� Ȯ��</span>�մϴ�.(��û �� ������ �Ϸ�� ��쿡�� �����δ�⡯�� , ��û �� ����, �������� ���α��� �Ϸ�� ��쿡�� �����Ρ����� ǥ�õ˴ϴ�.)</h3>
	<h4 id="step_arrow" class="step_arrow"></h4>
	<h3 class="cource_step">8) ������û ������ �Ϸ�Ǹ�, <span class="color_red">���ǰ��ǽ� > ������û ���� ������ ��û ������ ��Ͽ� �߰�</span>�˴ϴ�.(��, �н��� ���������� ���ĺ��� �����մϴ�.)
	<h4 class="step_pad"></h4>
</h3>	
	
	<!--Footer-->
	<jsp:include page="/learn/mobile/include/footer.jsp" flush="true" />
	<!--Footer-->
</div>
</body>
</html>