<%
//**********************************************************
//  1. ��      ��: Ȩ������ Q&A ����Ʈȭ��
//  2. ���α׷���: zu_HomePageQna_L.jsp
//  3. ��      ��: Ȩ������ Q&A ����Ʈȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̿��� 2005. 6. 29
//  7. ��      ��: �̿��� 2005. 6. 29
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");
if (box == null) box = RequestManager.getBox(request);
int v_tabseq         = box.getInt("p_tabseq");
int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));
int v_seq = 0,v_readcnt = 0,i = 0,v_cnt = 0;

String v_inuserid    = "", v_position = "", v_indate = "", v_title = "", tLink = "",  v_types = "" ,v_name="";

int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
ArrayList list = (ArrayList)request.getAttribute("selectList");
  
String  v_searchtext     = box.getString("p_searchtext");   
String  v_select         = box.getString("p_select");
//String  v_search         = box.getString("p_search");
String  v_categorycd     = box.getString("p_categorycd");
int v_pageno             = box.getInt("p_pageno"); 
String s_userid          = box.getSession("userid");
String s_usernm          = box.getSession("name");
String s_grcode          = box.getStringDefault("tem_grcode", box.getSession("tem_grcode"));
//out.println(s_grcode);
String v_classname1      = "";
String v_classname2      = "";
box.put("leftmenu","02");                       // �޴� ���̵� ����

%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topSupport.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--

//�Է��������� �̵�
function insertPage() {
	document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
	document.form1.p_process.value = "insertPage";  
	document.form1.p_pageno.value = "<%= v_pageno %>";    
	document.form1.submit();
}

//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList() {
	if (form1.p_searchtext.value == ""){
		alert("�˻� �� ������ �Է��� �ּ���");
	}else{
	document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
	document.form1.p_process.value = "";
	document.form1.submit();
	}
}

//��ȭ�� �������� �̵�
function select(seq, upfilecnt, userid, types) {
	document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
	document.form1.p_process.value   = "selectView";
	document.form1.p_seq.value       = seq;
	document.form1.p_userid.value    = userid;
	document.form1.p_types.value     = types;
    document.form1.p_upfilecnt.value = upfilecnt;
	document.form1.submit();
}

//ī�װ��� �´� ����Ʈ �˻�
function changeCategory(aa) {
	document.form1.p_categorycd.value=aa;
	document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
	document.form1.p_process.value    = "";
	document.form1.submit();
}

//������ �̵�
function go(index) {
	document.form1.p_pageno.value = index;
	document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
	document.form1.p_process.value = "";
	document.form1.submit();
}

//������ �̵�
function goPage(pageNum) {
	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
	document.form1.p_process.value = "";
	document.form1.submit();
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
      <td align="center" valign="top">
        <table width="675" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/images/user/support/<%=tem_subimgpath%>/tit_qna.jpg" ></td>
          </tr>
          <tr>
            <td height="20"></td>
          </tr>

        </table>

<%=HomePageQnaBean.homepageGetQnaCategoryTable(s_grcode)%>

		  <!-- �Խ��� ���� -->
		  <form name = "form1" method = "post">
		  <input type = "hidden" name = "p_process"     value = "">
		  <input type = "hidden" name = "p_pageno"      value = "">
		  <input type = "hidden" name = "p_seq"         value = "">
		  <input type = "hidden" name = "p_userid"      value = "">
		  <input type = "hidden" name = "p_upfilecnt"   value = "">
		  <input type = "hidden" name = "p_types"       value = "<%=v_types%>">
		  <input type = "hidden" name = "p_categorycd"  value = "<%=v_categorycd%>">

          <!-- qna table -->
          <table width="675" border="0" cellspacing="0" cellpadding="0">
            <tr valign="top"> 
              <td colspan="6"> <table width="675" border="0" cellpadding="0" cellspacing="0" background="/images/user/support/sup_tb_bg.gif">
                  <tr> 
                    <td width="6"><img src="/images/user/support/sup_tb_head.gif" width="5" height="28"></td>
                    <td width="39" align="center" valign="bottom"><img src="/images/user/support/sup_tb_num.gif" width="19" height="20"></td>
                    <td width="327" align="center" valign="bottom"><img src="/images/user/support/sup_tb_title.gif" width="19" height="20"></td>
                    <td width="130" align="center" valign="bottom"><img src="/images/user/support/sup_tb_pe.gif" width="29" height="20"></td>
                    <td width="83" align="center" valign="bottom"><img src="/images/user/support/sup_tb_day.gif" width="27" height="20"></td>
                    <td width="51" align="center" valign="bottom"><img src="/images/user/support/sup_tb_addfile.gif" width="38" height="20"></td>
                    <td width="29" align="center" valign="bottom"><img src="/images/user/support/sup_tb_view.gif" width="18" height="20"></td>
                    <td width="10" align="right"><img src="/images/user/support/sup_tb_tail.gif"></td>
                  </tr>
                </table></td>
            </tr>
            <tr> 
              <td colspan="6"><img src="/images/user/support/sup_tb_tline.gif"></td>
            </tr>

<%if(list.size() != 0){%>
<% 
			for(i = 0; i < list.size(); i++) {
                   DataBox dbox = (DataBox)list.get(i);  
                   v_dispnum = dbox.getInt("d_dispnum");
                   v_inuserid   = dbox.getString("d_inuserid");
                   v_name   = dbox.getString("d_name");
				   v_cnt = dbox.getInt("d_cnt");
                   v_indate    = dbox.getString("d_indate");
                   v_title    = dbox.getString("d_title");
                   v_seq      = dbox.getInt("d_seq");
				   v_types      = dbox.getString("d_types");
                   v_readcnt  = dbox.getInt("d_readcnt");
                   v_upfilecnt   = dbox.getInt("d_filecnt");
                   v_totalpage = dbox.getInt("d_totalpage");
                   v_rowcount = dbox.getInt("d_rowcount");  
				   v_categorycd = dbox.getString("d_categorycd");

					// �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.

					if (!v_searchtext.equals("")&&v_select.equals("title")) {
						v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
					} else if(!v_searchtext.equals("")&&v_select.equals("name")){
						v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
					}

%>
                    <tr> 
                      <td height="3" colspan="6"></td>
                    </tr>
                    <tr> 
                      <td width="45" class="tbl_br"><%=v_dispnum%></td>
                      <td width="327" class="tbl_bleft">
					        <%if (Integer.parseInt(v_types) > 0) {%>
								&nbsp;&nbsp;&nbsp;&nbsp;<IMG src="/images/user/support/ico_re.gif" border="0"> 
               				<% } %>
				
							<a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_inuserid%>','<%=v_types%>')"><%=v_title%></a>

 							<%if (FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){%>
								<IMG src="/images/user/support/ico_new.gif" border="0">
							<% } %>
                      <td width="131" class="tbl_br"><%=v_name%>(<%=v_inuserid%>)</td>
                      <td width="83" class="tbl_br"><%=FormatDate.getFormatDate(v_indate, "yyyy/MM/dd")%></td>
                      <td width="51" align="center"><% if( v_upfilecnt>0){ %>
							<img src="/images/user/support/ico_file.gif" width="13" height="12">
							<%}else{%>
							<%}%>
					  </td>
                      <td width="38" class="tbl_br"><%=v_cnt%></td>
                    </tr>
                    <tr> 
                      <td colspan="6"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                      <%}%>
					<%}else{%>

					<tr>
					  <td colspan="13" align=center valign=top>
							��� �� ������ �����ϴ�.		
					  </td>
					</tr>
					<%}%>
                    <tr> 
                      <td height="3" colspan="6"></td>
                    </tr>
                    <tr bgcolor="B8D5E5"> 
                      <td height="5" colspan="6"><img src="/images/user/support/sup_tb_bo.gif" width="675" height="5"></td>
                    </tr>
                  </table>

                  <!-- �Խ��� �� -->
                  <!-- ����¡&�˻� ���� -->
				  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="10" colspan="2"></td>
                    </tr>
                    <tr> 
                      <td width="418" align="right">
					  <table width="130" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td>
							<%= HomePageQnaBean.printPageList(v_totalpage, v_pageno, row) %>
							</td>
                          </tr>
                        </table></td>
                      <td width="257" align="right">
					  
					  <a href="javascript:insertPage()" target="_self" onfocus=this.blur()>
					<%  if(BulletinManager.isAuthority(box, box.getString("p_canAppend"))) { %>
					  <img src="/images/user/button/btn_register.gif" width="45" height="21" border="0"></a><%}%></td>

                    </tr>
                  </table>
				<!--�˻�����-->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="227">&nbsp;</td>
                      <td width="56"> 
						<select name = "p_select" class = "input">
							<option value="name" <% if (v_select.equals("name")) out.print("selected"); %>>�ۼ���</option>
                			<option value="title" <% if (v_select.equals("title")) out.print("selected"); %>>����</option>
							<option value = "content" <% if (v_select.equals("content")) out.print("selected"); %>>����</option>
              			 </select>						
						</td>
                      <td width="132"><input type = "text" onFocus = "this.style.background='#FFFAE1'" onBlur = "this.style.background='#ffffff'" 
                name = "p_searchtext" value = "<%=v_searchtext %>" size = "25" maxlength = "30"></td>
                      <td width="260"><A HREF="javascript:selectList()"><IMG src="/images/user/button/btn_search.gif" border="0"></A></td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                  </table>
				<!--�˻���-->	
				  </form>
				  </td>
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