<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page errorPage="/learn/library/error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.credu.homepage.*"%>
<%@ page import="com.credu.library.*"%>
<%@ page import="com.credu.common.*"%>
<%@ page import="com.credu.system.*"%>
<%@ page import="com.dunet.common.util.*"%>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select"%>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
	RequestBox box = (RequestBox) request.getAttribute("requestbox");
	if (box == null)
		box = RequestManager.getBox(request);
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
	
//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="form1" method="post">
	<input type="hidden" name="p_process" value="" />

	<h2 class="subTit">�λ縻</h2>
	<div id="subCont">
		<div>
			<div>
				<div style="float: left">
					<img src="/images/2013/common/bar.jpg" alt="bar" />
				</div>
				<div style="padding-left: 15px; font-size: 20px; font-weight: bold">
					�ѱ���������ī���̴�<br />�ѱ�������������� �����������η¾缺����Դϴ�.
				</div>
			</div>
			<div style="width: 530px; float: left; padding: 40px 16px; font-size: 14px;">


				<p>
					�ѱ���������ī���̴� <br />â��/����/���� ���� Ű���带 �ٽɰ�ġ��<br />������ ��� ���忡�� �ʿ��� ������
					â�����縦 �缺�ϱ� ���� ����ϰ� �ֽ��ϴ�.
				</p>
				<br /> <br />
				<p>
					�������� ������� â������ â�Ǵɷ¿��� ��Ե˴ϴ�.<br />����� â�ۿ����� ���ձ������ ���� ���縦 �缺�ϱ�
					���ؼ���<br />ü������ ���� Ŀ��ŧ���� ���������� �ʿ��մϴ�.
				</p>
				<br /> <br /> 
				<p>
					�ѱ���������ī���̴�<br />������ �ְ� �������� ǳ���� ���� ���Ͽ�, ���� �ְ��� ������ ���۱��� ������ ��������<br />������
					��� �����η±���, ������ ��������, �������� �ؿܿ��� �� �¶��� �������� ���� ��ϰ� �ֽ��ϴ�.<br />�̸� ����
					�۷ι� ���� �缺�� ���� ������ ��� ���� ����������μ��� ���Ұ� ��� ���࿡ �ּ��� ���ϰڽ��ϴ�.
				</p>
				<br /> <br /><p>�������� ���Ծ��� ���ɰ� ������ ��Ź�帮�ڽ��ϴ�.</p> <br /> <br />
				<!-- <span style="font-weight:bold">�ѱ�������������� �ۼ���</span> -->
			</div>
			<!-- <div style="float:right; padding-top:20px;">
                <img src="/images/2013/introduce/img_director.jpg" alt="�ѱ�������������� �ۼ��� ����" />
            </div>  -->
		</div>
		<!-- //greeting -->

	</div>
	<!-- //#subCont -->

</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->