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
    box.put("leftmenu","06");                       // �޴� ���̵� ����
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
              <td height="35" align="right"  background="/images/user/game/course/type1/kyowon/sub_06/tit_all_search.gif" class="location" valign="top" style="padding:17px 10px 0px 0px"><img src="/images/user/game/course/type1/kyowon/location_bl.gif">
                HOME > �����ȳ� > �򰡹��</td>
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
          <!-- �򰡹�� �� �̼����� -->
          <table width="720" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="2" style="padding:10px 0px 5px 5px"><img src="/images/user/game/course/type1/kyowon/sub_06/title.gif"></td>
            </tr>
            <tr>
              <td width="710" class="02_bold" style="padding:5px 0px 5px 15px">1.
                �򰡹��</td>
            </tr>
            <tr>
              <td width="710" class="01" style="padding:0px 0px 5px 30px">60�ð�
                �̻��� �������������� ������ ������ ���������� ���� �¶����򰡿� �⼮�򰡸� �ջ��Ͽ� ����˴ϴ�.</td>
            </tr>
            <tr>
              <td style="padding:0px 0px 0px 30px"> <table width="550" border="1" cellspacing="0" cellpadding="5" bordercolor="#d2d2d2">
                  <TR class="01" align="center" bgcolor="#f3ebeb">
                    <TD colspan="2">�򰡱���</TD>
                    <TD>������</TD>
                    <TD>��ȸ��</TD>
                    <TD>����</TD>
                  </TR>
                  <TR class="01" align="center">
                    <TD rowspan="3">�¶��� ��(40%)</TD>
                    <TD>����</TD>
                    <TD>���� �Ǵ� �ǽ����� ����</TD>
                    <TD>1ȸ</TD>
                    <TD>10��</TD>
                  </TR>
                  <TR class="01" align="center">
                    <TD>����</TD>
                    <TD>������/�ܴ��� ȥ��</TD>
                    <TD>1ȸ</TD>
                    <TD>10��</TD>
                  </TR>
                  <TR class="01" align="center">
                    <TD>��������</TD>
                    <TD>���ǽ� �۵��, �ڷ�Ǳ۵��,������,<BR>
                      �¶��� ���� ������</TD>
                    <TD>�������� ��</TD>
                    <TD>20��</TD>
                  </TR>
                  <TR class="01" align="center">
                    <TD>�������� ��<BR>
                      ����� ����</TD>
                    <TD>�⼮����</TD>
                    <TD>������<BR>
                      (������/�ܴ��� ȥ�� 30~40����)</TD>
                    <TD>1ȸ</TD>
                    <TD>60��</TD>
                  </TR>
                  <TR class="01" align="center">
                    <TD colspan="4">��</TD>
                    <TD>100��</TD>
                  </TR>
                </table></td>
            </tr>
            <tr>
              <td width="710" class="01" style="padding:10px 0px 5px 30px">* ����/����
                �׸� ���� ������ ������ ���� ������ �� �ֽ��ϴ�. (��: ���� 0��, ���� 30��)<BR>
                * ���������� ���� ���� �Ŀ� �ϰ� �򰡵˴ϴ�.</td>
            </tr>
            <tr>
              <td width="710" class="02_bold" style="padding:5px 0px 5px 15px">2.
                �̼����� �� ���� ���� ����</td>
            </tr>
            <tr>
              <td width="710" class="01" style="padding:0px 0px 5px 30px">���� 60��
                �̻�, ������ 80% �̻� �Ǿ�� �̼��� �����ϸ�, �̼��� ���� ��� �̼����� �߱޵��� �ʽ��ϴ�.<BR>
                ���� ������ ����� ������ ���������ڿ����� ���ݿ��� ���� ������ ���Ͽ�, ������������ ����ǥ�� ����<BR>
                80��~100�� ���̷� ����˴ϴ�.<BR>
                ������ �߻� �� ������ ó�� ���ؿ� ���� ó���˴ϴ�.</td>
            </tr>
            <tr>
              <td style="padding:0px 0px 0px 30px"> <table border="1" cellspacing="0" cellpadding="3" width="550" bordercolor="#d2d2d2">
                  <TR class="01" align="center" bgcolor="#f6f6f6">
                    <TD colspan="6">[ ������������ ����ǥ]</TD>
                  </TR>
                  <TR class="01" align="center" bgcolor="#f6f6f6">
                    <TD>����</TD>
                    <TD>�����</TD>
                    <TD>����</TD>
                    <TD>�����</TD>
                    <TD>����</TD>
                    <TD>�����</TD>
                  </TR>
                  <TR class="01" align="center">
                    <TD bgcolor="#faffe8">100</TD>
                    <TD>2.0%</TD>
                    <TD bgcolor="#faffe8">93</TD>
                    <TD>6.2%</TD>
                    <TD bgcolor="#faffe8">86</TD>
                    <TD>5.7%</TD>
                  </TR>
                  <TR class="01" align="center">
                    <TD bgcolor="#faffe8">99</TD>
                    <TD>2.6%</TD>
                    <TD bgcolor="#faffe8">92</TD>
                    <TD>6.6%</TD>
                    <TD bgcolor="#faffe8">85</TD>
                    <TD>5.1%</TD>
                  </TR>
                  <TR class="01" align="center">
                    <TD bgcolor="#faffe8">98</TD>
                    <TD>3.2%</TD>
                    <TD bgcolor="#faffe8">91</TD>
                    <TD>6.8%</TD>
                    <TD bgcolor="#faffe8">84</TD>
                    <TD>4.5%</TD>
                  </TR>
                  <TR class="01" align="center">
                    <TD bgcolor="#faffe8">97</TD>
                    <TD>3.8%</TD>
                    <TD bgcolor="#faffe8">90</TD>
                    <TD>7.0%</TD>
                    <TD bgcolor="#faffe8">83</TD>
                    <TD>3.8%</TD>
                  </TR>
                  <TR class="01" align="center">
                    <TD bgcolor="#faffe8">96</TD>
                    <TD>4.5%</TD>
                    <TD bgcolor="#faffe8">89</TD>
                    <TD>6.8%</TD>
                    <TD bgcolor="#faffe8">82</TD>
                    <TD>3.2%</TD>
                  </TR>
                  <TR class="01" align="center">
                    <TD bgcolor="#faffe8">95</TD>
                    <TD>5.1%</TD>
                    <TD bgcolor="#faffe8">88</TD>
                    <TD>6.6%</TD>
                    <TD bgcolor="#faffe8">81</TD>
                    <TD>2.6%</TD>
                  </TR>
                  <TR class="01" align="center">
                    <TD bgcolor="#faffe8">94</TD>
                    <TD>5.7%</TD>
                    <TD bgcolor="#faffe8">87</TD>
                    <TD>6.2%</TD>
                    <TD bgcolor="#faffe8">80</TD>
                    <TD>2.0%</TD>
                  </TR>
                </table></td>
            </tr>
            <tr>
              <td width="710" class="02_bold" style="padding:15px 0px 5px 15px">3.
                ��������뺸</td>
            </tr>
            <tr>
              <td width="710" class="01" style="padding:0px 0px 40px 30px">�����
                ���� ���� �� �̼���ȣ�� �߱��Ͽ� �� �õ�����û�� �̼��ڸ���� �뺸�մϴ�.<BR>
                �̼��ڿ��Դ� �̼����� �߱޵Ǹ�, ������ ���� ����� �� �ֽ��ϴ�.<BR>
                (��, �̼����� �¶��� �߱��� ��Ģ���� �ϸ�, �¶��� ���� �̼����� ������ ȿ���� �����ϴ�.)</td>
            </tr>
          </table>

<br><br>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->