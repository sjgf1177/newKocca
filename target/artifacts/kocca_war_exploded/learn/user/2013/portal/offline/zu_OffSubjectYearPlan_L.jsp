<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.off.OffClassifySubjectBean" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    box.put("title_str", "�����ȳ� - ���屳��");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
function whenSubjInfo(subj, year, subjseq, seq, area){
    location.href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectPreviewPage&p_subj="+subj+"&p_year="+year+"&p_subjseq="+subjseq+"&p_seq="+seq+"&p_area="+area;
}
</script>
<!-- container-new ���� //-->
<div id="container-new">

    <div id="mainMenu">
        <!-- ���� ���� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>���屳��</li>
            <li>
                �����ȳ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001" >������û</a></li>
                    <!-- 2015-02-23 ����
                    <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=002" >������ ���� �缺����</a></li>
                    //-->
                    <li><a href="/servlet/controller.course.EduScheduleHomePageServlet?p_process=offSchlYearPlanList" class="active">�����ȳ�</a></li>
<!-- 2015-01-07 �������
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���� ���ǽ�</a></li>
-->
                    <!-- 2014-04-23 ���� 3D������ �̷�â���η� �̰� �Ϸ������ ���Ͽ� �ּ�ó��
                    <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=004" class="active">������û</a></li>
                    //-->
                </ul>
            </li>
        </ul>
        <!-- ������ο� -->
<!-- 2015-01-07 �������
        <div class="introCategory">
            <ul>
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���� ���ǽ�</a></li>
                <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001">������û</a></li>
                <!-- 2014-04-23 ���� 3D������ �̷�â���η� �̰� �Ϸ������ ���Ͽ� �ּ�ó��
                <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=004">������û</a></li>
                //-->
<!--2015-01-07 �������
                <li><a href="/servlet/controller.course.EduScheduleHomePageServlet?p_process=offSchlYearPlanList"><strong><u>�����ȳ�</u></strong></a></li>
            </ul>
        </div>
//-->
    </div>


    <!-- ������ ���� ���� -->
    <div id="contents">
        
        <div id="subCont">

            <div class="noticBox">
                <strong>�� �ش������ ���γ����� 4�� ������ ���������Դϴ�.</strong><br />
                <strong>�� ��������</strong> : �ѱ������������ â������缺�� (02-3219-6534, thinkju@kocca.kr) <br />
                
            </div>


        </div>
        <!-- //#subCont -->
    </div>
    <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>
