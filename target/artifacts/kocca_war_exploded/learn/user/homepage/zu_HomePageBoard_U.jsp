<%
//**********************************************************
//  1. ��      ��: �ڷ��
//  2. ���α׷��� : zu_HomePageBoard_U.jsp
//  3. ��      ��: �ڷ�� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005.07.01 �̿���
//  7. ��      ��: 2005.07.01 �̿���
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

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

    int    v_cnt     = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";

	String content = "";
	String width = "650";
	String height = "200";	

    Vector v_realfileVector = null;          //      �����ϸ� �迭
    Vector v_savefileVector = null;          //      ������ ������ִ� ���ϸ� �迭
    Vector v_fileseqVector  = null;          //      ����� ���Ϲ�ȣ �迭

    DataBox dbox = (DataBox)request.getAttribute("selectHomePageBoard");
    if (dbox != null ) {
        v_seq         = dbox.getInt("d_seq");
        v_userid      = dbox.getString("d_userid");
        v_name        = dbox.getString("d_name");
        v_title       = dbox.getString("d_title");
        //v_content     = dbox.getString("d_content");
        v_cnt         = dbox.getInt("d_cnt");
        v_indate      = dbox.getString("d_indate");
        v_realfileVector = (Vector)dbox.getObject("d_realfile");
        v_savefileVector = (Vector)dbox.getObject("d_savefile");
        v_fileseqVector  = (Vector)dbox.getObject("d_fileseq");
		content = StringManager.replace(dbox.getString("d_content"),"\n;","<br>");
        v_title = StringManager.replace(v_title, "`", "'");
    }

    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");

out.println("content="+content);

box.put("leftmenu","04");                       // �޴� ���̵� ����
%>


<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topSupport.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--

//����� ������ ����
function update() {
	if(document.all.use_editor[0].checked) {        
		form1.content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
	}else {
		form1.content.value = document.all.txtDetail.value;
	}
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
	document.form1.p_search.value     = "";
    document.form1.p_searchtext.value = "";
    document.form1.action = "/servlet/controller.homepage.HomePageBoardServlet";
    document.form1.p_process.value = "update";
    document.form1.submit();
}

//����Ʈ ȭ������ �̵�
function cancel() {
     document.form1.action = "/servlet/controller.homepage.HomePageBoardServlet";
     document.form1.p_process.value = "selectList";
     document.form1.submit();
}

//�󳻿� üũ
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;
    
    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);
    
    return (false);
}
    
//���� ������ üũ
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
//-->
</script>
		  <!-- center start -->
		    <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location">HOME 
                  &gt; �н��������� &gt; Q&amp;A</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> <table width="675" border="0" cellspacing="0" cellpadding="0">

                    <tr> 
                      <td colspan="4"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="/images/user/support/<%=tem_subimgpath%>/tit_data.jpg" ></td>
                    </tr>
                    <tr>
                      <td height="20"></td>
                    </tr>
                  </table>
                  <!-- �ڷ�� table -->
				<form name = "form1" enctype = "multipart/form-data" method = "post">				
				<input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq %>">
				<input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
				<input type = "hidden" name = "p_search"     value = "<%=v_search %>">
				<input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
				<input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
				<input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
				<input type = "hidden" name = "p_userid"     value = "<%= v_userid %>">
			    <input type = "hidden" name = "p_process">
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td colspan="2"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td width="97"><img src="/images/user/support/text_title.gif"></td>
                      <td width="579" class="tbl_gleft"> 
					    <input type="text" name="p_title" size="80" maxlength="100" value ="<%= v_title %>"> 
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="2"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/support/text_pe.gif"></td>
                      <td class="tbl_gleft"><%= v_name %>(<%=v_userid%>)</td>
                    </tr>
                    <tr> 
                      <td colspan="2"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/support/text_day.gif"></td>
                      <td class="tbl_gleft"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
                    </tr>
                    <tr> 
                      <td colspan="2"><img src="/images/user/support/search_line.gif"></td>
                    </tr>

		<!---------����÷�ο��� ------------>
<% if(v_upfilecnt>0){%>

                    <tr> 
                      <td height="100" valign="top">
					  <table width="94" height="100%" border="0" cellpadding="0" cellspacing="0" background="../../../images/user/support/text_bg_head.gif">
                          <tr>
                            <td height="9"  valign="top"><img src="../../../images/user/support/text_top_head.gif"></td>
                          </tr>
                          <tr>
                            <td align="center"><img src="/images/user/support/text_prefile_a.gif"></td>
                          </tr>
                          <tr>
                            <td height="8" valign="bottom"><img src="../../../images/user/support/text_bo_head.gif" ></td>
                          </tr>
                        </table></td>
                      <td class="tbl_gleft"> 
			<%		
				if( v_realfileVector != null ) { 
					for(int i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����
					String v_realfile = (String)v_realfileVector.elementAt(i);
					String v_savefile = (String)v_savefileVector.elementAt(i);  
					String v_fileseq = (String)v_fileseqVector.elementAt(i);  	

					
					if(v_realfile != null && !v_realfile.equals("")) {  %>
						&nbsp;<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'>
					
                        <%= v_realfile%></a> &nbsp;
						<input type = "checkbox"  name = "p_fileseq<%=i%>" value = "<%= v_fileseq%>"> (������ üũ)<br>
						<input type = "hidden" name = "p_realfile"  value = <%=v_realfile%>>
						<input type = "hidden" name = "p_savefile<%=i%>"  value ="<%=v_savefile%>">
			<%		}   %>
		<%			}
				}
		%>
                      </td>
                    </tr>
<%}%>
		<!---------����÷�ο��� �� ------------>
                  <tr> 
                    <td colspan="2"><img src="/images/user/support/search_line.gif"></td>
                  </tr>
                  <tr> 
                      <td><img src="/images/user/support/text_addfile.gif"></td>
                      <td class="tbl_gleft">
						<input type="FILE" name="p_file1" size="80" class="input"><br>
						<input type="FILE" name="p_file2" size="80" class="input"><br>
						<input type="FILE" name="p_file3" size="80" class="input"><br>
						<input type="FILE" name="p_file4" size="80" class="input"><br>
						<input type="FILE" name="p_file5" size="80" class="input"><br>
					  </td>
                    </tr>
                    <tr> 
                      <td colspan="2"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr>
                      <td colspan="2"><img src="/images/user/support/text_contents2.gif"></td>
                    </tr>
                    <tr valign="top"> 
                      <td colspan="2" class="tbl_contents">
    		            <%@ include file="/include/DhtmlEditor.jsp" %>

                      </td>
                    </tr>
                    <tr> 
                      <td height="3" colspan="2"></td>
                    </tr>
                    <tr bgcolor="B8D5E5"> 
                      <td height="5" colspan="2"><img src="/images/user/support/sup_tb_bo.gif" width="675" height="5"></td>
                    </tr>
                  </table>
				  </form>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="10" colspan="2"></td>
                    </tr>
                    <tr> 
                      <td width="418" align="right">&nbsp; </td>
                      <td width="257" align="right"><a href = "javascript:update();"><img src="/images/user/button/btn_register.gif" border="0"></a> 
                      <a href = "javascript:cancel();"><img src="/images/user/button/btn_cancel.gif" border="0"></a> 
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

