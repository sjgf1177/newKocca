<%
//**********************************************************
//  1. ��      ��: Ȩ������ Q&A �亯ȭ��
//  2. ���α׷���: zu_HomePageQna_A.jsp
//  3. ��      ��: Ȩ������ Q&A �亯ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 18
//  7. ��      ��: ������ 2004. 12. 18
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    int     v_tabseq   = box.getInt("p_tabseq");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    String  v_types      = box.getString("p_types");
    String  v_title      = "";
    String  v_contents   = "";
    String  v_indate     = "";
    String  v_inuserid   = "";
    String  v_inusername = "";
	Vector  v_realfileVector = null;
	Vector  v_savefileVector = null;
	String  v_realmotion  = "";
	String  v_savemotion = "";
	String content = "";
	String v_name="";
	String v_content = "";
	String width = "650";
	String height = "200";

    DataBox dbox = (DataBox)request.getAttribute("selectQna");

	v_inuserid   = dbox.getString("d_inuserid");
	v_types = dbox.getString("d_types");
	v_indate    = dbox.getString("d_indate");
	v_title    = dbox.getString("d_title");
	v_inuserid   = dbox.getString("d_inuserid");
	v_types = dbox.getString("d_types");
	v_indate    = dbox.getString("d_indate");
	v_title    = dbox.getString("d_title");
	v_content = StringManager.replace(dbox.getString("d_contents"),"\n","<br>");
	v_name = dbox.getString("d_name");
	v_realfileVector = (Vector)dbox.getObject("d_realfile");
	v_savefileVector = (Vector)dbox.getObject("d_savefile");
	v_realmotion  = dbox.getString("d_realmotion");
	v_savemotion  = dbox.getString("d_savemotion");
        // �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
        if (!v_searchtext.equals("")) {
            if (v_search.equals("title")) {
                v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            }  else if (v_search.equals("contents")) {
                v_contents = StringManager.replace(v_contents, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            }
        }
    

    String s_userid    = box.getSession("userid");
    String s_name      = box.getSession("name");

%>


<HTML>
<HEAD>
<TITLE></TITLE>
<LINK rel="stylesheet" href="/css/style_main.css" type="text/css">
<SCRIPT src="/script/cafe_select.js" language="JavaScript"></SCRIPT>
<script language="JavaScript" type="text/JavaScript">
<!--
function cancel() {
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
        if (blankCheck(document.all.content.value)) {
			alert("������ �Է��ϼ���!");
	        document.all.content.focus();
	        return;
        }	    
		document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
		document.form1.p_process.value = "reply";              
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
													<input type = "hidden" name = "p_process">
												<TABLE cellpadding="0" cellspacing="0" border="0" width="735">
													<tr height="25">
														<td class="boardbgcolor" width="90" style="padding-left:18px"><IMG src="/images/board/mt_main_title.gif" border="0"></td>
														<td style="padding-left:15"><B><font color="FF8608"><%=v_title%></B></font></td>
													</tr>
													<tr height="25">
														<td class="boardbgcolor" style="padding-left:18px"><IMG src="/images/board/mt_main_name.gif" border="0"></td>
														<td style="BORDER-TOP:#E5E5E5 1px solid;padding-left:15px;padding-right:15px">
															<TABLE cellpadding="0" cellspacing="0" border="0" width="100%">
																<tr>
																	<td style="padding-top:5px"><%=v_name%>(<%=v_inuserid%>)</td>
																	<td align="right" style="padding-top:5px">
																		<TABLE cellpadding="0" cellspacing="0" border="0">
																			<tr height="15">
																				<td align="center" width="43" background="/images/board/mt_main_mbg.gif" style="background-repeat: no-repeat;padding-bottom:2px"><IMG src="/images/board/mt_main_date.gif" border="0"></td>
																				<td width="2"></td>
																				<td style="padding-top:1px"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd")%></td>
																			</tr>
																		</TABLE>
																	</td>
																</tr>
															</TABLE>
														</td>
													</tr>
												</TABLE>
												<TABLE cellpadding="0" cellspacing="0" border="0" width="735">
													<tr height="2">
														<td></td>
													</tr>
													<tr height="1">
														<td bgcolor="E5E5E5"></td>
													</tr>
													<tr>
														<td style="padding:17">
														 <%= v_content%>
														</td>
													</tr>
													<tr height="1">
														<td bgcolor="E5E5E5"></td>
													</tr>
												</TABLE>
												<!-- �Խ��� �� -->
												<!-- �亯���� ���� -->
												<TABLE cellpadding="0" cellspacing="0" border="0" width="735">
													<tr height="15">
														<td></td>
													</tr>
													<tr>
														<td><IMG src="/images/board/at_knowledge_02.gif" border="0"></td>
													</tr>
													<tr height="10">
														<td class="boardbgcolor"></td>
													</tr>
													<tr>
														<td style="padding-left:10px;padding-right:10px" class="boardbgcolor">
															<TABLE cellpadding="0" cellspacing="0" border="0" width="100%">
																<colgroup width="93" class="boardbgcolor" style="padding-left:7px;padding-top:10px"></colgroup>
																<colgroup bgcolor="FFFFFF"></colgroup>
																<tr valign="top">
																	<td><IMG src="/images/board/mt_main_title2.gif" border="0"></td>
																	<td style="padding-top:7px;padding-left:15px"><input size="65" maxlength="200" name="p_title" class="inputsub"></td>
																</tr>
																<tr valign="top">
																	<td><IMG src="/images/board/mt_main_name.gif" border="0"></td>
																	<td style="padding-top:7px;padding-left:15px"><%=s_name%></td>
																</tr>
																<tr valign="top">
																	<td><IMG src="/images/board/mt_main_date.gif" border="0"></td>
																	<td style="padding-top:7px;padding-left:15px"><%= FormatDate.getDate("yyyy/MM/dd") %></td>
																</tr>
																<tr valign="top">
																	<td><IMG src="/images/board/mt_main_data.gif" border="0"></td>
																	<td style="padding-top:10px;padding-left:15px">
																	<!-- ������ ���� -->
																	<%content = StringManager.replace(v_content,"<br>",">");%>
																	<!-- DHTML Editor  -->
																		<%//@ include file="/portal/include/DhtmlEditor.jsp" %>
																	
<textarea name="content" rows="15" cols="90" onkeyup="fc_chk_byte(this,1200);" >><%=content%></textarea>

																	<!-- DHTML Editor  -->																																<!-- ������ �� -->
																	</td>
																</tr>
																<tr height="10">
																	<td></td>
																	<td></td>
																</tr>
															</TABLE>
														</td>
													</tr>
													<tr height="10">
														<td class="boardbgcolor"></td>
													</tr>
												</TABLE>
												</form>
												<!-- �亯���� �� -->
												<!-- ��ư ���� -->
												<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="92%" align="right"><a href="javascript:insert()"><IMG src="/images/board/b_send.gif" border="0"></a></td>
                      <td width="1%">&nbsp;</td>
                      <td width="7%" align="right"><a href="javascript:cancel()"><IMG src="/images/board/b_cancel.gif" border="0"></a></td>
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