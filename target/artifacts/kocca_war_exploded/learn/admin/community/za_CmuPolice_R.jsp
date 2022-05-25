<%
//**********************************************************
//  1. ��      ��: Ŀ�´�Ƽ ����Ʈ
//  2. ���α׷��� : za_CmuRoom_L.jsp
//  3. ��      ��: �������� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��:  2003. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_searchtext    = box.getString("p_searchtext");
    String  v_select        = box.getString("p_select");
    String  v_policeno        = box.getString("p_policeno");


    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");


    String  content      = "";

    String  width = "630";
    String  height = "0";

    int v_pageno             = box.getInt("p_pageno");
    ArrayList list       = (ArrayList)request.getAttribute("list");
    String  v_str_fg     ="1";
    String  v_singo_men  ="";
    String  v_singo_email="";
    String  v_sino_cmu_nm="";
    String  v_singo_dte  ="";
    String  v_singo_content="";

    String  v_singo_re_men  ="";
    String  v_singo_re_email="";
    String  v_singo_re_dte  ="";
    String  v_singo_re_content="";
    if(list.size()>0){
       DataBox dbox = (DataBox)list.get(0);
       v_singo_men=dbox.getString("d_bname")+"&nbsp;"+dbox.getString("d_bjikwinm")+"/"+dbox.getString("d_bjikupnm")+"&nbsp;"+dbox.getString("d_bdeptnam");
       v_singo_email= dbox.getString("d_email");
       v_sino_cmu_nm= dbox.getString("d_cmu_nm");
       v_singo_content= dbox.getString("d_content");
       v_singo_dte= dbox.getString("d_singo_dte");

       v_singo_re_men=dbox.getString("d_cname")+"&nbsp;"+dbox.getString("d_cjikwinm")+"/"+dbox.getString("d_cjikupnm")+"&nbsp;"+dbox.getString("d_cdeptnam");
       v_singo_re_content= dbox.getString("d_repmemo");
       v_singo_re_dte= dbox.getString("d_str_dte");
       content =v_singo_re_content;

       v_str_fg= dbox.getString("d_str_fg");
    }
   
%>
<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function uf_updateOK() {
    document.form1.content.value = document.form1.Wec.MIMEValue;
    document.form1.content.value.replace("&","&amp;");
     
     if (document.form1.Wec.TextValue.length < 3) {
         alert("������ �Է��ϼ���");
         return;
     }

    document.form1.action = "/servlet/controller.community.CommunityAdminPoliceServlet";
    document.form1.p_process.value = "updateData";
    document.form1.submit();
}
function wf_listOK() {
    document.form1.action = "/servlet/controller.community.CommunityAdminPoliceServlet";
    document.form1.p_process.value = "listPage";
    document.form1.submit();
}

    function initPage()
    {
        document.form1.Wec.Value = document.form1.content.value;
    }
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" <% if("1".equals(v_str_fg)){%> onload="initPage()"<%}%>>
<form name = "form1" method = "post">
<input type = "hidden" name = "p_process"     value = "">
<input type = "hidden" name = "p_pageno"      value = "">
<input type = "hidden" name = "p_userid"      value = "">
<input type = "hidden" name = "p_upfilecnt"   value = "">
<input type = "hidden" name = "p_policeno"      value = "<%=v_policeno%>">

<input type = "hidden" name = "p_str_fg"   value = "<%=v_str_fg%>">
		<input type = "hidden" name = "conText"       value = "<%=content%>">
		<input type = "hidden" name = "content"       value = "<%=content%>">
<table width="1024" border="0" cellspacing="0" cellpadding="0" height="663">
 <tr>
  <td align="center" valign="top">
   <!----------------- title ���� ----------------->
   <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
    <tr> 
     <td><img src="../../../images/admin/homepage/tit_comm_singo.gif" ></td>
     <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
    </tr>
   </table>
   <!----------------- title �� ----------------->
   <br>
   <!-----------------  ���̺���� ----------------->

   <!----------------- �����׷� ���� ----------------->
   <table class="table_out" cellspacing="1" cellpadding="5">
    <tr><td colspan="4" class="table_top_line"></td></tr>
    <tr> 
     <td width="10%" class="table_title"><b>�Ű���</b></td>
     <td width="40%" height="25"  class="table_02_2"><%=v_singo_men%></td>
     <td width="10%" class="table_title"><b>�Ű�����</b></td>
     <td width="40%" height="25"  class="table_02_2"><%=FormatDate.getFormatDate(v_singo_dte, "yyyy/MM/dd")%></td>
    </tr>
    <tr> 
     <td  class="table_title"><strong>Ŀ�´�Ƽ��</strong></td>
     <td colspan="3" class="table_02_2" ><%=v_sino_cmu_nm%></td>
    </tr>
    <tr> 
     <td  class="table_title" height=80><strong>�Ű���</strong></td>
     <td colspan="3" class="table_02_2" height=80 ><%=v_singo_content%></td>
    </tr>
   </table>
   <br>
<% if("2".equals(v_str_fg)){%>
   <table class="table_out" cellspacing="1" cellpadding="5">
    <tr> 
     <td width="10%" class="table_title"><b>ó����</b></td>
     <td width="40%" height="25"  class="table_02_2"><%=v_singo_re_men%></td>
     <td width="10%" class="table_title"><b>ó������</b></td>
     <td width="40%" height="25"  class="table_02_2"><%=FormatDate.getFormatDate(v_singo_re_dte, "yyyy/MM/dd")%></td>
    </tr>
    <tr> 
     <td  class="table_title" height=80><strong>ó������</strong></td>
     <td colspan="3" class="table_02_2" height=80 ><%=v_singo_re_content%></td>
    </tr>
   </table>
<%}else{%>
   <table class="table_out" cellspacing="1" cellpadding="5">
    <tr> 
      <td class="table_02_2" style=padding-top:5;padding-bottom:5>
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">namoActiveInitCompleted("content");</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->

      </td>
    </tr>
   </table>
<%}%>
      <!----------------- �����׷� �� ----------------->
      <br> <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="10"></td>
        </tr>
        <tr> 
          <td align="center"><table width="197" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align=center>
<% if("1".equals(v_str_fg)){%>
                 <a href="javascript:uf_updateOK();"><img src="../../../images/admin/button/btn_apply.gif" border="0"></a>&nbsp;
<%}%>
                <a href="javascript:wf_listOK();"><img src="../../../images/admin/button/btn_list.gif" border="0"></a>
                </td>
              </tr>
            </table></td>
        </tr>
      </table>
   <br>
  </td>
 </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
