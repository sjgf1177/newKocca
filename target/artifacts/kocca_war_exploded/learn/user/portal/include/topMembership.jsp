<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page import = "com.credu.library.RequestBox" %>

<%

	String mainType=box.getSession("tem_main_type");  //���� ȭ�� Ÿ��
	
	boolean newAsp = mainType.equals("A") || mainType.equals("B") ? true : false;
%>

<%if(newAsp){%>
	<div class="sub_img">
		<div class="sub_text">
			<%if(mainType.equals("A")){%>
				<p class="sub_text_title"><span style="font-size: 15px;font-weight: 600;line-height: 36px;letter-spacing:-3px;color:#fff;">��������ī����</span><span style="font-size: 22px;font-weight: 600;margin-left: 5px;letter-spacing: -3px;color:#fff;">Membership</span></p>
				<p class="sub_text_explain" style="color:#fff;">Membership ������ �ѱ���������ī���̸� �̿��Ͻô� �е鲲<br>�پ��� ������ �����ϰ��� ȸ�����񽺸� �ǽ��ϰ� �ֽ��ϴ�.</p>
			<%}else{%>
				<p class="sub_text_title"><span style="font-size: 15px;font-weight: 600;line-height: 36px;">��������ī����</span><span style="font-size: 25px;font-weight: 600;margin-left: 8px;">Membership</span></p>
				<p class="sub_text_explain" >Membership ������ �ѱ���������ī���̸� �̿��Ͻô� �е鲲 �پ��� ������ �����ϰ���<br> ȸ�����񽺸� �ǽ��ϰ� �ֽ��ϴ�.</p>
			<%}%>
		</div>
	</div>

<%}else{%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="20">&nbsp;</td>
			<td><img src="/images/asp/membership/topimg.gif" width="920" height="135" /></td>
			<td width="20">&nbsp;</td>
		</tr>
	</table>
<%}%>
