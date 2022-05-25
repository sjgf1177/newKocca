<%
//**********************************************************
//  1. ��      ��: ����Ʈ ÷������
//  2. ���α׷���: zu_ProjectOld_U.jsp
//  3. ��      ��: ����Ʈ ÷������ ����ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 8.
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_pkey        = box.getString("p_pkey");
    String  v_userid      = box.getString("p_userid");
    String  v_filenm      = "";
    String  v_title       = "";
    String  v_submitdate    = "";
    String  v_markingdate = "";
    String  v_rscore      = "";
    String  v_redpen      = "";
	int i = 0;

    DataBox dbox  =null;
    dbox = (DataBox)request.getAttribute("selectProject");
    //DEFINED class&variable END

    if(dbox != null){
        v_filenm      = dbox.getString("d_filenm");
        v_title       = dbox.getString("d_title");
        v_submitdate    = dbox.getString("d_submitdate");
        v_markingdate = dbox.getString("d_markingdate");
        v_rscore      = dbox.getString("d_rscore");
        v_redpen      = dbox.getString("d_redpen");

        v_submitdate    = FormatDate.getFormatDate(v_submitdate,"yyyy/MM/dd");
        v_markingdate = FormatDate.getFormatDate(v_markingdate,"yyyy/MM/dd");
    }

%>

<html>
<head>
<title>::: REPORT :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    // ������
    function whenList() {
        document.form1.action = "/servlet/controller.study.ProjectServlet";
        document.form1.p_process.value = "ProjectListOld";
        document.form1.submit();
    }


//-->
</script>

</head>


<body topmargin="0" leftmargin="0">
<form name="form1" method="post" enctype = "multipart/form-data">
<input type="hidden" name="p_process">
<input type="hidden" name="p_pkey"    value="<%=v_pkey%>">
<input type="hidden" name="p_userid"  value="<%=v_userid%>">

<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="783" height="100%">
  <tr>
    <td>
      <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2" height="100%">
        <tr>
            <td align="center" valign="top" class="body_color">
			<br>
              <!----------------- Ÿ��Ʋ ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
                <tr>
                  <td><img src="/images/user/study/report_title.gif"></td>
                  <td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
                  <td><img src="/images/user/study/gongi_tail.gif"></td>
                </tr>
              </table>
              <!----------------- Ÿ��Ʋ �� ---------------->
            <br>


            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr>
                <td width="13"><img src="/images/user/study/icon2.gif" width="13" height="11" border="0"></td>
                <td><b>��������</b></td>
              </tr>
              <tr>
                <td height="5"></td>
              </tr>
            </table>

            <!----------------- �������� ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr>
                <td class="board_color_line"></td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out2">
              <tr>
                <td>
                  <table cellspacing="1" cellpadding="3" class="table2">
                    <tr>
                      <td class="board_title_bg1" width="20%">������</td>
                      <td class="board_title_bg3" width="80%"><%=v_submitdate%></td>
                    </tr>
                    <tr>
                      <td class="board_title_bg1" width="20%">����</td>
                      <td class="board_title_bg3" width="80%"><%=v_markingdate%></td>
                    </tr>
                    <tr>
                      <td class="board_title_bg1" width="20%">�� ����</td>
                      <td class="board_title_bg3" width="80%"><%=v_rscore%> ��</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- �������� �� ---------------->
            <br>
            <br>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr>
                <td width="13"><img src="/images/user/study/icon2.gif" width="13" height="11" border="0"></td>
                <td><b>���� ÷�賻��</b></td>
              </tr>
              <tr>
                <td height="5"></td>
              </tr>
            </table>

            <!----------------- ���� ÷�賻�� ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr>
                <td class="board_color_line"></td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out2">
              <tr>
                <td>
                  <table cellspacing="1" cellpadding="3" class="table2">
                    <tr>
                      <td class="board_title_bg1">����</td>
                    </tr>
                    <tr>
                      <td class="board_text3" height="27"><%=v_redpen%></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- ���� ÷�賻�� �� ---------------->
            <br>
            <br>
            <!-----------------  ��ư ���� ---------------->
            <table border=0 cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td >&nbsp;</td>
                <td align="right" width="50">
                &nbsp;<a href="javascript:whenList()"><img src="/images/user/button/btn_list.gif"  border="0"></a>
                </td>
              </tr>                      

              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <!-----------------  ��ư �� ---------------->


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
