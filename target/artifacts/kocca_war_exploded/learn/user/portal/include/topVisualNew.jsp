<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page import = "com.credu.library.RequestBox" %>

<%
    String visualFlashGubun = box.getSession("s_gubun").equals("99") ? "7" : box.getSession("s_gubun") ;

%>

<div class="sub_img">
	<div class="sub_text">
		<%if(mainType.equals("A")){%>
			<%if (visualFlashGubun.equals("5")) {%>
				<p class="sub_text_title"><span style="font-size: 15px;font-weight: 600;line-height: 36px;color:#fff;">��������ī����</span><span style="font-size: 22px;font-weight: 600;margin-left: 5px;letter-spacing: -3px;color:#fff;">��������</span></p>
				<p class="sub_text_explain" style="color:#fff">�������´� �����е鲲�� ���� ������ �� �ִ� �پ��� �ΰ��������� �����ϰ� �ֽ��ϴ�.<br>�оߺ��� �پ��� ������ �������� ������ ������.</p>
			
			<%} else {%>
				<p class="sub_text_title"><span style="font-size: 15px;font-weight: 600;line-height: 36px;color:#fff;">��������ī����</span><span style="font-size: 22px;font-weight: 600;margin-left: 5px;letter-spacing: -3px;color:#fff;">�¶��ΰ���</span></p>
				<p class="sub_text_explain" style="color:#fff">�¶��ΰ����� ��ۿ���, ���Ӱ���, ��ȭ������ ���� �������� ����� �����ý����� ����<br>�ð��� ������ ������� ������ ������ ���� �� �ִ� '����'�����Դϴ�.</p>
			<%}%>
		<%}else{%>
			<%if (visualFlashGubun.equals("5")) {%>
				<p class="sub_text_title"><span style="font-size: 15px;font-weight: 600;line-height: 36px;">��������ī����</span><span style="font-size: 25px;font-weight: 600;margin-left: 8px;">��������</span></p>
				<p class="sub_text_explain" >�������´� �����е鲲�� ���� ������ �� �ִ� �پ��� �ΰ��������� �����ϰ� �ֽ��ϴ�.<br>�оߺ��� �پ��� ������ �������� ������ ������.</p>
			
			<%} else {%>
				<p class="sub_text_title"><span style="font-size: 15px;font-weight: 600;line-height: 36px;">��������ī����</span><span style="font-size: 25px;font-weight: 600;margin-left: 8px;">�¶��ΰ���</span></p>
				<p class="sub_text_explain" >�¶��ΰ����� ��ۿ���, ���Ӱ���, ��ȭ������ ���� �������� ����� �����ý����� ����<br>�ð��� ������ ������� ������ ������ ���� �� �ִ� '����'�����Դϴ�.</p>
			<%}%>
		<%}%>
	</div>
</div>