<%
//**********************************************************
//  1. ��      ��: �������� ����Ʈ
//  2. ���α׷���:  gu_EducationSchedule_L.jsp
//  3. ��      ��: �������� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 12. 20
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process         = box.getString("p_process");
    box.put("leftmenu","05");                       // �޴� ���̵� ����
    String  ss_year    = box.getStringDefault("s_year",FormatDate.getDate("yyyy"));

    String  v_upperclass      =  "";
    String  v_middleclass     =  "";
    String  v_lowerclass      =  "";
    String  v_isonoff         =  "";
    String  v_course          =  "";
    String  v_coursenm        =  "";
    String  v_subj            =  "";
    String  v_year            =  "";
    String  v_subjseq         =  "";
    String  v_subjseqgr       =  "";
    String  v_subjnm          =  "";
    String  v_classnm         =  "";
    String  v_propstart       =  "";
    String  v_propend         =  "";
    int     v_biyong          =  0;
    String  v_eduperiod       =  "";

    String  v_isonoff_value   =  "";
    String  v_propstart_value =  "";
    String  v_propend_value   =  "";
    int     v_total           =  0;
    int     i                 =  0;
    DecimalFormat  df = new DecimalFormat("###,##0");

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topKyowonCourse.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--
    function whenSelect(){
        document.form1.p_process.value = 'EducationSchedule';
        document.form1.action='/servlet/controller.propose.MainSubjSearchServlet';
        document.form1.target = "_self";
        document.form1.submit();
    }

// ���� ���뺸��
function whenSubjInfo(subj){
    document.form1.p_subj.value = subj;
    document.form1.p_process.value  = 'SubjectPreviewPage';
    document.form1.p_rprocess.value = 'EducationSchedule';
    document.form1.action='/servlet/controller.course.CourseIntroServlet';
    document.form1.target = "_self";
    document.form1.submit();
}

// �Ϲ�/������, ��з��ڵ� ����
function whenSelect(sel,gubun){
    document.form1.p_iscourseYn.value = sel;
    document.form1.p_gubun.value   = gubun;
    document.form1.p_tabnum.value  = gubun;
    document.form1.target = "_self";
    document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
    document.form1.p_process.value = 'SubjectList';

    document.form1.submit();
}
//-->
</SCRIPT>

    <!-- title -->
    <table width="720" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="35" align="right"  background="/images/user/game/course/type1/kyowon/sub_05/tit_all_search.gif" class="location" valign="top" style="padding:17px 10px 0px 0px"><img src="/images/user/game/course/type1/kyowon/location_bl.gif"> HOME > �����ȳ� > �⼮����</td>
      </tr>
      <tr>
        <td height="20"></td>
      </tr>
    </table>

	<!-- ���������� -->
	<table width="720" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td><img src="/images/user/game/course/type1/kyowon/sub_05/pr_img.jpg"></td>
	  </tr>
	</table>

    <!-- �⼮���� -->
    <table width="720" border="0" cellspacing="0" cellpadding="0">
      <tr>
	    <td colspan="2" style="padding:10px 0px 5px 5px"><img src="/images/user/game/course/type1/kyowon/sub_05/tit_01.gif"></td>
	  </tr>
	  <tr>
	    <td width="710" class="02_bold" style="padding:5px 0px 5px 15px" colspan="2">1. �����Ͻ�</td>
	  </tr>
	  <tr>
	    <td width="710" class="01" style="padding:0px 0px 5px 30px" colspan="2">�⼮������ ���� ������ �濡 1ȸ �ǽõǸ�, ���� 100�� ���� �� 60���� �����ϹǷ� ���� �ÿ��� ���� �̼��� �Ұ����մϴ�.<BR>����� �����Ͻô� ������������ �ȳ� �޴��� �����Ͻñ� �ٶ��ϴ�.</td>
	  </tr>
	  <tr>
	    <td width="710" class="02_bold" style="padding:10px 0px 5px 15px" colspan="2">2. �������</td>
	  </tr>
	  <tr>
	    <td style="padding:0px 5px 5px 30px"><img src="/images/user/game/course/type1/kyowon/sub_03/icon.gif"></td>
	    <td width="710" class="01" style="padding:0px 0px 5px 0px">���� 30�� �������� �ǽõǸ�, ���� ������� �����Ⱓ �� ������ �����˴ϴ�.</td>
	  </tr>
	  <tr>
	    <td style="padding:0px 5px 5px 30px"><img src="/images/user/game/course/type1/kyowon/sub_03/icon.gif"></td>
	    <td width="710" class="01" style="padding:0px 0px 10px 0px">���� ������ ������ ���質 ��Ÿ ������ ���Ͽ� �ٸ� �������� �����Ͽ� ���ð� �����մϴ�.</td>
	  </tr>
	  </table>

	  <table border="1" cellspacing="0" cellpadding="3" bordercolor="#77a6d6">
	  <tr>
	     <td width="300" class="01" colspan="2"><span class="02">����� :</span> ����/�Ϻ�, ����/����, ����/����, ����/��õ<BR>
																					<span class="02">������ :</span> ��õ, ����, �ϻ�, ������, �Ⱦ�, �д�<BR>
																					<span class="02">������ :</span> ��õ, ����, ����<BR>
																					<span class="02">��û�� :</span> ����, õ��, û��, ����, ����<BR>
																					<span class="02">���� :</span> �λ�, ���, â��, �뱸, �ȵ�, ����, ����<BR>
																					<span class="02">����� :</span> ����, ����, ��õ, ����<BR>
																					<span class="02">���ֱ� :</span> ����<BR>
            </td>
	   </tr>
	 </table>

     <table width="720" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td width="710" class="02_bold" style="padding:20px 0px 5px 15px" colspan="2">3. �������� �� ���ѽð�</td>
	  </tr>
	  <tr>
	    <td width="710" class="01" style="padding:0px 0px 5px 30px" colspan="2">������ ���·� �����İ� �ܴ��� ������ ȥ��Ǿ� �����˴ϴ�(�� 30����).<BR>���ѽð��� 1����� 1�ð��Դϴ�.</td>
	  </tr>
	  <tr>
	    <td width="710" class="02_bold" style="padding:10px 0px 5px 15px" colspan="2">4. ����Ȯ��</td>
	  </tr>
	  <tr>
	    <td width="710" class="01" style="padding:0px 0px 40px 30px" colspan="2">�⼮���� ������ ������ ���������� ���Ͽ� �����˴ϴ�.</td>
	  </tr>
    </table>

<br><br>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->