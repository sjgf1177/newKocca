function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function gomenu(val) {


	//================== �����ȳ� ====================
	if (val=="1")   {
	  //������û
		 document.location.replace(path1+"/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList"); 
	}
	if (val=="1_1")   {
	  //������û
		 document.location.replace(path1+"/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList"); 
	}
	if (val=="1_2") {	
		//������ûȮ��/��� 
		document.location.replace(path1+"/servlet/controller.study.MyClassServlet?p_process=ProposeCancelPage"); 
	}
	if (val=="1_3") {	
		//�����˻�
		document.location.replace(path1+"/servlet/controller.propose.MainSubjSearchServlet?p_process=SubjSearchPre"); 
	}
	if (val=="1_4") {	
		// �����������
		document.location.replace(path1+"/servlet/controller.research.SulmunSubjResultServlet?p_process=SulmunEachResultPage"); 
	}
	if (val=="1_5") {	
		// BEST����
		document.location.replace(path1+"/servlet/controller.propose.MainSubjSearchServlet?p_process=SubjRecomList"); 
	}
	if (val=="1_6") {
		// ���н����û
		document.location.replace(path1+"/servlet/controller.language.LexamAppUserServlet"); 
	}
	if (val=="1_7") {	
		// ����������û
		document.location.replace(path1+"/servlet/controller.course.FamilyClassServlet?p_process=selectListInUser"); 
	}
	if (val=="1_8") {	
		// ����������û
		document.location.replace(path1+"/servlet/controller.propose.ProposeCourseServlet?p_process=EducationYearlySchedule"); 
	}
	if (val=="1_9") {
		// ����������û
		document.location.replace(path1+"/servlet/controller.propose.ProposeCourseServlet?p_process=EducationMonthlySchedule"); 
	}
	//if (val=="1_9") {	
	//	// ���� ���� ��û
	//	document.location.replace(path1+"/servlet/controller.course.FamilyClassServlet?p_process=selectListInUser"); 
	//}
	             
												

	//================== ����Ȩ ====================
	if (val=="2")	 {	
		//����Ȩ ����
		document.location.replace(path1+"/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage"); 
	}
	if (val=="2_1")  {
		// ���� ���ǽ�
		document.location.replace(path1+"/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage"); 
	}
	if (val=="2_2")  {
		// ���� �����̷�
		document.location.replace(path1+"/servlet/controller.study.MyClassServlet?p_process=StudyHistoryList"); 
	}
	if (val=="2_3")  {
		// 1:1��������
		document.location.replace(path1+"/servlet/controller.study.ChangeSeqServlet?p_process=ListPage"); 
	}
	if (val=="2_4")  {
		// �� ���� ����
		document.location.replace(path1+"/servlet/controller.study.MyClassServlet?p_process=CheifApproval"); 
	}
	if (val=="2_5")  {
		// E-Test
		document.location.replace(path1+"/servlet/controller.etest.ETestUserServlet?p_process=ETestUserListPage"); 
	}
	if (val=="2_6")  {
		// ������������
		document.location.replace(path1+"/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunUserListPage"); 
	}
	if (val=="2_7")  {
		// �Ϲݼ�������
		document.location.replace(path1+"/servlet/controller.research.SulmunCommonUserServlet?p_process=SulmunUserListPage"); 
	}
	if (val=="2_8")  {
		// 
		document.location.replace(path1+"/learn/user/study/my_list.jsp"); 
	}
	if (val=="2_9")  {
		// 
		document.location.replace(path1+"/learn/user/study/my_knowhow_list.jsp"); 
	}
	if (val=="2_10") {
		// 
		document.location.replace(path1+"/learn/user/study/my_scrap_list.jsp"); 
	}
	if (val=="2_11") { 
		// 
		document.location.replace(path1+"/learn/user/study/my_service_list.jsp"); 
	}
	if (val=="2_12") {
		// ���Ǹ��ϸ���
		document.location.replace(path1+"/learn/user/study/my_mileage.jsp");
	}
	if (val=="2_13") {
		// ������������
		document.location.replace(path1+"/servlet/controller.study.MyClassServlet?p_process=PersonalInformUpdatePage"); 
	}
	
		//================== ���� ������ ====================
	if (val=="3")   {
		//���������� ����
		document.location.replace(path1+"/portal/user/knowledge_main.jsp"); 
	}
	if (val=="3_1") {
		// �������� 
		document.location.replace(path1+"/portal/user/knowledge/km_list.jsp"); 
	}
	if (val=="3_2") {
		// ���Ͽ� ����
		document.location.replace(path1+"/portal/user/knowhow/knowhow_list.jsp"); 
	}
	if (val=="3_4") {
		// ������ ����
		document.location.replace(path1+"/portal/user/knowledge/km_master_list.jsp"); 
	}
	if (val=="3_3") {
		// ��������
		document.location.replace(path1+"/portal/user/knowhow/hunting_view.jsp"); 
	}
	
		//================== ��� �ڷ�� ====================
	if (val=="4")   {
		//HRD ����â��
		document.location.replace(path1+"/portal/user/gold/hrdknowledge.jsp"); 
	}
	if (val=="4_1") {
		//HRD ����â��
		document.location.replace(path1+"/portal/user/gold/hrdknowledge.jsp"); 
	}
	if (val=="4_2") {
		// HRD News
		document.location.replace(path1+"/portal/user/gold/hrdnews.jsp"); 
	}
	if (val=="4_3") {
		// HRD Brief
		document.location.replace(path1+"/portal/user/gold/hrdbrief.jsp"); 
	}
	if (val=="4_4") {
		//���̳� �ڷ��
		document.location.replace(path1+"/portal/user/gold/seminar_general.jsp"); 
	}
	if (val=="4_5") {
		// e-learning����
		document.location.replace(path1+"/portal/user/gold/e-learning.jsp"); 
	}
	if (val=="4_7") {
		// ����Ʈ ���� �ٿ�
		document.location.replace(path1+"/portal/user/gold/soft_down.jsp"); 
	}
	if (val=="4_8") {
		// ������� ����
		document.location.replace(path1+"/servlet/controller.study.DicSubjStudyServlet?p_process=selectTotalListPre"); 
	}
	
	
		//================== Ŀ�´�Ƽ  ====================
	if (val=="5")   {
		// Ŀ�´�Ƽ ����
		document.location.replace(path2+"/ClubHome.dsh"); 
	}
	if (val=="5_1") {
		document.location.replace(path2+"/community/home/hometool/InputClubInfo.dsh"); 
	}
	if (val=="5_2") {
		document.location.replace(path2+"/community/home/bbs/BbsList.dsh?boardno=1"); 
	}
	if (val=="5_3") {
		document.location.replace(path2+"/community/home/bbs/BbsList.dsh?boardno=2"); 
	}
	if (val=="5_4") {
		document.location.replace(path2+"/community/home/clubhome/ClubPoint.dsh?boardno=3"); 
	}
	if (val=="5_5") {
		document.location.replace(path2+"/community/home/clubhome/BadClubNotice.dsh?boardno=4"); 
	}
	if (val=="5_6") {
		document.location.replace(path2+"/community/home/clubhome/ClubSearch.dsh"); 
	}
	




	if (val=="5_8") {
		document.location.replace( path2+"/community/home/clubhome/ClubTopic.dsh"); 
	}

	if (val=="5_9") {
		var url = path2+"/help/community_help01.htm";
		var tmpOption = "toolbar=no,menubar=no,width=720,height=720,left=0,top=0,scrollbars=yes";
		window.open(url,"",tmpOption);  
	}
}