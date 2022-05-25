<%
//**********************************************************
//  1. ��      ��: SUBJ QNA INSERT
//  2. ���α׷���: zu_SubjQna_I.jsp
//  3. ��      ��: ���� ���� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 9. 8
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_grcode     = box.getSession("grcode"); 
    String  v_process   = box.getString("p_process");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    String  v_gadminYn = box.getString("p_gadminYn");   //�����ڿ���
    String  v_subj    = box.getString("p_subj");        //�����ڵ�
    String  v_year    = box.getString("p_year");        //�⵵
    String  v_subjseq = box.getString("p_subjseq");     //���� ����
    String  v_lesson  = box.getString("p_lesson");
    String  v_lessonnm  = box.getString("p_lessonnm");
    int     v_seq     = box.getInt("p_seq");
    if(v_lesson.equals("")) v_lesson="000";
    String  v_title="", v_contents="",  v_inuserid="",v_inusernm="";
    String  v_indate="";
    String  v_isopen="";
    int  v_types = 0;
    int  v_nanscnt  =0;
    int     i            = 0;
    ArrayList list1      = null;

    String  v_user_id   = box.getSession("userid");
    String  v_user_name = box.getSession("name");
    v_inuserid= box.getSession("userid");
    v_inusernm= box.getSession("name");

    // editor
    String content      = "";
    String width        = "600";
    String height       = "300";
%>
<!------- ����Ȯ����üũ INCLUDE ------------>       
<%@ include file = "/learn/library/fileFilter.jsp" %>
<html>
<head>
<title>::: ������ :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
  // ����ϱ�
  function qna_insert() {
 
        if (blankCheck(document.all.p_title.value)) {
            alert("������ �Է��ϼ���!");
            document.all.p_title.focus();
            return;
        }                
        if (realsize(document.all.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.all.p_title.focus();
            return;
    	}
    	
        /*if (blankCheck(document.form1.p_contents.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_contents.focus();
            return;
        }*/   	

    	if(document.all.use_editor[0].checked) {        
            document.form1.p_contents.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    	}else {
		    document.form1.p_contents.value = document.all.txtDetail.value;
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
          document.form1.target = "_self";
          document.form1.p_search.value     = "";
          document.form1.p_searchtext.value = "";
        	document.form1.p_process.value = "SubjQnaInsert";
          document.form1.submit();
	    }else{
	        return;
	    }	      
    }

    function goQnaDetailPage() {
      document.form1.submit();
    }

    // ��������̵�
    function qna_list() {
        document.form1.target = "_self";
        document.form1.action = "/servlet/controller.study.SubjQnaStudyServlet";
        document.form1.p_process.value = "SubjQnaList";
        document.form1.submit();
    }
-->
</SCRIPT>
</head>


<body topmargin="0" leftmargin="0">
<form name="form1" method="post" action="/servlet/controller.study.SubjQnaStudyServlet" enctype = "multipart/form-data">
    <input type="hidden" name="p_process"    value="<%=v_process%>">
    <input type="hidden" name="p_search"     value="<%=v_search %>">
    <input type="hidden" name="p_searchtext" value="<%=v_searchtext %>">
    <input type="hidden" name="p_subj"       value="<%=v_subj%>">
    <input type="hidden" name="p_year"       value="<%=v_year%>">
    <input type="hidden" name="p_subjseq"    value="<%=v_subjseq%>">
    <input type="hidden" name="p_lesson"     value="<%=v_lesson%>">
    <input type="hidden" name="p_seq"        value="<%=v_seq%>">
    <input type="hidden" name="p_lessonnm"   value="<%=v_lessonnm%>">
    <input type="hidden" name="p_gadminYn"   value="<%=v_gadminYn%>">
    <input type="hidden" name="p_contents">

    <br>
            <!----------------- Ÿ��Ʋ ���� ----------------->
  				<table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
    				<tr> 
      					<td><img src="/images/user/study/inquiry_title.gif"></td>
      					<td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
      					<td><img src="/images/user/study/gongi_tail.gif"></td>
    				</tr>
  				</table>
            <!----------------- Ÿ��Ʋ �� ---------------->
            <br>


    <!----------------- ���� ��� ���� ---------------->
    <table cellspacing="0" cellpadding="0" class="open_board_vertical_table_out" align="center">
      <tr>
        <td width="3" class="board_color_line"></td>
        <td>
          <table cellspacing="1" cellpadding="1" class="table2">
            <tr>
              <td class="board_title_bg2" width="150">�� ��</td>
              <td class="table_text3">
                <input type="radio" name="p_togubun" value="1" checked>��ڿ���&nbsp;
                <input type="radio" name="p_togubun" value="2">���翡��</td>
            </tr>          
            <tr>
              <td class="board_title_bg2" width="150">�� ��</td>
              <td class="table_text3">
                <input size="70" maxlength="20" name="p_title" class="input">
              </td>
            </tr>
            <tr>
              <td class="board_title_bg2" width="150">�ۼ���</td>
              <td class="table_text3"><%=v_inusernm%></td>
            </tr>
            <tr>
              <td class="board_title_bg2" width="150">��������</td>
              <td class="table_text3">
                <input type="radio" name="p_isopen" value="Y" checked>����&nbsp;
                <input type="radio" name="p_isopen" value="N">�����</td>
            </tr>
            <tr>
              <td class="board_title_bg2">�� ��</td>
              <td class="table_text3">
                <!--<textarea name="p_contents" cols="70" rows="15" class="input"></textarea>     -->
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
    <!----------------- ���� ��� �� ---------------->
    <br>

    <!----------------- ����, ��� ��ư ���� ----------------->
    <table width="120" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
          <td align="center"><a href="javascript:qna_insert()" ><img src="/images/user/button/btn_save.gif" border="0"></a></td>
          <td align="center"><a href="javascript:qna_list()" ><img src="/images/user/button/btn_list.gif" border="0"></a></td>
      </tr>
    </table>
    <!----------------- ����, ��� ��ư �� ----------------->
    <br>

</form>
</body>
</html>
