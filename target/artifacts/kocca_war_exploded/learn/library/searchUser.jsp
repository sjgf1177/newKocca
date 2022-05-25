<%
//**********************************************************
//  1. ��      ��: ��������� �˻� ����Ʈ
//  2. ���α׷��� : searchUser.jsp
//  3. ��      ��: ��������� �˻� ����Ʈ(�˾�)
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: swchoi
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
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

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������

    ArrayList list = (ArrayList)request.getAttribute("selectList");

%>
<html>
<head>
<title>�� ��������� �˻� ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/cresys_lib.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function init() {
//        this.moveTo(0,0);
//        this.resizeTo(575,485);
    }

    function selectUser(userid ,resno ,name ,email,membergubun ,comptext, handphone) {
        var date = {userid:userid,resno:resno,name:name,email:email,membergubun:membergubun,comptext:comptext,handphone:handphone};
        opener.addUser(date);
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
         document.form1.p_process.value = "user";
         document.form1.submit();
    }

    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.library.SearchServlet";
         document.form1.p_process.value = "user";
         document.form1.submit();
    }

    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.library.SearchServlet";
         document.form1.p_process.value = "user";
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


<table width="532" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">


  <tr>
    <td><table width="530" height="435" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
        <tr>
          <td align="center" valign='top' bgcolor="#FFFFFF">
          <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
            
          <td><img src="../../images/admin/course/tit_memsearch.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <br>
            <table width="510" height="26" border="0" cellpadding="0" cellspacing="0">
              <tr>
              <tr>
                <td height="10"></td>
              </tr>
                <td align="right">
                  <select name="p_gubun">
                    <option value='name' <% if (v_search.equals("name")) out.println("selected"); %> >�̸�</option>
                    <option value='userid' <% if (v_search.equals("userid")) out.println("selected"); %> >ID</option>
                  </select>
                  <input name="p_key1" type="text" class="input" value='<%=v_searchtext%>' onkeypress=enter(event)>
                </td>
                <td width="50" align="right" valign="bottom">
                <a href="javascript:search()"><img src="/images/admin/button/search3_butt.gif" border="0"></a>
                </td>
              </tr>
              <tr>
                <td height="3"></td>
              </tr>
            </table>
            <table width="510" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td colspan="7" class="table_top_line"></td>
              </tr>
              <tr>
                <td width="5%" height="26" class="table_title">&nbsp;</td>
                <td width="5%" class="table_title"><b>NO</b></td>
                <td width="18%" class="table_title"><b>ID</b></td>
                <td width="18%" class="table_title"><b>����</b></td>
                <td width="31%" class="table_title"><b>email</b></td>
                <td width="23%" class="table_title"><b>��ȭ��ȣ</b></td>
              </tr>
<%
         int i = 0;;

            for(i = 0; i < list.size(); i++) {

            	DataBox data = (DataBox) list.get(i);

%>
              <tr>
                <td height="26" class="table_01"> <input type="radio" name="no" value="<%=data.getFromDBTypeString("userid")%>" onClick="javascipt:selectUser('<%=data.getFromDBTypeString("userid")%>' ,'<%=data.getFromDBTypeString("resno")%>' ,'<%=data.getFromDBTypeString("name")%>' ,'<%=data.getFromDBTypeString("email")%>' ,'<%=data.getFromDBTypeString("membergubun")%>' ,'<%= data.getFromDBTypeString("comptext") %>' , '<%= data.getFromDBTypeString("handphone") %>', '', '', '')"></td>
                <td class="table_02_1"><%=(i+1)%></td>
                <td class="table_02_1"><%=data.getFromDBTypeString("userid")%></td>
                <td class="table_02_1"><p><%=data.getFromDBTypeString("name")%></p></td>
                <td class="table_02_1"><%=data.getFromDBTypeString("email")%></td>
                <td class="table_02_1"><%=data.getFromDBTypeString("handphone")%></td>
              </tr>
<%
          }
%>
            <% if(i == 0){ %>
              <tr>
                <td height='40' colspan="7" class="table_02_1">�˻��� ��������ڰ� �����ϴ�</td>
              </tr>
            <% } %>
            </table>

            <!----------------- total ���� ----------------->
            <table width="510" height="26" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="right" valign="absmiddle">
                  <%= PageUtil.printPageList(v_totalpage, v_pageno, 10) %>
                </td>
              </tr>
            </table>
            <!----------------- total �� ----------------->

            <table width="510" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="right" style="padding-top=10"><a href='javascript:self.close()'><img src="/images/admin/button/btn_close.gif"  border=0></a></td>
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
