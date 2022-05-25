<%
//**********************************************************
//  1. ��      ��: ���İ����亯 ���ȭ��
//  2. ���α׷���: zu_KnowBoard_A.jsp
//  3. ��      ��: ���İ����亯 ���ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.1
//  6. ��      ��: ������ 2005. 9
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","04"); 
	String p_categorycd = box.getString("p_categorycd");            // request ī�װ�    
    int v_seq = box.getInt("p_seq");
    String v_searchtext = box.getString("p_searchtext");
    String v_select     = box.getString("p_select");
    int    v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ� 
    int    v_pageno     = box.getInt("p_pageno");
    String s_usernm     = box.getSession("name");
    String content      = "";
    String width        = "650";
    String height       = "200";
    
    String s_userid     = box.getSession("userid");
    String s_name      = box.getSession("name");

	DataBox dbox = (DataBox)request.getAttribute("SelectView");

	String v_inuserid   = dbox.getString("d_inuserid");
	String 	v_title     = dbox.getString("d_title");
	String 	v_types     = dbox.getString("d_types");
	String 	v_indate    = dbox.getString("d_indate");
	String 	v_contents  = dbox.getString("d_contents");
	String 	v_name = dbox.getString("d_name");
    int v_recommend = dbox.getInt("d_recommend");
    int v_cnt       = dbox.getInt("d_cnt");

	String v_categorycd = dbox.getString("d_categorycd");
	String v_categorynm = dbox.getString("d_categorynm");


%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topMyClass.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<!------- ����Ȯ����üũ INCLUDE ------------>
<%@ include file = "/learn/library/fileFilter.jsp" %>

<script language="JavaScript" type="text/JavaScript">
<!--
 //����Ʈȭ������ �̵�
function selectList() {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "ListPage";     
    document.form1.submit();	
}  


// ī�װ� ����
function openCategory(){
    window.self.name = "winSelectList";
    open_window("openwinSelectList","","100","100","390","400","","","","yes","");
    document.form1.target = "openwinSelectList";
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "OpenCategoryPage";
    document.form1.submit();
    document.form1.target = window.self.name;    

}

function HuryunDailyPrint(){
    window.self.name = "HuryunDailyPrint";
    open_window("openHuryunDailyPrint","","50","50","750","730",'no','no','no','yes','no');
    document.form1.target = "openHuryunDailyPrint";
    document.form1.action='/learn/admin/goyong/za_HuryunDiaryFrame.jsp';
    //document.form1.p_process.value = 'HuryunDailyPrint';
    document.form1.submit();
    document.form1.target = window.self.name;
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
            document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
        	document.form1.p_process.value = "reply";
            document.form1.submit();
	    }else{
	        return;
	    }	        
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
function realsize( value ) {//���ڼ��� üũ
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


//-->
</script>
		  <!-- center start -->
		    <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location"> 
                  HOME &gt; ���� ���ǽ� &gt; ���İ��� &gt; �ֱ�����</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/myclass/type1/tit_knowledge.jpg" alt="���ǰ��ǽ�"></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <!-- ������ -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="675" height="5" colspan="4"><img src="/images/user/myclass/st_know_re.gif"></td>
                    </tr>
                    <tr> 
                      <td height="10" colspan="4"></td>
                    </tr>
                  </table>
                  		  
                  <!-- qna table -->
				<form name = "form1" enctype = "multipart/form-data" method = "post">
				<input type = "hidden" name = "p_seq"     value = "<%= v_seq %>">
				<input type = "hidden" name = "p_searchtext"  value = "">
				<input type = "hidden" name = "p_select"  value = "">
				<input type = "hidden" name = "p_pageno"  value = "">
				<input type = "hidden" name = "p_process" value="">
				<input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
				<input type = "hidden" name = "p_categorycd"  value = "<%=p_categorycd%>">


                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td colspan="8"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td width="94"><img src="/images/user/myclass/text_title.gif"></td>
                      <td colspan="7" class="tbl_btit"><%= v_title %></td>
                    </tr>
                    <tr> 
                      <td colspan="8"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/myclass/text_name.gif"></td>
                      <td width="149" class="tbl_gleft"><%=v_name%>(<%= v_inuserid %>)</td>
                      <td width="95"><img src="/images/user/myclass/text_day.gif"></td>
                      <td width="93" class="tbl_gleft"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %> </td>
                      <td width="55"><img src="/images/user/myclass/text_viewnum.gif"></td>
                      <td width="41" class="tbl_gleft"><%=v_cnt%></td>
                      <td width="55" ><img src="/images/user/myclass/text_recom2.gif" ></td>
                      <td width="93" class="tbl_gleft"><%=v_recommend%></td>
                    </tr>
                    <tr> 
                      <td colspan="8"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
					 <tr> 
                      <td width="94"><img src="/images/user/myclass/text_cate.gif"></td>
                      <td colspan="7" class="tbl_gleft"> <%=v_categorynm%> </td>
                    </tr>
                    <tr> 
                      <td colspan="8"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td colspan="8" class="tbl_contents"><%=v_contents%></td>
                    </tr>
                    <tr bgcolor="B8D5E5"> 
                      <td height="5" colspan="8"><img src="/images/user/myclass/class_tb_bo.gif"></td>
                    </tr>
                    <tr> 
                      <td height="10" colspan="8"></td>
                    </tr>
                  </table>


                <!--�亯-->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td colspan="2"><img src="/images/user/myclass/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td width="97"><img src="/images/user/myclass/text_title.gif"></td>
                      <td width="579" class="tbl_gleft"> <input type="text" name = "p_title" value="" size="70"> 
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="2"><img src="/images/user/myclass/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/myclass/text_cate.gif"></td>
                      <td width="409" class="tbl_gleft"><input type="text" name="p_catenm" size="30" value='<%=v_categorynm%>' disabled><input type=hidden name='p_catecd' value='<%=v_categorycd%>'> 
                       <!-- <a href="javascript:openCategory();"><img src="/images/user/button/btn_c_catesel.gif" align="absmiddle"></a>--></td>
                    </tr>
                    <tr> 
                      <td colspan="2"><img src="/images/user/myclass/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/myclass/text_day.gif"></td>
                      <td class="tbl_gleft"><%= FormatDate.getDate("yyyy/MM/dd") %></td>
                    </tr>

                    <tr> 
                      <td colspan="2"><img src="/images/user/myclass/search_line.gif"></td>
                    </tr>
                    <tr>
                      <td><img src="/images/user/myclass/text_file2.gif" ></td>
                      <td class="tbl_gleft">
					  <input type="FILE" name="p_file1" size="45" class="input"><br>
					  <input type="FILE" name="p_file2" size="45" class="input"><br>
					  <input type="FILE" name="p_file3" size="45" class="input"><br>
					  <input type="FILE" name="p_file4" size="45" class="input"><br>
					  <input type="FILE" name="p_file5" size="45" class="input"><br>
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="2"><img src="/images/user/myclass/search_line.gif"></td>
                    </tr>
                    <tr>
                      <td colspan="2"><img src="/images/user/myclass/text_contents.gif"></td>
                    </tr>
                    <tr valign="top"> 
                      <td colspan="2" class="tbl_contents">
						<!-- DHTML Editor  -->
			            <%//@ include file="/portal/include/DhtmlEditor.jsp" %>
    		            <%@ include file="/include/DhtmlEditor.jsp" %>
						<!--<textarea name="content" rows="15" cols="90" onkeyup="fc_chk_byte(this,1200);" ></textarea>-->
                        <!-- DHTML Editor  -->
                      </td>
                    </tr>
                    <tr> 
                      <td height="3" colspan="2"></td>
                    </tr>
                    <tr bgcolor="B8D5E5"> 
                      <td height="5" colspan="2"><img src="/images/user/myclass/class_tb_bo.gif" width="675" height="5"></td>
                    </tr>
                  </table>
				  </form>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="10" colspan="2"></td>
                    </tr>
                    <tr> 
                      <td width="418" align="right">&nbsp; </td>
                      <td width="257" align="right"> 
					  <!--����ϱ�-->
					  <a href="javascript:insert();"><img src="/images/user/button/btn_register.gif" alt="���" border="0"></a>
					  <!--����ϱ�-->
                      <a href="javascript:selectList();"><img src="/images/user/button/btn_cancel.gif" alt="���" border="0"></a>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td align="center" valign="top">&nbsp;</td>
              </tr>
              <tr> 
                <td width="470" height="2" align="center" valign="top" bgcolor="#999999"></td>
              </tr>
            </table>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->