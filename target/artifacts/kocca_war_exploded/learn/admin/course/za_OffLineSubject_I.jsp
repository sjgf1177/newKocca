<%
//**********************************************************
//  1. ��      ��: OffLineSubject
//  2. ���α׷��� : za_OffLineSubject_I.jsp
//  3. ��      ��: �������� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �ϰ��� 2005.12.17
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %> 
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    
    int  v_pageno      = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");	
    String  ss_grseq     = box.getString("s_grseq");           //��������

    String s_username  = box.getSession("name");
	String v_grcode = box.getStringDefault("s_grcode","N000001");
	String v_gubunNm = "";

	String ss_subj = box.getString("p_subj");
	String ss_subjnm = box.getString("p_subjnm");
    
    if(v_grcode.equals("N000001"))
	{
		v_gubunNm = "kocca";
	}
	else
	{
		v_gubunNm = "game";
	}

    String v_server   = conf.getProperty(v_gubunNm + ".url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;
    
    String  s_gadmin    = box.getSession("gadmin");
    String v_gadmin ="";
    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }
    
%>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
$(document).ready(function(){
	$("#p_dday").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_propstart").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_propend").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
	//���� ���ý�
	function whenSelection(p_action) {
		  document.form1.p_process.value = 'insertPage';


		  document.form1.action = "/servlet/controller.course.OffLineSubjectServlet";
		  document.form1.submit();
		}
	//����
    function insert_check() 
		{		
        document.form1.p_content.value = document.form1.Wec.MIMEValue;
        document.form1.p_content.value.replace("&","&amp;");

		if (document.form1.s_subjgubun.value == "----") {
            alert("�з��� �����ϼ���");
            document.form1.s_subjgubun.focus();
            return;
        }
        
        if (blankCheck(document.form1.p_dday.value)) {
            alert("�Ͻø� �Է��ϼ���");
            document.form1.p_dday.focus();
            return;
        }
		if (blankCheck(document.form1.p_propstart.value)) {
            alert("��û �������� �Է��ϼ���");
            document.form1.p_propstart.focus();
            return;
        }
		if (blankCheck(document.form1.p_propend.value)) {
            alert("��û �������� �Է��ϼ���");
            document.form1.p_propend.focus();
            return;
        }
		if (blankCheck(document.form1.p_place.value)) {
            alert("��Ҹ� �Է��ϼ���");
            document.form1.p_place.focus();
            return;
        }if (blankCheck(document.form1.p_limitmember.value)) {
            alert("�ο��� �Է��ϼ���");
            document.form1.p_limitmember.focus();
            return;
        }
		if (blankCheck(document.form1.p_subjnm.value)) {
            alert("���Ǹ��� �Է��ϼ���");
            document.form1.p_subjnm.focus();
            return;
        }
		if (blankCheck(document.form1.p_tname.value)) {
            alert("��米���� �Է��ϼ���");
            document.form1.p_tname.focus();
            return;
        }
		        
        if (document.form1.p_content.value.length < 3) {
	    	alert("������ �Է��ϼ���");
	    	return;
	    }
        
        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.course.OffLineSubjectServlet";
        document.form1.p_process.value = "insert";
        
        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.course.OffLineSubjectServlet";
        document.form1.p_process.value = "listPage";
        document.form1.submit();
    }

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
	
	// ���� ����(�޷�)
	function whenclick(caldate) {
		caldate.value = "";
	}
	
	// ���ø� ini ���� �ε�
    function initPage() {
        document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>";
		
    }
	function whenGubun()
	{
		if(document.form1.s_subjgubun.value == "00000000000000000002")
		{
			document.getElementById("tr_subj").style.display = "";
		}
		else
		{
			document.getElementById("tr_subj").style.display = "none";
		}
	}
	//���ڸ� �Է� ����
	function numcheck(oTarget)
	{
		if(((event.keyCode < 48) || (event.keyCode > 57)) && ((event.keyCode < 96) || (event.keyCode > 105)))
			if((event.keyCode == 9) || (event.keyCode == 8) || (event.keyCode == 46))
				event.returnValue = true;
			else
				event.returnValue = false;
	}

	//���� �˻�
	function searchMuser() {
	  var p_gubun = 'name';
	  var p_key1  = document.form1.p_subj.value;
	  var p_key2  = 'p_muser';
	  var url = "/servlet/controller.library.SearchServlet?p_process=subj";
	  open_window("",url,"0","0","100","100");
	}
	//�˻��� ���� �ޱ�
	function receiveSubj(subj , subjnm, tmp1, tmp2, tmp3)
	{
		document.form1.p_subj.value = subj;
		document.form1.p_subjnm.value = subjnm;
		document.getElementById("div_subjnm").innerHTML = "<input type='text' name='p_subj' value='" +subjnm + "' size='100' class='input' >"; 
	}
    
//-->
</SCRIPT>
	</HEAD>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onload="initPage()">

<form name="form1" method="post" enctype="multipart/form-data">
    <input type = "hidden" name="p_process"    value = "<%= v_process %>">
    <input type = "hidden" name="p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name="p_search"     value = "<%=v_search %>">
    <input type = "hidden" name="p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name="p_content"    value = "">
    <input type = "hidden" name="p_subj"	   value = "<%=ss_subj%>">
    <input type = "hidden" name="p_filecnt"    value = "">
    <input type = "hidden" name="s_grcode"    value = "<%= v_grcode %>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
        <tr>
            <td><img src="/images/admin/homepage/homepage_title1.gif" border="0"></td>
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
		  <tr> 
            <td width="15%" class="table_title"><strong>�з�</strong></td>
            <td height="25" class="table_02_2">
				<select name="s_subjgubun" onChange="whenGubun()">
					<% 
						int j = 0;
						String v_gubuncode = "";
						String v_gubuncodenm = "";
						
						ArrayList list2 = (ArrayList)OffLineSubjectBean.getOffGubun(box);

						for ( j=0; j < list2.size(); j++) 
						{
							DataBox dbox2 = (DataBox)list2.get(j);

							v_gubuncode		= dbox2.getString("d_code");
							v_gubuncodenm	= dbox2.getString("d_codenm");
						%>
							<option value="<%=v_gubuncode%>"><%=v_gubuncodenm%></option>
						<%
						}
					%>
				</select >
			</td>
          </tr>
          <tr id="tr_subj" style="display:none"> 
            <td width="15%" class="table_title"><strong>����/������</strong></td>
            <td height="25" class="table_02_2">
				<iframe name="ifrm_subj" style="width:800px; height:100px;" frameborder="0"  src="/servlet/controller.course.OffLineSubjectServlet?p_process=ifrme&p_formname=form1"></iframe> 
				<input type="hidden" name="p_subjseq">
				<input type="hidden" name="p_subj">
			</td>
          </tr>	
		  <tr> 
            <td width="15%" class="table_title"><strong>�Ͻ�</strong></td>
            <td height="25" class="table_02_2">
				<input name="p_dday" id="p_dday" type="text" class="datepicker_input1" size="10" value="">
				<select name="p_starttime">
                  <%=FormatDate.getDateOptions(0,23,0)%>
                </select>
                �� ~ 
				<select name="p_endtime">
                  <%=FormatDate.getDateOptions(0,23,0)%>
                </select>
                ��</td>
          </tr>
		  <tr> 
            <td width="15%" class="table_title"><strong>��û�Ⱓ</strong></td>
            <td height="25" class="table_02_2">
				<input name="p_propstart" id="p_propstart" type="text" class="datepicker_input1" size="10" value="">
				~ <input name="p_propend" id="p_propend" type="text" class="datepicker_input1" size="10" value=""></td>
          </tr>
		  <tr> 
            <td width="15%" class="table_title"><strong>���</strong></td>
            <td height="25" class="table_02_2">
				<input type="text" name="p_place" size="100" class="input"></td>
          </tr>
		  <tr> 
            <td width="15%" class="table_title"><strong>�ο�</strong></td>
            <td height="25" class="table_02_2">
				<input type="text" name="p_limitmember" size="3" class="input" onKeydown="numcheck(this);">��</td>
          </tr>
		  <tr> 
            <td width="15%" class="table_title"><strong>���Ǹ�</strong></td>
            <td height="25" class="table_02_2">
				<input type="text" name="p_subjnm" size="100" class="input" value="">
				</td>
          </tr>
		   <tr> 
            <td width="15%" class="table_title"><strong>��米��</strong></td>
            <td height="25" class="table_02_2">
				<input type="text" name="p_tname" size="100" class="input"></td>
          </tr>
		   <tr> 
            <td width="15%" class="table_title"><strong>���</strong></td>
            <td height="25" class="table_02_2">
				<select name="p_target">
					<option value="A">��ȸ��</option>
					<option value="S">����������</option>
					<option value="P">�������+����������</option>
				</select></td>
          </tr>
		 
          <tr> 
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><!--textarea name="p_adcontent" cols="110" rows="10" -->
                <!-- ���� Editor  -->
                <p align="left">
							<script language = "javascript" src = "/script/user_patch.js"></script>
							<script language='javascript'>object_namopatch('684','500');</script>
                <!--OBJECT WIDTH="0" HEIGHT="0" CLASSID="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
                   <PARAM NAME="LPKPath" VALUE="/namo/NamoWec5_Bobs_Consulting.lpk">
                </OBJECT>
                <OBJECT ID="Wec" WIDTH="684" HEIGHT="500"
                CLASSID="CLSID:DB1A8D98-97E8-4a42-9624-0E4BCD77F109" CODEBASE="/namo/NamoWec.cab#version=5,0,0,69">
                <param name="InitFileURL" value="/namo/namowec.env">
                <param name="InitFileVer" value="1.0">
                </OBJECT-->
                </p>
            <!--/textarea-->
            </td>
          </tr>
		  <tr>
            <td width="15%" class="table_title"><strong>Ư�� �ڷ��<br>�������</strong></td>
            <td height="25" class="table_02_2">
              ���<input type="radio" name="p_useyn" value='Y' class="input" >&nbsp;
              �̻��<input type="radio" name="p_useyn" value='N' class="input" checked>&nbsp;
            </td>
          </tr>
			
        </table>
        <!----------------- �������� ���� �� ----------------->

        <br>
        <!----------------- ����, ��� ��ư ����----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td align="center"><a href="javascript:list()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->


      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %> 
</form>
</body>
</html>
