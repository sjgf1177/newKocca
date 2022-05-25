<%
//**********************************************************
//  1. ��      ��: LEARNING STATUS LIST BY GRCODE
//  2. ���α׷���: za_LearningStatusByGrcode_L.jsp
//  3. ��      ��: �����׷캰 �н���Ȳ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.1.28
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_grseq       = "";
    String  v_grseqnm     = "";
    String  v_isnewcourse = "";
    String  v_course    = "";
    String  v_cyear     = "";
    String  v_courseseq = "";
    String  v_coursenm  = "";
    String  v_subj      = "";
    String  v_year      = "";
    String  v_subjseq   = "";
    String  v_subjseqgr = "";
    String  v_subjnm    = "";
    String  v_isonoff   = "";
    String v_onoff_value= "";
	String v_isbelongcourse = "";		//���������� ����
    int     v_educnt      =  0;
    int     v_gradcnt     =  0;
    int     v_tstep       =  0;
    int     v_mtest       =  0;
    int     v_ftest       =  0;
    int     v_htest       =  0;
    int     v_report      =  0;
    int     v_etc1        =  0;
    int     v_etc2        =  0;
    int     v_avtstep     =  0;
    int     v_avmtest     =  0;
    int     v_avftest     =  0;
    int     v_avhtest     =  0;
    int     v_avreport    =  0;
    int     v_avetc1      =  0;
    int     v_avetc2      =  0;
    int     v_score       =  0;
    int     v_point       =  0;
    int     v_act         =  0;
    int     v_avg_tstep   =  0;
    int     v_avg_mtest   =  0;
    int     v_avg_ftest   =  0;
    int     v_avg_htest   =  0;
    int     v_avg_report  =  0;
    int     v_avg_etc1    =  0;
    int     v_avg_etc2    =  0;
    int     v_avg_avtstep =  0;
    int     v_avg_avmtest =  0;
    int     v_avg_avftest =  0;
    int     v_avg_avhtest =  0;
    int     v_avg_avreport=  0;
    int     v_avg_avetc1  =  0;
    int     v_avg_avetc2  =  0;
    int     v_avg_score   =  0;
    int     v_avg_act     =  0;
    int     v_avg_grad    =  0;
    int     v_total       =  0;
    int     v_rowspan     =  0;
    int     i             =  0;
	int		v_subjcnt	  = 0;		//�����������ϰ�� ���� ������

    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
    String  v_orderColumn  = box.getString("p_orderColumn");           //������ �÷���

    ArrayList list      = null;
    //DEFINED class&variable END

    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getString("s_grseq");         //��������
    String  ss_grseqnm   = box.getString("s_grseqnm");         //��������
    String  ss_action    = box.getString("s_action");
    String  v_ongo      = "whenSelection('go')";

    //DEFINED in relation to select END

    if (ss_action.equals("go")) {    //go button ���ýø� list ���
        list = (ArrayList)request.getAttribute("LearningStatusListByGrcode");
    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    // �˻�
    function whenSelection(p_action) {
        if (p_action=="go"){
            if (chkParam() == false) {
                return;
            }
            top.ftop.setPam();
        }
        document.form1.s_action.value = p_action;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
        document.form1.p_process.value = 'LearningStatusListByGrcode';
        document.form1.submit();
    }

    // ����
    function whenOrder(column) {
        if (document.form1.p_orderType.value == " asc") {
            document.form1.p_orderType.value = " desc";
        } else {
            document.form1.p_orderType.value = " asc";
        }

        document.form1.p_orderColumn.value = column;
        whenSelection("go");
    }

    //���� ���
    function whenExcel() {
        if(document.form1.s_action.value != "go"){
            alert('���� ��ȸ�� �ֽʽÿ�');
            return;
      }
        //window.self.name = "LearningStatusListByGrcode";
        //open_window("openExcel","","100","100","700","400","yes","yes","yes","yes","yes");
        //document.form1.target = "openExcel";
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
        document.form1.p_process.value = 'LearningStatusExcelByGrcode';
        document.form1.submit();
    }

    // �Ķ���� üũ
    function chkParam() {
      if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
        alert("�����׷��� �����ϼ���.");
        return false;
      }
    }

//-->
</SCRIPT>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->
    <input type="hidden" name="p_orderColumn" value="<%=v_orderColumn%>">
    <input type="hidden" name="p_orderType" value="<%=v_orderType%>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
       <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/study/s_title08.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>

      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">

            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">

                  <table cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                      <td align="left" valign="middle">&nbsp;
<script type="text/javascript">
var startup = 0;
function Main_s_grseq(){
	if (startup > 0)
		changes_grseq(document.form1.s_grcode.value, document.form1.s_gyear.value);
	startup++;
}
</script>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<font color="red">��</font>
	�����׷� <kocca_select:select name="s_grcode" sqlNum="course.0001"  param=" "
	onChange="changes_gyear(this.value);" attr=" " selectedValue="<%= ss_grcode %>" isLoad="true" all="false" />
<font color="red">��</font>
	���� <kocca_select:select name="s_gyear" sqlNum="course.year"  param="<%= ss_grcode %>"
		onChange="changes_grseq(s_grcode.value, this.value);" afterScript="Main_s_grseq" attr=" " selectedValue="<%= ss_gyear %>" isLoad="true" all="false" />
	�������� <kocca_select:select name="s_grseq" sqlNum="course.subjseq"
		param="<%=ss_grcode%>" param2="<%=ss_gyear%>"
		attr=" '" onChange="" afterScript="" selectedValue="<%= ss_grseq %>" isLoad="true" all="true" />

                       &nbsp;<a href="javascript:<%=v_ongo%>"><img src="/images/admin/button/b_go.gif" align="absmiddle" border="0"></a>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- form �� ----------------->

      <br>
      <br>

      <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right">
            <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a>
            </td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư �� ----------------->
      <!----------------- �����׷캰 �н���Ȳ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr>
          <td colspan="15" class="table_top_line"></td>
        </tr>
          <tr>
            <td width="5%" class="table_title">NO</td>
            <td class="table_title"><a href="javascript:whenOrder('grseq')" class="e">��������</a></td>
            <td class="table_title" colspan="2"><a href="javascript:whenOrder('subj')" class="e">����</a></font></td>
            <td class="table_title"><a href="javascript:whenOrder('subjseq')" class="e">��������</a></td>
            <!--td class="table_title"><a href="javascript:whenOrder('isonoff')" class="e">����</a></td-->
            <td class="table_title">�����ο�</td>
            <td width="7" class="table_title">������</td>
            <td width="5" class="table_title">�߰���</td>
			<td width="5" class="table_title">������</td>
			<td width="5" class="table_title">������</td>
			<td width="5" class="table_title">����Ʈ</td>
			<td width="5" class="table_title">������</td>
			<td width="5" class="table_title">��Ÿ</td>
			<td width="5" class="table_title">����</td>
            <td width="5" class="table_title">������</td>
          </tr>

<%
if (ss_action.equals("go")) {    //go button ���ýø� list ���


	//������ �ְ� ��������
	if( list.size() != 0 ){		// �˻��� ������ �ִٸ�
	               v_total = list.size();

                for(i = 0; i < v_total; i++) {
                    StudyStatusData data  = (StudyStatusData)list.get(i);
                    v_grseq         = data.getGrseq();
                    v_grseqnm       = data.getGrseqnm();
                    v_course        = data.getCourse();
                    v_cyear         = data.getCyear();
                    v_courseseq     = data.getCourseseq();
                    v_coursenm      = data.getCoursenm();
                    v_subj          = data.getSubj();
                    v_year          = data.getYear();
                    v_subjseq       = data.getSubjseq();
                    v_subjseqgr     = data.getSubjseqgr();
                    v_subjnm        = data.getSubjnm();
                    v_isonoff       = data.getIsonoff();
                    v_educnt        = data.getEducnt();
                    v_tstep         = data.getTstep();
                    v_mtest         = data.getMtest();
                    v_ftest         = data.getFtest();
                    v_htest         = data.getHtest();
                    v_report        = data.getReport();
                    v_etc1          = data.getEtc1();
                    v_etc2          = data.getEtc2();
                    v_avtstep       = data.getAvtstep();
                    v_avmtest       = data.getAvmtest();
                    v_avftest       = data.getAvftest();
                    v_avhtest       = data.getAvhtest();
                    v_avreport      = data.getAvreport();
                    v_avetc1        = data.getAvetc1();
                    v_avetc2        = data.getAvetc2();
                    v_score         = data.getScore();
                    v_act           = data.getAct();
                    v_gradcnt       = data.getGradcnt();
                    v_rowspan       = data.getRowspan();
                    v_isnewcourse   = data.getIsnewcourse();
					v_isbelongcourse = data.getIsbelongcourse();
                    v_avg_grad      = (v_gradcnt * 100)  / v_educnt;
                    //out.println("v_gradcnt=>"+v_gradcnt);
                    //if(v_isonoff.equals("ON"))      {  v_onoff_value  = "���̹�����"; }
                    //else                            {  v_onoff_value  = "���հ���";   }
                    //else if(v_isonoff.equals("OFF")){  v_onoff_value  = "���հ���";   }


			// �������������ο� ���� �޸� ���
			if(v_isbelongcourse.equals("Y")){		//�����������϶� - ������ course�� �Ͽ� �� �ȿ��� for������ ���� �������
					v_subjcnt = data.getSubjcnt();
		%>
				  <tr>
					<td class="table_01"><%= list.size() - i %></td>
					<td class="table_02_1" rowspan="<%=v_subjcnt%>"><%=v_grseqnm%></td>
                    <td class="table_02_2" rowspan="<%=v_subjcnt%>"><font class="text_color04"><%=v_coursenm%></font></td>
					<td class="table_02_2"><%=v_subjnm%></td>
					<td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
					<!--td class="table_02_1" width="70"><%//=v_onoff_value%></td-->
					<td class="table_02_1"><%=v_educnt%></td>
					<td class="table_02_1"><%=v_tstep%>(<%=v_avtstep%>)</td>
					<td class="table_02_1"><%=v_mtest%>(<%=v_avmtest%>)</td>
					<td class="table_02_1"><%=v_ftest%>(<%=v_avftest%>)</td>
					<td class="table_02_1"><%=v_htest%>(<%=v_avhtest%>)</td>
					<td class="table_02_1"><%=v_report%>(<%=v_avreport%>)</td>
					<td class="table_02_1"><%=v_etc1%>(<%=v_avetc1%>)</td>
					<td class="table_02_1"><%=v_etc2%>(<%=v_avetc2%>)</td>
					<td class="table_02_1"><%=v_score%></td>
					<td class="table_02_1"><%=v_avg_grad%>%</td>
				  </tr>
				 <%
                    v_avg_tstep     += v_tstep;
                    v_avg_mtest     += v_mtest;
                    v_avg_ftest     += v_ftest;
                    v_avg_htest     += v_htest;
                    v_avg_report    += v_report;
                    v_avg_etc1      += v_etc1;
                    v_avg_etc2      += v_etc2;
                    v_avg_avtstep   += v_avtstep;
                    v_avg_avmtest   += v_avmtest;
                    v_avg_avftest   += v_avftest;
                    v_avg_avhtest   += v_avhtest;
                    v_avg_avreport  += v_avreport;
                    v_avg_avetc1    += v_avetc1;
                    v_avg_avetc2    += v_avetc2;
                    v_avg_score     += v_score;
                    v_avg_act       += v_act;

					//�������� ���� ������ �����ִ� ������ ���.
					for( int j = 0;  j < (v_subjcnt -1 ); j++ ){
						i++;
						data  = (StudyStatusData)list.get(i);
						v_grseq         = data.getGrseq();
						v_grseqnm       = data.getGrseqnm();
						v_course        = data.getCourse();
						v_cyear         = data.getCyear();
						v_courseseq     = data.getCourseseq();
						v_coursenm      = data.getCoursenm();
						v_subj          = data.getSubj();
						v_year          = data.getYear();
						v_subjseq       = data.getSubjseq();
						v_subjseqgr     = data.getSubjseqgr();
						v_subjnm        = data.getSubjnm();
						v_isonoff       = data.getIsonoff();
						v_educnt        = data.getEducnt();
	                    v_tstep         = data.getTstep();
	                    v_mtest         = data.getMtest();
	                    v_ftest         = data.getFtest();
	                    v_htest         = data.getHtest();
	                    v_report        = data.getReport();
	                    v_etc1          = data.getEtc1();
	                    v_etc2          = data.getEtc2();
	                    v_avtstep       = data.getAvtstep();
	                    v_avmtest       = data.getAvmtest();
	                    v_avftest       = data.getAvftest();
	                    v_avhtest       = data.getAvhtest();
	                    v_avreport      = data.getAvreport();
	                    v_avetc1        = data.getAvetc1();
	                    v_avetc2        = data.getAvetc2();
	                    v_score         = data.getScore();
	                    v_act           = data.getAct();
						v_gradcnt       = data.getGradcnt();
						v_rowspan       = data.getRowspan();
						v_isnewcourse   = data.getIsnewcourse();
						v_isbelongcourse = data.getIsbelongcourse();
						v_avg_grad      = (v_gradcnt * 100)  / v_educnt;
						//if(v_isonoff.equals("ON"))      {  v_onoff_value  = "���̹�����"; }
						//else                            {  v_onoff_value  = "���հ���";   }
						//else if(v_isonoff.equals("OFF")){  v_onoff_value  = "���հ���"; }

%>
				  <tr>
					<td class="table_01"><%= list.size() - i %></td>
					<td class="table_02_2"><%=v_subjnm%></td>
					<td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
					<!--td class="table_02_1" width="70"><%//=v_onoff_value%></td-->
					<td class="table_02_1"><%=v_educnt%></td>
					<td class="table_02_1"><%=v_tstep%>(<%=v_avtstep%>)</td>
					<td class="table_02_1"><%=v_mtest%>(<%=v_avmtest%>)</td>
					<td class="table_02_1"><%=v_ftest%>(<%=v_avftest%>)</td>
					<td class="table_02_1"><%=v_htest%>(<%=v_avhtest%>)</td>
					<td class="table_02_1"><%=v_report%>(<%=v_avreport%>)</td>
					<td class="table_02_1"><%=v_etc1%>(<%=v_avetc1%>)</td>
					<td class="table_02_1"><%=v_etc2%>(<%=v_avetc2%>)</td>
					<td class="table_02_1"><%=v_score%></td>
					<td class="table_02_1"><%=v_avg_grad%>%</td>
				  </tr>
<%
                    v_avg_tstep     += v_tstep;
                    v_avg_mtest     += v_mtest;
                    v_avg_ftest     += v_ftest;
                    v_avg_htest     += v_htest;
                    v_avg_report    += v_report;
                    v_avg_etc1      += v_etc1;
                    v_avg_etc2      += v_etc2;
                    v_avg_avtstep   += v_avtstep;
                    v_avg_avmtest   += v_avmtest;
                    v_avg_avftest   += v_avftest;
                    v_avg_avhtest   += v_avhtest;
                    v_avg_avreport  += v_avreport;
                    v_avg_avetc1    += v_avetc1;
                    v_avg_avetc2    += v_avetc2;
                    v_avg_score     += v_score;
                    v_avg_act       += v_act;

				}//for��

		}else{		//������������ �ƴ϶��
%>

				  <tr>
					<td class="table_01"><%= list.size() - i %></td>
					<td class="table_02_1"><%=v_grseqnm%></td>
					<td class="table_02_2" colspan="2"><font class="text_color04"><%=v_subjnm%></font></td>
					<td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
					<!--td class="table_02_1" width="70"><%//=v_onoff_value%></td-->
					<td class="table_02_1"><%=v_educnt%></td>
					<td class="table_02_1"><%=v_tstep%>(<%=v_avtstep%>)</td>
					<td class="table_02_1"><%=v_mtest%>(<%=v_avmtest%>)</td>
					<td class="table_02_1"><%=v_ftest%>(<%=v_avftest%>)</td>
					<td class="table_02_1"><%=v_htest%>(<%=v_avhtest%>)</td>
					<td class="table_02_1"><%=v_report%>(<%=v_avreport%>)</td>
					<td class="table_02_1"><%=v_etc1%>(<%=v_avetc1%>)</td>
					<td class="table_02_1"><%=v_etc2%>(<%=v_avetc2%>)</td>
					<td class="table_02_1"><%=v_score%></td>
					<td class="table_02_1"><%=v_avg_grad%>%</td>
				  </tr>
				 <%
                    v_avg_tstep     += v_tstep;
                    v_avg_mtest     += v_mtest;
                    v_avg_ftest     += v_ftest;
                    v_avg_htest     += v_htest;
                    v_avg_report    += v_report;
                    v_avg_etc1      += v_etc1;
                    v_avg_etc2      += v_etc2;
                    v_avg_avtstep   += v_avtstep;
                    v_avg_avmtest   += v_avmtest;
                    v_avg_avftest   += v_avftest;
                    v_avg_avhtest   += v_avhtest;
                    v_avg_avreport  += v_avreport;
                    v_avg_avetc1    += v_avetc1;
                    v_avg_avetc2    += v_avetc2;
                    v_avg_score     += v_score;
                    v_avg_act       += v_act;
		}

	}//for��

					//��ձ��ϱ�
					v_avg_tstep     = v_avg_tstep/v_total;
                    v_avg_mtest     = v_avg_mtest/v_total;
                    v_avg_ftest     = v_avg_ftest/v_total;
                    v_avg_htest     = v_avg_htest/v_total;
                    v_avg_report    = v_avg_report/v_total;
                    v_avg_etc1      = v_avg_etc1/v_total;
                    v_avg_etc2      = v_avg_etc2/v_total;
                    v_avg_avtstep   = v_avg_avtstep/v_total;
                    v_avg_avmtest   = v_avg_avmtest/v_total;
                    v_avg_avftest   = v_avg_avftest/v_total;
                    v_avg_avhtest   = v_avg_avhtest/v_total;
                    v_avg_avreport  = v_avg_avreport/v_total;
                    v_avg_score     = v_avg_score/v_total;
                    v_avg_act       = v_avg_act/v_total;

%>

				<tr>
				  <td colspan="6" class="table_02_3">���</td>
				  <td class="table_02_3"><%=v_avg_tstep%>(<%=v_avg_avtstep%>)</td>
				  <td class="table_02_3"><%=v_avg_mtest%>(<%=v_avg_avmtest%>)</td>
				  <td class="table_02_3"><%=v_avg_ftest%>(<%=v_avg_avftest%>)</td>
				  <td class="table_02_3"><%=v_avg_htest%>(<%=v_avg_avhtest%>)</td>
				  <td class="table_02_3"><%=v_avg_report%>(<%=v_avg_avreport%>)</td>
				  <td class="table_02_3"><%=v_avg_etc1%>(<%=v_avg_avetc1%>)</td>
				  <td class="table_02_3"><%=v_avg_etc2%>(<%=v_avg_avetc2%>)</td>
				  <td class="table_02_3"><%=v_avg_score%></td>
				  <td class="table_02_3">&nbsp;</td>
				</tr>
<%
	}else{			// ������ ���ٸ�
%>

              <tr>
                <td align="center" bgcolor="#F7F7F7" height="50" colspan="15">��ϵ� ������ �����ϴ�</td>
              </tr>

<%
	}
}
%>
      </table>
      <!----------------- �����׷캰 �н���Ȳ �� ----------------->
     <br>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
</body>
</html>
