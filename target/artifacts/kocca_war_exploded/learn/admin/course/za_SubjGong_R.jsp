<%
//**********************************************************
//  1. ��      ��: ������������������
//  2. ���α׷��� : za_SubjGong_R.jsp
//  3. ��      ��: ������������������ ���ð���󼼺���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 8. 18
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process        = box.getString("p_process");
    String  v_subj      = box.getString("p_subj");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");
    String  v_hsubjnm   = box.getString("p_hsubjnm");
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int     v_orgseq     = v_seq;
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
    int v_pageno = box.getInt("p_pageno");   

    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getString("s_grseq");         //��������
    String  ss_uclass    = box.getString("s_uclass");        //�����з�
    String  ss_subjcourse= box.getString("s_subjcourse");    //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");       //���� ����
    String  ss_isclosed  = box.getString("s_isclosed");      //���࿩��

    String  v_types      = "";
    String  v_typesnm    = "";
    String  v_addate     = "";
    String  v_title      = "";
    String  v_adcontent  = "";
    int    i         = 0;
    int    v_cnt     = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_content = "";
    String v_upfileview = "";

    Vector v_realfileVector = null;
    Vector v_savefileVector = null;

   /*  ���� ����   */
    DataBox dbox = (DataBox)request.getAttribute("selectGong");
    if (dbox != null ) {
        v_seq           = dbox.getInt("d_seq");
        v_userid        = dbox.getString("d_userid");
        v_name          = dbox.getString("d_name");
        v_title         = dbox.getString("d_title");
        v_content       = dbox.getString("d_adcontent");
        v_cnt           = dbox.getInt("d_cnt");
        v_indate        = dbox.getString("d_addate");
        v_types         = dbox.getString("d_types");
        v_typesnm       = dbox.getString("d_typesnm");
        v_realfileVector = (Vector)dbox.getObject("d_realfile");
        v_savefileVector = (Vector)dbox.getObject("d_savefile");
    }
%>

<html>
<head>
<title>::: �������� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
	
	//�������� ����
    function modify_gong() {
        document.form1.action = "/servlet/controller.course.SubjGongAdminServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }
	
	//�������� ����
    function delete_gong() {
        document.form1.action = "/servlet/controller.course.SubjGongAdminServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }
	
	//�������� ����Ʈ
    function list_gong() {
        document.form1.action = "/servlet/controller.course.SubjGongAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"  value = "<%= v_process %>">

    <input type='hidden' name='s_grcode'     value='<%=ss_grcode%>'>
    <input type='hidden' name='s_gyear'      value='<%=ss_gyear%>'>
    <input type='hidden' name='s_grseq'      value='<%=ss_grseq%>'>
    <input type='hidden' name='s_uclass'     value='<%=ss_uclass%>'>
    <input type='hidden' name='s_subjcourse' value='<%=ss_subjcourse%>'>
    <input type='hidden' name='s_subjseq'    value='<%=ss_subjseq%>'>
    <input type='hidden' name='s_isclosed'   value='<%=ss_isclosed%>'>

    <input type="hidden" name="p_subj"    value="<%=v_subj%>">
    <input type="hidden" name="p_year"    value="<%=v_year%>">
    <input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
    <input type="hidden" name="p_hsubjnm" value="<%=v_hsubjnm%>">
    <input type="hidden" name="p_seq"     value="<%=v_seq%>">
    <input type="hidden" name="p_pageno"     value="<%=v_pageno%>">

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
            <td class=sub_title><%=v_hsubjnm%><!--�η°��ߺ� &gt; 0001 &gt; Life Planning &gt; 0001--></td>
          </tr>
        </table>

        <br>
        <!----------------- �������װ��� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr class="table_02_2">
            <td height="25" class="table_title" ><strong>�����</strong></td>
            <td height="25" class="table_02_2"><%= v_indate %></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><%= v_typesnm %></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><%= v_title %></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="50" class="table_02_2"><br><%= v_content %><br></td>
          </tr>
		  <tr>
			<td class = "table_title" align = "center">÷������</td>
			<td class = "table_02_2"  align = "left" >
	              <%
                  Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                  Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                  %>
                  <%@ include file="/learn/admin/include/za_MultiAttach_R.jsp" %> 
			</td>
		  </tr>
        </table>
       <!----------------- �������װ��� �� ----------------->

        <br>
        <!----------------- ����, ����, ����Ʈ ��ư ���� ----------------->
        <table  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href="javascript:modify_gong()"><img src="/images/admin/button/btn_modify.gif" border="0"></a></td>
			<td width=4></td>
            <td align="center"><a href="javascript:delete_gong()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
			<td width=4></td>
            <td align="center"><a href="javascript:list_gong()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ����, ����Ʈ ��ư �� ----------------->

        <br>
      </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
