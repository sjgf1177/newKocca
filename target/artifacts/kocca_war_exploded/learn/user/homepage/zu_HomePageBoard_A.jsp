<%
//**********************************************************
//  1. ��      ��: �ڷ��
//  2. ���α׷��� : zu_HomePageBoard_A.jsp
//  3. ��      ��: �ڷ�� �亯
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005.7.4 �̿���
//  7. ��      ��:
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
 
    DataBox dbox = (DataBox)request.getAttribute("selectSoftwareBoard");
    if (dbox != null ) {
        v_seq         = dbox.getInt("d_seq");
        v_refseq      = dbox.getInt("d_refseq");
        v_levels      = dbox.getInt("d_levels");
        v_position    = dbox.getInt("d_position");
        v_userid      = dbox.getString("d_userid");
        v_name        = dbox.getString("d_name");
        v_title       = dbox.getString("d_title");
        v_content     = dbox.getString("d_content");
        v_cnt         = dbox.getInt("d_cnt");
        v_indate      = dbox.getString("d_indate");
        v_title = "[RE] " + v_title;
        v_title = StringManager.replace(v_title, "`", "'");
	}

    String s_name      = box.getSession("name");
    String s_userid  = box.getSession("userid");
box.put("leftmenu","04");                       // �޴� ���̵� ����

%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topSupport.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<script language="JavaScript" type="text/JavaScript">
<!--

//�Է� �����Ѵ�.
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
    document.form1.p_search.value     = "";
    document.form1.p_searchtext.value = "";
    document.form1.action = "/servlet/controller.homepage.HomePageBoardServlet";
    document.form1.p_process.value = "reply";
    document.form1.submit();
}

//����Ʈ �������� �̵��Ѵ�.
function cancel() {
    document.form1.action = "/servlet/controller.homepage.HomePageBoardServlet";
    document.form1.p_process.value = "selectList";
    document.form1.submit();
}

//����üũ�Ѵ�.
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;
    
    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);
    
    return (false);
}

//���ڼ��� üũ�Ѵ�.
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
				  <!-- qna table -->
				  
				<form name = "form1" enctype = "multipart/form-data" method = "post">
				<input type = "hidden" name = "p_pageno"    value = "<%=v_pageno %>">
				<input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq %>">
				<input type = "hidden" name = "p_search"     value = "<%=v_search %>">
				<input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
				<input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
				<input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
				<input type = "hidden" name = "p_refseq"     value = "<%= v_refseq %>">
				<input type = "hidden" name = "p_levels"     value = "<%= v_levels %>">
				<input type = "hidden" name = "p_position"   value = "<%= v_position %>">
				<input type = "hidden" name = "p_content"    value="">
				<input type = "hidden" name = "p_process">

                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td colspan="6"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td width="94"><img src="/images/user/support/text_title.gif"></td>
                      <td colspan="5" class="tbl_btit">�� ��� ����.. ��ȿ�Ⱓ�� �����ٰ��ϴµ� ���� �ִ� �����?</td>
                    </tr>
                    <tr> 
                      <td colspan="6"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/support/text_pe.gif"></td>
                      <td width="149" class="tbl_gleft">������/5314197</td>
                      <td width="95"><img src="/images/user/support/text_day.gif"></td>
                      <td width="93" class="tbl_gleft">2005/06/28 </td>
                      <td width="95">&nbsp;</td>
                      <td width="149" class="tbl_gleft">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="6"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td colspan="6" class="tbl_contents">�� ��� ���񽺸� ��� ���Ҵµ�..�Ѵ� ���� ������.. ��ȿ�Ⱓ�� �����ٰ� 
                        �ϳ׿�. <br>
                        ���� �ִ� ����� ���� �ǰ���?</td>
                    </tr>
                   
                    <tr bgcolor="B8D5E5"> 
                      <td height="1" colspan="6"></td>
                    </tr>
					  <tr> 
                      <td height="10" colspan="6"></td>
                    </tr>
                  </table>
				  <!-- �亯table -->
				  <table width="675" border="0" cellspacing="0" cellpadding="0">
                  
                    <tr> 
                      <td colspan="2"><img src="/images/user/support/text_answertit.gif" width="675" height="27"></td>
                    </tr>
                    <tr> 
                      <td colspan="2"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td width="97"><img src="/images/user/support/text_retitle.gif" width="94" height="27"></td>
                      <td width="579" class="tbl_gleft"> <input type="text" name="textfield2" size="70"> 
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="2"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/support/text_repe.gif" width="94" height="27"></td>
                      <td class="tbl_gleft">������/5314197</td>
                    </tr>
                    <tr> 
                      <td colspan="2"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/support/text_reday.gif"></td>
                      <td class="tbl_gleft">2005/06/28</td>
                    </tr>
                    <tr> 
                      <td colspan="2"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td colspan="2"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td colspan="2" class="tbl_contents"><textarea name="textarea" cols="90" rows="15"></textarea></td>
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
                      <td width="257" align="right"> <a href="#"><img src="/images/user/button/btn_cancel.gif" border="0"></a> 
                        <a href="1qna_list.htm"><img src="/images/user/button/btn_register.gif" border="0"></a></td>
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
