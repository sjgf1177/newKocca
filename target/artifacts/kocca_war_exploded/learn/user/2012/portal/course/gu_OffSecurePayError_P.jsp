<%
//**********************************************************
//  1. ��      ��: �������� ���� ����
//  2. ���α׷���: gu_OffPayCheck_P.jsp
//  3. ��      ��: �������� ���� ����
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2010.01.19
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>�����Ϸ�</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
</head>
<body id="popup"><!-- popup size : 752* -->
	<div id="pop_header">
		<h1><img src="/images/portal/popup/myclass_h1_tit2.gif" alt="�����Ϸ�" /></h1>
	</div>
	<div id="pop_container">
		<div id="contentwrap" class="message_top">
			<ul class="basket_tab">
				<li><img src="/images/portal/myclass/basket_off_tab1_off.gif" alt="��������Ȯ��" /></li>
				<li><img src="/images/portal/myclass/basket_off_tab2_on.gif" alt="�����Ϸ�" /></li>
			</ul>
			
			<div class="message_wrap bo_bn pd_t45 pd_bn">
				<img src="/images/portal/myclass/basket_message3.gif" alt="������ ������û�� ���еǾ����ϴ�." />
			</div>
		</div>
	</div>
	<div id="pop_footer">
		<p class="f_btn"><a href="javascript:top.window.close()" class="btn_gr"><span>�ݱ�</span></a></p>
	</div>
</body>
</html>