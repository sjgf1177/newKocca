<%
//**********************************************************
//  1. ��      ��: ���ְ��� �������� ���� ��ȭ��
//  2. ���α׷���: zu_CpNotice_R.jsp
//  3. ��      ��: ���ְ��� �������� ���� ��ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̿��� 2005. 08. 09
//  7. ��      ��: �̿��� 2004. 12. 18
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

String v_title = "", v_content = "", v_name = "", v_userid = "", v_indate = "", v_types = "", v_compcd = "";
String v_compnm = "", v_comp = "", v_loginyn="";

int    v_seq            = box.getInt("p_seq");
String v_searchtext     = box.getString("p_searchtext");            //  ������ ������ִ� ���ϼ� 
String v_select         = box.getString("p_select"); 
int    v_pageno         = box.getInt("p_pageno");
int    v_upfilecnt      = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
Vector v_realfileVector = null;
Vector v_savefileVector = null;
String v_realmotion     = "";
String v_savemotion     = "";

DataBox dbox = (DataBox)request.getAttribute("selectPds");

v_userid         = dbox.getString("d_aduserid");
v_name           = dbox.getString("d_adname");
v_indate         = dbox.getString("d_addate");
v_title          = dbox.getString("d_adtitle");
v_seq            = dbox.getInt("d_seq");
v_content        = dbox.getString("d_adcontent");
v_realfileVector = (Vector)dbox.getObject("d_realfile");
v_savefileVector = (Vector)dbox.getObject("d_savefile");
v_realmotion     = dbox.getString("d_realmotion");
v_savemotion     = dbox.getString("d_savemotion");
v_types          = dbox.getString("d_types");
v_compcd         = dbox.getString("d_compcd");
v_loginyn       = dbox.getString("d_loginyn");

if(v_loginyn.equals("Y")) v_loginyn = "�α�����"; 
else if(v_loginyn.equals("N")) v_loginyn = "�α�����";

String s_gubun = "";

s_gubun = box.getString("p_gubun");

//���ȸ��
	int tmplen= 0;
	String compcd="'1'";
	if(!v_compcd.equals("")) {
		compcd=v_compcd.substring(0, v_compcd.length()-1);
		compcd=StringManager.replace(compcd, ",", "','");
		compcd="'"+compcd+"'";
	}
	
	///out.println("v_compcd===>>>>"+compcd);
	
	CpNoticeAdminBean bean = new CpNoticeAdminBean();
	ArrayList compList = bean.selectCompany(box, compcd);

%>
<html>
<head>
<title>GateSystem��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language = "javascript">
<!--
//����Ʈ ȭ������ �̵�
function selectList() {
	document.form1.action = "/servlet/controller.cp.CpNoticeAdminServlet";
	document.form1.p_process.value = "selectList";     
	document.form1.submit();	
}
//���� ȭ������ �̵�
function updatePage() {
	document.form1.action = "/servlet/controller.cp.CpNoticeAdminServlet";
	document.form1.p_process.value = "updatePage";
	document.form1.submit();
}
//�����ϱ�
function deleteAction() {
    if (confirm("������ �����Ͻðڽ��ϱ�?")) {
        document.form1.action = "/servlet/controller.cp.CpNoticeAdminServlet";
		document.form1.p_process.value = "delete";
        document.form1.submit();
    }
    else {
        return;
    }
}
//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
<input type = "hidden" name = "p_seq"         value = "<%= v_seq %>">
<input type = "hidden" name = "p_searchtext"  value = "<%= v_searchtext %>">
<input type = "hidden" name = "p_select"      value = "<%= v_select %>">
<input type = "hidden" name = "p_pageno"      value = "<%= v_pageno %>">
<input type = "hidden" name = "p_process"     value = "">
<input type = "hidden" name = "p_userid"      value = "<%= v_userid %>">
<input type = "hidden" name = "p_gubun"       value = "<%=s_gubun%>">
<input type = "hidden" name = "p_upfilecnt"   value = "<%= v_upfilecnt %>">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/cp/cp_title06.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	        <!----------------- title �� ----------------->
      <br>
			<!----------------- ���뺸�� ���� ----------------->
	 <table width="97%" border="0" cellspacing="0" cellpadding="0">

	  <tr>
		<td width="1%"><img src="/images/admin/common/icon.gif" ></td>
		<td  class=sub_title>���ְ��� �������� ��ȭ�麸��</td>
		<td align = "right">
			<a href="javascript:updatePage()"><img src="/images/admin/button/btn_modify.gif" border="0"></a>
			<a href="javascript:deleteAction()"><img src="/images/admin/button/btn_del.gif" border="0"></a>
           <a href="javascript:selectList()"><img src="/images/admin/button/btn_list.gif" border="0"></a>
		</td>
	  </tr>
	  <tr>
		<td height="3"></td>
	  </tr>
	</table>
	<table cellspacing="1" cellpadding="5" class="table_out">
       <tr> 
           <td width="13%" height="25" class="table_title">����</td>
           <td class="table_02_2"><%= v_title %></td>
           <td width="13%" height="25" class="table_title" >��¥</td>
           <td class="table_02_2"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
       </tr>
       <tr class="table_02_2"> 
            <td height="25" class="table_title" >�α�������</td>
            <td height="25" class="table_02_2" colspan=3><%=v_loginyn%></td>
       </tr>
       <tr> 
           <td width="13%" height="25" class="table_title">ȸ���</td>
           <td class="table_02_2" colspan = "3">            
		   <% //for(int i=0;i<compList.size();i++){
	         // CpNoticeAdminBean compnm   = (CpNoticeAdminBean)compList.get(i);
	         // out.print(compnm.getCompnm());
	          %>&nbsp;	          
            <%//}%>

			<%  for(int i = 0; i < compList.size(); i++) {
					   DataBox dbox1 = (DataBox)compList.get(i);  
					   v_compnm = dbox1.getString("d_cpnm");
					   v_comp = dbox1.getString("d_cpseq");
					   out.print(v_compnm);%>&nbsp;
			<%	}
			%>
		   </td>
       </tr>
       <tr> 
           <td class="table_title" class="table_title">÷������ </td>
           <td class="table_02_2" colspan="3">
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

       <tr> 
           <td class="table_title" class="table_title">���� </td>
           <td class="table_02_2" colspan="3"><%=v_content%></td>

       </tr>
     </table>

        <br>
    </td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
