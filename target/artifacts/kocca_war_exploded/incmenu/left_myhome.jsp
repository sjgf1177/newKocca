<%--  
	��  �� : ����Ȩ ���� �޴� 
	���ϸ� : left_myhome.jsp
	�ۼ��� : 2004.11.10
	ȸ  �� :(��)��������Ʈ 
	�ۼ��� : �̿���
	��  �� : ����� �������� ����Ȩ ���� �޴� ����
	
	�б� Page	: 
--%> 
<%
		String homeExeSrcFile = request.getRequestURI();

		if(homeExeSrcFile.equals("/portal/user/knowledge/km_view.jsp")) homeExeSrcFile = "/my_list";
		else if(homeExeSrcFile.equals("/portal/user/knowhow/knowhow_view.jsp")) homeExeSrcFile = "/my_knowhow";
		
			
		//url���� ��ǥ�� �Ǵ� URL�� �Ϻ� Tree ����
		String[] menuUrlKey = {"/zu_EducationSubject_L", "/zu_StudyHistoryTotal_L",  "/zu_ETestPaper_L", "/zu_SulmunSubPaper_L.jsp", "/zu_SulmunPaper_L",  "/zu_PersonalInform_U"};

		// ��ũ�� url
		String[] menuSrc = {"/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage", "/servlet/controller.study.MyClassServlet?p_process=StudyHistoryList", "/servlet/controller.etest.ETestUserServlet?p_process=ETestUserListPage", "/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunUserListPage", "/servlet/controller.research.SulmunCommonUserServlet?p_process=SulmunUserListPage", "/servlet/controller.study.MyClassServlet?p_process=PersonalInformUpdatePage"};
		
		// �޴� �̹�����
		String[] menuImgName = {"img101", "img102",  "img105", "img106", "img107", "img113"};
				
		
		// �޴� �̹���
		String[] menuImg = {"/images/common/left_myhome_01", "/images/common/left_myhome_02", "/images/common/left_myhome_05", "/images/common/left_myhome_14", "/images/common/left_myhome_12", "/images/common/left_myhome_03"};
		

		int menuCo = 6;
%>

						<TABLE cellpadding="0" cellspacing="0" border="0" height="100%">
							<tr height="74">
								<td style="padding-left:10px"><A HREF="/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage"><IMG src="/images/common/left_title_myhome.gif" border="0"></A></td>
							</tr>
							<tr height="10">
								<td></td>
							</tr>
							<tr valign="top">
								<td style="padding-left:25px">
									<TABLE cellpadding="0" cellspacing="0" border="0">
<%
		int iMenu = homeExeSrcFile.indexOf(menuUrlKey[0]);
		

		for(int loop = 0; loop < menuCo; loop++){
			int iMenuBg = homeExeSrcFile.indexOf(menuUrlKey[loop]);

			//-------------menu�� 1,2,3,7�� ���Ͽ� ó��------ //
			////-- ������ �ȿ� ���� ���������鿡 ���Ͽ� ������ �̹��� highlight
			if(loop == 1) {
				if(homeExeSrcFile.endsWith("zu_StudyHistoryOn_L.jsp") || homeExeSrcFile.endsWith("zu_StudyHistoryOff_L.jsp") || homeExeSrcFile.endsWith("zu_StudyHistoryLang_L.jsp")) 
				{
				  iMenuBg = 0;
				}
			else if(loop == 2) {
				if(homeExeSrcFile.endsWith("zu_ChangeSeq_I.jsp") || homeExeSrcFile.endsWith("zu_ChangeSeq_U.jsp") || homeExeSrcFile.endsWith("zu_ChangeSeq_R.jsp")) {
				iMenuBg = 0;
				}
			}
			}else if(loop == 3) {
				if(homeExeSrcFile.endsWith("zu_EduTargetSearch_L.jsp") || 					homeExeSrcFile.endsWith("zu_ProposeMember_L.jsp") || homeExeSrcFile.endsWith("zu_TeamExamHistory_L.jsp") ||
				homeExeSrcFile.endsWith("zu_TeamScoreSearch_L.jsp")	) {
				iMenuBg = 0;
				}
			}
			else if(loop == 7) {
				if(homeExeSrcFile.endsWith("zu_MyQna_L.jsp") || 					homeExeSrcFile.endsWith("zu_MyQna_R.jsp") || homeExeSrcFile.endsWith("zu_MyQna_U.jsp") || homeExeSrcFile.endsWith("zu_MySubjQna_L.jsp") ||
				homeExeSrcFile.endsWith("zu_MySubjQna_R.jsp")) {
				iMenuBg = 0;
				}
			}			
			
			//-----------------------------------------------------//
			if (iMenuBg > -1) {		

%>
										<tr>
											<td>
											<A HREF="<%=menuSrc[loop]%>">
											<img src="<%=menuImg[loop]%>_r.gif" border="0" name="<%=menuImgName[loop]%>"></A></td>
										</tr>
<%
				iMenuBg = -1;
			 }else{
%>
                                        <tr>
											<td>
											<A HREF="<%=menuSrc[loop]%>">
											<img src="<%=menuImg[loop]%>.gif" border="0" name="<%=menuImgName[loop]%>" onMouseOver="document.all.<%=menuImgName[loop]%>.src='<%=menuImg[loop]%>_r.gif'" onMouseOut="document.all.<%=menuImgName[loop]%>.src='<%=menuImg[loop]%>.gif'"></A></td>
										</tr>
<%			 
			 }
			if(loop == 2 || loop == 4 || loop == 10){
%>
										<tr height="15">
											<td></td>
										</tr>
<%
			}
			}
%>
	                              </TABLE>
								</td>
							</tr>
						</TABLE>