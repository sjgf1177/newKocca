<%
//**********************************************************
//  1. ��      ��: �����Խ���
//  2. ���α׷���: zu_StudyBoard_A.jsp
//  3. ��      ��: �����Խ��� �亯
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    int     v_tabseq   = box.getInt("p_tabseq");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    int    v_refseq   = 0;
    int    v_levels   = 0;
    int    v_position = 0;
    int    v_cnt      = 0;
    String v_userid   = "";
    String v_name     = "";
    String v_indate   = "";
    String v_title    = "";
    String v_content  = "";
	String v_addcontent = "";
    Vector v_realfileVector = null;          //      �����ϸ� �迭
    Vector v_savefileVector = null;          //      ������ ������ִ� ���ϸ� �迭
    Vector v_fileseqVector  = null;          //      ����� ���Ϲ�ȣ �迭

    // editor
    String content      = "";
    String width        = "600";
    String height       = "300";

    DataBox dbox = (DataBox)request.getAttribute("selectStudyBoard");
    if (dbox != null ) {
        v_seq         = dbox.getInt("d_seq");
        v_refseq      = dbox.getInt("d_refseq");
        v_levels      = dbox.getInt("d_levels");
        v_position    = dbox.getInt("d_position");
        v_userid      = dbox.getString("d_userid");
        v_name        = dbox.getString("d_name");
        v_title       = dbox.getString("d_title");
        //v_content     = dbox.getString("d_content");
        content     = StringManager.replace(dbox.getString("d_content"),"\n;","<br>");  
        v_cnt         = dbox.getInt("d_cnt");
        v_indate      = dbox.getString("d_indate");
        v_realfileVector = (Vector)dbox.getObject("d_realfile");
        v_savefileVector = (Vector)dbox.getObject("d_savefile");
        v_fileseqVector  = (Vector)dbox.getObject("d_fileseq");
        
		v_title = "[RE] " + v_title;
        v_title = StringManager.replace(v_title, "`", "'");
        //v_content = "\r\n\r\n\r\n\r\n\r\n\r\n--------------------------------------------------\r\n\r\n" + v_name + "���� ���ű�\r\n\r\n" + v_content;
		//v_addcontent = "<br><br><br><br><br><br>---------------------------------------------------------------------<br>" + v_name + "���� ���ű�<br><br><br>";
    }

    String s_userid    = box.getSession("userid");
    String s_name      = box.getSession("name");
%>
<!------- ����Ȯ����üũ INCLUDE ------------>       
<%@ include file = "/learn/library/fileFilter.jsp" %>
<html>
<head>
<title>::: �Խ��� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "javascript" src = "/script/cresys_lib.vb"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function insert() {
        //moveContent();

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

    	if(document.all.use_editor[0].checked) {        
            document.form1.p_content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    	}else {
		    document.form1.p_content.value = document.all.txtDetail.value;
	    }
	    //���� Ȯ���� ���͸�  
	    var islimit = true;	    
	    for(var i=1; i<=5; i++){
	        var file = eval("document.form1.p_file"+i+".value");

    	    if(file!="") {
    	        islimit = limitFile(file);
    	        
    	        if(!islimit) break;
    	    }	        
	    }
 	    	    	    	    
	    if(islimit) {
			document.form1.p_search.value     = "";
			document.form1.p_searchtext.value = "";
			document.form1.action = "/servlet/controller.study.StudyBoardServlet?p_file=5";
			document.form1.p_process.value = "reply";
			document.form1.submit();
	    }else{
	        return;
	    }
    }

   function cancel() {
        document.form1.action = "/servlet/controller.study.StudyBoardServlet";
        document.form1.p_process.value = "";
        document.form1.submit();
   }

//�̹��� ��θ� �ٲ��ش�.
function setImageNames(filenames,filepath) {
   document.forms[0].DHTMLimages.value = filenames;
   document.forms[0].DHTMLimagesPath.value = filepath;
}
//namo editor �ۼ� ���밪 �ű��
function moveContent(){
	document.form1.p_content.value = document.form1.we.BodyValue;
}
//-->
</SCRIPT>

<!-- SCRIPT FOR NAMO EDITOR -->
<SCRIPT LANGUAGE="VBScript">
<!--
    Function Load_Content()
            document.form1.we.BodyValue = document.form1.p_content.value
            document.form1.we.focus
    End Function

    Sub we_OnInitCompleted
        call Load_Content()
    End Sub

    Function Move_Content()
            document.form1.p_content.value = document.form1.we.BodyValue
    End Function
-->
</script>

</head>




<body topmargin="0" leftmargin="0">
<form name="form1" method="post" enctype = "multipart/form-data">
    <input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq %>">
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
    <input type = "hidden" name = "p_refseq"     value = "<%= v_refseq %>">
    <input type = "hidden" name = "p_levels"     value = "<%= v_levels %>">
    <input type = "hidden" name = "p_position"   value = "<%= v_position %>">
    <input type = "hidden" name = "p_userid"     value = "<%= v_userid %>">
    <input type = "hidden" name = "p_content"    value="">
    <input type = "hidden" name = "p_isedu"      value="1"><!--�н�â��-->
<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="783" height="100%">
  <tr> 
    <td> 
      <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2" height="100%">
        <tr> 
          <td align="center" valign="top" class="body_color"> 

<br>
            <!----------------- Ÿ��Ʋ ���� ----------------->
  <table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
    <tr> 
      <td><img src="/images/user/study/board_title.gif"></td>
      <td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
      <td><img src="/images/user/study/gongi_tail.gif"></td>
    </tr>
  </table>
            <!----------------- Ÿ��Ʋ �� ---------------->
            <br>

            <!----------------- �Խ��� �� ��� ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_vertical_table_out">
              <tr> 
                <td> 
                  <table cellspacing="1" cellpadding="1" class="table2">
				  				  <tr>
                        <td class="board_color_line" height=2></td>
                        <td class="board_color_line" height=2></td>
                      </tr>
                    <tr> 
                      <td class="board_title_bg2" width="150">�� ����</td>
                      <td class="table_text3"> 
                        <input size="80" maxlength="200" name="p_title" class="input"  value = `<%= v_title %>`>
                      </td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg2" width="150">�� �ۼ���</td>
                      <td class="table_text3"><%=s_name%>
                      </td>
                    </tr>
                    <tr> 
                      <td align=center class="board_title_bg2"  width="150">�� ����</td>
                      <td class="table_text3"> 
			   <!--textarea name="p_content" cols="110" rows="10" ></textarea
			   
                                <OBJECT WIDTH=0 HEIGHT=0 CLASSID="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
                                <PARAM NAME="LPKPath" VALUE="/learn/namo/NamoWec4_Namo.lpk">
                                </OBJECT>
                                <OBJECT ID="we" WIDTH="580" HEIGHT="300" CLASSID="CLSID:C5AC95C0-C873-445B-BA1F-3A430A4DEA42" CODEBASE="/learn/namo/NamoWec.cab#version=4,0,0,17">
                                  <param name="InitFileURL" value="/learn/namo/namowec.env">
                                </OBJECT>-->

						<!-- DHTML Editor  -->
			            <%//@ include file="/portal/include/DhtmlEditor.jsp" %>
    		            <%@ include file="/include/DhtmlEditor.jsp" %>
                        <!-- DHTML Editor  -->  
                      </td>
                    </tr>
					  <tr>
                        <td class="board_title_bg2">÷������</td>
						<td class="table_text3">
						  <input type="FILE" name="p_file1" size="45" class="input"><br>
						  <input type="FILE" name="p_file2" size="45" class="input"><br>
						  <input type="FILE" name="p_file3" size="45" class="input"><br>
						  <input type="FILE" name="p_file4" size="45" class="input"><br>
						  <input type="FILE" name="p_file5" size="45" class="input"><br>
						</td>
					  </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- �Խ��� �� ��� �� ---------------->





            <br>





            <!----------------- ����, ��� ��ư ���� ----------------->
            <table width="150" border="0" cellspacing="0" cellpadding="0" align="center" class="open_board_table_out1">
              <tr> 
			     <td width=70%>&nbsp;</td> 
                <td align=right><a href="javascript:insert()"><img src="/images/user/button/btn_save.gif" border="0"></a></td>
				<td witdh=5%></td>
                <td width=8% align=right><a href="javascript:cancel()"><img src="/images/user/button/btn_list.gif" border="0"></a></td>
              </tr>
            </table>
            <!----------------- ����, ��� ��ư �� ----------------->

           <br>

          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>

</form>
</body>
</html>
