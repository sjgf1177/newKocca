<%
//**********************************************************
//  1. ��      ��: �������� ��ϰ���
//  2. ���α׷���: za_cpcourse_l.jsp
//  3. ��      ��: �������� ��ϰ��� ����Ʈȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â��
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%//@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

int i = 0, v_dispnum = 0, v_totalpage = 0, v_rowcount = 0;
String v_subj = "", v_subjnm = "", v_isonoff = "", v_preurl = "", v_onoff = "", v_cpnm = "", v_cpsubj = "", v_cpapproval = "";

ArrayList list = (ArrayList)request.getAttribute("selectCourseList");
   
String v_searchtext = box.getString("p_searchtext");  

String ss_gadmin = box.getSession("gadmin"); 
String v_cp = box.getString("p_cp"); 
//out.println("v_cp====>>>>>>"+v_cp);
//String v_select = box.getString("p_select");
int v_pageno = box.getInt("p_pageno"); 

//String s_userid = box.getSession("userid");
//String s_usernm = box.getSession("username");


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="javascript">
<!--
function whenSelection(arg){
	document.form1.action = "/servlet/controller.cp.CPCourseServlet";
	document.form1.p_process.value = "";
	document.form1.p_pageno.value = "1";
	
	document.form1.submit();
}

function go(index) {
     document.form1.p_pageno.value = index;
     document.form1.action = "/servlet/controller.cp.CPCourseServlet";
     document.form1.p_process.value = "";     
     document.form1.submit();
}  

function goPage(pageNum) {
	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.cp.CPCourseServlet";
	document.form1.p_process.value = "";     
	document.form1.submit();
}  

function selectList() {
	document.form1.action = "/servlet/controller.cp.CPCourseServlet";
	document.form1.p_process.value = "";   
	document.form1.p_pageno.value = "1";     
	top.ftop.setPam();
	document.form1.submit();
}     

function subjInfo(subj){
	document.form1.action = "/servlet/controller.cp.CPCourseServlet";
	document.form1.p_process.value = "updatePage";   
	document.form1.p_subj.value = subj;     
	document.form1.submit();
}

function subjinsert(){
	document.form1.action = "/servlet/controller.cp.CPCourseServlet";
	document.form1.p_process.value = "insertPage";
	document.form1.submit();
}

function updateapproval(subj,cpapproval){
  document.form1.action="/servlet/controller.cp.CPCourseServlet";
  document.form1.p_subj.value = subj;
  document.form1.p_cpapproval.value = cpapproval;
  document.form1.p_process.value = 'CpApproval1';
  document.form1.submit();
}
-->
</script>
</head>

<body topmargin=0 leftmargin=0>
<form name="form1" action="" method="post">
<input type="hidden" name="p_process" value="">
<input type="hidden" name="p_pageno" value="<%=v_pageno%>">
<input type="hidden" name="p_subj" value="">
<input type="hidden" name="p_cpapproval" value="">

<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
	
	<table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
            <td><img src="../../images/admin/cp/cp_tit_course.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	   
      <br>
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>�������� ��� ����</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table>  
	  <table width="970" cellpadding="1" cellspacing="0" class="form_table_out">
        <tr> 
          <td align="center"><table width="970" cellpadding="0" cellspacing="0" class="form_table_bg">
              <tr> 
                <td height="7"></td>
              </tr>
             
              <tr> 
                <td align="center"> <table  border="0" cellspacing="0" cellpadding="0">
                    <tr>
						<td>�����⵵</td>
					  <td>&nbsp; <%= CPCommonBean.getYear(box, true, true, "2004","p_year")%><!-- getCompany(RequestBox, isChange, isALL)    ����  --></td>
					  <td>&nbsp;</td><td  align="right">&nbsp;</td>
					  <td>������ü</td> 
                      <td> &nbsp;<%= CPCommonBean.getCP(box, true, true)%><!-- getCompany(RequestBox, isChange, isALL)    �������  --></td>
					  <td width=20></td>
					  <td>������</td>
					  <td width=6></td>
					  <td><input name="p_searchtext" type="text" class="input" style="width:180" value="<%=v_searchtext %>"></td>
					  <td width=6></td>
                      <td><a href="javascript:selectList();"><img src="/images/admin/button/b_go.gif"  border="0"></a></td>
					  <!--td width=6></td>
					  <td><a href="javascript:subjinsert();"><img src="/images/admin/button/btn_apply.gif"  border="0"></a></td-->
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="7"></td>
              </tr>
            </table></td>
        </tr>
      </table>
	  <br>
      <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
        <tr> 
          <td colspan="9" class="table_top_line"></td>
        </tr>
        <tr> 
        <%if(!ss_gadmin.equals("S1") && !ss_gadmin.equals("T1") && !ss_gadmin.equals("M1")){%>
          <td class="table_title" width="6%">��ȣ</td>
          <td class="table_title"  width="12%">��ü�����ڵ�</td>
          <td class="table_title"  width="25%">������</td>
          <td class="table_title"  width="15%">��ü��</td>
          <td class="table_title"  width="7%">��������</td>
          <td class="table_title"  width="8%">���ο���</td>
          <td class="table_title"  width="11%">�̸����� </td> 
          <td class="table_title"  width="8%">����</td>
          <td class="table_title"  width="8%">�ݷ�</td>
        <%}else{%>
          <td class="table_title" width="8%">��ȣ</td>
          <td class="table_title" width="16%">��ü�����ڵ�</td>
          <td class="table_title" width="27%">������</td>
          <td class="table_title" width="18%">��ü��</td>
          <td class="table_title" width="10%">��������</td>
          <td class="table_title" width="10%">�������</td>
          <td class="table_title" width="11%">�̸����� </td> 
        <%}%>
        </tr>
<%
if (list != null && list.size() > 0){
	for(i = 0; i < list.size(); i++) {
        DataBox dbox = (DataBox)list.get(i);  

		//sql = "select subj, subjnm, isonoff, eduurl, preurl, conturl, cpsubj, cpnm from tz_subj ";
        
        v_dispnum = dbox.getInt("d_dispnum");
        v_subj   = dbox.getString("d_subj");
        v_subjnm   = dbox.getString("d_subjnm");
        v_isonoff    = dbox.getString("d_isonoff");
        v_preurl    = dbox.getString("d_preurl");
        v_cpsubj = dbox.getString("d_cpsubj");
        v_cpnm = dbox.getString("d_cpnm");
        v_totalpage = dbox.getInt("d_totalpage");
        v_rowcount = dbox.getInt("d_rowcount");
        v_rowcount = dbox.getInt("d_rowcount");
        v_cpapproval = dbox.getString("d_cpapproval");
        
        //if(v_isonoff.equals("ON")){
        //	v_isonoff = "�¶���";
        //}
        //else if(v_isonoff.equals("OFF")){
        //	v_isonoff = "��������";
        //}
        //else
        //	v_isonoff = "-";
        
        if(!v_preurl.equals("")){
        	v_preurl = "<a href=# onclick=\"javascript:window.open('" + v_preurl + "','','')\"><img src=\"/images/admin/button/b_preview.gif\"  border=0></a>";
        }
        else
        	v_preurl = "-";
        	
        if (!v_searchtext.equals("")) {
            v_subjnm = StringManager.replace(v_subjnm, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            // ����˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
        }
%>
        <tr> 
          <td class="table_02_1" ><%=v_dispnum%></td>
          <td class="table_02_1" ><%=v_cpsubj%></td>
          <td class="table_02_2" ><a href="javascript:subjInfo('<%=v_subj%>')"><%=v_subjnm%></a></td>
          <td class="table_02_1" ><%=v_cpnm%></td>
          <td class="table_02_1" ><%=TextComBean.getIsOnOffTxt(v_isonoff)%></td>
          <td class="table_02_1" ><%=TextComBean.getApprovalTxt(v_cpapproval, "cpsubj")%></td>
          <td class="table_02_1" ><%=v_preurl%></td>
          <%if(!ss_gadmin.equals("S1") && !ss_gadmin.equals("T1") && !ss_gadmin.equals("M1")){%>
          <td class="table_02_1" ><%if(v_cpapproval.equals("B")){%><a href="javascript:updateapproval('<%=v_subj%>','Y')"><img src="/images/admin/button/btn_approve.gif"  border="0"></a><%}else{%>-<%}%></td>
          <td class="table_02_1" ><%if(v_cpapproval.equals("B")){%><a href="javascript:updateapproval('<%=v_subj%>','N')"><img src="/images/admin/button/btn_reject.gif"  border="0"></a><%}else{%>-<%}%></td>
          <%}%>
        </tr>
<%
	}
}else if(list != null){
%>
        <tr> 
          <td class="table_02_1" colspan="11" height="28" bgcolor="#ffffff">��ȸ�� �����Ͱ� �����ϴ�.</td>
        </tr>
<%
}
%>
      </table>
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class=dir_txt ><%= PageUtil.printPageList(v_totalpage, v_pageno, v_rowcount) %></td>
        </tr>
      </table> </td>
  </tr>
  <tr height="100">
    <td>
      <%@ include file = "/learn/library/getJspName.jsp" %> 
    </td>
  </tr>
</table>
</form>
</body>
</html>

