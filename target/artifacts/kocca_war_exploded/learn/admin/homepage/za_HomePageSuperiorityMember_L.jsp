<%
//**********************************************************
//  1. ��      ��: HomePageSuperiorityMember
//  2. ���α׷��� : za_HomePageSuperiorityMember_L.jsp
//  3. ��      ��: Ȩ������ ���� ���ȸ�� ���� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �ϰ��� 2005.12. 14
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

    HomePageSuperiorityMemberBean selectData = new HomePageSuperiorityMemberBean();

    RequestBox box    = (RequestBox)request.getAttribute("requestbox");
    String  v_process = box.getString("p_process");
    
    //out.println(v_selcomp);
    
    int v_pageno         = box.getInt("p_pageno");

    if (v_pageno == 0) {
        v_pageno = 1;
    }
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");
	String  v_gubun		  = box.getString("p_gubun");

	int i = 0;
    int    v_seq     = 0;           // �Ϸù�ȣ
	int    v_cnt     = 0;           // ��ȸ��	

    String v_title   = "";          // ����
    String v_content = "";          // ����
    String v_ldate   = "";          // �����
    String v_name    = "";          // �����
	String v_useyn   = "";			// ���λ�뿩��
	String v_savefile = "";			// �������ϸ�
	String v_realfile = "";			// �������ϸ�
	String v_select_seq = "";		// ���� �Խü��õ� seq
	String v_month   = "";			// ����
	String v_singleword   = "";		// �Ѹ���


    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������

    ArrayList list1 = (ArrayList)request.getAttribute("selectHomePageSuperiorityMemberList");
   
%>
<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.homepage.HomePageAdminSuperiorityMemberServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.homepage.HomePageAdminSuperiorityMemberServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }

	//�󼼺���
    function view(seq) {
        document.form1.action = "/servlet/controller.homepage.HomePageAdminSuperiorityMemberServlet";
        document.form1.p_seq.value = seq;
        document.form1.p_process.value = "select";
        document.form1.submit();
    }
	// �Է�
    function insert() {
        document.form1.action = "/servlet/controller.homepage.HomePageAdminSuperiorityMemberServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }
	// ��ȸ
    function search() {
        document.form1.action = "/servlet/controller.homepage.HomePageAdminSuperiorityMemberServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }
	// �Խÿ��� 
	function goCheckbox()
	{
		var i = 0;
		var j = 0;
		var oTemp = document.all;

		for(var i = 0 ; i < oTemp.length ; i++) 
		{
			if(oTemp[i].type == "checkbox")
			{
				if(oTemp[i].checked)
				{
					j++;
					document.form1.p_select_seq.value = oTemp[i].value;
				}			
			}
		}
		if (j == 0){
			alert("���õ� �Խù��� �����ϴ�");
			return;
		}
		document.form1.action = "/servlet/controller.homepage.HomePageAdminSuperiorityMemberServlet";
        document.form1.p_process.value = "selectMain";
		document.form1.submit();
	}
	// üũ
	function checkInverse(oTarget)
	{
		var oTemp = document.all;
		var i = 0;

		for(var i = 0 ; i < oTemp.length ; i++) 
		{
			if(oTemp[i].type == "checkbox")
			{
				if(oTemp[i] == oTarget)
				{
					oTemp[i].checked = true;
				}
				else
				{
					oTemp[i].checked = false;
				}
			}
		}
	}

//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno"  value = "<%=v_pageno %>"> 
    <input type = "hidden" name = "p_gubun"  value = "<%=v_gubun %>"> 
    <input type = "hidden" name = "p_select_seq"  value = "<%=v_select_seq %>"> 
    <input type = "hidden" name = "p_seq"     value = ""> 
    <input type = "hidden" name = "s_grcode"     value = "N000002">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="/images/admin/homepage/tit_monthlist.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->

        <br>
        <!----------------- form ���� ----------------->
        <table width="97%" height="26" border="0" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="250"> 
            </td>
            <td width="610" align="right"> 
              <select name="p_search" >
                <option value='title'     <% if (v_search.equals("title")) out.println("selected"); %>>����</option>
                <option value='contents' <% if (v_search.equals("contents")) out.println("selected"); %>>����</option>
              </select>
              <input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>">
            </td>

            <td width="160" align="right" valign="middle"> 
				<a href='javascript:search()'><img src="/images/admin/button/btn_inquiry.gif" border="0"></a> 
				<a href='javascript:insert()'><img src="/images/admin/button/btn_add.gif" border="0"></a> 
				<a href='javascript:goCheckbox()'><img src="/images/admin/button/btn_set.gif" border="0"></a> 
            </td>
          </tr>

          <tr> 
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- form �� ----------------->


        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="9" class="table_top_line"></td>
          </tr>
          <tr>
			<td class="table_title" width="10%">��뿩��</td>
            <td class="table_title" width="5%" height="25"><b>NO</b></td>
            <td class="table_title" width="5%" height="25"><b>Month</b></td>
            <td class="table_title" ><b>����</b></td>
            <td class="table_title" width="8%"><b>�����</b></td>
            <td class="table_title" width="8%"><b>÷������</b></td>
            <td class="table_title" width="12%"><b>�����</b></td>
            <td class="table_title" width="8%" ><b>��ȸ��</b></td>
          </tr>
          <!-- ��ü�������� ���� -->
<%

            for( i = 0; i < list1.size(); i++) 
				{
                
                DataBox dbox = (DataBox)list1.get(i);
                v_seq   = dbox.getInt("d_seq");
                v_cnt	= dbox.getInt("d_cnt");
                v_title = dbox.getString("d_title");
                v_ldate = dbox.getString("d_ldate");
                v_name  = dbox.getString("d_lname");
                v_useyn = dbox.getString("d_useyn");
                v_month = dbox.getString("d_lmonth");
                v_singleword = dbox.getString("d_singleword");

				
                v_savefile = dbox.getString("d_savefile");
                v_realfile = dbox.getString("d_realfile");
				v_dispnum   = dbox.getInt("d_dispnum");
                v_totalpage = dbox.getInt("d_totalpage");

                v_ldate   = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd");
                              
%>          <tr>
				<td class="table_01" ><input type="checkbox" name="p_select" value="<%=v_seq%>" onclick="javascript:checkInverse(this)"
<% if(v_useyn.equals("Y")){ out.println("checked");}%>
		></td>
				<td class="table_01" ><%=v_dispnum %></td>
				<td class="table_01" ><%=v_month %></td>
				<td class="table_02_2"><a href="javascript:view('<%=v_seq%>')"><%=v_singleword%></a></td>
				<td class="table_02_1"><%=v_title%></td>
				<td class="table_02_1"><%if(!v_realfile.equals("")){%>
						<img src="/images/user/support/ico_file.gif" width="13" height="12">
					<%}else{					 
					 %>&nbsp;
					<%}%></td>
				<td class="table_02_1"><%=v_ldate%></td>
				<td class="table_02_1"><%=v_cnt%></td>
          </tr>
<%	       
}
%>
<%
	if(i == 0 )
	{
	%>
			<tr>
				<td class="table_02_1" height="100" colspan="8" align="center"> ��ϵ� �����Ͱ� �����ϴ�. </td>
			</tr>
<%
	}
%>
          <!-- ��ü�������� �� -->

        </table>
        <!----------------- �������� ���� �� ----------------->

        <!----------------- ����¡ ���� ----------------->
        <br>
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="absmiddle"> 
              <%= PageUtil.printPageList(v_totalpage, v_pageno, 10) %>
            </td>
          </tr>
        </table>
        <!----------------- ����¡ �� ----------------->

        <br>
      </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
