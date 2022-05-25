<%
//**********************************************************
//  1. ��      ��: ��� ��������
//  2. ���α׷��� : za_NewsLetter_L.jsp
//  3. ��      ��: ��� ��������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 9. 2
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    int v_seq = 0;
    int v_cnt = 0;
    int i     = 0;

    String v_userid = "";
    String v_name   = "";
    String v_indate = "";
    String v_title  = "";

    int v_dispnum   = 0;
    int v_totalpage = 0;
    int v_rowcount  = 0;
    int v_upfilecnt = 0;

    String v_type    = box.getStringDefault("p_type","HR");
    int v_tabseq    = box.getInt("p_tabseq");
    int v_pageno    = box.getInt("p_pageno");

    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");

    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");

    ArrayList list = (ArrayList)request.getAttribute("selectBoardList");
%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">


<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/cresys_lib.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
    //������ ��ȸ
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.homepage.NewsAdminServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }
    //������ �̵�
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.homepage.NewsAdminServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }
    //��ȭ�� ��ȸ
    function selectList() {
        document.form1.action = "/servlet/controller.homepage.NewsAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }
    //�Է�ȭ�� �̵�
    function insertPage() {
        document.form1.action = "/servlet/controller.homepage.NewsAdminServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }
    //����Ʈ ��ȸ
    function select(seq, upfilecnt, userid) {
        document.form1.action = "/servlet/controller.homepage.NewsAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.p_seq.value = seq;
        document.form1.p_upfilecnt.value = upfilecnt;
        document.form1.p_userid.value    = userid;
        document.form1.submit();
    }
    // ����Ʈ ��ȯ (HR news,  What's news)
    function moveList() {
        document.form1.action = "/servlet/controller.homepage.NewsAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }
    // ����� ȭ��
    function userOpen(seq) {
        window.self.name = "adminList";
        open_window("openUser","","10","10","690","550", 'no', 'no', 'no', 'yes', 'no');
        document.form1.target = "openUser";
		document.form1.p_seq.value=seq;
        document.form1.p_process.value='userSelect';
        document.form1.action='/servlet/controller.homepage.NewsAdminServlet?p_process=userSelect&p_type=<%=v_type%>';
        document.form1.submit();

        document.form1.target = window.self.name;
    }
//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"   value = "">
    <input type = "hidden" name = "p_pageno"    value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq%>">
    <input type = "hidden" name = "p_seq"       value = "">
    <input type = "hidden" name = "p_upfilecnt" value = "">
    <input type = "hidden" name = "p_userid"    value = "">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="600">
  <tr>
    <td align="center" valign="top">


      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
            <td><img src="/images/admin/homepage/tit_news.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr valign="middle">
            <td align="left" width="20%">
                <select name= "p_type" onChange="moveList()">
                    <option value="HR" <%if(v_type.equals("HR")){%>selected<%}%>>HR NEWS</option>
                    <option value="WN" <%if(v_type.equals("WN")){%>selected<%}%>>WHAT'S NEWS</option>
                </select>
            </td>
            <td align="right" width="65%">
              <select name="p_search" >
                <option value='name' <% if (v_search.equals("name")) out.print("selected"); %>>�ۼ���</option>
                <option value='title' <% if (v_search.equals("title")) out.print("selected"); %>>����</option>
                <option value='content' <% if (v_search.equals("content")) out.print("selected"); %>>����</option>
              </select>
              <input name="p_searchtext" type="text" class="input" value='<%=v_searchtext %>'> </td>
            <td align="right">
                  <a href = "javascript:selectList();"><img src="/images/admin/button/b_go.gif" border="0"></a>
                    <a href = "javascript:insertPage();"><img src="/images/admin/button/btn_add.gif" border="0"></a>
            </td>
          </tr>
        </table>
        <br>

        <!----------------- List ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="6" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="8%"  class="table_title" height="25" align="center"><b>NO</b></td>
            <td width="34%" class="table_title"><b>�� ��</b><b></b></td>
            <td width="28%"  class="table_title"><b>��ũ</b></td>
            <td width="8%"  class="table_title"><b>�ۼ���</b></td>
            <td width="14%" class="table_title"><b>�����</b></td>
            <td width="8%"  class="table_title"><b>��ȸ��</b></td>
            <!--td width="8%"  class="table_title"><b>÷������</b></td-->
          </tr>
<%
    for(i = 0; i < list.size(); i++) {
        DataBox dbox = (DataBox)list.get(i);
        v_userid    = dbox.getString("d_userid");
        v_name      = dbox.getString("d_name");
        v_indate    = dbox.getString("d_indate");
        v_title     = dbox.getString("d_title");
        v_seq       = dbox.getInt("d_seq");
        v_cnt       = dbox.getInt("d_cnt");
        v_upfilecnt = dbox.getInt("d_filecnt");
        v_dispnum   = dbox.getInt("d_dispnum");
        v_totalpage = dbox.getInt("d_totalpagecount");
        v_rowcount  = dbox.getInt("d_rowcount");

        // �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
        if (!v_searchtext.equals("")) {
            if (v_search.equals("name")) {
                v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            } else if (v_search.equals("title")) {
                v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            }
        }

%>
          <tr>
            <td class="table_01" height="25"><%=list.size()-i%></td>
            <td  class="table_02_2">
              <a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_userid%>')"><%=v_title%></a>
              <% if(FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){          %>
                 &nbsp;&nbsp;<img src = "/images/user/course/btn_new.gif" align = "absmiddle" border = "0">
              <%  }                                                                                                 %>
            </td>
            <td  class="table_02_2"><a href="javascript:userOpen('<%=v_seq%>')">/servlet/controller.homepage.NewsAdminServlet?p_process=userSelect&p_type=<%=v_type%>&p_seq=<%=v_seq%></a></td>
            <td class="table_02_1"><%= v_name %></a></td>
            <td class="table_02_1"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
            <td class="table_02_1"><%=v_cnt%></td>
            <!--td class="table_02_1"><%= v_upfilecnt %></td-->
          </tr>
<%
        }
%>

        </table>
        <!----------------- List �� ----------------->
        <!----------------- total ���� ----------------->
        <br>
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="absmiddle">
              <%= PageUtil.printPageList(v_totalpage, v_pageno, row) %>
            </td>
          </tr>
        </table>
        <br>
        <!----------------- total �� ----------------->
      </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
