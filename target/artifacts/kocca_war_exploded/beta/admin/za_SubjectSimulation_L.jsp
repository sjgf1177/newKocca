<%
//**********************************************************
//  1. ��      ��: ���������н�(��Ÿ�׽�Ʈ)
//  2. ���α׷���: za_BetaSubject_L.jsp
//  3. ��      ��: ���������н�(��Ÿ�׽�Ʈ)
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
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.beta.*" %>
<%@ page import = "com.credu.cp.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

		String v_searchtext = box.getString("p_searchtext");  
        String  ss_subjcourse   = box.getStringDefault("s_subjcourse","ALL");    //����&�ڽ�
        //String  s_gadmin		= box.getSession("gadmin");
        //String  v_search        = box.getString("p_search");  //�˻���
        String  v_subj          = box.getString("p_subj");  //�����ڵ�
 		int t_year = Integer.parseInt(FormatDate.getDate("yyyy"))-1;       
%>
<html>
<head>
<title>���������н�-��Ÿ�׽�Ʈ�ý���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--

// ����Ʈ ��ȸ
function whenSelection() {
    document.form2.p_process.value = 'listPage';
    document.form2.submit();
}

// �����н� â ����
function whenViewEdu(url){
    window.open(url,'EduStart','width=800,height=600');
}

// ��������
function whenProgressDelete(subj,year,subjseq) {
    document.form2.p_subj.value = subj;
    document.form2.p_year1.value = year;
    document.form2.p_subjseq.value = subjseq;
    document.form2.p_process.value = 'progressDelete';
    document.form2.submit();
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
          <td><img src="/images/admin/beta/tit_coursemo.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <form name="form2" method="post" action="/servlet/controller.beta.SubjectSimulationServlet">
          <input type="hidden" name="p_process"  value="">
          <input type="hidden" name="p_subj"     value="">
          <input type="hidden" name="p_subjnm"   value="">
          <input type="hidden" name="p_year1"     value="">
          <input type="hidden" name="p_subjseq"  value="">
          <input type="hidden" name="p_action"   value="">
          <input type="hidden" name="p_comp"     value="">
		  
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center" width="99%" valign="middle">
                  <table cellspacing="0" cellpadding="0" class="form_table">
                    <tr>
					  <td>�����⵵</td>
					  <td>&nbsp; <%= CPCommonBean.getYear(box, true, true, t_year+"","p_year")%><!-- getCompany(RequestBox, isChange, isALL)    ����  --></td>
					  <td>&nbsp;</td><td  align="right">&nbsp;</td>
					  <td>������ü</td> 
                      <td> &nbsp;<%= CPCommonBean.getCP(box, true, true)%><!-- getCompany(RequestBox, isChange, isALL)    �������  --></td>
					  <td width=20></td>
					  <td>������</td>
					  <td width=6></td>
					  <td><input name="p_searchtext" type="text" class="input" style="width:180" value="<%=v_searchtext %>"></td>
					  <td width=6></td>
                      <td><a href="javascript:whenSelection();"><img src="/images/admin/button/b_go.gif"  border="0"></a></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br>
      <!----------------- �߰� ��ư ���� ----------------->
      <table cellpadding="0" cellspacing="0" class="table1">
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
          <td class="table_title" width="5%"><b>NO</b></td>
          <td class="table_title" width="10%"><b>�����ڵ�</b></td>
          <td class="table_title"><b>������</b></td>
          <td class="table_title" width="10%"><b>������ȸ��</b></td>
          <td class="table_title" width="10%"><b>�����</b></td>
          <td class="table_title" width="10%"><b>��Ű��</b></td>
          <td class="table_title" width="10%"><b>���</b></td>
        </tr>
<%  ArrayList  list = (ArrayList)request.getAttribute("SubjectList");
    BetaSubjectData data = null;
    for (int i=0; i<list.size(); i++) {
        DataBox dbox = (DataBox)list.get(i);  

//        data  = (BetaSubjectData)list.get(i); 
%>
        <tr>
          <td class="table_01"><%=list.size()-i%></td>
          <td class="table_02_1"><%=dbox.getString("d_subj")%></td>
          <td class="table_02_2">
            <!--a href="javascript:UpdateSubjPage('<%=dbox.getString("d_subj")%>')" class='b'><%=dbox.getString("d_subjnm")%></a-->
            <a href="javascript:whenViewEdu('<%=EduEtc1Bean.make_eduURL_beta(dbox.getString("d_subj"),dbox.getString("d_year"),dbox.getString("d_subjseq"))%>')"><%=dbox.getString("d_subjnm")%></a>
          </td>
          <td class="table_02_1"><%=dbox.getString("d_cpnm")%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(dbox.getString("d_indate"),"yyyy/MM/dd")%></td>
          <td class="table_02_1"><%=TextComBean.getApprovalTxt(dbox.getString("d_cpapproval"), "cpsubj")%></td>
          <td class="table_03_1"><a href="javascript:whenProgressDelete('<%=dbox.getString("d_subj")%>','<%=dbox.getString("d_year")%>','<%=dbox.getString("d_subjseq")%>')"><img src="/images/admin/button/b_jindodel.gif" border="0"></a></td>
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
