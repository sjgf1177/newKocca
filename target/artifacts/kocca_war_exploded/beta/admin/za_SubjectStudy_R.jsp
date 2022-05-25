<%
//**********************************************************
//  1. ��      ��: ���������н�-���Ȼ�
//  2. ���α׷���: za_SubjectStudy_R.jsp
//  3. ��      ��: ���������н�-���Ȼ�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: S.W.Kang
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.beta.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_subjnm     = box.getString("p_subjnm");
    String  v_subj       = box.getString("p_subj");
    String  v_process    = box.getString("p_process");
    int     v_pageno     = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    String  v_comp       = box.getString("p_comp");
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int     v_orgseq     = v_seq;
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    int v_levels = 0;
    int v_dispnum   = 0;
    int v_totalpage = 0;
    int v_rowcount  = 0;

    int    i         = 0;
    int    v_cnt     = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";
    
    String v_class1     = "";
    String v_class2     = "";
        
	Vector v_realfileVector = null;
    Vector v_savefileVector = null;

	DataBox dbox = (DataBox)request.getAttribute("selectDocData");

    if (dbox != null ) {
        v_seq           = dbox.getInt("d_seq");
        v_subj          = dbox.getString("d_subj");
        v_userid        = dbox.getString("d_userid");
        v_name          = dbox.getString("d_name");
        v_title         = dbox.getString("d_title");
        v_content       = dbox.getString("d_content");
        v_cnt           = dbox.getInt("d_cnt");
        v_indate        = dbox.getString("d_indate");
        v_realfileVector = (Vector)dbox.getObject("d_realfile");
        v_savefileVector = (Vector)dbox.getObject("d_savefile");
        v_content = StringManager.replace(v_content,"\r\n","<br>");
}

    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");
    int    v_filecount = v_realfileVector.size();

    // ����Ʈ
//    ArrayList list = (ArrayList)request.getAttribute("UpdateDocPage");
    
    //DEFINED in relation to select START
    String  ss_action    = box.getString("s_action");   
    //DEFINED in relation to select END        
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.beta.SubjectSimulationServlet";
         document.form1.p_process.value = "list";
         document.form1.submit();
    }
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.beta.SubjectSimulationServlet";
         document.form1.p_process.value = "list";
         document.form1.submit();
    }
    function reply_StudyData() {
        document.form1.action = "/servlet/controller.beta.SubjectSimulationServlet";
        document.form1.p_process.value = "replyPage";
        document.form1.submit();
    }

    function modify_StudyData() {
        document.form1.action = "/servlet/controller.beta.SubjectSimulationServlet";
        document.form1.p_process.value = "modifyPage";
        document.form1.submit();
    }

    function delete_StudyData() {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {
            document.form1.action = "/servlet/controller.beta.SubjectSimulationServlet";
            document.form1.p_process.value = "deleteDoc";
            document.form1.p_pageno.value = "1";
            document.form1.submit();
        }
        else {
            return;
        }
    }

    function list_StudyData() {
        document.form1.action = "/servlet/controller.beta.SubjectSimulationServlet";
        document.form1.p_process.value = "docListPage";
        document.form1.submit();
    }


    function selectList() {
        document.form1.action = "/servlet/controller.beta.SubjectSimulationServlet";
        document.form1.p_process.value = "list";
        document.form1.p_pageno.value = "1";
        document.form1.submit();
    }

    function select(seq, upfilecnt, userid) {
        document.form1.action = "/servlet/controller.beta.SubjectSimulationServlet";
        document.form1.p_process.value = "select";
        document.form1.p_seq.value = seq;
        document.form1.p_upfilecnt.value = upfilecnt;
        document.form1.p_userid.value    = userid;
        document.form1.submit();
    }
    function insertPage() {
        document.form1.action = "/servlet/controller.beta.SubjectSimulationServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }    
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type="hidden"   name = "s_action"    value="<%=ss_action%>">     <!--in relation to select-->
    <input type="hidden"   name = "p_subj"value="<%=v_subj%>"> <!--in relation to select-->
    <input type = "hidden" name = "p_subjnm"    value = "<%=v_subjnm %>">
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_filecount %>">
    <input type = "hidden" name = "p_userid"     value = "<%= v_userid %>">
    <input type = "hidden" name = "p_comp"       value = "<%= v_comp %>">



  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
     <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/beta/b_title05.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
		    <td width="1%"><img src="/images/admin/common/icon.gif" ></td> 
            <td class=sub_title><%=v_subjnm%>����</td>
          </tr>
		  <tr>
            <td height=6></td>
            <td height=6></td>
          </tr>
        </table>
        <!----------------- �ڷ��� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="12%" height="25" class="table_title"><b>�ۼ���</b></td>
            <td class="table_02_2" width="88%"><%=v_name%></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"><%= v_title %></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>�����</b></td>
            <td class="table_02_2"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
          </tr>       
          <tr> 
            <td class="table_title" height="25"><b>��ȸ��</b></td>
            <td class="table_02_2"><%=v_cnt%></td>
          </tr>                  
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"><%= v_content %></td>
          </tr>

		<!---------����÷�ο��� ------------>

		<%  
				if( v_realfileVector != null ) { 
					for(i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����
					String v_realfile = (String)v_realfileVector.elementAt(i);
					String v_savefile = (String)v_savefileVector.elementAt(i);                        
		%>
		  <tr>
			<td class = "table_title" align = "center">÷������</td>
			<td class = "table_02_2"  align = "left" colspan="3">
			<%		if(v_realfile != null && !v_realfile.equals("")) {  %>
					&nbsp;<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'>
					<%= v_realfile%></a><br>
					<input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
			<%		}   %>
			</td>
		  </tr>
		<%			}
				}
		%>
	<!---------����÷�ο��� �� ------------>

        </table>
        <!----------------- �ڷ��� �� ----------------->

        <br>

        <!----------------- ���, ��� ��ư ���� ----------------->
        <table border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td>
                <a href="javascript:modify_StudyData()"><img src="/images/admin/button/btn_modify.gif" border="0"></a></td>
            <td width=8></td>
            <td>
                <a href="javascript:delete_StudyData()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
            <td width=8></td>
            <td>
                <a href="javascript:list_StudyData()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ���, ��� ��ư �� ----------------->

        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center" class="ms"><%= PageUtil.printPageList(v_totalpage, v_pageno, row) %></td>
          </tr>
          <tr>
            <td height="15"></td>
          </tr>
          <tr>
            <td align="center" class="ms">

      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
