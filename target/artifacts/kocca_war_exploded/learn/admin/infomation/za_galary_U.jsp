<%
//**********************************************************
//  1. ��      ��: ������������������
//  2. ���α׷��� : za_SubjGong_U.jsp
//  3. ��      ��: ������������������ ��������������
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 8. 18
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.dunet.common.util.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");
String  v_process        = box.getString("p_process");

int     v_tabseq        = box.getInt("p_tabseq");
int     v_seq           = box.getInt("p_seq");
int     v_pageno        = box.getInt("p_pageno");

String  v_searchtext    = box.getString("p_searchtext");
String  v_search        = box.getString("p_search");

String  v_date          = "";
String  v_title         = "";
String  v_content       = "";
String  v_name          = "";
String  v_flagYn        = "";
String  v_position      = "";
String  v_realfile      = "";
String  v_savefile      = "";

DataBox dbox = (DataBox)request.getAttribute("selectView");

if (dbox != null) {
          
    v_title     = dbox.getString("d_title"); 
    v_content   = dbox.getString("d_content");   
    v_date      = dbox.getString("d_ldate");      
    v_name      = dbox.getString("d_name");
    v_flagYn    = dbox.getString("d_flagyn");
    v_position  = dbox.getString("d_position");
    v_realfile  = dbox.getString("d_realfile");
    v_savefile  = dbox.getString("d_savefile");
    
 }  

//Vector v_realfileVector = (Vector)dbox.getObject("d_realfile");
//Vector v_savefileVector = (Vector)dbox.getObject("d_savefile");
%>

<html>
<head>
<title>::: ������ ������ :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    
    function insert_check() {
 
        if(blankCheck(document.form1.p_title.value)){
            alert("������ �Է��ϼ���");
            document.form1.p_title.focus();
            return;
        }
        
        if (document.form1.p_title.value == "") {
            alert("������ �Է��ϼ���");
            document.form1.p_title.focus();
            return;
        } 
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        } 

        if (document.form1.p_position.value == "") {
            alert("�Ҽ�/�̸��� �Է��ϼ���");
            document.form1.p_position.focus();
            return;
        }
        if (realsize(document.form1.p_position.value) > 200) {
            alert("�Ҽ�/�̸��� �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_position.focus();
            return;
        }
        
        //alert(document.form1.Wec.MIMEValue);
        //alert(document.form1.p_content.value);
        document.form1.p_content.value = document.form1.Wec.MIMEValue;
     
        document.form1.p_content.value.replace("&","&amp;");
       

        if (document.form1.Wec.TextValue.length < 3) {
            alert("������ �Է��ϼ���");
            return;
        }
		
        document.form1.action = "/servlet/controller.infomation.GalaryAdminServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.infomation.GalaryAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }
    function clickDelete(){
        var inputObj = document.getElementById("divFile");
        var checkObj = document.getElementById("p_fileseq1");
        var fileObj  = document.getElementById("p_file1");

        if(checkObj.checked) {
            divFile.style.display = "block";
        } else {
            fileObj.select();
            //document.form1.p_file1.select();
            document.selection.clear();
            divFile.style.display = "none";                    
        }
    }
//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" >
<form name="form1" method="post" enctype="multipart/form-data">
    <input type="hidden" name="p_process"    value ="<%= v_process %>">
    <input type="hidden" name="p_tabseq"     value="<%=v_tabseq%>">
    <input type="hidden" name="p_seq"        value="<%=v_seq%>">
    <input type="hidden" name="p_pageno"     value = "<%=v_pageno %>">
    <input type="hidden" name="p_search"     value = "<%=v_search %>">
    <input type="hidden" name="p_searchtext" value = "<%=v_searchtext %>">
    <input type="hidden" name="p_tabseq"     value = "<%=v_tabseq %>">
    <input type="hidden" name="p_content"    value = "<%=StringUtil.convertHtmlchars(v_content) %>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/portal/s.1_10.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>
        <!----------------- ��ü���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td colspan="3" height="25" class="table_02_2"><input type="text" name="p_title" size = 100 class="input" maxlength="80" value="<%=v_title %>"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�ۼ���</strong></td>
            <td height="25" class="table_02_2"><%=v_name%></td>
            <td width="15%" class="table_title"><strong>�Ҽ�/�̸�</strong></td>
            <td width="35%" height="25" class="table_02_2"><input type="text" name="p_position" style="width:300px;" class="input" maxlength="80" value="<%=v_position%>"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>���ο���</strong></td>
            <td colspan="3" height="25" class="table_02_2">
              <select name="p_flagYn">
                  <option value='Y' <%=v_flagYn.equals("Y") ? "selected" : ""  %>>Yes</option>
                  <option value='N' <%=v_flagYn.equals("N") ? "selected" : ""  %>>No</option>
              </select>
            </td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td colspan="3" height="25" class="table_02_2">
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">namoActiveInitCompleted("p_content");</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
            </td>
          </tr>
          <tr>
              <td width="16%" class="table_title"><b>÷������</b></td>
              <td colspan="3" width="81%" class="table_02_2">
                <!--input name="p_file1" type="file" class="input" size="118" maxlength="100" tabindex=65 -->
                <%  if( v_realfile != null && !v_realfile.equals("")) { %>
                &nbsp;
                <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a>
                <input type = "checkbox"  name = "p_fileseq1"   value = "1" onclick="clickDelete();"> (������ üũ)<br>
                <input type = "hidden"    name = "p_realfile1"  value = <%=v_realfile%>>
                <input type = "hidden"    name = "p_savefile1"  value ="<%=v_savefile%>">
                <%  } %>
                    <div id="divFile" <%=v_realfile != null && !v_realfile.equals("") ? "style='display:none;'" : "" %>>
                    <input type="FILE" name="p_file1" id="p_file1" size="100" class="input"><br>
                    </div>
              </td>
          </tr>

        </table>
        <!----------------- ��ü���� �� ----------------->


        <br>
        <!----------------- ����, ��� ��ư ���� ----------------->
        <table  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href='javascript:insert_check()'><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
			<td width=4></td>
            <td align="center"><a href='javascript:list()'><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->

        <br>
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>

</body>
</html>
