<%
/**
 * file name : za_ExamQuestion_L.jsp
 * date      : 2003/08/29
 * programmer:
 * function  : �� ���װ��� - ����Ʈ������
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.cp.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_process		= box.getString("p_process");
    String  v_action		= box.getString("p_action");
    String  v_grcode		= box.getStringDefault("s_grcode","ALL");        //�����׷�
    String  v_subj			= box.getString("p_subj");        //�����׷�

	String  ss_gadmin = box.getSession("gadmin"); 
	int t_year = Integer.parseInt(FormatDate.getDate("yyyy"))-1;

%>
<html>
<head>
<title>�򰡹�������-����Ʈ</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript">
<!--

// ���� ��ȸ
function whenSelection(p_action) {

    v_subj = document.form1.p_subj.value;

    if (p_action=="go") {
		if (document.form1.p_cp.value == "----"){
			alert("������ü�� �����ϼ���!");
			return;
		}

        if (v_subj=="ALL"||v_subj=="----"){
            alert("������ �����ϼ���");
            return;
        }
     top.ftop.setPam();
    }
     document.form1.p_process.value = 'ExamQuestionListPage';
     document.form1.p_action.value  = p_action;
	 document.form1.submit();		
}

// �߰�
function insert() {

    if (document.form1.p_subj.value=="ALL"||document.form1.p_subj.value=="----"){
            alert("������ �����ϼ���");
            return;
    }
        window.self.name = "winSelectView";
        farwindow = window.open("", "openWinQuestion", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no, width = 667, height = 900, top=0, left=0");
        document.form1.target = "openWinQuestion";
		document.form1.action = "/servlet/controller.cp.BPExamQuestionServlet";
        document.form1.p_process.value = 'ExamQuestionInsertPage';
		document.form1.p_subj.value = document.form1.p_subj.value;
		document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
}

// ���� ���� ����
function detailSelect(p_subj, p_examnum, p_examtype, p_action) {
       window.self.name = "winSelectView";
        farwindow = window.open("", "openWinQuestion", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no, width = 667, height = 767, top=0, left=0");
        document.form1.target = "openWinQuestion";
		document.form1.action = "/servlet/controller.cp.BPExamQuestionServlet";
		document.form1.p_process.value = "ExamQuestionUpdatePage";
		document.form1.p_examnum.value = p_examnum;
		document.form1.p_examtype.value = p_examtype;
		document.form1.p_action.value = p_action;
		document.form1.p_subj.value = p_subj;
		document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;

}

// ��â���� ó���� ȭ�� RELOAD��
function ReloadPage(p_action) {
  document.form1.p_process.value = 'ExamQuestionListPage';
  document.form1.p_action.value  = p_action;
  document.form1.submit();
}


// ���Ϸ� �߰�
function insertFileToDB() {
    if (document.form1.p_subj.value=="----"){
            alert("������ �����ϼ���");
            return;
    }
    window.self.name = "winInsertPage";     //      opener ��ü�� name �� �����Ѵ�
    farwindow = window.open("", "openWinInsert", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 800, height = 600, top=0, left=0");
    document.form1.target = "openWinInsert"
    document.form1.p_process.value = "ExamQuestionFileToDB";
    document.form1.p_action.value = "go";
	document.form1.p_subj.value = document.form1.p_subj.value;
    document.form1.action = "/servlet/controller.cp.BPExamQuestionServlet";
	document.form1.submit();

    farwindow.window.focus();
    document.form1.target = window.self.name;
}

// �� �߰� 
function insertPool() {

    if (document.form1.p_subj.value=="----"){
            alert("������ �����ϼ���");
            return;
    }
    window.self.name = "winInsertPage";     //      opener ��ü�� name �� �����Ѵ�
    farwindow = window.open("", "openWinInsert", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 1017, height = 700, top=0, left=0");
    document.form1.target = "openWinInsert"
    document.form1.p_process.value = "ExamQuestionPoolPage";
    document.form1.p_action.value = "go";
	document.form1.p_subj.value = document.form1.p_subj.value;
    document.form1.action = "/servlet/controller.cp.BPExamQuestionServlet";
	document.form1.submit();

    farwindow.window.focus();
    document.form1.target = window.self.name;
}

-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/exam/e_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- form ���� ----------------->
	  <table width="970" cellpadding="1" cellspacing="0" class="form_table_out">
		<form name="form1" method="post" action="/servlet/controller.cp.BPExamQuestionServlet">
		  <input type="hidden" name="p_process" value="">
		  <input type="hidden" name="p_action"  value="<%=v_action%>">
		  <input type="hidden" name="p_examnum"  value="">
		  <input type="hidden" name="p_examtype"  value="">
		<tr> 
		  <td align="center"><table width="970" cellpadding="0" cellspacing="0" class="form_table_bg">
			  <tr> 
				<td height="7"></td>
			  </tr>
			 
			  <tr> 
				<td align="center"> <table  border="0" cellspacing="0" cellpadding="0">
					<tr>
					  <td>�����⵵</td>
					  <td>&nbsp;<%= CPCommonBean.getYear(box, true, true, t_year+"","p_year")%></td>
					  <td width=20></td>
					  <td>������ü</td> 
					  <td>&nbsp;<%= CPCommonBean.getCP(box, true, true)%></td>
					  <td width=20></td>
					  <td>������</td>
					  <td>&nbsp;<%= CPCommonBean.getSelectCourse(box, true, false,"p_subj",v_subj)%></td>
					  <td width=20></td>
					  <td><a href="javascript:whenSelection('go');"><img src="/images/admin/button/b_go.gif"  border="0"></a></td>
					</tr>
				  </table></td>
			  </tr>
			  <tr> 
				<td height="7"></td>
			  </tr>
			</table></td>
		</tr>
	  </form>
	  </table>
      <!----------------- form �� ----------------->
      <br>
      <br>
      <!----------------- ������, �߰���ư ���� ----------------->
      <table cellpadding="0" cellspacing="0" class="heed_table">
        <tr align="right">
		<td width="1%"><img src="/images/admin/common/icon.gif" ></td>
		  <td align="left" class=sub_title>������
            : [<%=GetCodenm.get_subjnm(v_subj)%>]</td>
          <td align="right">
		  <a href="javascript:insert()" class="a"><img src="/images/admin/button/btn_add.gif" border="0"></a>
		  <!--a href="javascript:insertPool()"><img src="/images/admin/button/btn_poolplus.gif" border="0"></a-->
		  <a href="javascript:insertFileToDB()"><img src="/images/admin/button/btn_fileplus.gif" border="0"></a></td>
        </tr>
        <tr>
          <td height="3"></td>
		   <td height="3"></td>
		    <td height="3"></td>
			 <td height="3"></td>
			  <td height="3"></td>
        </tr>
      </table>
      <!-----------------  ������, �߰���ư �� ----------------->
      <!----------------- �� ���װ���-��� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr>
          <td colspan="6" class="table_top_line"></td>
        </tr>
        <tr>
          <td width="30" class="table_title">NO</td>
          <td class="table_title">����</td>
          <td width="30" class="table_title">����</td>
		  <td width="50" class="table_title">���̵�</td>
    	  <td width="60" class="table_title">�����з�</td>


        </tr>
<%  ArrayList  list = (ArrayList)request.getAttribute("ExamQuestionList");
    DataBox dbox = null;
    for (int i=0; i<list.size(); i++) {
        dbox  = (DataBox)list.get(i); %>
        <tr>
          <td class="table_01"><%=String.valueOf(dbox.getInt("d_examnum"))%></td>
          <td class="table_02_2"><a href="javascript:detailSelect('<%=v_subj%>','<%=String.valueOf(dbox.getInt("d_examnum"))%>','<%=dbox.getString("d_examtype")%>','go')" class="a"><%=StringManager.replace(dbox.getString("d_examtext"),"\n","<br>")%></a></td>
          <td class="table_02_1"><%=dbox.getString("d_lesson")%></td>
		  <td class="table_02_1"><%=dbox.getString("d_levelsnm")%></td>
		  <td class="table_02_1"><%=dbox.getString("d_examtypenm")%></td>
       </tr>
<%  } %>
      </table>
      <!----------------- �� ���װ���-��� �� ----------------->
      <br>
    </td>
  </tr>


</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
