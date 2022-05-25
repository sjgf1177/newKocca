<%
//**********************************************************
//  1. ��      ��: COMPLETE RATE LIST
//  2. ���α׷���: za_GoyongReportCourse_E.jsp
//  3. ��      ��: ������ ��ȸ ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getString("s_grseq");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����
    String  ss_company      = box.getString("s_company");         //ȸ��
    String  ss_report_flag  = box.getString("p_report_flag");     //����Ʈ����

    String startDate  = FormatDate.getRelativeDate(-60);
    String endDate = FormatDate.getRelativeDate(30);

    String searchStart = FormatDate.getFormatDate(startDate,"yyyyMMdd");
    String searchEnd   = FormatDate.getFormatDate(endDate,"yyyyMMdd");

    String  v_searchStart = box.getStringDefault("p_searchStart",searchStart).replaceAll("-","");
    String  v_searchEnd   = box.getStringDefault("p_searchEnd",searchEnd).replaceAll("-",""); 

    String  v_this_day    =FormatDate.getDate("yyyyMMdd");
    //out.println("ss_grcode      :"+ss_grcode     );
    //out.println("ss_gyear       :"+ss_gyear      );
    //out.println("ss_grseq       :"+ss_grseq      );
    //out.println("ss_grseqnm     :"+ss_grseqnm    );
    //out.println("ss_subjcourse  :"+ss_subjcourse );
    //out.println("ss_subjseq     :"+ss_subjseq    );
    //out.println("ss_company     :"+ss_company    );
    //out.println("ss_report_flag :"+ss_report_flag);
    //out.println("v_searchStart  :"+v_searchStart);
    //out.println("v_searchEnd    :"+v_searchEnd);

%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" >
<!--  �� �ٿ�ε� �޴� �κ� -->
<!-- �������� ����-->
<%@ include file="/learn/library/oz.jsp"%>
<!-- �������� ��-->
<%if("1".equals(ss_report_flag)){ //��������Ʈ %>
   <param name="connection.reportname" value="goyong/course_list.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="course_list">
   <param name="odi.course_list.pcount" value="8">
   <param name="odi.course_list.args1" value="P_GRCODE=<%=ss_grcode%>">
   <param name="odi.course_list.args2" value="P_YEAR=<%=ss_gyear%>">
   <param name="odi.course_list.args3" value="P_GRSEQ=<%=ss_grseq%>">
   <param name="odi.course_list.args4" value="P_SUBJSEQ=<%=ss_subjseq%>">
   <param name="odi.course_list.args5" value="P_SUBJ=<%=ss_subjcourse%>">
   <param name="odi.course_list.args6" value="P_COMP=<%=ss_company%>">
   <param name="odi.course_list.args7" value="P_FDTE=<%=v_searchStart%>00">
   <param name="odi.course_list.args8" value="P_TDTE=<%=v_searchEnd%>23">

<%} else if("2".equals(ss_report_flag)){ //�뵿��������û���� %>
   <param name="connection.reportname" value="goyong/nodong_fixdoc_list.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="nodong_fixdoc_list">
   <param name="odi.nodong_fixdoc_list.pcount" value="8">
   <param name="odi.nodong_fixdoc_list.args1" value="P_GRCODE=<%=ss_grcode%>">
   <param name="odi.nodong_fixdoc_list.args2" value="P_YEAR=<%=ss_gyear%>">
   <param name="odi.nodong_fixdoc_list.args3" value="P_GRSEQ=<%=ss_grseq%>">
   <param name="odi.nodong_fixdoc_list.args4" value="P_SUBJSEQ=<%=ss_subjseq%>">
   <param name="odi.nodong_fixdoc_list.args5" value="P_SUBJ=<%=ss_subjcourse%>">
   <param name="odi.nodong_fixdoc_list.args6" value="P_COMP=<%=ss_company%>">
   <param name="odi.nodong_fixdoc_list.args7" value="P_FDTE=<%=v_searchStart%>00">
   <param name="odi.nodong_fixdoc_list.args8" value="P_TDTE=<%=v_searchEnd%>23">
<%} else if("3".equals(ss_report_flag)){ //�ƷýǽýŰ���1 %>
   <param name="connection.reportname" value="goyong/trade_list1.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="trade_list1">
   <param name="odi.trade_list1.pcount" value="8">
   <param name="odi.trade_list1.args1" value="P_GRCODE=<%=ss_grcode%>">
   <param name="odi.trade_list1.args2" value="P_YEAR=<%=ss_gyear%>">
   <param name="odi.trade_list1.args3" value="P_GRSEQ=<%=ss_grseq%>">
   <param name="odi.trade_list1.args4" value="P_SUBJSEQ=<%=ss_subjseq%>">
   <param name="odi.trade_list1.args5" value="P_SUBJ=<%=ss_subjcourse%>">
   <param name="odi.trade_list1.args6" value="P_COMP=<%=ss_company%>">
   <param name="odi.trade_list1.args7" value="P_FDTE=<%=v_searchStart%>00">
   <param name="odi.trade_list1.args8" value="P_TDTE=<%=v_searchEnd%>23">
<%} else if("4".equals(ss_report_flag)){ //�ƷýǽýŰ���5 %>
   <param name="connection.reportname" value="goyong/trade_list2.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="trade_list2">
   <param name="odi.trade_list2.pcount" value="8">
   <param name="odi.trade_list2.args1" value="P_GRCODE=<%=ss_grcode%>">
   <param name="odi.trade_list2.args2" value="P_YEAR=<%=ss_gyear%>">
   <param name="odi.trade_list2.args3" value="P_GRSEQ=<%=ss_grseq%>">
   <param name="odi.trade_list2.args4" value="P_SUBJSEQ=<%=ss_subjseq%>">
   <param name="odi.trade_list2.args5" value="P_SUBJ=<%=ss_subjcourse%>">
   <param name="odi.trade_list2.args6" value="P_COMP=<%=ss_company%>">
   <param name="odi.trade_list2.args7" value="P_FDTE=<%=v_searchStart%>00">   
   <param name="odi.trade_list2.args8" value="P_TDTE=<%=v_searchEnd%>23">
<%} else if("5".equals(ss_report_flag)){ //���������1 %>
   <param name="connection.reportname" value="goyong/suryo_repost_list1.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="suryo_repost_list1">
   <param name="odi.suryo_repost_list1.pcount" value="8">
   <param name="odi.suryo_repost_list1.args1" value="P_GRCODE=<%=ss_grcode%>">
   <param name="odi.suryo_repost_list1.args2" value="P_YEAR=<%=ss_gyear%>">
   <param name="odi.suryo_repost_list1.args3" value="P_GRSEQ=<%=ss_grseq%>">
   <param name="odi.suryo_repost_list1.args4" value="P_SUBJSEQ=<%=ss_subjseq%>">
   <param name="odi.suryo_repost_list1.args5" value="P_SUBJ=<%=ss_subjcourse%>">
   <param name="odi.suryo_repost_list1.args6" value="P_COMP=<%=ss_company%>">
   <param name="odi.suryo_repost_list1.args7" value="P_FDTE=<%=v_searchStart%>00">
   <param name="odi.suryo_repost_list1.args8" value="P_TDTE=<%=v_searchEnd%>23">
<%} else if("6".equals(ss_report_flag)){ //�����ں��� %>
   <param name="connection.reportname" value="goyong/suryo_report.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="suryo_report">
   <param name="odi.suryo_report.pcount" value="13">
   <param name="odi.suryo_report.args1" value="P_GRCODE=<%=ss_grcode%>">
   <param name="odi.suryo_report.args2" value="P_YEAR=<%=ss_gyear%>">
   <param name="odi.suryo_report.args3" value="P_GRSEQ=<%=ss_grseq%>">
   <param name="odi.suryo_report.args4" value="P_SUBJSEQ=<%=ss_subjseq%>">
   <param name="odi.suryo_report.args5" value="P_SUBJ=<%=ss_subjcourse%>">
   <param name="odi.suryo_report.args6" value="P_COMP=<%=ss_company%>">
   <param name="odi.suryo_report.args7" value="P_FDTE=<%=v_searchStart%>00">
   <param name="odi.suryo_report.args8" value="P_TDTE=<%=v_searchEnd%>23">
   <param name="odi.suryo_report.args9" value="P_DOCNO=���信���ý����� <%=v_this_day.substring(0,4)%>-<%=v_this_day.substring(4,6)%>-      ȣ">
   <param name="odi.suryo_report.args10" value="P_RECNM=���ﰭ������뵿�繫����">
   <param name="odi.suryo_report.args11" value="P_MYCMPNM=���信���ý������">
   <param name="odi.suryo_report.args12" value="P_MYCODE=12000-09-0115">
   <param name="odi.suryo_report.args13" value="P_PRESIDENTNM=��  ��  ��">


<%} else if("7".equals(ss_report_flag)){ //���������ڸ�� %>
   <param name="connection.reportname" value="goyong/suryo_men_repost_list.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="suryo_men_repost_mst_list">
   <param name="odi.suryo_men_repost_mst_list.pcount" value="9">
   <param name="odi.suryo_men_repost_mst_list.args1" value="P_GRCODE=<%=ss_grcode%>">
   <param name="odi.suryo_men_repost_mst_list.args2" value="P_YEAR=<%=ss_gyear%>">
   <param name="odi.suryo_men_repost_mst_list.args3" value="P_GRSEQ=<%=ss_grseq%>">
   <param name="odi.suryo_men_repost_mst_list.args4" value="P_SUBJSEQ=<%=ss_subjseq%>">
   <param name="odi.suryo_men_repost_mst_list.args5" value="P_SUBJ=<%=ss_subjcourse%>">
   <param name="odi.suryo_men_repost_mst_list.args6" value="P_COMP=<%=ss_company%>">
   <param name="odi.suryo_men_repost_mst_list.args7" value="P_FDTE=<%=v_searchStart%>00">
   <param name="odi.suryo_men_repost_mst_list.args8" value="P_TDTE=<%=v_searchEnd%>23">
   <param name="odi.suryo_men_repost_mst_list.args9" value="P_PRESIDENT=��  ��  ��">
<%} else if("8".equals(ss_report_flag)){ //�����Ʒü������߱޴��� %>
   <param name="connection.reportname" value="goyong/suryo_license_print_list.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="suryo_license_print_list">
   <param name="odi.suryo_license_print_list.pcount" value="9">
   <param name="odi.suryo_license_print_list.args1" value="P_GRCODE=<%=ss_grcode%>">
   <param name="odi.suryo_license_print_list.args2" value="P_YEAR=<%=ss_gyear%>">
   <param name="odi.suryo_license_print_list.args3" value="P_GRSEQ=<%=ss_grseq%>">
   <param name="odi.suryo_license_print_list.args4" value="P_SUBJSEQ=<%=ss_subjseq%>">
   <param name="odi.suryo_license_print_list.args5" value="P_SUBJ=<%=ss_subjcourse%>">
   <param name="odi.suryo_license_print_list.args6" value="P_COMP=<%=ss_company%>">
   <param name="odi.suryo_license_print_list.args7" value="P_FDTE=<%=v_searchStart%>00">
   <param name="odi.suryo_license_print_list.args8" value="P_TDTE=<%=v_searchEnd%>23">
<%} else if("9".equals(ss_report_flag)){ //����Ȯ�μ� %>
   <param name="connection.reportname" value="goyong/sunap_cmf_list.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="sunap_cmf_list">
   <param name="odi.sunap_cmf_list.pcount" value="11">
   <param name="odi.sunap_cmf_list.args1" value="P_GRCODE=<%=ss_grcode%>">
   <param name="odi.sunap_cmf_list.args2" value="P_YEAR=<%=ss_gyear%>">
   <param name="odi.sunap_cmf_list.args3" value="P_GRSEQ=<%=ss_grseq%>">
   <param name="odi.sunap_cmf_list.args4" value="P_SUBJSEQ=<%=ss_subjseq%>">
   <param name="odi.sunap_cmf_list.args5" value="P_SUBJ=<%=ss_subjcourse%>">
   <param name="odi.sunap_cmf_list.args6" value="P_COMP=<%=ss_company%>">
   <param name="odi.sunap_cmf_list.args7" value="P_FDTE=<%=v_searchStart%>00">
   <param name="odi.sunap_cmf_list.args8" value="P_TDTE=<%=v_searchEnd%>23">
   <param name="odi.sunap_cmf_list.args9" value="P_ADDRESS=����� ������ ���ﵿ 837-36">
   <param name="odi.sunap_cmf_list.args10" value="P_PRESIDENT=��  ��  ��">
   <param name="odi.sunap_cmf_list.args11" value="P_THISDAY=<%=v_this_day.substring(0,4)%>-<%=v_this_day.substring(4,6)%>-">
<%} else if("10".equals(ss_report_flag)){ //����������ɷ°����Ʒú�� ���곻���� %>
   <param name="connection.reportname" value="goyong/aes_suryo_list1.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="aes_suryo_list1">
   <param name="odi.aes_suryo_list1.pcount" value="14">
   <param name="odi.aes_suryo_list1.args1" value="P_GRCODE=<%=ss_grcode%>">
   <param name="odi.aes_suryo_list1.args2" value="P_YEAR=<%=ss_gyear%>">
   <param name="odi.aes_suryo_list1.args3" value="P_GRSEQ=<%=ss_grseq%>">
   <param name="odi.aes_suryo_list1.args4" value="P_SUBJSEQ=<%=ss_subjseq%>">
   <param name="odi.aes_suryo_list1.args5" value="P_SUBJ=<%=ss_subjcourse%>">
   <param name="odi.aes_suryo_list1.args6" value="P_COMP=<%=ss_company%>">
   <param name="odi.aes_suryo_list1.args7" value="P_FDTE=<%=v_searchStart%>00">
   <param name="odi.aes_suryo_list1.args8" value="P_TDTE=<%=v_searchEnd%>23">
   <param name="odi.aes_suryo_list1.args9" value="P_COMPNM=���信���ý������">
   <param name="odi.aes_suryo_list1.args10" value="P_CEONM=���ͱ�">
   <param name="odi.aes_suryo_list1.args11" value="P_ADDR=���� ������ ���ﵿ 837-36 ���帶ũŸ��4��">
   <param name="odi.aes_suryo_list1.args12" value="P_CMP_SCALE=��Ը�">
   <param name="odi.aes_suryo_list1.args13" value="P_DAMDANG=��������� ��ȭ��">
   <param name="odi.aes_suryo_list1.args14" value="P_TELLINE=02-3458-1457 / 02-3458-1388">

<%} else if("11".equals(ss_report_flag)){ //AES��ü������ ȯ�޾� ��û���� ���� %>
   <param name="connection.reportname" value="goyong/aes_suryo_list2.ozr">
   <param name="viewer.configmode" value="html">
   <param name="viewer.isframe" value="false">
   <param name="odi.odinames" value="aes_suryo_list2">
   <param name="odi.aes_suryo_list2.pcount" value="8">
   <param name="odi.aes_suryo_list2.args1" value="P_GRCODE=<%=ss_grcode%>">
   <param name="odi.aes_suryo_list2.args2" value="P_YEAR=<%=ss_gyear%>">
   <param name="odi.aes_suryo_list2.args3" value="P_GRSEQ=<%=ss_grseq%>">
   <param name="odi.aes_suryo_list2.args4" value="P_SUBJSEQ=<%=ss_subjseq%>">
   <param name="odi.aes_suryo_list2.args5" value="P_SUBJ=<%=ss_subjcourse%>">
   <param name="odi.aes_suryo_list2.args6" value="P_COMP=<%=ss_company%>">
   <param name="odi.aes_suryo_list2.args7" value="P_FDTE=<%=v_searchStart%>00">
   <param name="odi.aes_suryo_list2.args8" value="P_TDTE=<%=v_searchEnd%>23">

<%}%>
</OBJECT>
</body>
</html>



