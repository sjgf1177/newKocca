<%
//**********************************************************
//  1. ��      ��: ���� ��ȸȭ��(��Ÿ�׽�Ʈ)
//  2. ���α׷���: za_BetaSubject_L.jsp
//  3. ��      ��: ���� ��ȸȭ��(��Ÿ�׽�Ʈ)
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 26
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.beta.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

        String  ss_subjcourse   = box.getStringDefault("s_subjcourse","ALL");    //����&�ڽ�
        String  v_search       = box.getString("p_search");  //�˻���
        
%>
<html>
<head>
<title>��������-��Ÿ�׽�Ʈ�ý���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
function InsertSubjPage() {
    document.form2.p_process.value = 'insertPage';
    document.form2.submit();
}

function UpdateSubjPage(subj) {
  document.form2.p_process.value = 'updatePage';
  document.form2.p_subj.value  = subj;
  document.form2.submit();
}

function Preview(subj, subjnm) {
    document.form2.p_process.value = 'previewPage';
    document.form2.p_subj.value    = subj;
    document.form2.p_subjnm.value  = subjnm;
    document.form2.submit();
}

function Subjseq(subj) {
    alert('�������� ��ȸȭ������ �̵�');
    return;
    /*
    document.form2.p_process.value = 'subjseqPage';
    document.form2.p_subj.value  = p_subj;
    document.form2.submit();
    */
}

function whenSelection() {
    document.form2.p_process.value = 'listPage';
    document.form2.submit();
}
//���ο������� 
function whenAbility(subj){
	var url='/servlet/controller.course.AbilityAdminServlet?p_process=cntlSubjPage&p_subj='+subj;
	window.open(url,'ability','toolbar=no, location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=800,height=600');
}



-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/beta/b_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <form name="form2" method="post" action="/servlet/controller.beta.BetaSubjectServlet">
          <input type="hidden" name="p_process"  value="">
          <input type="hidden" name="p_subj"     value="">
          <input type="hidden" name="p_subjnm"   value="">
		  
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7" width="99%"></td>
              </tr>
              <tr>
                <td align="center" width="99%" valign="middle">
                  <table width="99%" cellspacing="0" cellpadding="0" class="form_table">
                    <tr>
                      <td>
					  <%= SelectSubjBean.getBetaSubj(box, true, true)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
				  &nbsp;<input type="text" name="p_search" value="<%=v_search%>" size="20" maxlength="30"><a href="javascript:whenSelection()"><img src="/images/admin/button/b_go.gif" border="0"></a>
                       </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7" width="99%"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br>
      <!----------------- �߰� ��ư ���� ----------------->
      <table cellpadding="0" cellspacing="0" class="table1">
        <tr>
          <td align="right" height="20"><a href="javascript:InsertSubjPage()"><img src="/images/admin/button/btn_cyberplus.gif" border="0"></a></td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- �߰� ��ư �� ----------------->
      <!----------------- ���� ���� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr>
          <td colspan="11" class="table_top_line"></td>
        </tr>
        <tr>
          <td class="table_title" width="10%"><b>NO</b></td>
          <td class="table_title" width="20%"><b>�����ڵ�</b></td>
          <td class="table_title" width="45%"><b>������</b></td>
          <td class="table_title" width="15%"><b>�����������</b></td>
          <td class="table_title" width="10%"><b>���</b></td>
        </tr>
<%  ArrayList  list = (ArrayList)request.getAttribute("SubjectList");
    BetaSubjectData data = null;
    for (int i=0; i<list.size(); i++) {
        data  = (BetaSubjectData)list.get(i); %>
        <tr>
          <td class="table_01"><%=String.valueOf(i+1)%></td>
          <td class="table_02_1"><%=data.getSubj()%></td>
          <td class="table_02_1"><a href="javascript:UpdateSubjPage('<%=data.getSubj()%>')" class='b'><%=data.getSubjnm()%></a></td>
          <td class="table_02_1"><%=data.getName()%></td>
          <td class="table_02_1"><%=data.getIsuse()%></td> 
        </tr>
<%  } %>
      </table>
      <!----------------- ���� ���� �� ----------------->
      <br>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
</body>
</html>
