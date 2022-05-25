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
    String v_attach = "";

    int v_dispnum   = 0;
    int v_totalpage = 0;
    int v_rowcount  = 0;
    int v_upfilecnt = 0;

    int v_tabseq    = box.getInt("p_tabseq");
    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");
    int     v_totalrowcount =  0;

    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");

    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");
    
    String  s_gadmin    = box.getSession("gadmin");
    String v_gadmin ="";
    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }

    ArrayList list = (ArrayList)request.getAttribute("selectList");
%>


<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.tutor.OffPlanNoteAdminServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.tutor.OffPlanNoteAdminServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }
    function pagesize(pageSize) {
        document.form1.target = "_self";
        document.form1.p_pageno.value = 1;
        document.form1.p_pagesize.value = pageSize;
        document.form1.action = '/servlet/controller.tutor.OffPlanNoteAdminServlet';
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }
    function selectList() {
        document.form1.action = "/servlet/controller.tutor.OffPlanNoteAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }
    function insertPage() {
        document.form1.action = "/servlet/controller.tutor.OffPlanNoteAdminServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }
    function select(seq) {
        document.form1.action = "/servlet/controller.tutor.OffPlanNoteAdminServlet";
        document.form1.p_process.value = "selectView";
        document.form1.p_seq.value = seq;
        document.form1.submit();
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"   value = "">
    <input type = "hidden" name = "p_pageno"    value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_pagesize"  value = "<%=v_pagesize%>">
    <input type = "hidden" name = "p_seq"       value = "">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="600">
  <tr>
    <td align="center" valign="top">


      <!----------------- title 시작 ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/portal/s.1_23.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title 끝 ----------------->
      <br>
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr valign="middle">
            <td align="right" width="85%">
              <select name="p_search" >
                <option value='name' <% if (v_search.equals("name")) out.print("selected"); %>>작성자</option>
                <option value='title' <% if (v_search.equals("title")) out.print("selected"); %>>제목</option>
                <option value='content' <% if (v_search.equals("content")) out.print("selected"); %>>내용</option>
              </select>
              <input name="p_searchtext" type="text" class="input" value='<%=v_searchtext %>'> </td>
            <td align="right">
                  <a href = "javascript:selectList();"><img src="/images/admin/button/b_go.gif" border="0"></a>
                <%  //if(BulletinManager.isAuthority(box, box.getString("p_canAppend"))) {    //    쓰기 여부 %>
                <%if(v_gadmin.equals("A")){%>
                    <a href = "javascript:insertPage();"><img src="/images/admin/button/btn_add.gif" border="0"></a>
                <%}%>
                <%  //}   %>            
            </td>
          </tr>
        </table>
        <br>

        <!----------------- List 시작 ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="6" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="8%"  class="table_title" height="25" align="center"><b>NO</b></td>
            <td width="54%" class="table_title"><b>내 용</b><b></b></td>
            <td width="8%"  class="table_title"><b>작성자</b></td>
            <td width="14%" class="table_title"><b>등록일</b></td>
            <td width="8%"  class="table_title"><b>첨부</b></td>
            <td width="8%"  class="table_title"><b>조회수</b></td>
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
        v_upfilecnt = dbox.getInt("d_upfilecnt");
        v_dispnum   = dbox.getInt("d_dispnum");
        v_totalpage = dbox.getInt("d_totalpage");
        v_totalrowcount = dbox.getInt("d_totalrowcount");

        // 검색어가 있었다면 해당 부분을 해당색으로 부각시킨다.
        if (!v_searchtext.equals("")) {
            if (v_search.equals("name")) {
                v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            } else if (v_search.equals("title")) {
                v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            }
        }
        
        if(v_upfilecnt > 0 ) {
        	v_attach = "<img src='/images/admin/study/file_icon1.gif'>";
        } else {
        	v_attach = "";
        }
        

%>
          <tr>
            <td class="table_01" height="25"><%=v_dispnum%></td>
            <td  class="table_02_2">
              <a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_userid%>')"><%=v_title%></a>
              <% if(FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){          %>
                 &nbsp;&nbsp;<img src="/images/user/course/btn_new.gif" align = "absmiddle" border = "0">
              <%  }                                                                                                 %>
            </td>
            <td class="table_02_1"><a href = "mailto:<%//=fbean.getSession("email")%>"><%= v_name %></a></td>
            <td class="table_02_1"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
            <td class="table_02_1"><%= v_attach %></td>
            <td class="table_02_1"><%=v_cnt%></td>
          </tr>
<%
        }
%>

        </table>
        <!----------------- List 끝 ----------------->
        <!----------------- total 시작 ----------------->
        <br>
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="absmiddle">
              <%= PageUtil.printPageSizeList(v_totalpage, v_pageno, 0, v_pagesize, v_totalrowcount) %>
            </td>
          </tr>
        </table>
        <br>
        <!----------------- total 끝 ----------------->
      </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
