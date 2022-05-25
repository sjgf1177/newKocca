<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    String  v_user_id   = box.getSession("userid");
    box.put("topmenu","2");
	box.put("submenu","8");
%>

<SCRIPT LANGUAGE="JavaScript">
<!--
function goCelp(userid) {
    var ulink = "http://koccacelp.campus21.co.kr/Start.asP?UserID="+ userid;
    var new_Open = window.open(ulink,"celp",'scrollbars=no,width=1050,height=700,scrollbars=yes,resizable=no');
}
//-->
</SCRIPT>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->


<div class="content">
	<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�Դϴ�">
		<tr>
			<td class="pagetitle"></td>
			<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ���ǰ��ǽ� > <u>�ڱ⿪������</u></td>
		</tr>
	</table>
	<div><img src="/images/2012/sub/page1/about_celp.gif" alt="�ڱ⿪�������̶�? ���� ���ܰ� ������ ������ ���� ������ ���� �� ��ǥ�� �޼��ϴµ� �ʿ��� ������ Ȯ���ϴ� ���� ���񽺸� ���մϴ�."></div>
	<div class="fixing">
		<div class="checkpoint">
			<dl class="celpdetail">
				<dt><img src="/images/2012/sub/page1/celp_part.gif" alt="�ڱ⿪������ ���α׷� ü��"></dt>
				<dd>Ŀ�´����̼�, ��Ī, ��Ʈ��ŷ, �����ذ�, ��������, ������ �߱�, ��ȭ ����, �� ����, ���� ���� ü������ ������ ���ܰ� ����, ����, ����, ģ��, ���� ���� ���� ������ ���� ���� �� ��ǥ�� �޼��ϴµ� �ʿ��� ������ �����մϴ�.</dd>
			</dl>
			<dl class="celpdetail">
				<dt><img src="/images/2012/sub/page1/celp_check.gif" alt="���� ���� ����� ���� ���� ����� ����"></dt>
				<dd>���� ���� ����� ��Ȯ�� �� �� �ֽ��ϴ�. ���� ����� ������ ���� ����� ���� ������ ���� ������ ������ Ȯ���Ͽ�, ������ ���� �κ��� ������ų �� �ֽ��ϴ�. </dd>
			</dl>
		</div>
	</div>
	<div class="opencelp"><a href="javascript:goCelp('<%=v_user_id%>')" title="(��â) �� ���� �����ϱ�"><img src="/images/2012/sub/page1/btn_celp.gif" alt="�� ���� �����ϱ�"></a></div>
</div>

<!-- footer ���� ���� -->
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->