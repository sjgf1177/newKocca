<%
//**********************************************************
//  1. ��      ��: ���������н�-���ȼ���
//  2. ���α׷���: za_SubjectStudy_U.jsp
//  3. ��      ��: ���������н�-���ȼ���
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
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_subjnm    = box.getString("p_subjnm");
    String v_subj      = box.getString("p_subj");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    String  v_comp       = box.getString("p_comp");
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    int    v_cnt     = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";

    Vector v_realfileVector = null;          //      �����ϸ� �迭
    Vector v_savefileVector = null;          //      ������ ������ִ� ���ϸ� �迭
    Vector v_fileseqVector  = null;          //      ����� ���Ϲ�ȣ �迭

    DataBox dbox = (DataBox)request.getAttribute("selectDocData");
    if (dbox != null ) {
        v_seq         = dbox.getInt("d_seq");
        v_subj        = dbox.getString("d_subj");
        v_userid      = dbox.getString("d_userid");
        v_name        = dbox.getString("d_name");
        v_title       = dbox.getString("d_title");
        v_content     = dbox.getString("d_content");
        v_cnt         = dbox.getInt("d_cnt");
        v_indate      = dbox.getString("d_indate");
        v_realfileVector = (Vector)dbox.getObject("d_realfile");
        v_savefileVector = (Vector)dbox.getObject("d_savefile");
        v_fileseqVector  = (Vector)dbox.getObject("d_fileseq");

        v_title = StringManager.replace(v_title, "`", "'");
    }


    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");
    
    //DEFINED in relation to select START
    String  ss_action   = box.getString("s_action");   
    //DEFINED in relation to select END        
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function insert() {
        if (blankCheck(document.form1.p_title.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_title.focus();
            return;
        }
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }

        if (blankCheck(document.form1.p_content.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_content.focus();
            return;
        }
/*
        document.forms[0].p_content.editorApplet = DHTMLEdit.tbContentElement;
        document.forms[0].p_content.value = DHTMLEdit.getDocumentHTML();
        document.forms[0].InitHTML.value="";
        document.forms[0].addBody.value="";
*/
        document.form1.p_search.value     = "";
        document.form1.p_searchtext.value = "";
        document.form1.action = "/servlet/controller.beta.SubjectSimulationServlet?p_file=5";
        document.form1.p_process.value = "docUpdate";
        document.form1.submit();
    }

   function cancel() {
        document.form1.action = "/servlet/controller.beta.SubjectSimulationServlet";
        document.form1.p_process.value = "docListPage";
        document.form1.submit();
   }

//�̹��� ��θ� �ٲ��ش�.
function setImageNames(filenames,filepath) {
   document.forms[0].DHTMLimages.value = filenames;
   document.forms[0].DHTMLimagesPath.value = filepath;
}
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post" enctype = "multipart/form-data">
    <input type = "hidden" name = "s_action"     value="<%=ss_action%>">     <!--in relation to select-->
    <input type = "hidden" name = "p_subj"       value="<%=v_subj%>"> <!--in relation to select-->
    <input type = "hidden" name = "p_subj"       value = "<%=v_subj %>">
    <input type = "hidden" name = "p_subjnm"     value = "<%=v_subjnm %>">    
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
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
            <td class="table_02_2"> 
              <input size="80" maxlength="20" name="p_title" class="input" value = `<%= v_title %>`>
            </td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"> 
			<textarea name="p_content" cols="80" rows="16" class="inputsub"> <%=v_content%></textarea>
                <!--iframe id="DHTMLEdit" src="/learn/pds/dhtml/DHTMLEditor.htm" width="95%" height="440" style="BORDER: 1px solid black;"></iframe>
                <DIV id="tmpHTML" style="visibility:hidden; display:none">
                <FONT SIZE=2><TEXTAREA NAME="InitHTML" type=hidden ><%= v_content%></TEXTAREA></FONT>
                <FONT SIZE=2><TEXTAREA NAME="addBody" type=hidden></TEXTAREA></FONT>
                <INPUT NAME="DHTMLimagesPath" type="file">
                </DIV>
                <INPUT NAME="p_content" VALUE="" type=hidden>
                <INPUT NAME="DHTMLimages" VALUE="" type=hidden-->
            </td>
          </tr>
          <tr> 
            <td height="25" class="table_title"><b>��������</b></td>
            <td class="table_02_2">
            
<% 
		if (v_realfileVector !=null ) {
			for(int i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����
				String v_realfile = (String)v_realfileVector.elementAt(i);
				String v_savefile = (String)v_savefileVector.elementAt(i);								
				String v_fileseq  = (String)v_fileseqVector.elementAt(i);								
				if(v_realfile != null && !v_realfile.equals("")) { 
%>
                &nbsp;<%= v_realfile%>
                &nbsp;<input type = "checkbox"  name = "p_savefile" value = "<%= v_savefile%>"> (������ üũ)
                <br>
               <input type = "hidden" name = "p_realfile"  value = "<%= v_realfile%>">
<%				}  
			}
		}// end of if v_realfileVector != null 
%>            </td>
          </tr>          
          <tr> 
            <td height="25" class="table_title"><b>÷������1</b></td>
            <td class="table_02_2"><input type="FILE" name="p_file" size="50" class="input"></td>
          </tr>
          <tr> 
            <td height="25" class="table_title"><b>÷������2</b></td>
            <td class="table_02_2"> <input type="FILE" name="p_file" size="50" class="input"></td>
          </tr>
          <tr> 
            <td height="25" class="table_title"><b>÷������3</b></td>
            <td class="table_02_2"> <input type="FILE" name="p_file" size="50" class="input"></td>
          </tr>
          <tr> 
            <td height="25" class="table_title"><b>÷������4</b></td>
            <td class="table_02_2"> <input type="FILE" name="p_file" size="50" class="input"></td>
          </tr>
          <tr> 
            <td height="25" class="table_title"><b>÷������5</b></td>
            <td class="table_02_2"> <input type="FILE" name="p_file" size="50" class="input"></td>
          </tr>
        </table>
        <!----------------- �ڷ��� �� ----------------->



        <br>



        <!----------------- ���, ��� ��ư ���� ----------------->
        <table border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td>
            <a href="javascript:insert()"><img src="/images/admin/button/btn_apply.gif" border="0"></a>
            </td>
			<td width=8></td>
            <td>
            <a href="javascript:cancel()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a>
            </td>
          </tr>
        </table>
        <!----------------- ���, ��� ��ư �� ----------------->






        <br>




      </td>
  </tr>
</table>
<script LANGUAGE="javascript">
<!--
// �������Ϳ��� ����ϴ� �����Դϴ�.
//var documentMode = "Reply";
//var initHTML = document.forms[0].InitHTML.value;
//var addBody  = document.forms[0].addBody.value;

// -->
</script> 
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
