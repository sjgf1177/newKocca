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
    box.put("leftmenu","04");                       // �޴� ���̵� ����
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
        <td height="35" align="right"  background="/images/user/game/course/type1/kyowon/sub_04/tit_all_search.gif" class="location" valign="top" style="padding:17px 10px 0px 0px"><img src="/images/user/game/course/type1/kyowon/location_bl.gif"> HOME > �����ȳ� > �н����</td>
      </tr>
      <tr>
        <td height="20"></td>
      </tr>
    </table>

	<!-- ���������н� -->
	<table width="720" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td><img src="/images/user/game/course/type1/kyowon/sub_04/pr_img.jpg"></td>
	  </tr>
	</table>

    <!-- ���� ������ �������� -->
    <table width="720" border="0" cellspacing="0" cellpadding="0">
      <tr>
	    <td><img src="/images/user/game/course/type1/kyowon/sub_04/tit_img.gif"></td>
	  </tr>
	  <!--
	  <tr>
	    <td width="710" class="02_bold" style="padding:5px 0px 5px 15px">1. �������� Ȯ��</td>
	  </tr>
	  <tr>
	    <td width="710" class="01" style="padding:0px 0px 5px 15px">Classroom�� �����Ͻø�, �ݵ�� ���������� ���������� ���� Ȯ���ϼž� �մϴ�.<BR>���л������������ ����/���� ���� �� ������ ���õ� �ֿ� ���������� �ȳ��ǹǷ�, �����Ⱓ �߿��� ���÷�<BR>Ȯ���غ��ž� �մϴ�. </td>
	  </tr>
	  -->
	  <tr>
	    <td width="710" class="02_bold" style="padding:10px 0px 5px 15px">1. �н���� �� ����üũ</td>
	  </tr>
	  <tr>
	    <td width="710" class="01" style="padding:0px 0px 5px 15px">���Ǵ� HTML, Flash, ������ ���� ȥ�յ� ������ ���ݿ��� �������� �⺻���� �ϸ�, ���������� ���� ����(å)��<BR>�����ǰų�, �ٿ�ε�� ���� ���·� �����˴ϴ�.<BR>(��, ����ȭ/�ڰ��� ������ ������ ������ ���簡 �����ϴ�.)<BR>[�¶��α���]�� �����Ⱓ(6�� �Ǵ� 7��) ���� 1����(������~�Ͽ���) ������ ������ �Ǹ�,<BR> 1�� ��� �н� �ð��� 1.5~2�ð� ���� �Դϴ�.<BR><BR>�⼮üũ�� ������ ���� �ʰ�, [�¶��α���] �������� ���������� �����Ǳ� ������ ���ϸ��� �������� �����ŵ� �˴ϴ�.</td>
	  </tr>
	  <tr>
	    <td width="710" class="02_bold" style="padding:10px 0px 5px 15px">2. ���� �н� ��Ȳ Ȯ��</td>
	  </tr>
	  <tr>
	    <td width="710" class="01" style="padding:0px 0px 20px 15px">"���� ���ǽ�" �޴����� ������ �� ����/����, �⼮����, ����� ������ Ȯ���� �� �ֽ��ϴ�.</td>
	  </tr>
    </table>

<br><br>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->