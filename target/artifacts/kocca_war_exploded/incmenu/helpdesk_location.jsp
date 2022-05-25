<%--  
	��  �� : Help Desk�� Recursive Path ������ ����ϱ� ���� ������
	���ϸ� : helpdesk_location.jsp
	�ۼ��� : 2005.01.
	ȸ  �� :(��)��������Ʈ 
	�ۼ��� : �̵���
	��  �� : Help Desk��  Recursive Path ������ ����ϱ� ���� ������
		   
	���� Ŭ����      : 
	Input Parameter  : ������ URL
	�б� Page        : ����
	Output Parameter : ����
	
	//FAQ = zu_HomePageFaq_XX
	//QNA = zu_HomePageQna_XX
	//Admin = zu_HomePageAdmin_XX
	//Manual = �¶��� �Ŵ��� ���� �� �������� = manual_01
	//			���������� = manual_02
	//			����ڷ�� = manual_03
	//			Ŀ�´�Ƽ	= manual_04_XX
	//			����Ʈ����	= manual_05
--%> 
<%@ page language="java" contentType="text/html; charset=euc-kr" %>

<%
	String sUrl = request.getParameter("URL");
	String sPath = "<a href='/'>HOME</a> > <a href='javascript:faqList();'>Help Desk<a/> > ";
	try {	
		if(sUrl.indexOf("zu_HomePageFaq") > 0) {
			sPath += "<a href='javascript:faqList();'>FAQ</a>";
		}else if(sUrl.indexOf("zu_HomePageQna") > 0 ) {
			sPath += "<a href='javascript:qnaList();'>Q&A</a>";
		}else if(sUrl.endsWith("manual_00.jsp")) {
			sPath += "<a href='./manual_00.jsp'>�¶��� �Ŵ���</a> > <a href='./manual_00.jsp'>������û</a>";
		}else if(sUrl.endsWith("manual_01.jsp")) {
			sPath += "<a href='./manual_01.jsp'>�¶��� �Ŵ���</a> > <a href='./manual_01.jsp'>���ǰ��ǽ�</a>";
		}else if(sUrl.endsWith("manual_01_01.jsp")) {
			sPath += "<a href='./manual_01.jsp'>�¶��� �Ŵ���</a> > <a href='./manual_01.jsp'>���ǰ��ǽ�</a>";
		}else if(sUrl.indexOf("manual_02") > 0) {
			sPath += "<a href='./manual_02.jsp'>�¶��� �Ŵ���</a> > <a href='./manual_02.jsp'>����������</a>";
		}else if(sUrl.endsWith("manual_03.jsp")) {
			sPath += "<a href='./manual_03.jsp'>�¶��� �Ŵ���</a> > <a href='./manual_03.jsp'>����ڷ��</a>";
		}else if(sUrl.indexOf("manual_04") > 0 ) {
			sPath += "<a href='./manual_04.jsp'>�¶��� �Ŵ���</a> > <a href='./manual_04_01.jsp'>Ŀ�´�Ƽ</a>";
		}else if(sUrl.endsWith("manual_05.jsp")) {
			sPath += "<a href='./manual_05.jsp'>�¶��� �Ŵ���</a> > <a href='./manual_05.jsp'>����Ʈ����</a>";
		}else if(sUrl.indexOf("zu_HomePageAdmin") > 0) {
			sPath += "<a href='javascript:adminList();'>��ڿ���</a>";
		}
	}catch(Exception e) {
		sPath = "";
	}
		
%>
<TABLE cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
        <td align="right" class="location"><img src="/images/common/bullet_location.gif"> <%=sPath%>   </td>
    </tr>
    <tr height="3">
        <td></td>
    </tr>
</table>