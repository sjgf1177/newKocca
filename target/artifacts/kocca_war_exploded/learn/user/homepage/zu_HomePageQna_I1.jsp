<%
//**********************************************************
//  1. ��      ��: Ȩ������ Q&A ���ȭ��
//  2. ���α׷���: zu_HomePageQna_I.jsp
//  3. ��      ��: Ȩ������ Q&A ���ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 18
//  7. ��      ��: ������ 2004. 12. 18
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");
 
String v_title = "", v_content = "", v_usernm = "", v_userid = "", v_regdt = "";

int v_seq = box.getInt("p_seq");
String v_searchtext = box.getString("p_searchtext");
String v_select = box.getString("p_select");
int v_pageno = box.getInt("p_pageno");
String s_usernm = box.getSession("name");
String content = "";
String width = "650";
String height = "200";
%>

<HTML>
<HEAD>
<TITLE></TITLE>
<LINK rel="stylesheet" href="/css/style_main.css" type="text/css">
<SCRIPT src="/script/cafe_select.js" language="JavaScript"></SCRIPT>
<script language="JavaScript" type="text/JavaScript">
<!--
function selectList() {
                document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
                document.form1.p_process.value = "";     
                document.form1.submit();	
            }  
function insert() {
	
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
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
	document.form1.p_process.value = "insert";              
    document.form1.submit();
}
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;
    
    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);
    
    return (false);
}
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

function helpdeskList(){
	document.form1.p_process.value = "selectList";
	document.form1.action = "/servlet/controller.homepage.HomePageFAQServlet";
	document.form1.submit();
}

function fc_chk_byte(aro_name,ari_max)
{

   var ls_str     = aro_name.value; // �̺�Ʈ�� �Ͼ ��Ʈ���� value ��
   var li_str_len = ls_str.length;  // ��ü����

   // �����ʱ�ȭ
   var li_max      = ari_max; // ������ ���ڼ� ũ��
   var i           = 0;  // for���� ���
   var li_byte     = 0;  // �ѱ��ϰ��� 2 �׹ܿ��� 1�� ����
   var li_len      = 0;  // substring�ϱ� ���ؼ� ���
   var ls_one_char = ""; // �ѱ��ھ� �˻��Ѵ�
   var ls_str2     = ""; // ���ڼ��� �ʰ��ϸ� �����Ҽ� ������������ �����ش�.

   for(i=0; i< li_str_len; i++)
   {
      // �ѱ�������
      ls_one_char = ls_str.charAt(i);

      // �ѱ��̸� 2�� ���Ѵ�.
      if (escape(ls_one_char).length > 4)
      {
         li_byte += 2;
      }
      // �׹��� ���� 1�� ���Ѵ�.
      else
      {
         li_byte++;
      }

      // ��ü ũ�Ⱑ li_max�� ����������
      if(li_byte <= li_max)
      {
         li_len = i + 1;
      }
   }
   
   // ��ü���̸� �ʰ��ϸ�
   if(li_byte > li_max)
   {
      alert( li_max + " ���ڸ� �ʰ� �Է��Ҽ� �����ϴ�. \n �ʰ��� ������ �ڵ����� ���� �˴ϴ�. ");
      ls_str2 = ls_str.substr(0, li_len);
      aro_name.value = ls_str2;
      
   }
   aro_name.focus();   
}

//-->
</script>
</HEAD>

<BODY topmargin="0" leftmargin="0">
<TABLE cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
	<tr class="tableheight1" valign="top">
		<td background="/images/common/bg_sub.gif">
			<TABLE cellpadding="0" cellspacing="0" border="0" width="950">
				<tr class="tableheight2">
					<td>
						<!-- TOP ���� -->
						<%@include file="/incmenu/top.jsp"%>
						<!-- TOP �� -->
					</td>
				</tr>
				<tr class="tableheight3">
					<td style="BORDER-LEFT:#FFFFFF 10px solid">
						<!-- ���� �÷��� ���� -->
						<%@include file="/incmenu/sub.jsp"%>
						<!-- ���� �÷��� �� -->
					</td>
				</tr>
				<tr class="tableheight4">
					<td style="BORDER-LEFT:#FFFFFF 10px solid">
						<!-- �޴��� ���� -->
						<%@include file="/incmenu/menu.jsp"%>
						<!-- �޴��� �� -->
					</td>
				</tr>
			</TABLE>
		</td>
	</tr>
	<tr valign="top">
		<td>
			<TABLE cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
				<tr valign="top">
					<td width="200" background="/images/common/left_bg.gif">
						<!-- ���� �޴� ���� -->
						<%@include file="/incmenu/left_helpdesk.jsp"%>
						<!-- ���� �޴� �� -->
					</td>
					<td>
						<!-- �˻� ���� -->
						<jsp:include page="/incmenu/search_main.jsp" flush="true">
							<jsp:param name="GUBUN" value="PORTAL"/>
						</jsp:include>
						<!-- �˻� �� -->
						<!-- ���� ���� -->
						<TABLE cellpadding="0" cellspacing="0" border="0" width="735">
							<tr>
								<td class="bodypd">
									<!-- ���� ��ġ ���� -->
									<jsp:include page="/incmenu/helpdesk_location.jsp" flush="true">
										<jsp:param name="URL" value="<%=request.getServletPath().toString()%>"/>
									</jsp:include>
									
									<% //@include file="/incmenu/location.jsp"%>
									<!-- ���� ��ġ �� -->
									<TABLE cellpadding="0" cellspacing="0" border="0" width="735">
										<tr>
											<td><IMG src="/images/common/title_helpdesk_02.gif" border="0"></td>
										</tr>
										<tr height="1">
											<td bgcolor="E5E5E5"></td>
										</tr>
										<tr height="2">
											<td></td>
										</tr>
										<tr>
                                            <td>
												<!-- �Խ��� ���� -->
												<form name = "form1" enctype = "multipart/form-data" method = "post">
													<input type = "hidden" name = "p_seq"     value = "<%= v_seq %>">
												    <input type = "hidden" name = "p_searchtext"  value = "">
												    <input type = "hidden" name = "p_select"  value = "">
												    <input type = "hidden" name = "p_pageno"  value = "">
													<input type = "hidden" name = "p_process" value="">
                                                <TABLE cellpadding="0" cellspacing="0" border="0" width="735">
                                                    <colgroup style="padding-left:18px;padding-top:5px" width="90" class="boardbgcolor"></colgroup>
<colgroup style="padding-left:15px"></colgroup>

                                                    <tr height="15">
                                                        <td></td>
                                                        <td></td>
													</tr>
                                                    <tr valign="top">
                                                        <td><IMG src="/images/board/mt_main_title.gif" border="0"></td>
                                                        <td><input type = "text"  onFocus = "this.style.background='#FFFAE1'" onBlur = "this.style.background='#ffffff'" 
										name = "p_title" size = "90" maxlength = "100" value = "" class="input"></td>
													</tr>
                                                    <tr height="10">
                                                        <td></td>
                                                        <td></td>
													</tr>
                                                    <tr>
                                                        <td><IMG src="/images/board/mt_main_name.gif" border="0"></td>
                                                        <td style="padding-top:5px"><B><%= s_usernm %></B></td>
													</tr>
                                                    <tr height="10">
                                                        <td></td>
                                                        <td></td>
													</tr>
                                                    <tr>
                                                        <td><IMG src="/images/board/mt_main_date.gif" border="0"></td>
                                                        <td style="padding-top:5px"><%= FormatDate.getDate("yyyy/MM/dd") %></td>
													</tr>
                                                    <tr height="10">
                                                        <td></td>
                                                        <td></td>
													</tr>
                                                    <tr valign="top">
                                                        <td><IMG src="/images/board/mt_main_data.gif" border="0"></td>
                                                        <td><!-- DHTML Editor  -->
                                                            <%//@ include file="/portal/include/DhtmlEditor.jsp" %>
															
															<textarea name="content" rows="15" cols="90" onkeyup="fc_chk_byte(this,1200);" ></textarea>

                                                            <!-- DHTML Editor  --></td>
													</tr>
                                                    <tr height="10">
                                                        <td></td>
                                                        <td></td>
													</tr>
                                                    <tr valign="top">
                                                        <td><IMG src="/images/board/mt_main_file2.gif" border="0"></td>
                                                        <td><input type = "file" onFocus = "this.style.background = '#FFFAE1'" onBlur = "this.style.background='#ffffff'" name = "p_file"></td>
													</tr>
                                                    <tr height="10">
                                                        <td height="2"></td>
                                                        <td height="2"></td>
													</tr>
                                                    <tr height="2">
                                                        <td bgcolor="FFFFFF" colspan="2"></td>
													</tr>
                                                    <tr>
                                                        <td colspan="2" bgcolor="E5E5E5"></td>
													</tr>
												</TABLE>
												</form>
												<!-- �Խ��� �� -->
												<!-- ��ư ���� -->
												<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
					<!--����ϱ�-->
                      <td align="right" valign="middle"><a href = "javascript:insert();"><IMG src="/images/board/b_send.gif" border="0"></a></td>
                      <td width="1%">&nbsp;</td>
					  <!--����ϱ�-->
                      <td width="53" align="right" valign="middle"><a href = "javascript:selectList();"><IMG src="/images/board/b_cancel.gif" border="0"></a></td>
                    </tr>
                  </table>
												<!-- ��ư �� -->
											</td>
										</tr>
									</TABLE>
								</td>
							</tr>
						</TABLE>
						<!-- ���� �� -->
					</td>
				</tr>
			</TABLE>
		</td>
	</tr>
	<tr height="51">
		<td valign="top">
			<!-- FOOTER ���� -->
			<jsp:include page="/incmenu/footer.jsp" flush="true">
				<jsp:param name="sUrl" value="<%=request.getServletPath().toString()%>"/>
			</jsp:include>
			<!-- FOOTER �� -->
		</td>
	</tr>
</TABLE>
</BODY>
</HTML>