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
    box.put("leftmenu","02");                       // �޴� ���̵� ����
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
        <td height="35" align="right"  background="/images/user/game/course/type1/kyowon/sub_02/tit_all_search.gif" class="location" valign="top" style="padding:17px 10px 0px 0px"><img src="/images/user/game/course/type1/kyowon/location_bl.gif"> HOME > �����ȳ� > ������û</td>
      </tr>
      <tr>
        <td height="20"></td>
      </tr>
    </table>

	<!-- �������� ��û�� ���ǻ��� -->
	<table width="720" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td><img src="/images/user/game/course/type1/kyowon/sub_02/sub_title_process.jpg"></td>
	  </tr>
	</table>

    <!-- ������û�� ���ǻ��� -->
    <table width="720" border="0" cellspacing="0" cellpadding="0">
      <tr>
	    <td><img src="/images/user/game/course/type1/kyowon/sub_02/sub_title_01.gif"></td>
	  </tr>
	  <tr>
	    <td class="01_1">1.�������</td>
	  </tr>
	  <tr>
	    <td class="01" style="padding:0px 10px 10px 20px">���� 16�� �õ�����û �Ҽ� ��,��,��,�� ���� �� ����������(����/���� ����)<br>���� ���̰ų� �Ⱓ�� ����, �Ϲ����� ������ �������� �ʽ��ϴ�. </td>
	  </tr>
	  <tr>
	    <td class="01_1">2. �����Ⱓ �ߺ� ����</td>
	  </tr>
	  <tr>
	    <td class="01" style="padding:0px 10px 5px 20px">������������� ���ݿ����� ���Ͽ��� 1����, ���� ���ȿ��� 2���±��� ������ �����մϴ�.<br>(��, ���е����̶� �⼮������ �ߺ��� ��쿡�� 1���¸� ������)</td>
	  </tr>
	  <tr>
	    <td align="center"><img src="/images/user/game/course/type1/kyowon/sub_02/img_02.jpg"></td>
	  </tr>

    </table>

	 <!-- ���������ȣ -->
    <table width="720" border="0" cellspacing="0" cellpadding="0">
	 <tr>
	   <td><img src="/images/user/game/course/type1/kyowon/sub_02/sub_title_02.gif"></td>
	 </tr>
	 <tr>
	   <td class="01" style="padding:0px 5px 5px 10px">2007.03.01 ���� '�б��� ��õ��'�� �ѽ��� �����ϴ� ����� �����ǰ� �б��� �� ���� ���� ��� ����ġ�� ����<br>���� ��ȣ ���� �ý������� ����Ǿ����ϴ�. ���� ���� ��ȣ ������ ���� ���ǽǿ��� �����Ͻ� �� �ֽ��ϴ�.</td>
	 </tr>

    </table>

	 <!--�������,ȯ��-->
	<table width="720" border="0" cellspacing="0" cellpadding="0">
	 <tr>
	   <td><img src="/images/user/game/course/type1/kyowon/sub_02/sub_title_03.gif"></td>
	 </tr>
	 <tr>
	   <td class="01_1" style="padding:5px 10px 3px 10px">1. ������� �� ȯ�� ����</td>
	 </tr>
	 <tr>
	   <td class="01" style="padding:0px 10px 20px 25px">������ұⰣ: ���� ���� �� 7�ϱ����� �����մϴ�.<br>������ ȯ��: ���� ���� �� 100% ȯ��, ���� ���� �� 7�� �̳� 80% ȯ��, 7�� ��� �Ŀ��� ȯ�� �Ұ�</td>
	 </tr>

     <tr>
	  <td style="padding:0px 0px 0px 25px">
        <table width="550" border="1" cellspacing="0" cellpadding="0" bordercolor="#d2d2d2">
	     <TR class="01" bgcolor="#f3ebeb" align="center">
			<TD>��� ���� </TD>
			<TD>�����Ⱓ</TD>
			<TD>��������</TD>
	     </TR>
	     <TR class="01" align="center">
			<TD>���� ���� �� (�̳� ����)</TD>
			<TD>-</TD>
			<TD>MyClass���� ���� ��� ���� </TD>
	     </TR>
	     <TR class="01" align="center">
			<TD>���� ���� ��</TD>
			<TD>���� ȯ��</TD>
			<TD rowspan="2">���������� ��� ��û<BR>(TEL 02-540-8194)</TD>
	     </TR>
	     <TR class="01" align="center">
			<TD>���� ���� �� 7�� �̳�</TD>
			<TD>80% ȯ��</TD>
	     </TR>
	     <TR class="01" align="center">
			<TD>7�� ��� ��</TD>
			<TD>-</TD>
			<TD>��� �Ұ�</TD>
	     </TR>
	    </table>
	   </td>
      </tr>


	  <tr>
	   <td class="01_1" style="padding:20px 10px 3px 10px">2. ���� ����</td>
	  </tr>
	  <tr>
	   <td class="01" style="padding:0px 10px 5px 25px">������ұⰣ ���Ŀ� Ư���� ������ ���Ͽ� ���� ������ �Ұ����� ��Ȳ�� �߻��� ���,���� ������ �����Ͽ�<br>������ �� �ֽ��ϴ�. (�������� 14�������� ����)
         <br>(��) ������, ������ ��, ���谡�� ��ȥ�� ������ �⼮���� ���� ���ð� �Ұ����� ���<br>��, ���� ��û �ÿ��� ���������û���� ������ ���� ����(���ܼ�, ûø�� ��)�� �����ؾ� �մϴ�.<br>(FAX: 02-511-9918)
      </tr>
	  <tr>
	    <td class="01" style="padding:15px 10px 5px 25px">* ���� ��û�� �ۼ��� ���� ����<br>
		   * ��Ȯ�� ���� ������ �ۼ��� �ֽñ� �ٶ��ϴ�.<BR>
		   * ���� ����� 1ȸ�� �����մϴ�(1ȸ ���� ���� �翬�� �Ұ�)<BR>
		   * ���� ����� 1�� �̳� �����մϴ�.<BR>
		   * ���� ����� ��û ������ ����Ǳ� 14�� ������ �����մϴ�.<BR>
		   * ���� ����� ��û�Ͻ� �������θ� ���� �����մϴ�.(�ٸ� �������� ����Ұ�)<BR>
		   * ���� ����� ���������ȣ�� ���� �ο��޾� �Է��ϼž� �մϴ�.<BR></td>
	  </tr>
	  <tr>
	    <td align="center" style="padding:10px 0px 30px 0px"><a href="/upload/kyowon/kyowon01.hwp"><img src="/images/user/game/course/type1/kyowon/sub_02/b.jpg" border=0></a></td>
	  </tr>

    </table>

<br><br>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->