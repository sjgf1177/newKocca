<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
    	box = RequestManager.getBox(request);
    }

/*============ �׽�Ʈ�� ======================*/
//    box.setSession("userid","lee1");
//    box.setSession("gadmin","A1");
//    box.setSession("resno","6906031010912");
//    box.setSession("name","�迬��");
//    box.setSession("email","jeong@credu.com");
//    box.setSession("usergubun","KDGI");
/*============ �׽�Ʈ�� ======================*/

   String v_gadmin = box.getSession("gadmin");
   String v_systemgubun = box.getString("p_systemgubun");
   

   

%>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="Javascript">
<!--
	function gomenu(url) {
		document.ff.action=url;
		document.ff.submit();
	}
-->
</script>
</head>

<body topmargin=0>
<form name="ff" method="post" action="" target="fbody">
</form>
<font style="font-size:9pt">
<%if (v_gadmin.equals("A1") || v_gadmin.equals("A1") || v_gadmin.equals("B1") || v_gadmin.equals("B1")) { %>
����<br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.SubjectServlet?p_process=listPage" target="fbody">��������</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.CourseServlet?p_process=listPage" target="fbody">����������</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.EduGroupServlet?p_process=listPage" target="fbody">�����׷����</a><br>                                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.templet.TempletServlet?p_process=listPage" target="fbody">���ø� ����</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.GrseqServlet?p_process=" target="fbody">��������</a><br>                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.OffLineSubjectServlet?p_process=listPage" target="fbody">�������� ���� ����</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.contents.MasterFormServlet?p_process=listPage" target="fbody">�������� ����</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.contents.MasterFormServlet?p_process=listPageDetail" target="fbody">�������� ����</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.contents.SCObjectServlet?p_process=listPage" target="fbody">OBJECT ����</a><br>                                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.contents.SCOServlet?p_process=listPage" target="fbody">SCO ����</a><br>                                            
��û�԰�<br>                                                                                                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.propose.ApprovalServlet?p_process= " target="fbody">��û���� ó��</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.propose.StudentManagerServlet?p_process=StudentMemberList" target="fbody">����������</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.propose.AcceptServlet?p_process=proposeFileToDB" target="fbody">�԰��ϰ�ó��</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.propose.ProposeStatusAdminServlet?p_process=ProposeMemberList" target="fbody">��û�����ȸ</a><br>                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.propose.ProposeStatusAdminServlet?p_process=ProposeCancelMemberList" target="fbody">�ݷ�/��Ҹ����ȸ</a><br>        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.propose.ApprovalServlet?p_process=OffLinelistPage" target="fbody">�������� ��û�ڰ���</a><br>                            
�н���Ȳ<br>                                                                                                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.StudentStatusAdminServlet?p_process=StudentMemberCountList" target="fbody">�԰��ο���ȸ</a><br>                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.StudentStatusAdminServlet?p_process=StudentMemberList" target="fbody">�԰������ȸ</a><br>                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.ClassServlet?p_process=listPage" target="fbody">Ŭ��������</a><br>                                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.StudyStatusAdminServlet?p_process=PersonalSearchPage" target="fbody">���κ� �н���Ȳ</a><br>                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.StudyStatusAdminServlet?p_process=LearningStatusListByGrcode" target="fbody">�����׷캰 �н���Ȳ</a><br>        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.StudyStatusAdminServlet?p_process=LearningTimeSelectList" target="fbody">�н��ð���ȸ</a><br>                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.StudyTotalStatusServlet?p_process=StudyTotalList" target="fbody">�����н���Ȳ</a><br>                        
�����<br>                                                                                                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.SubjGongAdminServlet?p_process=selectPre" target="fbody">��������</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.DicSubjAdminServlet?p_process=selectPre" target="fbody">������</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.CourseProgressAdminServlet?p_process=selectPre" target="fbody">���������������Ȳ</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.ToronAdminServlet?p_process=ToronList" target="fbody">��й�</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.ProjectAdminServlet?p_process=ProjectQuestionsAdmin" target="fbody">����Ʈ��������</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.ProjectAdminServlet?p_process=ProjectSubmitAdmin" target="fbody">����Ʈ�򰡰���</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.StudyAdminDataServlet?p_process=adminList" target="fbody">�������ڷ��</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.SubjShamAdminServlet?p_process=selectPre" target="fbody">���������н�</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.SuperiorityMemberAdminServlet?p_process=selectList" target="fbody">���ȸ������</a><br>                        
����<br>                                                                                                                                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.complete.FinishServlet?p_process=listPage" target="fbody">����ó��</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.complete.FinishInputServlet?p_process=listPage" target="fbody">���հ����ϰ�ó��</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.complete.CompleteStatusAdminServlet?p_process=CompleteMemberList" target="fbody">�����������̷�</a><br>                
����/��<br>                                                                                                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.research.SulmunAllQuestionServlet?p_process=SulmunQuestionListPage" target="fbody">������������</a><br>            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.research.SulmunAllPaperServlet?p_process=SulmunPaperListPage" target="fbody">����������</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.research.SulmunTargetMemberServlet?p_process=SulmunMemberListPage" target="fbody">��������ڰ���</a><br>                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.exam.ExamQuestionServlet?p_process=ExamQuestionListPage" target="fbody">�򰡹�������</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.exam.ExamMasterServlet?p_process=ExamMasterListPage" target="fbody">�򰡸����Ͱ���</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.exam.ExamPaperServlet?p_process=ExamPaperListPage" target="fbody">�򰡹���������</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.exam.ExamResultServlet?p_process=ExamResultListPage" target="fbody">�򰡰���м�</a><br>                            
E-test<br>                                                                                                                                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.etest.ETestGroupServlet?p_process=ETestGroupListPage" target="fbody">E-test �׷����</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.etest.ETestQuestionServlet?p_process=ETestQuestionListPage" target="fbody">E-test ��������</a><br>                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.etest.ETestMasterServlet?p_process=ETestMasterListPage" target="fbody">E-test �����Ͱ���</a><br>                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.etest.ETestMemberServlet?p_process=ETestMemberListPage" target="fbody">E-test ����ڰ���</a><br>                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.etest.ETestPaperServlet?p_process=ETestPaperListPage" target="fbody">E-test ����������</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.etest.ETestResultServlet?p_process=ETestResultListPage" target="fbody">E-test ����м�</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.jindan.JindanQuestionServlet?p_process=JindanQuestionListPage" target="fbody">���ܹ���</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.jindan.JindanResultServlet?p_process=JindanResultListPage" target="fbody">���� ����м�</a><br>                        
Ȩ������<br>                                                                                                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.NoticeAdminServlet?p_process=select" target="fbody">�������װ���</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.PollAdminServlet?p_process=select" target="fbody">CyberPoll����</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.HomePageFaqCategoryAdminServlet?p_process=selectList" target="fbody">FAQ����</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.QnaAdminServlet?p_process=selectList" target="fbody">����Q&A����</a><br>                                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.NoticeTempletServlet?p_process=select" target="fbody">�������� ���ø� ����</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.LinkSiteServlet?p_process=selectList" target="fbody">���û���Ʈ����</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.KnowBoardServlet?p_process=KonwCodeList" target="fbody">���İ��� �з��ڵ�</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.community.CommunityAdminFaqServlet?p_process=selectlist&p_faq_type=DIRECT" target="fbody">Ŀ�´�Ƽ��������</a><br>    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.community.CommunityAdminRoomServlet?p_process=listPage" target="fbody">Ŀ�´�Ƽ����</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.community.CommunityAdminPoliceServlet?p_process=listPage" target="fbody">�Ұ���Ŀ�´�Ƽ�Ű���Ȳ</a><br>                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.NewsAdminServlet?p_process=selectList&p_type=HR" target="fbody">��������</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.community.CommunityAdminCategoryServlet?p_process=selectList" target="fbody">Ŀ�´�Ƽī�װ�����</a><br>            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.HomePagePreCourseAdminServlet?p_process=selectList" target="fbody">����������������</a><br>                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.HomePageAdminSuperiorityMemberServlet?p_process=selectList" target="fbody">���� ���ȸ������Ʈ ����</a><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.KOpenPowerAdminServlet?p_process=selectList " target="fbody">�Ŀ����ͺ����</a><br>                            
ȯ�漳��<br>                                                                                                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.system.MenuAdminServlet?p_process=select" target="fbody">��޴�����</a><br>                                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.system.MenuSubAdminServlet?p_process=selectMenu" target="fbody">�޴�������</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.system.MenuAuthAdminServlet?p_process=updatePage" target="fbody">�޴������Ѱ���</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.system.ManagerAdminServlet?p_process=select" target="fbody">��ڰ���</a><br>                                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.system.CodeAdminServlet?p_process=select" target="fbody">�ڵ����</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.ClassifySubjectServlet?p_process=listPage" target="fbody">�����з�</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.system.SitemapAdminServlet?p_process=select" target="fbody">��ڻ���Ʈ��</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.system.MemberSearchServlet?p_process=memberSearchPage" target="fbody">ȸ����ȸ</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.PdsAdminServlet?p_process=" target="fbody">����ڷ��</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.system.OutUserAdminServlet?p_process=select" target="fbody">��ü����</a><br>                                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.system.DiscountServlet?p_process=selectList" target="fbody">����������</a><br>                                        
��Ÿ�׽�Ʈ<br>                                                                                                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.beta.BPCourseServlet?p_process=listPage" target="fbody">��������</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.beta.BetaMasterFormServlet?p_process=listPage" target="fbody">������������</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.beta.BetaSCObjectServlet?p_process=listPage" target="fbody">OBJECT����</a><br>                                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.beta.BetaSCOServlet?p_process=listPage" target="fbody">SCO����</a><br>                                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.beta.SubjectSimulationServlet?p_process=listPage" target="fbody">���� �����н�</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.beta.BPProjectAdminServlet?p_process=ProjectQuestionsAdmin" target="fbody">����Ʈ ��������</a><br>                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.beta.BPExamQuestionServlet?p_process=ExamQuestionListPage" target="fbody">�򰡹��� ��������</a><br>                    
���/�м�<br>                                                                                                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.statistics.StatisticsAdminServlet?p_process=StatisticsExe" target="fbody">������Ȳ</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.statistics.UserCountServlet?p_process=selectYearCnt&s_grcode=ALL" target="fbody">ȸ�������Ȳ</a><br>                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.CourseStateAdminServlet?p_process=selectPre" target="fbody">����� ���</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.system.CountServlet?p_process=selectMonthDay&s_grcode=ALL" target="fbody">����ڷα�</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.research.SulmunAllResultServlet?p_process=SulmunResultPage" target="fbody">�������</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.statistics.SubjYnAdminServlet?p_process=SubjYnExe" target="fbody">�ű�/�󰭰��� ��Ȳ</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.complete.CompleteStatusAdminServlet?p_process=CompleteRateList" target="fbody">������ ���</a><br>                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.analysis.InclinationAdminServlet?p_process=jobInclinationList" target="fbody">�н��ڼ���</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.analysis.InclinationAdminServlet?p_process=routeList" target="fbody">�н��ڰ��</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.analysis.InclinationAdminServlet?p_process=satisfactionList" target="fbody">�н��ڸ�����</a><br>                    
��������<br>                                                                                                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.polity.DiplomaAdminServlet?p_process=selectList" target="fbody">����������</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.polity.TaxAdminServlet?p_process=selectList" target="fbody">���ݰ�꼭����</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.polity.AccountAdminServlet?p_process=selectList" target="fbody">������ü����</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.polity.SettlementAdminServlet?p_process=selectList" target="fbody">ī���������</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.polity.RefundmentAdminServlet?p_process=selectList" target="fbody">ȯ�ҽ�û����</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.goyong.GoYongManageServlet?p_process=HuryunExe" target="fbody">�ƷýǽýŰ�</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.goyong.GoYongManageServlet?p_process=SuryoJeung" target="fbody">�������߱޴���</a><br>                                
��������<br>                                                                                                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.TutorAdminServlet?p_process=TutorList" target="fbody">������</a><br>                                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.TutorActionAdminServlet?p_process=listPage" target="fbody">����Ȱ������</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.TutorValuationAdminServlet?p_process=listPage" target="fbody">�����򰡰���</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.TutorAdminMainServlet?p_process=listPage&p_action=go" target="fbody">�������</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.TutorActionAdminServlet?p_process=listPage2&s_action=go" target="fbody">Ȱ������</a><br>                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.NoticeAdminServlet?p_process=selectList" target="fbody">�����������</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.AdminQnaServlet?p_process=" target="fbody">����������</a><br>                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.TutorMessageAdminServlet?p_process=listPage" target="fbody">�����޼���</a><br>                                    
�����Ǹ�<br>                                                                                                                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.book.BookAdminServlet?p_process=listPage" target="fbody">�������</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.book.BookSellAdminServlet?p_process=listPage" target="fbody">�����ǸŰ���</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.book.BookSellAdminServlet?p_process=cancelPage" target="fbody">����ȯ�Ұ���</a><br>                                
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.book.BookSellAdminServlet?p_process=listPageNew" target="fbody">�����ǸŰ���(NEW)</a><br>                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.cp.CPCourseServlet?p_process=listPage" target="fbody">������������</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.cp.CPCourseSeqServlet?p_process=listPage" target="fbody">�������� ��������</a><br>                                    
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.cp.CPEduStudentServlet?p_process=listPage" target="fbody">�԰� �ο� ��ȸ</a><br>                                        
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.cp.CPResultServlet?p_process=listPage" target="fbody">����������</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.cp.CPEduStatusServlet?p_process=listPage" target="fbody">�н���Ȳ</a><br>                                            
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.cp.CPCourseServlet?p_process=listPage3" target="fbody">���������</a><br>                                        
<% } else if (v_gadmin.equals("P1")) { %>
�н���Ȳ<br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.StudentStatusAdminServlet?p_process=StudentMemberCountList" target="fbody">�԰��ο���ȸ</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.StudentStatusAdminServlet?p_process=StudentMemberList" target="fbody">�԰������ȸ</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.StudyStatusAdminServlet?p_process=LearningTimeSelectList" target="fbody">�н��ð���ȸ</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.StudyTotalStatusServlet?p_process=StudyTotalList" target="fbody">�����н���Ȳ</a><br><br>
�����<br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.SubjGongAdminServlet?p_process=selectPre" target="fbody">��������</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.DicSubjAdminServlet?p_process=selectPre" target="fbody">������</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.CourseProgressAdminServlet?p_process=selectPre" target="fbody">���������������Ȳ</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.ToronAdminServlet?p_process=ToronList" target="fbody">��й�</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.ProjectAdminServlet?p_process=ProjectQuestionsAdmin" target="fbody">����Ʈ��������</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.ProjectAdminServlet?p_process=ProjectSubmitAdmin" target="fbody">����Ʈ�򰡰���</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.study.StudyAdminDataServlet?p_process=adminList" target="fbody">�������ڷ��</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.course.SubjShamAdminServlet?p_process=selectPre" target="fbody">���������н�</a><br><br>
����<br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.complete.FinishServlet?p_process=listPage" target="fbody">����ó��</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.complete.CompleteStatusAdminServlet?p_process=CompleteMemberList" target="fbody">�����������̷�</a><br><br>
����/��<br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.exam.ExamQuestionServlet?p_process=ExamQuestionListPage" target="fbody">�򰡹�������</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.exam.ExamMasterServlet?p_process=ExamMasterListPage" target="fbody">�򰡸����Ͱ���</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.exam.ExamPaperServlet?p_process=ExamPaperListPage" target="fbody">�򰡹���������</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.exam.ExamResultServlet?p_process=ExamResultListPage" target="fbody">�򰡰���м�</a><br><br>
Ȩ������<br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.NoticeAdminServlet?p_process=select" target="fbody">�������װ���</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.homepage.QnaAdminServlet?p_process=selectList"  target="fbody">����Q&A����</a><br><br>
��������<br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.TutorAdminMainServlet?p_process=listPage&p_action=go" target="fbody">�������</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.TutorActionAdminServlet?p_process=listPage2&s_action=go" target="fbody">Ȱ������</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.NoticeAdminServlet?p_process=selectList" target="fbody">�����������</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.AdminQnaServlet?p_process=" target="fbody">����������</a><br><br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.tutor.TutorMessageAdminServlet?p_process=listPage" target="fbody">�����޼���</a><br><br>

<% } %>
��������<br>
&nbsp;&nbsp;&nbsp;<a href="/servlet/controller.off.OffBatchRecordsAdminServlet?p_process=FileToDBPage" target="fbody">��ġ�۾�</a><br><br>
</p>
</body>
</html>
