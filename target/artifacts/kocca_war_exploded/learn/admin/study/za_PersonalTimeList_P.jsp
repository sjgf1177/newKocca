 <%
//**********************************************************
//  1. ��      ��: �н�â ���� �α� ����Ʈ
//  2. ���α׷���: za_PersonalCounsel_L
//  3. ��      ��: �н�â ���� �α� ����(�˾�)
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 7. 5
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
	String v_lgip     = "";
	String v_ldate    = "";  
    String v_day      = "";  // ���ӳ�¥
    String v_time     = "";  // ���ӽð�
	int    i          = 0;

    ArrayList list = (ArrayList)request.getAttribute("PersonalTimeList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/hhi_lib.js"></SCRIPT>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>

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
          <td><img src="/images/admin/study/tit_log.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
            <br>

<form name="form1" method = "post">
  <input type="hidden" name="p_process" value="<%=v_process%>">

        <table class="box_table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="3" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" ><b>NO</b></td>
            <td class="table_title" ><b>���ӳ�¥</b></td>
            <td class="table_title" ><b>���ӽð�</b></td>
          </tr>
<%

    for (i=0; i<list.size();i++) {
        DataBox dbox1   = (DataBox)list.get(i);
        v_lgip   = dbox1.getString("d_lgip");
        v_ldate   = dbox1.getString("d_ldate");



        v_day  = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd");
        v_time = FormatDate.getFormatDate(v_ldate,"HH:mm:ss");
%>
          <tr>
            <td class="table_01"><%=i+1%></td>
            <td class="table_02_1"><%=v_day%></td>
            <td class="table_02_1"><%=v_time%></td>
          </tr>
<%
    }
    if (i==0){
%>
          <tr>
            <td class="table_01" colspan="3">���ӷαװ� �����ϴ�.</td>
          </tr>
<%
    }
%>
        </table>

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
