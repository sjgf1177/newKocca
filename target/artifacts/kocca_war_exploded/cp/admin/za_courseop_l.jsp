<%
//**********************************************************
//  1. ��      ��: ����� ��ϰ���
//  2. ���α׷���: za_cpcourseop_l.jsp
//  3. ��      ��: �������� ���� ��ϰ��� ����Ʈȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2004.12.21
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=MS949" %>
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
String v_subj = "", v_subjnm = "", v_cpnm = "", v_cpsubjseq = "", v_year = "";
String v_subjseq = "", v_subjseqgr = "", v_propstart = "", v_propend = "", v_edustart = "", v_eduend = "";
  
String v_searchtext = box.getString("p_searchtext");
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
<script language="javascript">
<!--//
function whenSelection(ss_action){
    document.form1.p_action.value = ss_action;
    
	if (ss_action=="go") {
		if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
		    alert("�����׷��� �����ϼ���.");
		    return ;
		}
		top.ftop.setPam();
	}
    
	document.form1.action = "/servlet/controller.cp.CPCourseServlet";
	document.form1.p_process.value = "listPage3";
	document.form1.p_pageno.value = "1";
	document.form1.submit();
}

function go(index) {
     document.form1.p_pageno.value = index;
     document.form1.p_action.value = "go";     
     document.form1.action = "/servlet/controller.cp.CPCourseServlet";
     document.form1.p_process.value = "listPage3";     
     document.form1.submit();
}  

function goPage(pageNum) {
	document.form1.p_pageno.value = pageNum;
	document.form1.p_action.value = "go";
	document.form1.action = "/servlet/controller.cp.CPCourseServlet";
	document.form1.p_process.value = "listPage3";     
	document.form1.submit();
}  

function selectList() {
	document.form1.action = "/servlet/controller.cp.CPCourseServlet";
	document.form1.p_process.value = "listPage3";   
	document.form1.p_pageno.value = "1";
	document.form1.submit();
}  

function insert(year,subj,subjseq,subjseqgr) {
	document.form1.action = "/servlet/controller.cp.CPCourseServlet";
	document.form1.p_year.value = year;
	document.form1.p_subj.value = subj;
	document.form1.p_subjseq.value = subjseq;
	document.form1.p_subjseqgr.value = subjseqgr;
	document.form1.p_process.value = "insertPage3";
	document.form1.submit();
}  
//-->
</script>
</head>

<body topmargin=0 leftmargin=0>
<form name="form1" action="" method="post">
<input type="hidden" name="p_process" value="">
<input type="hidden" name="p_action" value="">
<input type="hidden" name="p_year" value="">
<input type="hidden" name="p_subj" value="">
<input type="hidden" name="p_subjseq" value="">
<input type="hidden" name="p_subjseqgr" value="">
<input type="hidden" name="p_pageno" value="<%=v_pageno%>">
<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
	
	<table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/cp/cp_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	   
      <br>
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>���������</td>
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
	  				  <td><%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  --></td>
					  <td>&nbsp; <%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
						&nbsp; <%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->

					  <td>&nbsp;</td>
					  <td>������ü</td> 
                      <td> &nbsp;<%= CPCommonBean.getCP(box, true, true)%><!-- getCompany(RequestBox, isChange, isALL)    �������  --></td>
					  <td width=20></td>
					  <td>������</td>
					  <td width=6></td>
					  <td><input name="p_searchtext" type="text" class="input" style="width:180" value="<%=v_searchtext %>"></td>
					  <td width=6></td>
					  <td><a href="javascript:whenSelection('go');"><img src="/images/admin/button/b_go.gif"  border="0"></a></td>
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
          <td colspan="6" class="table_top_line"></td>
        </tr>

        <tr> 
          <td class="table_title" width="6%">��ȣ</td>
          <td class="table_title"  width="27%">������</td>
          <td class="table_title"  width="15%">����/��ü����</td>
          <td class="table_title"  width="16%">��ü��</td>
          <td class="table_title"  width="18%">��û�Ⱓ</td>
          <td class="table_title"  width="18%">�н��Ⱓ</td>
        </tr>
		<tr> 
          <td class="table_02_1">1</td>
          <td class="table_02_1"><a href="javascript:insert()">�׽�Ʈ ���ְ���</a></td>
          <td class="table_02_1">1 / 1</td>
          <td class="table_02_1">���̿���</td>
          <td class="table_02_1">2005/05/20 ~ 2005/05/25</td>
          <td class="table_02_1">2005/06/01 ~ 2005/08/31</td>
        </tr>

<%        
if (box.getString("p_action").equals("go")) {
	ArrayList list = (ArrayList)request.getAttribute("selectCourseSeqList");                                                                                                                                        
	
	for(i = 0; i < list.size(); i++) {
        DataBox dbox = (DataBox)list.get(i); 
        
		//sql = "select a.subj, a.subjnm, b.year, b.subjseq, b.propstart, b.propend, b.edustart, b.eduend, c.cpnm, b.cpsubjseq ";

        v_dispnum = dbox.getInt("d_dispnum");
        v_subj   = dbox.getString("d_subj");
        v_subjnm   = dbox.getString("d_subjnm");
		v_subjseq    = dbox.getString("d_subjseq");
        v_subjseqgr    = dbox.getString("d_subjseqgr");
        v_cpsubjseq    = dbox.getString("d_cpsubjseq");
        v_propstart    = dbox.getString("d_propstart");
        v_propend    = dbox.getString("d_propend");
        v_edustart    = dbox.getString("d_edustart");
        v_eduend    = dbox.getString("d_eduend");
        v_cpnm = dbox.getString("d_cpnm");
        v_totalpage = dbox.getInt("d_totalpage");
        v_rowcount = dbox.getInt("d_rowcount");
        v_year = dbox.getString("d_year");

        if (!v_searchtext.equals("")) {
            v_subjnm = StringManager.replace(v_subjnm, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            // ����˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
        }
        
        if(v_cpsubjseq.equals("")){
        	v_cpsubjseq = "<a href=\"javascript:eduinfo('" + v_year + "','" + v_subj + "','" + v_subjseq + "','" + v_subjseqgr + "')\"><span class=text_color04>�̵��</span></a>";
        }
        
        v_subjnm = "<a href=\"javascript:eduinfo('" + v_year + "','" + v_subj + "','" + v_subjseq + "','" + v_subjseqgr + "')\">" + v_subjnm + "</a>";
%>
<!--
		<tr> 
          <td class="table_02_1"><%=v_dispnum%></td>
          <td class="table_02_1"><%=v_subjnm%></td>
          <td class="table_02_1"><%=StringManager.toInt(v_subjseqgr)%> / <%=v_cpsubjseq%></td>
          <td class="table_02_1"><%=v_cpnm%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd")%> - <%=FormatDate.getFormatDate(v_propend,"yyyy/MM/dd")%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")%> - <%=FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")%></td>
        </tr>
 -->

<%
	}
	if(list.size() <= 0){
%>
        <tr> 
          <td class="table_02_1" colspan="6" height="28" bgcolor="#ffffff">��ȸ�� �����Ͱ� �����ϴ�.</td>
        </tr>
<%
	}
}
%>
      </table>
      
    </td>
  </tr>
</table>
<br>����� ��Ȳ�� ����Ͻ÷��� �������� �����Ͻʽÿ�.
<table width="1000" border="0" cellpadding="5" cellspacing="1">
  <tr>
    <td><%= PageUtil.printPageList(v_totalpage, v_pageno, v_rowcount) %></td>
  </tr>
    <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>      
</table>
<br>
</form>
</body>
</html>
