<%--  
	��  �� : HelpDesk �������� ���� �޴�(�����)
	���ϸ� : left_helpdesk.jsp
	�ۼ��� : 2004.12.
	ȸ  �� :(��)ũ����
	�ۼ��� : �̿���
	��  �� : HelpDesk ���� �޴� Include
		   
	���� Ŭ����      : 
	Input Parameter  : 
	�б� Page        : ����
	Output Parameter : ����
--%> 


<%
		String homeExeSrcFile = request.getRequestURI();

		//url���� ��ǥ�� �Ǵ� URL�� �Ϻ� Tree ����
		String[] menuUrlKey = {"/zu_HomePageFaq_L.jsp", "/zu_HomePageQna_L.jsp","/zu_HomePageSoftWare_L.jsp","/zu_HomePageBoard_L.jsp","/zu_HomePageMileage_L","/zu_HomePageHelp_L","/zu_HomePageWay_L"};

		// ��ũ�� url                                    
		String[] menuSrc = {"/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList", "/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList","/servlet/controller.homepage.HomePageSoftWareServlet?p_process=selectList","/servlet/controller.homepage.HomePageBoardServlet?p_process=selectList","/servlet/controller.homepage.HomePageMileageServlet?p_process=selectList","/servlet/controller.homepage.HomePageHelpServlet?p_process=selectList","/servlet/controller.homepage.HomePageWayServlet?p_process=selectList"};
		
		// �޴� �̹�����
		String[] menuImgName = {"Image23", "Image24","Image25","Image26","Image27","Image32","Image33"};

		
		// �޴� �̹���          
		String[] menuImg = {"/images/user/support/lm_01", "/images/user/support/lm_02","/images/user/support/lm_03","/images/user/support/lm_04","/images/user/support/lm_05","/images/user/support/lm_06","/images/user/support/lm_07"};
		

		int menuCo = 7;
%>

		<img src="/images/user/support/type1/lm_tit.gif" width="152" height="63">
<%
		int iMenu = homeExeSrcFile.indexOf(menuUrlKey[0]);


		for(int loop = 0; loop < menuCo; loop++){
			int iMenuBg = homeExeSrcFile.indexOf(menuUrlKey[loop]);

			//-----------------------------------------------------//
			
%>
        <a href="<%=menuSrc[loop]%>" target="_self">
		  <IMG src="<%=menuImg[loop]%>.gif"  name="<%=menuImgName[loop]%>" onMouseOver="document.all.<%=menuImgName[loop]%>.src='<%=menuImg[loop]%>_on.gif'" onMouseOut="document.all.<%=menuImgName[loop]%>.src='<%=menuImg[loop]%>.gif'" border="0"></a>
<%
			
}
%>
      
	







