<%--  
	��  �� : HelpDesk �������� ���� �޴�(�����)
	���ϸ� : left_helpdesk.jsp
	�ۼ��� : 2004.12.
	ȸ  �� :(��)��������Ʈ 
	�ۼ��� : �̵���
	��  �� : HelpDesk ���� �޴� Include
		   
	���� Ŭ����      : 
	Input Parameter  : 
	�б� Page        : ����
	Output Parameter : ����
--%> 

<%
	String sPageUri = request.getRequestURI();
System.out.println("helpdesk==> " + sPageUri);	
	int iIdx		= -1;
	String sPrefix	= "pds";
	String imgSrc	= "";
	
	//FAQ = zu_HomePageFaq_XX
	//QNA = zu_HomePageQna_XX
	//Admin = zu_HomePageAdmin_XX
	//Manual = �¶��� �Ŵ��� ���� �� �������� = manual_01
	//			���������� = manual_02
	//			����ڷ�� = manual_03
	//			Ŀ�´�Ƽ	= manual_04_XX
	//			����Ʈ����	= manual_05
	
%>



 					
						<TABLE cellpadding="0" cellspacing="0" border="0" height="100%">
							<tr height="74">
								<td style="padding-left:10px"><IMG src="/images/common/left_title_pds.gif" border="0"></td>
							</tr>
							<tr height="10">
								<td></td>
							</tr>
							<tr valign="top">
								<td style="padding-left:25px">
									<TABLE cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td><A HREF="/servlet/controller.tutor.TutorFormServlet"><img src="/images/common/left_<%= (imgSrc=sPageUri.indexOf("zu_TutorForm_L") > 0  ? sPrefix+"_01_r.gif" : sPrefix+"_01.gif")%>" border="0" name="img101" onMouseOver="document.all.img101.src='/images/common/left_pds_01_r.gif'" onMouseOut="javascript:this.src='/images/common/left_<%=imgSrc%>'"></A></td>
										</tr>
									 	<tr>
											<td><A HREF="/servlet/controller.tutor.TutorSwServlet"><img src="/images/common/left_<%= (imgSrc=sPageUri.indexOf("zu_TutorSw_L") > 0  ? sPrefix+"_02_r.gif" : sPrefix+"_02.gif")%>" border="0" name="img102" onMouseOver="document.all.img102.src='/images/common/left_pds_02_r.gif'" onMouseOut="javascript:this.src='/images/common/left_<%=imgSrc%>'"></A></td>
										</tr>
									 	<tr>
											<td><A HREF="/servlet/controller.study.DicSubjStudyServlet?p_process=selectTotalListPre"><img src="/images/common/left_<%= (imgSrc=sPageUri.indexOf("edu_word") > 0  ? sPrefix+"_03_r.gif" : sPrefix+"_03.gif")%>" border="0" name="img103" onMouseOver="document.all.img103.src='/images/common/left_pds_03_r.gif'" onMouseOut="javascript:this.src='/images/common/left_<%=imgSrc%>'"></A></td>
										</tr>
									</TABLE>
								</td>
							</tr>
						</TABLE>