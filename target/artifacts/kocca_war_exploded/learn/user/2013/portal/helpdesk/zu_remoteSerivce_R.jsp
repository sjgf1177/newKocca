<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page errorPage="/learn/library/error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.credu.library.*"%>
<%@ page import="com.credu.course.*"%>
<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    ArrayList list1 = null;
    ArrayList list2 = null;
    
    String left_menu = "helpdesk";
   
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">
<!--

//-->
</SCRIPT>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform1" method="post" onsubmit="javascript:select();">
	<input type="hidden" name="p_process">


	<h2>
		<img src="/images/portal/studying/h2_tit11.gif" alt="������������" class="fl_l" />
		<p class="category">
			Home > �н��������� > <strong>������������</strong>
		</p>
	</h2>

	<p>
		<img src="/images/portal/homepage_renewal/support/500090_01.gif" alt="������������" class="fl_l" />
	</p>
	<p>
		<img src="/images/portal/homepage_renewal/support/500090_02.gif" alt="Step01. ������� 02-6441-3258 �����ȭ �����ͷ� ��ȭ �� �н� ���� �ڰ������� �����մϴ�." class="fl_l" />
		<a title="��â����" href="https://113366.com/edu_kocca" target="_blank">
			<img src="/images/portal/homepage_renewal/support/500090_03.gif" alt="Step02. �������� ����Ʈ ���� : �������� ����Ʈ �ٷΰ���" class="fl_l" />
		</a>
		<img src="/images/portal/homepage_renewal/support/500090_04.gif" alt="Step03. �������Է�(�̸� �� ���� ������ Ŭ��! ���� �Ⱥ��ϰ�� ���ΰ�ħ Ŭ��!)" class="fl_l" />
		<img src="/images/portal/homepage_renewal/support/500090_05.gif" alt="Step04. ���α׷� ��ġ �� ����(��ȸ�� ���������� �ڵ� ��ġ�Ǹ� ���� ���� �� ���� ����)" class="fl_l" />
	</p>


	<!-- footer ���� ���� -->
	<%@ include file="/learn/user/portal/include/footer.jsp"%>
	<!-- footer ���� ���� -->