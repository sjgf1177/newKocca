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
	box.put("submenu","1");
%>


<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="�ѱ����������������� �λ縻�Դϴ�">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ��ī���� �Ұ� > <u>������� �λ縻</u></td>
			</tr>
		</table>
		<div class="concept">
			<div>
				<img src="/images/2012/sub/page7/title/title_greeting.png" alt="������� �λ縻">
			</div>
		</div>
		<table class="detail" cellpadding="0" cellspacing="0" summary="�λ縻�Դϴ�">
			<colgroup><col width="269"><col width="*"><col width="325"></colgroup>
			<tr>
				<td class="photo"><img src="/images/2012/sub/page7/photo_ledger.gif" alt="�ѱ�������������� ȫ��ǥ"></td>
				<td class="text1">
					<b>�ѱ���������ī����</b>�� ��ȭ�� ���, ��۰� ���, ������ �帣
					�� �����̶�� �ô� �䱸�� ������ ������ �帣���� ��Ǿ�
					���� ���� �ְ� ������ <<span>��۾�ī����</span>>, <<span>��ȹâ�۾�ī����</span>>, 
					<<span>���Ӿ�ī����</span>>�� �ϳ��� ������ ���� ���� ������ ��/������
					�� ������ ���� ��������Դϴ�.<br><br>
					
					���� ����� ������ȸ�� ���� â�������ȸ�� ���� �ֽ���
					��.  â��, ����, ��� ���� ��ġ�� �ٽ��� �Ǵ� ������ �����
					��ΰ���ġ�� ������μ� ���ĸ� ���� �������� ���̴� �����
					���� �̷� ���� ���� �����Դϴ�.<br><br>
					
					Ư�� 3D��ü����, CG, HDTV ���� �̵�� ���������� �оߴ�
					������ ����� �Բ� ���� ��� ����ȿ���� ����Ǵ� �о�
					�Դϴ�. ������ ��� ���忡���� �̿� ���� ��밨�� ����
					Ŀ���� ������, ���Ҿ� ������ â������ ������ ���� �����ǰ�
					�ִ� �����Դϴ�.
				</td>
				<td class="text2">
					�������� ������� �������� â������ â�� �ɷ¿��� ���
					�˴ϴ�. �۷ι� ������� ���� �������� ��ȹ�� ����, �ؿ�
					���� ������ ��� ����� â���η� ������� â��Ǵ� ������
					���� â�� ������ ���������� ������� ���� â�� ���縦
					�缺�ϱ� ���� ü������ ������ ������� ������ �����
					�־ ���� �߿��� ����Դϴ�.<br><br>
					
					�ѱ���������ī���̴� ������ �ְ��� ������ ������ ǳ����
					���� ���Ͽ�, ���� �ְ��� ������ ���۱��������� ��������
					������ â����������, ����� ���� �米��, �¶��α�������
					��� ���� ����������� ���� ����������μ� ���Ұ� ���
					������ ���� ����� ���Դϴ�.<br><br>
					
					�������� ���Ծ��� ���ɰ� ������ ��Ź�帮�ڽ��ϴ�.
					<p><img src="/images/2012/sub/page7/sign.gif" alt="�ѱ�������������� ȫ��ǥ"></p>
				</td>
			</tr>
		</table>
	</div>
	
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>