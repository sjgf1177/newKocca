<%
//**********************************************************
//  1. ��      ��: ������ ��㳻�� ����
//  2. ���α׷���: za_PersonalCounsel_L
//  3. ��      ��: ������ ��㳻�� ����(�˾�)
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: lyh
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String v_resno      = "";  //�ֹε�Ϲ�ȣ
    String v_name       = "";  //�̸�
    String v_email      = "";  //�̸���
    String v_hometel    = "";  //����ȭ
    String v_pwd        = "";  //��й�ȣ
    String v_userid     = "";  //id
    String v_handphone  = "";
	String v_membergubunnm = "";	//ȸ�����и�
	String v_grcode = "";	//  �׷��ڵ�

    MemberData data = (MemberData)request.getAttribute("SelectMemberInfo");
    //v_resno      = data.getResno();
    v_resno      = data.getResno1()+data.getResno2();
    v_name       = data.getName();
    v_email      = data.getEmail();
    v_hometel    = data.getHometel();
    v_handphone  = data.getHandphone();
    v_pwd        = data.getPwd();
    v_userid     = data.getUserid();
	v_membergubunnm =  data.getMembergubunnm();
	v_grcode     = data.getGrcode();
	

    //v_resno = v_resno.substring(0, 6) + "-" + v_resno.substring(6);
    //v_resno = v_resno.substring(0, 6) + "-*******";
    
    //if(v_resno.length() > 12){
    //  v_resno = v_resno.substring(0, 6) + "-*******";
    //}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/hhi_lib.js"></SCRIPT>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
// �����
function insertCounsel() {
        document.form1.action='/servlet/controller.study.CounselAdminServlet';
        document.form1.p_process.value = 'CounselInsertPage';
        document.form1.submit();
}

// ��㳻������
function viewCounsel(no) {
        document.form1.p_no.value = no;
        document.form1.action='/servlet/controller.study.CounselAdminServlet';
        document.form1.p_process.value = 'CounselUpdatePage';
        document.form1.submit();

}

//�з� ����
function selectMcode() {
        document.form1.action='/servlet/controller.study.CounselAdminServlet';
        document.form1.p_process.value = 'CounselListPage';
        document.form1.submit();
}

//-->
</SCRIPT>

</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="800" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr>
    <td align="left">
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
          <tr>

          <td align="center" bgcolor="#FFFFFF">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="../../../images/admin/study/tit_counsel.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
            <br>

            <table width="100%" cellspacing="1" cellpadding="5" class="open_table_out" border="0">
              <tr>
                <td colspan="4" class="table_top_line"></td>
              </tr>
              <tr>
                <td width="22%" class="table_title" width="22%" >ID</td>
                <td width="28%" class="table_02_2"  width="28%" ><%=v_userid%></td>
                <td width="22%" class="table_title" width="22%">��й�ȣ</td>
                <td width="28%" class="table_02_2"  width="28%">*****<!-- %=v_pwd%--></td>
              </tr>
              <tr>
                <td width="22%" class="table_title" width="22%" >����</td>
                <td width="28%" class="table_02_2"  width="28%" ><%=v_name%></td>
                <td width="22%" class="table_title" width="22%">ȸ������</td>
                <td width="28%" class="table_02_2"  width="28%"><%=v_membergubunnm%></td>
              </tr>
              <tr>
                <td width="22%" class="table_title">�ڵ���</td>
                <td width="28%" class="table_02_2"><%=v_handphone%></td>
                <td width="22%" class="table_title">E-mail</td>
                <td width="28%" class="table_02_2"><%=v_email%></td>
              </tr>
            </table>

<%
    int    vc_no = 0;
    String p_subj     = box.getString("p_subj");
    String p_mcode    = box.getString("s_mcode");
    String vc_userid  = box.getString("p_userid");
    String vc_cuserid = "";
    String vc_name    = "";
    String vc_title   = "";
    String vc_ftext   = "";
    String vc_ctext   = "";
    String vc_mcode   = "";
    String vc_mcodenm = "";
    String vc_etime   = "";
    String vc_subj    = "";
    String vc_year    = "";
    String vc_subjseq = "";
    String vc_status  = "";
    String vc_sdate   = "";
    String vc_ldate   = "";
    String vc_gubun   = "";
    String vc_status_view = "";
    String vc_sdate_view  = "";
    String vc_ldate_view  = "";
    String vc_gubun_view  = "";
    int i = 0;

    ArrayList list1 = (ArrayList)request.getAttribute("counselList");
%>

<form name="form1" method = "post">
  <input type="hidden" name="p_process" value="<%=v_process%>">
  <input type="hidden" name="p_userid" value="<%=vc_userid%>">
  <input type="hidden" name="p_subj" value="<%=p_subj%>">
  <input type="hidden" name="p_no"     value="">
  <input type="hidden" name="s_grcode"     value="<%=v_grcode%>">

                        <table width="97%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" width="80%" >�з�&nbsp;&nbsp;
                                <%=CodeConfigBean.getCodeGubunSelect (CounselAdminBean.COUNSEL_KIND, "", 1, "s_mcode", p_mcode,"onChange= 'javascript:selectMcode()'",  2)%>
                            </td>
                            <td align="right" height="20" >
                            <a href="javascript:insertCounsel()"><img src="/images/admin/button/btn_counsel_insert.gif" border="0" alt="�����"></a>
                            </td>
                        </tr>
                        </table>

                      <div style='width:760px;height:370px;overflow:auto;visibility:visible;border:1 '>
                      <table class="box_table_out" cellspacing="1" cellpadding="5">
                        <tr>
                          <td colspan="9" class="table_top_line"></td>
                        </tr>
                        <tr>
                          <td class="table_title" ><b>NO</b></td>
                          <td class="table_title" ><b>�з�</b></td>
                          <td class="table_title" ><b>����</b></td>
                          <td class="table_title" ><b>�ۼ���</b></td>
                          <td class="table_title" ><b>ó������</b></td>
                          <td class="table_title" ><b>�������</b></td>
                          <td class="table_title" ><b>����</b></td>
                        </tr>
<%

    for (i=0; i<list1.size();i++) {
        DataBox dbox1   = (DataBox)list1.get(i);
        vc_no      = dbox1.getInt("d_no");
        vc_userid  = dbox1.getString("d_userid");
        vc_name    = dbox1.getString("d_name");
        vc_cuserid = dbox1.getString("d_cuserid");
        vc_title   = dbox1.getString("d_title");
        vc_ftext   = dbox1.getString("d_ftext");
        vc_ctext   = dbox1.getString("d_ctext");
        vc_mcode   = dbox1.getString("d_mcode");
        vc_mcodenm = dbox1.getString("d_mcodenm");
        vc_etime   = dbox1.getString("d_etime");
        vc_subj    = dbox1.getString("d_subj");
        vc_year    = dbox1.getString("d_year");
        vc_subjseq = dbox1.getString("d_subjseq");
        vc_sdate   = dbox1.getString("d_sdate");
        vc_status  = dbox1.getString("d_status");
        vc_ldate   = dbox1.getString("d_ldate");
        vc_gubun   = dbox1.getString("d_gubun");

        //vc_status  1 : ��ó��, 2 : ó����, 3 : �Ϸ�
        if (vc_status.equals("1")) {
            vc_status_view = "��ó��";
        } else if (vc_status.equals("2")) {
            vc_status_view = "ó����";
        } else {
            vc_status_view = "�Ϸ�";
        }

        // vc_gubun   in : ���� , out : �߽�
        if (vc_gubun.equals("in")) {
            vc_gubun_view = "����";
        } else if (vc_gubun.equals("out")) {
            vc_gubun_view = "�߽�";
        }

        vc_sdate_view = FormatDate.getFormatDate(vc_sdate,"yyyy/MM/dd");
        vc_ldate_view = FormatDate.getFormatDate(vc_ldate,"yyyy/MM/dd");
%>
                        <tr>
                          <td class="table_01"><%=list1.size()-i%></td>
                          <td class="table_02_1"><%=vc_mcodenm%></td>
                          <td class="table_02_1"><a href="javascript:viewCounsel('<%=vc_no%>')"><%=vc_title%></a></td>
                          <td class="table_02_1"><%=vc_name%></td>
                          <td class="table_02_1"><%=vc_status_view%></td>
                          <td class="table_02_1"><%=vc_sdate_view%></td>
                          <td class="table_02_1"><%=vc_gubun_view%></td>
                        </tr>
<%
    }

    if (i==0){
%>

                        <tr>
                          <td class="table_01" colspan="7">��ϵ� ������ �����ϴ�.</td>
                        </tr>
<%
    }
%>
                      </table>
                      </div>




            <!----------------- �ݱ� ��ư ���� ----------------->
            <table cellspacing="0" cellpadding="0" class="open_table1">
              <tr>
                <td align="right" style="padding-top=10">
                <a href="javascript:self.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a>
                </td>
              </tr>
            </table>
            <!----------------- �ݱ� ��ư �� ----------------->
              <br>




          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
