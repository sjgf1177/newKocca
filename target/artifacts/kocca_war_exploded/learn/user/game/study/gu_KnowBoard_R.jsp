<%
//**********************************************************
//  1. ��      ��: ���İ��� �ֱ�����
//  2. ���α׷��� : gu_KnowBoard_R.jsp
//  3. ��      ��: ���İ��� �ֱ����� ��ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 06.01.03
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
box.put("leftmenu","05"); 

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

int    v_filecount = v_realfileVector.size();

String p_categorycd = box.getString("p_categorycd");            // request ī�װ�

if(p_categorycd.equals("")){
    p_categorycd=v_categorycd;
}

	String v_process= box.getString("p_process");

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topMystudy.jsp"%>
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
				                  
                  <html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/css/user_style1.css" rel="stylesheet" type="text/css">
</head>

<body>
<!-- title -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="720" height="35" align="right"  background="/images/user/game/mystudy/<%=tem_subimgpath%>/tit_joint.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > ���� ���ι� > ���İ����Խ���</td>
  </tr>
  <tr> 
    <td height="20">
      <!-- page sub -->
    </td>
  </tr>
</table>

<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td ><img src="/images/user/game/mystudy/st_su_edu.gif"></td>
  </tr>
   <tr> 
    <td height="12"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="81" height="2" class="linecolor_board3"></td>
	<td width="639" height="2" class="linecolor_board4"></td>
  </tr>
</table>
<table width="720" border="2" cellspacing="0" 
    cellpadding="0"  style="border-collapse:collapse;" bordercolor="#DFE4CA" frame="hsides" rules="rows" >
 <tr> 
    <td width="77" class="tbl_grc"><img src="/images/user/game/mystudy/text_t_subject02.gif"></td>
    <td width="1" valign="bottom" ><img src="/images/user/game/mystudy/vline.gif"></td>
    <td class="font_specialroom_list" colspan="13"><%=v_title%></td>
  </tr>
  <tr> 
    <td class="tbl_grc"><img src="/images/user/game/mystudy/text_t_writer.gif"></td>
    <td width="1"valign="bottom"><img src="/images/user/game/mystudy/vline.gif"></td>
    <td width="165" bgcolor="F8F7EF" class="tbl_bleft"><%=v_name%></td>
    <td width="1" valign="bottom"><img src="/images/user/game/mystudy/vline.gif"></td>
    <td width="82" class="tbl_grc"><img src="/images/user/game/mystudy/text_day.gif"></td>
    <td width="1" valign="bottom" ><img src="/images/user/game/mystudy/vline.gif"></td>
    <td width="89" class="tbl_grc"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
    <td width="1" valign="bottom" ><img src="/images/user/game/mystudy/vline.gif"></td>
	<td width="82" class="tbl_grc"><img src="/images/user/game/mystudy/text_number.gif"></td>
    <td width="1" valign="bottom" ><img src="/images/user/game/mystudy/vline.gif"></td>
	<td width="55" class="tbl_grc"><%=v_cnt%></td>
    <td width="1" valign="bottom" ><img src="/images/user/game/mystudy/vline.gif"></td>
	<td width="82"  class="tbl_grc"><img src="/images/user/game/mystudy/text_recomm.gif"></td>
	<td width="1" valign="bottom"  ><img src="/images/user/game/mystudy/vline.gif"></td>
    <td width="41" class="tbl_grc"><%=v_recommend%></td>
  </tr>
  <tr> 
    <td width="77" class="tbl_grc"><img src="/images/user/game/mystudy/text_catagory.gif"></td>
    <td width="1" valign="bottom" ><img src="/images/user/game/mystudy/vline.gif"></td>
    <td class="tbl_bleft" colspan="13"><%=v_categorynm%></td>
  </tr>
  <tr> 
    <td colspan="15" class="tbl_contents"><%=v_contents%></td>
  </tr>
  <tr> 
    <td class="tbl_grc"><img src="/images/user/game/mystudy/text_t_addfile.gif"></td>
    <td valign="bottom" ><img src="/images/user/game/mystudy/vline.gif"></td>
    <td colspan="13" class="tbl_gleft">
		<table width="655" height="20" border="0" cellpadding="0" cellspacing="0" bgcolor="#F5F8EF">
			<tr><td class="tbl_gleft">
	<%		
		if( v_realfileVector != null ) { 
			for(int i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����

				String v_realfile = (String)v_realfileVector.elementAt(i);
				String v_savefile = (String)v_savefileVector.elementAt(i);  	

				if(v_realfile != null && !v_realfile.equals("")) {  %> 

			<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a> &nbsp;</td> 
	<%				
				}else{%>
			÷�ε� ������ �����ϴ�</td>
	<%	 
				}
		}
	}
	%>
        </tr>
      </table> </td>
  </tr>
</table>
<table width="721" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="1" colspan="8" class="linecolor_bg01"></td>
  </tr>
  <tr> 
    <td height="5" colspan="8"></td>
  </tr>
  <tr> 
    <td align="center" valign="bottom">&nbsp;</td>
    <td width="48" align="right" valign="bottom"><a href="javascript:InsertRecommend('<%=v_seq%>');"><img src="/images/user/game/button/btn_recomm.gif"></a></td>
 <%
	if(!s_userid.equals(v_inuserid)){
 %>
    <td width="2" align="right" valign="bottom">&nbsp;</td><td width="48" align="right" valign="bottom"><a href="javascript:replyPage()" target="_self" onfocus=this.blur()><img src="/images/user/game/button/btn_answer.gif" border="0"></a></td> 
<%
	}
	if(s_userid.equals(v_inuserid)){
%>	
	<td width="2" align="right" valign="bottom">&nbsp;</td><td width="48" align="right" valign="bottom"><a href="javascript:updatePage()" target="_self" onfocus=this.blur()><img src="/images/user/game/button/btn_mod.gif"></a></td> 
	<td width="2" align="right" valign="bottom">&nbsp;</td><td width="48" align="right" valign="bottom"><a href="javascript:deleteAction()" target="_self" onfocus=this.blur()><img src="/images/user/game/button/btn_del.gif"></a></td> 
 <%
	}
 %>  
    <td width="2" align="right" valign="bottom">&nbsp;</td><td width="48" align="right" valign="bottom"><a href="javascript:selectList()" target="_self" onfocus=this.blur()><img src="/images/user/game/button/btn_list.gif" border="0"></a></td>
  </tr>
  <tr> 
    <td height="5" colspan="8" ></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="2" bgcolor="#92C2BB"></td>
  </tr>
</table>
</form>

	<%@include file="/learn/user/game/study/gu_KnowAddList.jsp"%>



<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
