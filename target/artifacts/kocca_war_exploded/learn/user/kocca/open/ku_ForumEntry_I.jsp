<%
//**********************************************************
//  1. ��      ��: ���� > �����Խ��� 
//  2. ���α׷��� : ku_ForumList_L.jsp
//  3. ��      ��: ���� > �����Խ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />


<%

    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
	box.put("leftmenu","01");  

    String 	v_seq   = box.getString("p_seq");
    String 	v_types = box.getString("p_types");
    String  v_url   = "SubjectList";
    
    if  (  "B".equals(v_types)) {
            v_url   = "SubjectFreeList";
    }

	String s_userid     = box.getSession("userid");
    String s_usernm     = box.getSession("name");
    String content      = "";
    String width        = "650";
    String height       = "200";

	String v_catenm		= "";

	// ������ ��������   
    ArrayList listTheme = (ArrayList)request.getAttribute("monthTheme");

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topOpenkocca.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->
<!------- ����Ȯ����üũ INCLUDE ------------>

<%@ include file = "/learn/library/fileFilter.jsp" %>

<SCRIPT LANGUAGE="JavaScript">

	//���� ��õ�ϱ�
    function ForumRecommend() {
  
	
      if (confirm("��õ�Ͻðڽ��ϱ�?")) {
        document.Forumform1.p_process.value = "insertRecommend";
        document.Forumform1.action ="/servlet/controller.homepage.OpenForumUserServlet";
        document.Forumform1.submit();
      }  
      else 
      {
		return;
	   }
    }
    
    
//���� ���
function insertcomment() {
	
	if(document.form1.commentqna.value ==""){
		alert("������ ����ϼ���");
		return;
	}
	
	
	document.form1.action = "/servlet/controller.homepage.OpenForumUserServlet";
	document.form1.p_process.value = "commentInsert";
	document.form1.submit();
}

//���� ����
function deleteComment(v_commentseq) {


	if (confirm("������ �����Ͻðڽ��ϱ�?")) {
		document.form1.p_commentseq.value = v_commentseq;
		document.form1.p_process.value = "deleteComment";
		document.form1.action = "/servlet/controller.homepage.OpenForumUserServlet";
		document.form1.submit();
	}
	else 
	{
		return;
	}
}




//�����͸� �Է��Ѵ�.
function insert() {
	if(document.all.use_editor[0].checked) {        
        form1.content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
	}else {
		form1.content.value = document.all.txtDetail.value;
	    }

    if (blankCheck(document.all.p_title.value)) {
        alert("������ �Է��ϼ���!");
        document.all.p_title.focus();
        return;
    }       
             
    if (realsize(document.all.p_title.value) > 100) {
        alert("������ �ѱ۱��� 50�ڸ� �ʰ����� ���մϴ�.");
        document.all.p_title.focus();
        return;
	}

   // if (blankCheck(document.all.p_catecd.value)) {
   //     alert("ī�װ��� �����ϼ���!");
   //     return;
  //  }    
    
	    //���� Ȯ���� ���͸�  
		var islimit1 = true;
		var file1 = document.form1.p_file1.value;
		alert(file1);
		
		if(file1!="") {islimit1 = limitFile(file1);}
		if(!islimit1){  return;	}
 	    	    	    	   
            document.form1.action = "/servlet/controller.homepage.OpenForumUserServlet";
        	document.form1.p_process.value = "insert";
            document.form1.submit();
       
}

//�Է� ������ ������ üũ
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;
    
    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);
    
    return (false);
}
//���ڼ��� üũ
function realsize( value ) {
    var len = 0;
    if ( value == null ) return 0;
    for(var i=0;i<value.length;i++){
        var c = escape(value.charAt(i));
        if ( c.length == 1 ) len ++;
        else if ( c.indexOf("%u") != -1 ) len += 2;
        else if ( c.indexOf("%") != -1 ) len += c.length/3;
    }
    return len;
}
		 
		 

</SCRIPT>



<form name="form1"  enctype = "multipart/form-data" method="post">
	<input type = "hidden" name = "p_seq"			value="<%=v_seq%>">
	<input type = "hidden" name = "p_types"			value="<%=v_types%>">
	<input type = "hidden" name = "p_process"		value="" >  
	<input type = "hidden" name = "p_commentseq"	value="" > 
	<input type = "hidden" name = "p_upfilecnt"		value = "1">
     

						<table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > �������� > ȸ������</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/openkocca/<%=tem_subimgpath%>/tit_forum.gif"></td>
                          </tr>
                          <tr> 
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="88" rowspan="3"><img src="/images/user/kocca/openkocca/text_forum.gif"></td>
                          </tr>
                          <tr> 
                            <td height="12"></td>
                          </tr>
                          <tr > 
                            <td height="1" colspan="2" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr > 
                            <td height="7" colspan="2" ></td>
                          </tr>
                        </table>
                        
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td ><% if ("B".equals(v_types)) { %><img src="/images/user/kocca/openkocca/st_freewrite.gif" >
                   						<%}else{%>	<img src="/images/user/kocca/openkocca/st_write.gif" >
                   						<%}%>
							</td>
						  </tr>
						  </table>
                        <!--�Խ��Ǹ�� -->
                        
                                                    
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="5" colspan="6"></td>
                          </tr>
                          <tr> 
                            <td colspan="6"><img src="/images/user/kocca/openkocca/bar_forum_write_top.gif" ></td>
                          </tr>
                          <tr> 
                            <td height="2" colspan="6"></td>
                          </tr>
                          
                          <tr> 
                            <td width="120" class="tbl_gleft03">
							<% if  (  "B".equals(v_types)) {  out.println("�з�");%></td>
								<td colspan="5" class="tbl_gleft01"><%= CodeConfigBean.getCodeGubunSelect("0066","",1,"p_catenm",v_catenm,"",3)%></td> 	
							<%}else{ out.println("����");%></td>
                            <td colspan="5" class="tbl_gleft01">
								<%if( listTheme != null ){
									DataBox dbox =(DataBox)listTheme.get(0);
									String v_theme = dbox.getString("d_subject");
									String v_themeseq = dbox.getString("d_subjectseq");%>
								<%=v_theme%>
								<input type=hidden name='p_catecd' value="<%=v_theme%>">
								<input type=hidden name='p_subjectseq' value="<%=v_themeseq%>">
								<%}%></td>
							<%}%>
                          </tr>
                          <tr> 
                            <td colspan="6" height="1"></td>
                          </tr>
                                                   
                          <tr > 
                            <td height="1" colspan="6" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          
                          
                          <tr> 
                            <td width="120" class="tbl_gleft03">����</td>
                            <td colspan="5" class="tbl_gleft01"><input type="text" name = "p_title" value="" size="70" class="input3"> </td>
                          </tr>
                          <tr> 
                            <td colspan="6" height="1"></td>
                          </tr>
                          <tr > 
                            <td height="1" colspan="6" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr> 
                            <td width="120" class="tbl_gleft03">÷���̹���</td>
                            <td colspan="5" class="tbl_gleft01"> <input type="FILE" name="p_file1" size="45" class="input3"><br></td>
                          </tr>
                          <tr> 
                            <td colspan="6" height="1"></td>
                          </tr>
                                                   
                          <tr > 
                            <td height="1" colspan="6" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr valign="top"> 
                            <td colspan="6" class="tbl_contents">
									<!-- DHTML Editor  -->
			    		            <%@ include file="/include/DhtmlEditor.jsp" %>
			                        <!-- DHTML Editor  -->
                           </td>
                          </tr>
                          <tr> 
                            <td height="3" colspan="6" class="tbl_bgcolor_openkocca"></td>
                          </tr>
                        </table> 
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="2"></td>
                          </tr>
                          <tr>
                            <td height="27" class="linecolor_notice"><table width="108" border="0" align="right" cellpadding="0" cellspacing="0">
                                <tr> 
                                  <td width="47"><a href="/servlet/controller.homepage.OpenForumUserServlet?p_process=<%=v_url%>"><img src="/images/user/kocca/button/btn_list.gif" border="0"></a></td>
                                  <td width="61"><a href="javascript:insert();"><img src="/images/user/kocca/button/btn_ok.gif" border="0"></a></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td height="1" bgcolor="#cccccc"></td>
                          </tr>
                        </table>

 
</form>

                       


<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
