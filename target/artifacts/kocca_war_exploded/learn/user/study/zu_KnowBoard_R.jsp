<%
//**********************************************************
//  1. ��      ��: ���İ���
//  2. ���α׷���: zu_KnowBoard_R
//  3. ��      ��: ���İ��� ��ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 9.
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

String v_title = "", v_contents = "", v_inuserid = "", v_indate = "" , v_types = "";
Vector v_realfileVector = null;
Vector v_savefileVector = null;
int    v_seq        = box.getInt("p_seq");
int    v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
int    v_pageno     = box.getInt("p_pageno");
String v_searchtext = box.getString("p_searchtext");            //  ������ ������ִ� ���ϼ� 
String v_select     = box.getString("p_select"); 
String v_name = "";

DataBox dbox        = (DataBox)request.getAttribute("SelectView");

//int v_commentseq    = dbox.getInt("d_commentseq");
int v_commentseq    = 0;

v_inuserid          = dbox.getString("d_inuserid");
v_name              = dbox.getString("d_name");
v_types             = dbox.getString("d_types");
v_indate            = dbox.getString("d_indate");
v_title             = dbox.getString("d_title");
v_seq               = dbox.getInt("d_seq");
v_contents          = dbox.getString("d_contents");
v_realfileVector    = (Vector)dbox.getObject("d_realfile");
v_savefileVector    = (Vector)dbox.getObject("d_savefile");
String v_categorynm = dbox.getString("d_categorynm");
int v_recommend = dbox.getInt("d_recommend");
int v_cnt       = dbox.getInt("d_cnt");

String  v_categorycd= dbox.getString("d_categorycd");
String s_userid     = box.getSession("userid");

box.put("leftmenu","04");                       // �޴� ���̵� ����

int    v_filecount = v_realfileVector.size();

String p_categorycd = box.getString("p_categorycd");            // request ī�װ�

if(p_categorycd.equals("")){
    p_categorycd=v_categorycd;
}

%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topMyClass.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--

//����Ʈ�������� �̵�
function selectList() {
   	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form1.p_process.value = "ListPage";     
	document.form1.submit();	
}      

//������������ �̵�
function updatePage() {
	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form1.p_process.value = "updatePage";
	document.form1.submit();
}

//�亯 ��� �������� �̵�
function replyPage() {
	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form1.p_process.value = "replyPage";
	document.form1.submit();
}   

//������ ���
function insertcomment() {
	if(document.form2.commentqna.value==""){
		alert("�������� ����ϼ���");
		return;
	}
	document.form2.p_categorycd.value = document.form1.p_categorycd.value; // ī�װ�
	document.form2.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form2.p_process.value = "commentInsert";
	document.form2.submit();
}

//�� ȭ�� ����
function deleteAction() {
	if (confirm("������ �����Ͻðڽ��ϱ�?")) {
		
		document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
		document.form1.p_process.value = "delete";
		document.form1.submit();
	}
	else {
		return;
	}
}

//������ ����
function deleteComment(v_commentseq) {
	if (confirm("������ �����Ͻðڽ��ϱ�?")) {
		document.form2.p_categorycd.value = document.form1.p_categorycd.value; // ī�װ�
		document.form2.p_commentseq.value = v_commentseq;
		document.form2.action = "/servlet/controller.homepage.KnowBoardUserServlet";
		document.form2.p_process.value = "deleteComment";
		document.form2.submit();
	}
	else {
		return;
	}
}

// ��õ�ϱ�
function InsertRecommend(seq) {
//alert(document.form1.p_categorycd.value);
	if (confirm("��õ�Ͻðڽ��ϱ�?")) {
		document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
		document.form1.p_process.value = "insertRecommend";
		document.form1.submit();
	}
	else {
		return;
	}
}
//-->
</script>


		  <!-- center start -->
		    <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location">HOME 
                  &gt; ���� ���ǽ� &gt; ���İ��� &gt; �ֱ�����</td>
              </tr>
              <tr> 
                <td align="center" valign="top">
                <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="/images/user/myclass/type1/tit_knowledge.jpg" alt="���ǰ��ǽ�"></td>
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
                  <!-- �ֱ����� table -->

				<form name = "form1" method = "post">
				<input type = "hidden" name = "p_seq"         value = "<%= v_seq %>">
				<input type = "hidden" name = "p_searchtext"  value = "<%= v_searchtext %>">
				<input type = "hidden" name = "p_select"      value = "<%= v_select %>">
				<input type = "hidden" name = "p_pageno"      value = "<%= v_pageno %>">
				<input type = "hidden" name = "p_process"     value = "">
				<input type = "hidden" name = "p_userid"      value = "<%= v_inuserid %>">
				<input type = "hidden" name = "p_types"       value = "<%=v_types%>">
				<input type = "hidden" name = "p_categorycd"  value = "<%=p_categorycd%>">
				<input type = "hidden" name = "p_upfilecnt"   value = "<%= v_upfilecnt %>">
				                  
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
                      <td width="94"><img src="/images/user/myclass/text_file.gif"></td>
                      <td colspan="7" class="tbl_bdata">
                      
			<%		
				if( v_realfileVector != null ) { 
					for(int i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����

						String v_realfile = (String)v_realfileVector.elementAt(i);
						String v_savefile = (String)v_savefileVector.elementAt(i);  	

						if(v_realfile != null && !v_realfile.equals("")) {  %>
							&nbsp;<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'>
					
							<%= v_realfile%></a><br>
							<input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
				<%		}   %>
		<%			}
				}
		%>                      
                      </td>
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
				  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="418" align="right">&nbsp; </td>
                      <td width="257" align="right"> <a href="javascript:InsertRecommend('<%=v_seq%>');"><img src="/images/user/button/btn_recom.gif" alt="��õ�ϱ�" border="0"></a></td>
                    </tr>
                  </table>                    
                   
				  </form>
				  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="418" align="right">&nbsp; </td>
                      <td width="257" align="right">
             <%
             	if(!s_userid.equals(v_inuserid)){
             %>
					   <a href="javascript:replyPage()" target="_self" onfocus=this.blur()><img src="/images/user/button/btn_answer.gif" alt="�亯" border="0"></a>
					   <%
					   	}
					   	if(s_userid.equals(v_inuserid)){
					   %>
                        <a href="javascript:updatePage()" target="_self" onfocus=this.blur()><img src="/images/user/button/btn_mod.gif" alt="����" border="0"></a>
                        <a href="javascript:deleteAction()" target="_self" onfocus=this.blur()><img src="/images/user/button/btn_del.gif" alt="����" border="0"></a>
             <%
             	}
             %>
                        <a href="javascript:selectList()" target="_self" onfocus=this.blur()><img src="/images/user/button/btn_list.gif" alt="�������" border="0"></a></td>
                    </tr>
                  </table>


					<%@include file="/learn/user/homepage/zu_HomePageQna_C.jsp"%>


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
