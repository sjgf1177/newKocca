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
    box.put("leftmenu","07");                       // �޴� ���̵� ����
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
        <td height="35" align="right"  background="/images/user/game/course/type1/kyowon/sub_07/tit_all_search.gif" class="location" valign="top" style="padding:17px 10px 0px 0px"><img src="/images/user/game/course/type1/kyowon/location_bl.gif"> HOME > �����ȳ� > ������������</td>
      </tr>
      <tr>
        <td height="20"></td>
      </tr>
    </table>

	<!-- ������������ -->
	<table width="720" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td width="20" align="center" style="padding:0px 0px 0px 10px"><img src="/images/user/game/course/type1/kyowon/sub_07/icon.gif"></td>
		<td width="700" class="01" style="padding:5px 0px 5px 0px">2008�⵵ ������������(4����, 2����) ������������ �Դϴ�.</td>
	  </tr>
	  <tr>
	    <td width="20" align="center" style="padding:0px 0px 0px 10px"><img src="/images/user/game/course/type1/kyowon/sub_07/icon.gif"></td>
		<td width="700" class="01" style="padding:5px 0px 5px 0px">��������� �¶������� ��û�Ͻð� �������� ��ȣ�� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="01_bold" style="padding:5px 0px 5px 20px">* �⼮�������: ���� 30�� ����� ���� �ǽ�</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="01_1" style="padding:0px 0px 10px 20px">����(����/����), ����(����/�Ϻ�), ����(����/����), ����(����/��õ), ������, ����, ��õ, �Ⱦ�, �λ�, �뱸, ����<BR>û��, ����, ����, ����, ����, ���, â��, ����, �ȵ�, ����, ��õ, ����, ����, ��õ, õ��, �ϻ�, �д�, ����, ����</td>
	  </tr>
	  </table>

	   <!-- ǥ -->
		  <table width="700" border="1" cellspacing="0" cellpadding="3" bordercolor="#d2d2d2">
		  <TR class="01" align="center" bgcolor="#cfe1f3">
			<TD>������</TD>
			<TD>����</TD>
			<TD>������û�Ⱓ</TD>
			<TD colspan="2">�����Ⱓ</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD rowspan="2" bgcolor="#f2f8fd">�ܿ����</TD>
			<TD rowspan="2" bgcolor="#e8faff">2����, 3��</TD>
			<TD>2007.11.19~2008. 01. 13</TD>
			<TD bgcolor="#e8faff">1��</TD>
			<TD>2008.01.14~2008.02.03</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD>2007.11.19~2008. 02. 03</TD>
			<TD bgcolor="#e8faff">2��</TD>
			<TD>2008.02.04~2008.02.24</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD bgcolor="#f2f8fd">Ư���б�</TD>
			<TD bgcolor="#e8faff">2����. 3��</TD>
			<TD>2007.02.04~2008. 02. 24</TD>
			<TD bgcolor="#e8faff">3��</TD>
			<TD>2008.02.25~2008.03.16</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD rowspan="4" bgcolor="#f2f8fd">��ݱ�<BR>(1�б�)</TD>
			<TD rowspan="2" bgcolor="#e8faff">2����, 3��</TD>
			<TD>2008.02.11~2008.04.06</TD>
			<TD bgcolor="#e8faff">4��</TD>
			<TD>2008.04.07~2008.04.27</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD>2008.02.11~2008.04.27</TD>
			<TD bgcolor="#e8faff">5��</TD>
			<TD>2008.04.28~2008.05.18</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD rowspan="2" bgcolor="#e8faff">2����, 3��</TD>
			<TD>2008.04.21~2008.05.25</TD>
			<TD bgcolor="#e8faff">6��</TD>
			<TD>2008.05.26~2008.06.15</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD>2008.04.21~2008.06.15</TD>
			<TD bgcolor="#e8faff">7��</TD>
			<TD>2008.06.16~2008.07.06</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD rowspan="2" bgcolor="#f2f8fd">��������</TD>
			<TD rowspan="2" bgcolor="#e8faff">2����, 3��</TD>
			<TD>2008.06.09~2008.07.13</TD>
			<TD bgcolor="#e8faff">8��</TD>
			<TD>2008.07.14~2008.08.03</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD>2008.06.09~2008.08.03</TD>
			<TD bgcolor="#e8faff">9��</TD>
			<TD>2008.08.04~2008.08.24</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD rowspan="4" bgcolor="#f2f8fd">�Ϲݱ�<BR>(2�б�)</TD>
			<TD rowspan="2" bgcolor="#e8faff">2����, 3��</TD>
			<TD>2008.08.11~2008.09.21</TD>
			<TD bgcolor="#e8faff">10��</TD>
			<TD>2008.09.22~2008.10.12</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD>2008.08.11~2008.10.12</TD>
			<TD bgcolor="#e8faff">11��</TD>
			<TD>2008.10.13~2008.11.02</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD rowspan="2" bgcolor="#e8faff">2����, 3��</TD>
			<TD>2008.10.06~2008.11.09</TD>
			<TD bgcolor="#e8faff">12��</TD>
			<TD>2008.11.10~2008.11.30</TD>
		  </TR>
		  <TR class="01" align="center">
			<TD>2008.10.06~2008.11.30</TD>
			<TD bgcolor="#e8faff">13��</TD>
			<TD>2008.12.01~2008.12.21</TD>
		  </TR>
		  </table>
	<table width="720" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td width="20" align="center" style="padding:0px 0px 0px 10px"><img src="/images/user/game/course/type1/kyowon/icon.gif"></td>
		<td width="700" class="01_1" style="padding:10px 0px 5px 0px">���������� ���������̳� ���бⰣ ������ ���� �ټ� ������ �� �ֽ��ϴ�.</td>
	  </tr>
	  <tr>
	    <td colspan="2" align="right"><img src="/images/user/game/course/type1/kyowon/sub_07/b_img.gif"></td>
	  </tr>
	</table>

<br><br>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->