<%
//**********************************************************
//  1. ��      ��: ��ڿ��� ����Ʈ
//  2. ���α׷��� : za_Contact_L.jsp
//  3. ��      ��: ��ڿ��� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 8
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process     = box.getString("p_process");
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");
    int  v_pageno     = box.getInt("p_pageno");
    if (v_pageno == 0) v_pageno = 1;

    int     v_seq        = 0;
    int     v_dispnum    = 0;
    int     v_totalpage  = 0;

    String  v_addate     = "";
    String  v_queid      = "";
    String  v_quetitle   = "";
    String  v_quecontent = "";
    String  v_ansid      = "";
    String  v_anstitle   = "";
    String  v_anscontent = "";
    String  v_ismail     = "";

    String  v_cono       = "";
    String  v_name       = "";
    String  v_email      = "";
    String  v_jikwinm    = "";
    String  v_compnm     = "";

    String v_classcenter = "";
    String v_classleft   = "";
    
    ArrayList list = (ArrayList)request.getAttribute("selectList");
%>
<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function view(seq) {
        document.form1.action = "/servlet/controller.homepage.ContactAdminServlet";
        document.form1.p_seq.value   = seq;
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function search() {
        document.form1.action = "/servlet/controller.homepage.ContactAdminServlet";
        document.form1.p_pageno.value = 1;
        document.form1.p_process.value = "select";
        document.form1.submit();
    }


    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.homepage.ContactAdminServlet";
         document.form1.p_process.value = "select";
         document.form1.submit();
    }

    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.homepage.ContactAdminServlet";
         document.form1.p_process.value = "select";
         document.form1.submit();
    }

//-->
</SCRIPT>

</head>




<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_seq"   value = "">
    <input type = "hidden" name = "p_pageno"  value = "<%= v_pageno %>">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="665">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="../../../images/admin/homepage/h_title03.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->
      <br>

        <!----------------- ����˻� ���� ----------------->
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="bottom" height="20"><b>�� �亯�� ���� ���Ϸ� �߼۵˴ϴ�.</b></td>
            <td align="right">
              <select name="p_search">
                <option value='quetitle'    <% if (v_search.equals("quetitle")) out.println("selected"); %>    >����</option>
                <option value='quecontents' <% if (v_search.equals("quecontents")) out.println("selected"); %> >����</option>
              </select>
              <input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>">
            </td>
            <td width="42" align="right" valign="bottom">
              <a href='javascript:search()'><img src="/images/admin/homepage/search1_butt.gif" width="37" height="18" border="0"></a>
            </td>
          </tr>
          <tr>
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- ����˻� �� ----------------->

        <!----------------- ��ڿ��� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="8" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="5%"  class="table_title" height="25" ><b>NO</b></td>
            <td width="20%" class="table_title"><b>�Ҽ�</b></td>
            <td width="7%"  class="table_title"><b>����</b></td>
            <td width="7%"  class="table_title"><b>ID</b></td>
            <td width="7%"  class="table_title"><b>���</b></td>
            <td width="7%"  class="table_title"><b>����</b></td>
            <td width="12%"  class="table_title"><b>�ۼ���</b></td>
            <td width="43%" class="table_title"><b>����</b></td>
          </tr>
<%
            for(int i = 0; i < list.size(); i++) {

                ContactData data  = (ContactData)list.get(i);

                v_seq        = data.getSeq();
                v_addate     = data.getAddate();
                v_addate     = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd HH")+"��";
                v_queid      = data.getQueid();
                v_quetitle   =  data.getQuetitle();
                v_quecontent = data.getQuecontent();
                v_ansid      = data.getAnsid();
                v_anstitle   = data.getAnstitle();
                v_anscontent = data.getAnscontent();
                v_ismail     = data.getIsmail();

                v_cono       = data.getCono();
                v_name       = data.getName();
                v_email      = data.getEmail();
                v_jikwinm    = data.getJikwinm();
                v_compnm     = data.getCompnm();
                v_dispnum    = data.getDispnum();
                v_totalpage  = data.getTotalPageCount();

                if (v_ismail.equals("Y")) {
					v_classcenter = "table_02_1";
					v_classleft   = "table_02_2";
				} else {
					v_classcenter = "table_02_5";
					v_classleft   = "table_02_6";
				}
//"#CECECE"
%>
          <tr>
            <td class="table_01" height="25"><%=v_dispnum%></td>
            <td class="<%=v_classcenter%>"><%=v_compnm%></td>
            <td class="<%=v_classcenter%>"><%=v_jikwinm%></td>
            <td class="<%=v_classcenter%>"><%=v_queid%></td>
            <td class="<%=v_classcenter%>"><%=v_cono%></td>
            <td class="<%=v_classcenter%>"><%=v_name%></td>
            <td class="<%=v_classcenter%>"><%=v_addate%></td>
            <td class="<%=v_classleft%>"><a href="javascript:view(<%=v_seq%>)"><%=v_quetitle%></a></td>
          </tr>


<%
        }
%>

        </table>
        <!----------------- List �� ----------------->

       <br>
        <!----------------- total ���� ----------------->
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="absmiddle">
                  <%= PageUtil.printPageList(v_totalpage, v_pageno, 10) %>
            </td>
          </tr>
        </table>
        <!----------------- total �� ----------------->
       <br>

      </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
