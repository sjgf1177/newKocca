<%
//**********************************************************
//  1. ��      ��: ������ �˻� ����Ʈ
//  2. ���α׷��� : searchApproval.jsp
//  3. ��      ��: ������ �˻� ����Ʈ(�˾�)
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 16
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    int  v_pageno     = box.getInt("p_pageno");
    if (v_pageno == 0) v_pageno = 1;

    String  v_search     = box.getString("p_gubun");
    String  v_searchtext = box.getString("p_key1");
    String  v_key2       = box.getString("p_key2");

    String v_userid  = "";
    String v_name    = "";
    String v_resno   = "";
    String v_email   = "";
    String v_cono    = "";
    String v_jikwi   = "";
    String v_jikwinm = "";
    String v_comp    = "";
    String v_compnm  = "";

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������

    ArrayList list = (ArrayList)request.getAttribute("selectList");

%>
<html>
<head>
<title>�� ������ ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" href="/css/user_style_propose.css" type="text/css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/cresys_lib.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function init() {
        this.moveTo(0,0);
        this.resizeTo(560,450);
    }

    function selectApproval(userid, name, resno, email, cono, jikwi, jikwinm, comp, compnm, tmp1, tmp2, tmp3) {
        opener.receiveApproval(userid, name, resno, email, cono, jikwi, jikwinm, comp, compnm, tmp1, tmp2, tmp3);
        self.close();
    }

    function enter(e) {
        if (e.keyCode =='13'){
            search();
        }
    }

    function search() {
        if (document.form1.p_key1.value == "") {
            alert("�˻�� �Է����ּ���");
            return;
        }

         document.form1.action = "/servlet/controller.library.SearchServlet";
         document.form1.p_process.value = "approval";
         document.form1.submit();
    }

    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.library.SearchServlet";
         document.form1.p_process.value = "approval";
         document.form1.submit();
    }

    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.library.SearchServlet";
         document.form1.p_process.value = "approval";
         document.form1.submit();
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onLoad='init();'>
<form name = "form1" method = "post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno"  value = "<%= v_pageno %>">
    <input type = "hidden" name = "p_userid"  value = "">
    <input type = "hidden" name = "p_key2"  value = "<%=v_key2%>">

<table width="560" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td background="/images/user/propose/propose_open_bar2.gif"><img src="/images/user/propose/propose_open_bar1.gif" width="88" height="3" border="0"></td>
  </tr>
  <tr> 
    <td align="center"> 

      <table cellpadding="0" cellspacing="7" bgcolor="#F7F7F7" class="table2">
        <tr> 
          <td> 
            <table cellpadding="0" cellspacing="1" bgcolor="#C0C0C0" class="table2">
              <tr> 
                <td align="center" class="body_color" bgcolor="#FEFEFE" valign="top"> 
                  <br>

                  <!----------------- ������ Ÿ��Ʋ, ��ȸ ���� ----------------->
                  <table cellspacing="0" cellpadding="0" class="open_table3">
                    <tr> 
                      <td width="15"><img src="/images/user/propose/propose_icon1.gif" width="15" height="15" border="0"></td>
                      <td class="s_title_text">������</td>
                      <td align="right"> 


                        <table cellspacing="0" cellpadding="0" width="180">
                          <tr> 
                            <td align="center"> 
                              <input type='hidden' name="p_gubun" value= 'name'>
                              <input name="p_key1" type="text" class="input_course_search" value='<%=v_searchtext%>' onkeypress=enter(event)>&nbsp;
                            </td>
                            <td width="50"><img src="/images/user/propose/search_butt2.gif" width="45" height="16" border="0"></td>
                          </tr>
                        </table>

                      </td>
                    </tr>
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table>
                  <!----------------- ������ Ÿ��Ʋ, ��ȸ �� ----------------->

                  <table cellspacing="0" cellpadding="0" class="open_table3">
                    <tr> 
                      <td colspan="7" class="table_top_line"></td>
                    </tr>
                    <tr> 
                      <td class="table_title_bg1" >�Ҽ�</td>
                      <td valign="top" class="table_title_line" width="1"><img src="/images/user/propose/table_line.gif" width="1" height="8" border="0"></td>
                      <td class="table_title_bg1" width="15%">����</td>
                      <td valign="top" class="table_title_line" width="1"><img src="/images/user/propose/table_line.gif" width="1" height="8" border="0"></td>
                      <td class="table_title_bg1" width="15%">ID</td>
                      <td valign="top" class="table_title_line" width="1"><img src="/images/user/propose/table_line.gif" width="1" height="8" border="0"></td>
                      <td class="table_title_bg1" width="15%">����</td>
                    </tr>
                    <tr> 
                      <td colspan="7" class="table_color_line"></td>
                    </tr>

<%
         int i = 0;;

            for(i = 0; i < list.size(); i++) {

                SearchData data  = (SearchData)list.get(i);

                v_userid  = data.getCode();
                v_name    = data.getCodenm();
                v_resno   = data.getTmp1();;
                v_email   = data.getTmp2();
                v_cono    = data.getTmp3();
                v_jikwi   = data.getTmp4();
                v_jikwinm = data.getTmp5();
                v_comp    = data.getTmp6();
                v_compnm  = data.getTmp7();         // ȸ��/�����/�μ�
                v_dispnum   = data.getDispnum();
                v_totalpage = data.getTotalpagecount();

%>
                    <tr> 
                      <td class="table_text1"><%=v_compnm%></td>
                      <td class="table_line1" width="1"></td>
                      <td class="table_text1"><%=v_jikwinm%></td>
                      <td class="table_line1" width="1"></td>
                      <td class="table_text1"><%=v_userid%></td>
                      <td class="table_line1" width="1"></td>
                      <td class="table_text1"><a href="javascript:selectApproval('<%=v_userid%>' ,'<%=v_name%>' ,'<%=v_resno%>' ,'<%=v_email%>' ,'<%=v_cono%>' ,'<%=v_jikwi%>' ,'<%=v_jikwinm%>' ,'<%=v_comp%>' ,'<%=v_compnm%>', '<%=v_key2%>', '', '')" class="a"><%=v_name%></a></td>
                    </tr>
                    <tr> 
                      <td colspan="7" class="table_line2"></td>
                    </tr>
<%
          }
%>
            <% if(i == 0){ %>
                    <tr>
                      <td height='40' colspan="7" class="table_text1">�˻��� ȸ�簡 �����ϴ�</td>
                    </tr>
                    <tr> 
                      <td colspan="7" class="table_line2"></td>
                    </tr>
            <% } %>
                    <tr> 
                      <td colspan="7" class="table_line2"></td>
                    </tr>
                    <tr> 
                      <td colspan="7" class="table_line2"></td>
                    </tr>
                </table>

                  <!----------------- total ���� ----------------->
                  <table cellspacing="0" cellpadding="0" class="open_table3">
                    <tr> 
                        <td height="9"></td>
                    </tr>
                    <tr> 
                      <td align="center"><%= PageUtil.printPageList(v_totalpage, v_pageno, 10) %></td>
                    </tr>
                  </table>
                  <!----------------- total �� ----------------->

                  <!----------------- �ݱ� ��ư ���� ----------------->
                  <table cellspacing="0" cellpadding="0" class="open_table3">
                    <tr> 
                      <td align="right"><a href="javascript:self.close()"><img src="/images/user/propose/open_close_butt1.gif" width="35" height="15" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table>
                  <!----------------- �ݱ� ��ư �� ----------------->

                 </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>

    </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
