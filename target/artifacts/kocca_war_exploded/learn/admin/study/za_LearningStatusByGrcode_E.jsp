<%
//**********************************************************
//  1. ��      ��: LEARNING STATUS EXCEL BY GRCODE
//  2. ���α׷���: za_LearningStatusByGrcode_E.jsp
//  3. ��      ��: �����ְ��� �н���Ȳ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.1.28
//  7. ��      ��:
//***********************************************************
%>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<%//@ page language="java" contentType="application/vnd.ms-excel;name=My_Excel;charset=euc-kr" %>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
	response.setContentType("application/vnd.ms-text");
	response.setHeader("Content-Disposition", "inline; filename=za_StudentMember_E.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

	//DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

	ArrayList list = (ArrayList)request.getAttribute("LearningStatusExcelByGrcode");

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
    int     v_educnt    =  0;
    int     v_gradcnt   =  0;
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
    int     v_total     =  0;
    int     v_rowspan   =  0;
    int     i           =  0;

    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
    String  v_orderColumn  = box.getString("p_orderColumn");           //������ �÷���

    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getString("s_grseq");         //��������
    String  ss_grseqnm   = box.getString("s_grseqnm");         //��������
    String  ss_action    = box.getString("s_action");
    String  v_ongo      = "whenSelection('go')";

%>
<HTML>
<HEAD>
<TITLE></TITLE>

</HEAD>

<BODY leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" >

      <!----------------- �����׷캰 �н���Ȳ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out" border="1">
        <tr>
          <td colspan="21" class="table_top_line"></td>
        </tr>
          <tr>
            <td width="5%" class="table_title">NO</td>
            <td class="table_title">��������</td>
            <td class="table_title">����</td>
            <td class="table_title">��������</a></td>
            <!--td class="table_title">����</td-->
            <td class="table_title">�����ο�</td>
            <td class="table_title">������</td>
            <td class="table_title">�߰���</td>
			<td class="table_title">������</td>
			<td class="table_title">������</td>
			<td class="table_title">����Ʈ</td>
			<td class="table_title">������</td>
			<td class="table_title">��Ÿ</td>
            <td class="table_title">������ ��������</td>
            <td class="table_title">�߰��� ��������</td>
			<td class="table_title">������ ��������</td>
			<td class="table_title">������ ��������</td>
			<td class="table_title">����Ʈ ��������</td>
			<td class="table_title">������ ��������</td>
			<td class="table_title">��Ÿ ��������</td>
			<td class="table_title">����</td>
            <td class="table_title">������</td>
          </tr>

<%
		       v_total = list.size();
if(list.size() != 0 ){						//������ �ִٸ�


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
                    v_avg_grad      = (v_gradcnt * 100)  / v_educnt;
                    //if(v_isonoff.equals("ON"))      {  v_onoff_value  = "���̹�����"; }
                    //else                            {  v_onoff_value  = "���հ���";   }
                    //else if(v_isonoff.equals("OFF")){  v_onoff_value  = "���հ���";   }
%>
          <tr>
            <td class="table_01"><%= list.size() - i %></td>
            <td class="table_02_1"><%=v_grseqnm%></td>
            <td class="table_02_2"><%=v_subjnm%></td>
            <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
            <!--td class="table_02_1" width="70"><%//=v_onoff_value%></td-->
            <td class="table_02_1"><%=v_educnt%></td>
			<td class="table_02_1"><%=v_tstep%></td>
			<td class="table_02_1"><%=v_mtest%></td>
			<td class="table_02_1"><%=v_ftest%></td>
			<td class="table_02_1"><%=v_htest%></td>
			<td class="table_02_1"><%=v_report%></td>
			<td class="table_02_1"><%=v_etc1%></td>
			<td class="table_02_1"><%=v_etc2%></td>
			<td class="table_02_1"><%=v_avtstep%></td>
			<td class="table_02_1"><%=v_avmtest%></td>
			<td class="table_02_1"><%=v_avftest%></td>
			<td class="table_02_1"><%=v_avhtest%></td>
			<td class="table_02_1"><%=v_avreport%></td>
			<td class="table_02_1"><%=v_avetc1%></td>
			<td class="table_02_1"><%=v_avetc2%></td>
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
          <td colspan="5" class="table_02_3">���</td>
		  <td class="table_02_3"><%=v_avg_tstep%></td>
		  <td class="table_02_3"><%=v_avg_mtest%></td>
		  <td class="table_02_3"><%=v_avg_ftest%></td>
		  <td class="table_02_3"><%=v_avg_htest%></td>
		  <td class="table_02_3"><%=v_avg_report%></td>
		  <td class="table_02_3"><%=v_avg_etc1%></td>
		  <td class="table_02_3"><%=v_avg_etc2%></td>
		  <td class="table_02_3"><%=v_avg_avtstep%></td>
		  <td class="table_02_3"><%=v_avg_avmtest%></td>
		  <td class="table_02_3"><%=v_avg_avftest%></td>
		  <td class="table_02_3"><%=v_avg_avhtest%></td>
		  <td class="table_02_3"><%=v_avg_avreport%></td>
		  <td class="table_02_3"><%=v_avg_avetc1%></td>
		  <td class="table_02_3"><%=v_avg_avetc2%></td>
		  <td class="table_02_3"><%=v_avg_score%></td>
          <td class="table_02_3">&nbsp;</td>
        </tr>
<% 
}else{		//������ ���ٸ�
%>
              <tr>
                <td align="center" bgcolor="#F7F7F7" height="50" colspan="21">��ϵ� ������ �����ϴ�</td>
              </tr>
<%
} 
%>
      </table>
      <!----------------- �����׷캰 �н���Ȳ �� ----------------->

</body>
</HTML>

