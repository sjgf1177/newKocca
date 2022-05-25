<%
//**********************************************************
//  1. ��      ��: Notice
//  2. ���α׷��� : za_Notice_U.jsp
//  3. ��      ��: �������� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");

    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_seq        = box.getInt("p_seq");

    int    v_cnt		= 1;	// ��ȸ��
    String v_gubun		= "";   // ��ü����
    String v_title		= "";   // ����
    String v_content	= "";   // ����
    String v_ldate		= "";   // �����
    String v_lname		= "";   // ����ڹ�
    String v_useyn   	= "";	// �������
	String v_gubunNm   	= "";	// ������.
    String v_singleword   = "";	// �Ѹ���
    int v_month		= 0;	// ���ȸ�� �ش��

    String v_realfile = "";
    String v_savefile = "";
;
    DataBox dbox = (DataBox)request.getAttribute("selectHomePageBoard");
    if (dbox != null) {
        v_gubun		= dbox.getString("d_gubun");
        v_title		= dbox.getString("d_title");
        v_content	= dbox.getString("d_contents");
        v_singleword	= dbox.getString("d_singleword");
        v_ldate		= dbox.getString("d_ldate");
        v_lname		= dbox.getString("d_lname");
        v_cnt       = dbox.getInt("d_cnt");
		v_useyn   	= dbox.getString("d_useyn");
		v_month   	= dbox.getInt("d_lmonth");

		v_realfile = dbox.getString("d_realfile");
        v_savefile = dbox.getString("d_savefile");
    }
	
	if(v_gubun.equals("K"))
	{
		v_gubunNm = "kocca";
	}
	else
	{
		v_gubunNm = "game";
	}

    v_content = StringManager.replace(v_content, "&nbsp;","&amp;nbsp;" );
    String s_username  = box.getSession("name");

    String v_server   = conf.getProperty(v_gubunNm + ".url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;    
    
    String s_gadmin    = box.getSession("gadmin");
    String v_gadmin ="";
    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }
%>


<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>

<SCRIPT language="JScript" FOR="Wec" EVENT="OnInitCompleted()">
                                                               
var wec = document.form1.Wec;                                  
var sContent   = document.getElementById("p_content").value; 
wec.Value = sContent;                                          
                                                               
</SCRIPT>        

</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" >

<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false' ondragstart='return false' onselectstart='return false' style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99"></div>

<form name="form1" method="post" enctype="multipart/form-data">
     <input type = "hidden" name="p_process"    value = "<%= v_process %>">
    <input type = "hidden" name="p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name="p_search"     value = "<%=v_search %>">
    <input type = "hidden" name="p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name="p_seq" value = "<%=v_seq %>">
    <input type = "hidden" name="p_filecnt" >
    <input type = "hidden" name="p_content" value="<%=v_content %>">
    <input type = "hidden" name="p_month" >


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td background="/images/admin/homepage/title_bg.gif"><img src="/images/admin/homepage/tit_monthlist.gif"  border="0"></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>
        <br>
        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�ۼ���</strong></td>
            <td height="25" class="table_02_2"><%=s_username%></td>
          </tr>
          <tr class="table_02_2">
            <td height="25" class="table_title" ><strong>�����</strong></td>
            <td height="25" class="table_02_2"><%= FormatDate.getDate("yyyy/MM/dd") %></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�������</strong></td>
            <td height="25" class="table_02_2">
              ���<input type="radio" name="p_useyn" value='Y' class="input" <%if (v_useyn.equals("Y")){%>checked<%}%>>&nbsp;
              �̻��<input type="radio" name="p_useyn" value='N' class="input" <%if (v_useyn.equals("N")){%>checked<%}%>>&nbsp;
            </td>
          </tr>
		   <tr> 
            <td width="15%" class="table_title"><strong>�ش��</strong></td>
            <td height="25" class="table_02_2">
				<select name="p_tmpmonth">
				<% 
					int k = 0;
					for(k = 1 ; k <= 12; k++)
					{
				%>
						<option value="<%=k%>" <% if(k == v_month){ %> selected <%}%>><%=k%></option>

				<%
					}
				%>
				</select> �� 
			</td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�����</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_title" size="100" class="input" value='<%= v_title %>' maxlength="80"></td>
		</tr>
		<tr> 
            <td width="15%" class="table_title"><strong>�Ѹ���</strong></td>
            <td height="25" class="table_02_2">
				<textarea name="p_singleword" style="width:610px; height=40px;" maxlength="1000"><%=v_singleword%></textarea>
				<!--input type="text" name="p_singleword" size="100" class="input"--></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2">
            <!-- ���� Editor  -->
                <p align="left">
                    <script language="javascript" src="/namo_active/kor/NamoWec7.js"></script>
                </p>
            <!-- ���� Editor  --> 
            </td>
          </tr>
			  <tr>
		  <td height="25" class="table_title">÷������</td>
            <td class="table_02_2"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="90%"> 
                  <%		
					if(v_realfile != null && !v_realfile.equals("")) 
					{  %>
						&nbsp;<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'>
					
						  <%= v_realfile%></a> &nbsp;
						<input type = "checkbox"  name = "p_fildel" value = "<%= v_seq%>"> (������ üũ)<br>
						<input type = "hidden" name = "p_realfile"  value = "<%=v_realfile%>">
						<input type = "hidden" name = "p_savefile"  value ="<%=v_savefile%>">
						<input type = "hidden" name = "p_delfile" >
		<%			} 
		          %>
                    <input type="FILE" name="p_file1" size="118" class="input" onkeydown="javascript:return File_CancelKeyInput()"><br>
			      </td>
                  <td width="50">
                  </td>
                </tr>
              </table></td>
		  </tr>
        </table>
        <!----------------- �������� ���� �� ----------------->

        <br>
        <!----------------- ����, ��� ��ư ����----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td align="center"><a href="javascript:list()"><img src="/images/admin/button/btn_cancel.gif"  border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->
      </td>
  </tr>
</table>

<SCRIPT LANGUAGE="JavaScript">
<!--
	//����÷�ο� ���� ����
	function File_CancelKeyInput()
	{
		if(event.keyCode == 9){	// Tab key�� ���
			return true;
		}else{
			alert('[ã�ƺ���] ��ư�� �̿��� ÷���Ͻ� ������ �����ϼ���.\n\n��θ� �������� �߸� �Է��Ͻ� ��� ���ε尡 ����� �̷������ �ʽ��ϴ�.'); 
			return false;
		}
	}
	//�Է�
    function insert_check() 
	{
        
        document.form1.p_content.value = document.form1.Wec.MIMEValue;
        document.form1.p_content.value.replace("&","&amp;");
        
        if (blankCheck(document.form1.p_title.value)) {
            alert("������ �Է��ϼ���");
            document.form1.p_title.focus();
            return;
        }
        
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }
		
		if (blankCheck(document.form1.p_singleword.value)) {
            alert("�Ѹ��� �Է��ϼ���");
            document.form1.p_singleword.focus();
            return;
        }
        
        if (document.form1.Wec.Value.length < 3) {
	    	alert("������ �Է��ϼ���");
	    	return;
	    }

<%
		if( !v_realfile.equals("")) 
		{
	%>
			if(document.form1.p_fildel.checked == true)
			{
				document.form1.p_filecnt.value = 1;
				document.form1.p_delfile.value = "<%=v_seq%>";
			}			
			else
			{
				document.form1.p_filecnt.value = -1;
			}
<% } %>
	
		if(document.form1.p_file1.value.length > 0)
		{
			document.form1.p_filecnt.value = 1;
		}
		
		if(document.form1.p_tmpmonth.value.length < 2)
		{
			document.form1.p_month.value = "0"+ document.form1.p_tmpmonth.value;
		}
		else
		{
			document.form1.p_month.value = document.form1.p_tmpmonth.value;
		}

        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.homepage.HomePageAdminSuperiorityMemberServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.homepage.HomePageAdminSuperiorityMemberServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }


	function initPage()
	{
		document.form1.Wec.Value = "<%=v_content %>";
		document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>";
		
<%
		if( !v_realfile.equals("")) 
		{
	%>
			document.form1.p_filecnt.value = 1;
<% } %>
	}


//-->
</SCRIPT>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
