<%
//**********************************************************
//  1. ��      ��: ������������
//  2. ���α׷���:  zu_SubjGongStudy_R.jsp
//  3. ��      ��: ���� ���� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 8. 13
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


	int     v_seq        = 0;
    String  v_types      = "";
    String  v_typesnm    = "";
    String  v_addate     = "";
    String  v_title      = "";
    String  v_adcontent  = "";

   /*  ���� ����   */
   SubjGongData data = (SubjGongData)request.getAttribute("selectGong");
    if (data != null) {
        v_seq        = data.getSeq();
        v_types      = data.getTypes();
        v_typesnm    = data.getTypesnm();
        v_addate     = FormatDate.getFormatDate(data.getAddate(),"yyyy/MM/dd");
        v_title      = data.getTitle();
        //v_adcontent  = StringManager.replace(data.getAdcontent(),"\n","<br>");
        v_adcontent  = data.getAdcontent();
    }

%>
<html>
<head>
<title>::: �������� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function list_gong() {
        document.form1.action = "/servlet/controller.study.SubjGongStudyServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }
//-->
</SCRIPT>
</head>

<body class="body_color">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"  value = "<%= v_process %>">
    <input type="hidden" name="p_subj"    value="<%=v_subj%>">
    <input type="hidden" name="p_year"    value="<%=v_year%>">
    <input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
    <input type="hidden" name="p_seq"     value="<%=v_seq%>">
<!----------------- Ÿ��Ʋ ���� ---------------->
<table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
  <tr> 
    <td><img src="/images/user/study/gongi_title.gif"></td>
    <td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
    <td><img src="/images/user/study/gongi_tail.gif"></td>
  </tr>
</table>
<!----------------- Ÿ��Ʋ �� ---------------->
<br>

<!----------------- �������� ���� ���� ---------------->
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr> 
    <td class="board_color_line"></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
  <tr> 
    <td> 
      <table cellspacing="1" cellpadding="3" class="table2">
        <tr> 
          <td class="board_title_bg1" width="15%">�� ��</td>
          <td colspan="3" class="board_title_bg3"><%= v_title %></td>
        </tr>
        <tr> 
          <td class="board_title_bg1">�����</td>
          <td class="board_title_bg3" colspan="3"><%= v_addate %> </td>
        </tr>
        <tr> 
          <td colspan="4" class="board_text1" align="center"> 
            <table width="98%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td> <%= v_adcontent %></td>
              </tr>
              <tr> 
                <td height="7"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<!----------------- �������� ���뺸�� �� ---------------->
<br>


<!----------------- ��� ��ư ���� ----------------->
<table width="30%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td align="center"><a href="javascript:list_gong()"><img src="/images/user/button/btn_list.gif"  border="0"></a></td>
  </tr>
</table>
<!----------------- ��� ��ư �� ----------------->
<%@ include file = "/learn/library/getJspName.jsp" %>


</body>
</html>
