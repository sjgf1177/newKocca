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
    box.put("submenu","7");
    
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
				<td class="pagetitle"><img src="/images/2012/sub/page0/title/member_email.gif" alt="�̸��Ϻδܼ����ź�"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > <u>�̸��Ϲ��ܼ����ź�</u></td>
			</tr>
		</table>
		<div class="emailbox">
			<ul class="emailmsg">
				<li class="danger">
					�� Ȩ�������� �Խõ� �̸��� �ּҰ� ���ڿ��� ���� ���α׷��̳� �� ���� �����
					��ġ�� �̿��Ͽ� �������� �����Ǵ� ���� �ź��ϸ�, �̸� ���ݽ� ������Ÿ�����
					���� ����ó������ �����Ͻñ� �ٶ��ϴ�.
				</li>
				<li class="speaking">�ѱ������������ ��ī���̴� �̸��� �ּ� ������ �ź��մϴ�.</li>
				<li class="laws">
					<span>������Ÿ��� �� 50���� 2 (���ڿ����ּ��� ���� �������� �� ����)</span><br><br>
					<p>
						�� �������� ���ڿ����ּ��� ������ �ź��ϴ� �ǻ簡 ��õ� ���ͳ� Ȩ���������� �ڵ����� ���ڿ����ּҸ�<br>
					    &nbsp; &nbsp; �����ϴ� ���α׷� �� ���� ����� ��ġ�� �̿��Ͽ� ���ڿ����ּҸ� �����Ͽ����� �ȵȴ�.
					</p>
					<p>
						�� �������� �� 1���� ������ �����Ͽ� ������ ���ڿ����ּҸ� �Ǹ� �����Ͽ����� �ƴϵȴ�.
					</p>
					<p>
						�� �������� �� 1�� �� �� 2���� ������ ���Ͽ� �������Ǹ� �� �����̱����� ���ڿ����ּ����� �˰� �̸� ����<br>
					   &nbsp; &nbsp; ���ۿ� �̿��Ͽ����� �ƴ� �ȴ�.
					</p>
					<br>
					<p>
						�� ����, ���� ���� ����� ��ġ�� ����� �̸����ּ� ���ܼ��� ���ظ� ���Ͻ� ��� <b>�ҹ����Դ�������</b><br>
					  &nbsp; &nbsp; <b>������ȭ (1336)�� Ȩ������(www.spamcop.or.kr)</b>�� �Ű�â�� ���Ͽ� �Ű��Ͽ� �ֽñ� �ٶ��ϴ�.
					</p>
				</li>
			</ul>
		</div>
	</div>
	
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>