<%
//**********************************************************
//  1. ��      ��: �Ŀ����ͺ�
//  2. ���α׷��� : za_KOpenPower_I.jsp
//  3. ��      ��: Ȩ������ ���� �Ŀ����ͺ� ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process	 = box.getString("p_process");
    int		v_pageno	 = box.getInt("p_pageno");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    String	s_username	 = box.getSession("name");
	String	v_gubun		 = "";
	String	v_gubunNm	 = "";
    
    if(v_gubun.equals("G")) v_gubunNm = "game";
	else v_gubunNm = "kocca";

 // �������� ���ø� ����
    String v_server   = conf.getProperty("kocca.url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;
    
    String  s_gadmin    = box.getSession("gadmin");
    String  v_gadmin	= "";

    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }
    
%>

<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language = "javascript" src= "/script/cresys_lib.js"></script>
<script language = "VBScript"   src= "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript"><!--

//����
    function insert_check() 
		{
		
        document.form1.p_content.value = document.form1.Wec.MIMEValue;
        //document.form1.p_content_text.value = document.form1.Wec.TextValue;
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

		if (blankCheck(document.form1.p_target.value)) {		
            alert("���ͺ� ����� �����ϼ���");
            document.form1.p_target.focus();
            return;
        }
		
		if (blankCheck(document.form1.p_comptext.value)) {
            alert("�Ҽ��� �Է��ϼ���");
            document.form1.p_comptext.focus();
            return;
        }
        
        if (document.form1.Wec.Value.length < 3) {
	    	alert("������ �Է��ϼ���");
	    	return;
	    }


/*		if(document.form1.p_tmpmonth.value.length < 2)
		{
			document.form1.p_month.value = "0"+ document.form1.p_tmpmonth.value;
		}
		else
		{
			document.form1.p_month.value = document.form1.p_tmpmonth.value;
		}
*/        
        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.homepage.KOpenPowerAdminServlet";
        document.form1.p_process.value = "insert";
        
        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.homepage.KOpenPowerAdminServlet";
        document.form1.p_process.value = "selectList";
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
//
--></SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" >

<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false' ondragstart='return false' onselectstart='return false' style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99"></div>

<form name="form1" method="post" enctype="multipart/form-data">
    <input type = "hidden" name="p_process"    value = "<%= v_process %>">
    <input type = "hidden" name="p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name="p_search"     value = "<%=v_search %>">
    <input type = "hidden" name="p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name="p_content"    value = "">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
        <tr>
            <td><img src="/images/admin/homepage/tit_power.gif" border="0"></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>
        <br>
        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>                        
            <td colspan="6" class="table_top_line"></td>
          </tr>
           <tr> 
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td colspan="5" height="25" class="table_02_2">
              <input type="text" name="p_title" size="100" class="input" maxlength="80">
            </td>
          </tr>     
          <tr> 
            <td width="13%" class="table_title"><strong>�ۼ���</strong></td>
            <td width="15%" height="25" class="table_02_2">���</td>
            <td width="14%" class="table_title"><strong>���ͺ� ���</strong></td>
            <td width="20%" height="25" class="table_02_2">
              <kocca_select:select                                       
                name="p_target"                                         
                sqlNum="0001"                                    
                param="0090"             
                onChange=""                         
                attr= "�з�"                                        
                selectedValue=""                         
                isLoad="true"                                           
                type="1"                                                
                styleClass=""                                
                all="true" />
            </td>
            <td width="13%" class="table_title"><strong>�Ҽ�/�̸�</strong></td>
            <td width="25%" height="25" class="table_02_2">
              <input type="text" name="p_comptext" style="width:200px;" class="input" maxlength="80">
            </td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>��뿩��</strong></td>
            <td colspan="5" height="25" class="table_02_2">
              <select name="p_useyn">
                <option value="Y">Y</option>
                <option value="N">N</option>
              </select>
            </td>
          </tr> 
		  <!--tr> 
            <td width="15%" class="table_title"><strong>�ش��</strong></td>
            <td height="25" class="table_02_2">
				<select name="p_tmpmonth">
				<% 
					int k = 0;
					for(k = 1 ; k <= 12; k++)
					{
				%>
						<option value="<%=k%>"><%=k%></option>

				<%
					}
				%>
				</select> �� 
			</td>
          </tr-->
           
          <!--tr> 
            <td width="15%" class="table_title"><strong>Ʃ�͸�</strong></td>
            <td height="25" class="table_02_2">
				<input type="text" name="p_title" size="50" class="input" maxlength="80"></td>
			<td width="15%" class="table_title"><strong>�Ҽ�</strong></td>
            <td height="25" class="table_02_2">
				<input type="text" name="p_comptext" size="50" class="input" maxlength="80"></td>
          </tr-->
          <tr> 
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td colspan="5" height="25" class="table_02_2"><!--textarea name="p_adcontent" cols="110" rows="10" -->
                <!-- ���� Editor  -->
                <p align="left">
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">namoActiveInitCompleted("p_content");</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
                </p>
            </td>
          </tr>
		  <tr>
			  <td width="16%" class="table_title"><b>�����̹�������÷��</b></td>
	          <td colspan="5"width="81%" class="table_02_2">
	            <!--input name="p_file1" type="file" class="input" size="118" maxlength="100" tabindex=65 -->
	            <input type="FILE" name="p_file1" size="60" class="input"  onkeydown="javascript:return File_CancelKeyInput()"> <strong>( 74 X 56 )</strong> <br>
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

