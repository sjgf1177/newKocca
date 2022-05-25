<%
//**********************************************************
//  1. ��      ��: ������������������
//  2. ���α׷���: za_SubjGong_I.jsp
//  3. ��      ��: ������������������ �������������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 23
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.homepage.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
	String  v_process  = box.getString("p_process");
    
    String  v_subj      = box.getString("p_subj");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");
    String  v_hsubjnm   = box.getString("p_hsubjnm");
    String  v_types     = box.getString("p_types");

    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getString("s_grseq");         //��������
    String  ss_uclass    = box.getString("s_uclass");        //�����з�
    String  ss_subjcourse= box.getString("s_subjcourse");    //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");       //���� ����
    String  ss_isclosed  = box.getString("s_isclosed");      //���࿩��
    int v_pageno         = box.getInt("p_pageno");

    String v_title      = "";
    String v_adcontent  = "";
	
  	String content 	= "";
  	String width	= "540";
  	String height	= "300";


   /*  Sample ���� ����   */
   SubjGongData data1 = (SubjGongData)request.getAttribute("selectGong");
    if (data1 != null) {
        v_title      = data1.getTitle();
        v_adcontent  = data1.getAdcontent();
    }
   
   String v_server   = conf.getProperty("kocca.url.value");
   String v_tem_url  = conf.getProperty("url.namo.template");
   String v_tem_name = conf.getProperty("name.namo.template.ini");
   String v_tem_url_name = v_server + v_tem_url + v_tem_name; 
    
%>

<html>
<head>
<title>::: �������� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    // ����
    function insert_check() {
        if(blankCheck(document.form1.p_title.value)){
            alert("������ �Է��ϼ���");
            document.form1.p_title.focus();
            return;
        }
        if (document.form1.p_title.value == "") {
            alert("������ �Է��ϼ���");
            document.form1.p_title.focus();
            return;
        }
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }
		
		document.form1.p_adcontent.value = document.form1.Wec.MIMEValue;

		document.form1.p_adcontent.value.replace("&","&amp;");

        if (document.form1.Wec.TextValue.length < 3) {
            alert("������ �Է��ϼ���");
            return;
        }
		/*
        if (realsize(document.form1.p_adcontent.value) > 2000) {
            alert("������ �ѱ۱��� 1000�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_adcontent.focus();
            return;
        }*/

        document.form1.action = "/servlet/controller.course.SubjGongAdminServlet";
        document.form1.p_process.value = "insert";
        document.form1.submit();
    }

    // ��ü������� �̵�
    function list() {
        document.form1.action = "/servlet/controller.course.SubjGongAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

    // �������� ����
    function selectCategory() {
        document.form1.action = "/servlet/controller.course.SubjGongAdminServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }
    
    // �ʱ�ȭ
    function initPage()
    {
        //document.form1.Wec.TextValue = document.form1.p_adcontent.value;
        document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>";
    }     
//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0"  onload="initPage()">
<form name="form1" method="post" enctype = "multipart/form-data">
    <input type = "hidden" name = "p_process"  value = "<%= v_process %>" >

    <input type='hidden' name='s_grcode'     value='<%=ss_grcode%>'>
    <input type='hidden' name='s_gyear'      value='<%=ss_gyear%>'>
    <input type='hidden' name='s_grseq'      value='<%=ss_grseq%>'>
    <input type='hidden' name='s_uclass'     value='<%=ss_uclass%>'>
    <input type='hidden' name='s_subjcourse' value='<%=ss_subjcourse%>'>
    <input type='hidden' name='s_subjseq'    value='<%=ss_subjseq%>'>
    <input type='hidden' name='s_isclosed'   value='<%=ss_isclosed%>'>
    <input type="hidden" name="p_pageno"     value="<%=v_pageno%>">

    <input type="hidden" name="p_subj"    value="<%=v_subj%>">
    <input type="hidden" name="p_year"    value="<%=v_year%>">
    <input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
    <input type="hidden" name="p_hsubjnm" value="<%=v_hsubjnm%>">
	<input type='hidden' name="p_adcontent"  value="">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
            <td class=sub_title><%=v_hsubjnm%></td>
          </tr>
          <tr>
            <td height=8></td>
            <td height=8></td>
          </tr>
        </table>

        <!----------------- ��ü���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="4" class="table_top_line"></td>
          </tr>
          <tr> 
            <td class="table_title" rowspan="2" width="16%"><b>����</b></td>
            <td class="table_02_2" rowspan="2" width="44%"> 
              <input name="p_title" type="text" class="input" size="98" value="<%=v_title%>">
            </td>
            <td class="table_title" height="25" width="16%"><b>������</b></td>
            <td class="table_title" width="15%"><b>v_subjnm</b></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>�����ϼ�</b></td>
            <td class="table_title"><b>v_edudates</b></td>
          </tr>
          <tr> 
            <td class="table_title" ><b>��������</b></td>
            <td class="table_02_2" > 
<!-- �������� SELECT BOX  START   -->
<%= CodeConfigBean.getCodeSelect("noticeCategory","",1,"p_types",v_types,"",0,"") %>
<!-- �������� SELECT BOX  END     -->
            </td>
            <td class="table_title" height="25"><b>�����Ⱓ</b></td>
            <td class="table_title"><b>v_eduperiod</b></td>
          </tr>
          <tr> 
            <td class="table_title" rowspan="12"><b>����</b></td>
            <td class="table_02_2" rowspan="12"> 
                <!-- ���� Editor  -->              
                <p align="center">
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">namoActiveInitCompleted("p_adcontent");document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>";</script>
                <script language="javascript">object_namoActivepatch('684','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
                </p>
                <!-- ���� Editor  --> 
            </td>
            <td class="table_title" height="25"><b>��� �̸�</b></td>
            <td class="table_title"><b>v_name</b></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>��� ��ȭ</b></td>
            <td class="table_title"><b>v_comptel</b></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>��� E-mail</b></td>
            <td class="table_title"><b>v_email</b></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����ġ(������)</b></td>
            <td class="table_title"><b>v_wstep</b></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����ġ(�߰���)</b></td>
            <td class="table_title"><b>v_wmtest</b></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����ġ(������)</b></td>
            <td class="table_title"><b>v_wftest</b></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����ġ(������Ʈ)</b></td>
            <td class="table_title"><b>v_wreport</b></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����ġ(��Ƽ��Ƽ)</b></td>
            <td class="table_title"><b>v_wact</b></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>�����������</b></td>
            <td class="table_title"><b>v_gradscore</b></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>�������������</b></td>
            <td class="table_title"><b>v_gradstep</b></td>
          </tr>
          <!--tr> 
            <td class="table_title" height="25"><b>�̼�����</b></td>
            <td class="table_title"><b>v_point</b></td>
          </tr-->
          <tr> 
            <td class="table_title" height="25"><b>������</b></td>
            <td class="table_title"><b>v_edustart</b></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>������</b></td>
            <td class="table_title"><b>v_eduend</b></td>
          </tr>
		  <tr>
			<td class = "table_title" width = "12%" align = "center">÷������</td>
			<td class = "table_02_2"  align = "left" colspan="3">
            <%
            int    i_fileLimit         = NoticeAdminBean.getFILE_LIMIT();              // ���� ÷�� ���ϼ�
            %>
            <%@ include file="/learn/admin/include/za_MultiAttach_I.jsp" %> 
			</td>
		  </tr>
        </table>
        <!----------------- ��ü���� �� ----------------->


        <br>
        <!----------------- ����, ��� ��ư ���� ----------------->
        <table  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href='javascript:insert_check()'><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
			<td width=8></td>
            <td align="center"><a href='javascript:list()'><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->

        <br>
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
