<%
//**********************************************************
//  1. ��      ��: Notice Templet
//  2. ���α׷��� : za_NoticeTemplet_L.jsp
//  3. ��      ��: �������� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box        = (RequestBox)request.getAttribute("requestbox");
    String  v_process     = box.getString("p_process");

    int  v_pageno         = box.getInt("p_pageno");
    if (v_pageno == 0) {
        v_pageno = 1;
    }
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");
    String  v_selGubun    = box.getString("p_selGubun");  

    int    v_seq     = 0;              // �Ϸù�ȣ
    int    v_cnt     = 0;              // ��ȸ��
    String v_adtitle     = "";         // ����
    String v_addate      = "";         // �����
    String v_adname      = "";         // �����
    String v_templetfile = "";         // ���ø� ���ϸ�
    String v_code        = "";         // ���ø� �ڵ�
    String v_codenm      = "";         // ���ø� �ڵ��

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������

    ArrayList list      = (ArrayList)request.getAttribute("selectList");
    ArrayList codeList  = (ArrayList)request.getAttribute("codeList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    // �󼼺���
    function view(seq) {
        document.form1.action = "/servlet/controller.homepage.NoticeTempletServlet";
        document.form1.p_seq.value = seq;
        document.form1.p_process.value = "selectView";
        document.form1.submit();
    }

    // ���
    function insert() {
        document.form1.action = "/servlet/controller.homepage.NoticeTempletServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }

    // �˻�
    function search() {
        document.form1.action = "/servlet/controller.homepage.NoticeTempletServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

	// �������̵�
    function go(index) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = index;
         document.form1.action = '/servlet/controller.homepage.NoticeTempletServlet';
         document.form1.p_process.value = "select";
         document.form1.submit();
    }

	// �������̵�
    function goPage(pageNum) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = pageNum;
         document.form1.action = '/servlet/controller.homepage.NoticeTempletServlet';
         document.form1.p_process.value = "select";
         document.form1.submit();
    }

//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno"  value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_seq"     value = "">


  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/homepage/tit_noticetem.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>
      <table class="form_table_out" cellspacing="0" cellpadding="1">
          <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7" width="99%"></td>
              </tr>
              <tr>
                <td align="center" width="99%" valign="middle">
                  <table width="99%" cellspacing="0" cellpadding="0" class="form_table">
                    <tr>
                      <td>
                        <table cellspacing="0" cellpadding="0" width="99%">
                          <tr>
                            <td height="3"></td>
                          </tr>
                          <tr>
                            <td> <table border="0" cellspacing="0" cellpadding="0" width="99%">
                                <tr>
                                  <td width="60%" >
                                    <select name="p_selGubun" onChange="search()">
                                      <option value="">::��ü::</option>
                                      <% 
                                        if (codeList != null && codeList.size() > 0) {
                                            for(int i = 0 ; i < codeList.size() ; i ++ ) {
                                            	DataBox dbox   = (DataBox)codeList.get(i);

                                            	v_code         = dbox.getString("d_code"); 
                                            	v_codenm       = dbox.getString("d_codenm");
                                      %>
                                        <option value="<%=v_code %>" <%=v_code.equals(v_selGubun) ? "selected" : ""  %> ><%=v_codenm %></option>
                                      <%
                                            }
                                        }
                                      %>
                                    </select>
                                  </td>
                                  <td  width="40%" align="right">
                                    <select name="p_search" >
                                      <option value='adtitle' <% if (v_search.equals("adtitle")) out.println("selected"); %>>����</option>
                                      <option value='name'    <% if (v_search.equals("name")) out.println("selected"); %>   >�ۼ���</option>
                                    </select>
                                    <input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>">
                                    <a href="javascript:search()"><img src="/images/admin/button/search3_butt.gif" align="absmiddle" border="0"></a>
                                  </td>
                                </tr>
                              </table></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7" width="99%"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!-- �˻� �� -->
      <br>

      <!----------------- ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="right" height="20"><a href='javascript:insert()'><img src="/images/admin/button/btn_add.gif" border="0"></a></td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- �������� ���� ----------------->

      <table class="table_out" cellspacing="1" cellpadding="5">
        <tr>
          <td colspan="7" class="table_top_line"></td>
        </tr>
        <tr>
          <td width="5%" height="25" class="table_title"><b>NO</b></td>
          <td width="15%" class="table_title">����</td>
          <td width="68%" class="table_title">����</td>
          <td width="12%" class="table_title">�����</td>
        </tr>
<%
            for(int i = 0; i < list.size(); i++) {
                DataBox dbox   = (DataBox)list.get(i);

                v_seq         = dbox.getInt("d_seq");
                v_cnt         = dbox.getInt("d_cnt");
                v_adtitle     = dbox.getString("d_adtitle");
                v_addate      = dbox.getString("d_addate");
                v_adname      = dbox.getString("d_adname");
                v_templetfile = dbox.getString("d_templetfile");
                v_codenm      = dbox.getString("d_codenm");

                v_addate   = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd");
                v_dispnum   = dbox.getInt("d_dispnum");
                v_totalpage = dbox.getInt("d_totalpage");
%>

          <tr>
            <td class="table_01" height="29"><%=v_dispnum%></td>
            <td class="table_02_1"><%=v_codenm%></td>
            <td class="table_02_2"><a href="javascript:view('<%=v_seq%>')"><%=v_adtitle%></a></td>
            <td class="table_02_1"><%=v_addate%></td>
          </tr>
<%
        }
%>
      </table>
        <!----------------- ����Ʈ ��ȸ �� ----------------->
        <br>
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