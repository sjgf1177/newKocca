<%
//**********************************************************
//  1. ��      ��: ȸ������ > �������� ���
//  2. ���α׷��� : ku_Notice_I.jsp
//  3. ��      ��: ȸ������ ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: 05.12.19 �̳���
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
	box.put("leftmenu","01");  

    int     v_tabseq     = box.getInt("p_tabseq");
    String  v_process    = box.getString("p_process");
    int     v_pageno     = box.getInt("p_pageno");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
    String  v_indate     = "";
    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
	String  content = "";
	String  width = "650";
	String  height = "200";

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topOpenkocca.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">

	function listnotice(){
		document.form1.action = "/servlet/controller.homepage.OpenForumNoticeServlet";
        document.form1.submit();
	}

	// ���� �������� ���
	function insert(){
		if(document.all.use_editor[0].checked) {        
			form1.p_content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
		}else {
			form1.p_content.value = document.all.txtDetail.value;
		}

		if (blankCheck(document.all.p_title.value)) {
			alert("������ �Է��ϼ���!");
			document.all.p_title.focus();
			return;
		}   
		if (realsize(document.form1.p_title.value) > 200) {
			alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
			document.form1.p_title.focus();
			return;
		}

			var islimit1 = true;
			var file1 = document.form1.p_file1.value;
			
			if(file1!="") {islimit1 = limitFile(file1);}
			if(!islimit1){  return;	}

		document.form1.p_pageno.value = "1";
		document.form1.p_search.value     = "";
		document.form1.p_searchtext.value = "";
		document.form1.action = "/servlet/controller.homepage.OpenForumNoticeServlet";
		document.form1.p_process.value = "insert";
		document.form1.submit();
	}

	//������ �̵�
	function goPage(pageNum) {
		 document.form1.p_pageno.value = pageNum;
		 document.form1.action = "/servlet/controller.homepage.OpenForumNoticeServlet";
		 document.form1.p_process.value = "List";
		 document.form1.submit();
	}
	
	// ����÷�ο� �������
	function File_CancelKeyInput()
	{
		if(event.keyCode == 9){	// Tab key�� ���
			return true;
		}else{
			alert('[ã�ƺ���] ��ư�� �̿��� ÷���Ͻ� ������ �����ϼ���.\n\n��θ� �������� �߸� �Է��Ͻ� ��� ���ε尡 ����� �̷������ �ʽ��ϴ�.'); 
			return false;
		}
	}

</SCRIPT>

<!-- /////////////////////////////////////////////////////////-->
<!--
  ����Ȯ����üũ INCLUDE
  
  1. page import = "com.credu.system.*" �߰�
  2. �ڹٽ�ũ��Ʈ ȣ��κ� �߰�
    ����)
    //���� Ȯ���� ���͸�  
	var islimit = true;
	var file = document.form1.p_file1.value;  
	if(file!="") {
	    islimit = limitFile(file);    //return�� true/false
	}
	
	if(islimit) {
        document.form1.submit();
	}else{
	    return;
	}

-->
<%@ include file = "/learn/library/fileFilter.jsp" %>
<!-- /////////////////////////////////////////////////////////-->

<form name="form1" enctype = "multipart/form-data" method="post">
	<input type = "hidden" name = "p_process">
	<input type = "hidden" name = "p_tabseq"     value = "<%=v_tabseq %>">
	<input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
	<input type = "hidden" name = "p_search"     value = "<%=v_search %>">
	<input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
	<input type = "hidden" name = "p_content"    value = "">


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
                        <!--�Խ��Ǹ�� -->
                         <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/openkocca/st_forum_notice.gif"> </td>
                          </tr>                          
                        </table>
                        
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
                            <td width="75" class="tbl_gleft03" height="25">����</td>
                            <td width="605" class="tbl_gleft01" height="25"><input name="p_title" type="text" size="50" class="input2"></td>
                          </tr>
                          <tr> 
                            <td colspan="6" height="1"></td>
                          </tr>
                          <tr > 
                            <td height="1" colspan="6" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr> 
                            <td colspan="6" height="1"></td>
                          </tr>
                          <tr> 
                            <td width="75" class="tbl_gleft03" height="25">�����</td>
                            <td width="605" class="tbl_gleft01" height="25"><%= FormatDate.getDate("yyyy-MM-dd") %></td>
                          </tr>
                
                          <tr > 
                            <td height="1" colspan="6" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr valign="top"> 
                            <td colspan="6" class="tbl_gleft01">
								<!-- DHTML Editor  -->
								<%@ include file="/include/DhtmlEditor.jsp" %>
								<!-- DHTML Editor  -->
							</td>
                          </tr>
                           <tr > 
                            <td height="1" colspan="6" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr> 
                            <td width="75" class="tbl_gleft03" height="25">÷������</td>
                            <td width="605" class="tbl_gleft01" height="25">
								<input type="FILE" name="p_file1" size="60" class="input2" onkeydown="javascript:return File_CancelKeyInput()"><br></td>
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
                            <td height="27" class="linecolor_notice">
							  <table width="108" border="0" align="right" cellpadding="0" cellspacing="0">
                                <tr>
								  <td width="61">&nbsp;</td>
                                  <td width="47"><a href="javascript:insert()"><img src="/images/user/kocca/button/btn_input.gif"></a></td>
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