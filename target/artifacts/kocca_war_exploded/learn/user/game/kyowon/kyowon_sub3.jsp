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
    box.put("leftmenu","03");                       // �޴� ���̵� ����
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
        <td height="35" align="right"  background="/images/user/game/course/type1/kyowon/sub_03/tit_all_search.gif" class="location" valign="top" style="padding:17px 10px 0px 0px"><img src="http://cyber.gameacademy.or.kr/images/user/game/common/location_bl.gif"> HOME > �����ȳ� > ��ü��û</td>
      </tr>
      <tr>
        <td height="20"></td>
      </tr>
    </table>

	<!-- top �̹����͹�ư -->
	<table width="720" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td align="center"><img src="/images/user/game/course/type1/kyowon/sub_03/top_img.jpg"></td>
	  </tr>
	  <!--
	  <tr>
	    <td align="center"><img src="/images/user/game/course/type1/kyowon/sub_03/b_img.jpg"></td>
	  </tr>
	  -->
	</table>

    <!-- ��ü���δ�� -->
    <table width="720" border="0" cellspacing="0" cellpadding="0">
      <tr>
	    <td colspan="2"><img src="/images/user/game/course/type1/kyowon/sub_03/title_01.gif"></td>
	  </tr>
	  <tr>
	    <td width="10" style="padding:7px 3px 8px 30px"><img src="/images/user/game/course/type1/kyowon/sub_03/icon.gif"></td>
		<td width="710" class="01">5�� �̻� ��ü��û �� ������ 30%����</td>
	  </tr>
	  <tr>
	    <td width="10" style="padding:7px 3px 8px 30px"><img src="/images/user/game/course/type1/kyowon/sub_03/icon.gif"></td>
		<td width="710" class="01">10�� �̻� ��ü��û �� ������ 50%����</td>
	  </tr>
	   <tr>
	    <td class="02" colspan="2" style="padding:0px 3px 10px 42px">(���а���, ����������, �ڰ��������� ��ü�̺�Ʈ�� ����Ʈ�� ���������, ������ ������ ������� �ʽ��ϴ�.)</td>
	  </tr>
    </table>

	<!-- �¶��� ��ü -->
    <table width="720" border="0" cellspacing="0" cellpadding="0">
      <tr>
	    <td colspan="2"><img src="/images/user/game/course/type1/kyowon/sub_03/title_02.gif"></td>
	  </tr>
	  <tr>
	    <td width="10" style="padding:7px 3px 8px 30px"><img src="/images/user/game/course/type1/kyowon/sub_03/icon.gif"></td>
		<td width="710" class="01">��ǥ�� �����Բ��� ��üȸ������ ����� �մϴ�.</td>
	  </tr>
	  <tr>
	    <td width="10" style="padding:5px 3px 5px 30px"><img src="/images/user/game/course/type1/kyowon/sub_03/icon.gif"></td>
		<td width="710" class="01">��ü��� �� ����ϴ� �����Ե��� �̸�,�޴�����ȣ, ��������� ��Ȯ�ϰ� �����մϴ�.</td>
	  </tr>
	  <tr>
	    <td width="10" style="padding:5px 3px 5px 30px"><img src="/images/user/game/course/type1/kyowon/sub_03/icon.gif"></td>
		<td width="710" class="01">��ü����� �Ϸ�Ǹ� ���������� ������û�� �մϴ�.</td>
	  </tr>
	  <tr>
	    <td width="10" style="padding:5px 3px 10px 30px"><img src="/images/user/game/course/type1/kyowon/sub_03/icon.gif"></td>
		<td width="710" class="01">������û �� 5�� �̻� ��ü�� ����� �� ��쿡 �ڵ����� ������ ���αݾ��� ������ ���������� ������ �Ͻ� �� �ֽ��ϴ�.</td>
	  </tr>

    </table>

	<!-- fax��ü���� -->
    <table width="720" border="0" cellspacing="0" cellpadding="0">
      <tr>
	    <td colspan="2"><img src="/images/user/game/course/type1/kyowon/sub_03/title_03.gif"></td>
	  </tr>
	  <tr>
	    <td width="10" style="padding:10px 3px 8px 30px"><img src="/images/user/game/course/type1/kyowon/sub_03/icon.gif"></td>
		<td width="710" class="01">���� ���������� ���� ��û�� �մϴ�.</td>
	  </tr>
	  <tr>
	    <td width="10" style="padding:5px 3px 5px 30px"><img src="/images/user/game/course/type1/kyowon/sub_03/icon.gif"></td>
		<td width="710" class="01">��ü��û���� �� ���� ��û���� ��� ���� ��<span class="02">Fax(02-511-9918)</span>�� �����մϴ�.</td>
	  </tr>
	  <tr>
	    <td class="02_bold" colspan="2" style="padding:20px 0px 5px 30px">[��ü ���� ���� ���� �� �������]</td>
	  </tr>
	  <tr>
	    <td class="01" colspan="2" style="padding:0px 0px 5px 30px">��ü���� ��ǥ�� �̸� Ȥ�� �б������� ������ �ϰ� �۱��Ͽ� �ֽø� ��û�� ��� ���� ���� ó�� ��</td>
	  </tr>
	  <tr>
	    <td class="01" colspan="2" style="padding:0px 0px 0px 30px"><span class="sub_bold">�������� : </span>361437-04-001948</td>
	  </tr>
	  <tr>
	    <td class="01" colspan="2" style="padding:0px 0px 0px 30px"><span class="sub_bold">������ : </span>���Ӿ�ī����</td>
	  </tr>
	  <tr>
	    <td colspan="2" style="padding:10px 0px 40px 35px"><a href="/upload/kyowon/kyowon02.hwp"><img src="/images/user/game/course/type1/kyowon/sub_03/b_down.gif" border="0"></a></td>
	  </tr>
    </table>

<br><br>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->