<%
//**********************************************************
//  1. ��      ��:
//  2. ���α׷���:
//  3. ��      ��:
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.scorm.*" %>
<%@ page import = "com.credu.statistics.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

	String startDate  = FormatDate.getRelativeDate(-60);
	String endDate = FormatDate.getRelativeDate(30);

	RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String  v_action    = box.getString("p_action");
    String  v_edustart  =  "";
    String  v_eduend    =  "";
	String	v_fmt_biyong    =  "";
	String	v_stucnt     =  "";
	String	v_fmt_stucnt_tatal	=	"";
	String	v_fmt_subjsales_tatal	=	"";

	String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getString("s_grseq");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����

    String  ss_edustart		= box.getString("s_start");            //����������
    String  ss_eduend		= box.getString("s_end");              //����������
    String  ss_isuse		= box.getString("ss_isuse");           //��뱸��

	ArrayList list = null;
	int listsize = 0;
	int i = 0;

    if ( v_action.equals("go") ) {
	    list = (ArrayList)request.getAttribute("SubjYnList");

    	listsize = list.size();
	}

	String searchStart = FormatDate.getFormatDate(startDate,"yyyy-MM-dd");
	String searchEnd   = FormatDate.getFormatDate(endDate,"yyyy-MM-dd");

	String  v_searchStart = box.getString("p_searchStart");
	String  v_searchEnd   = box.getString("p_searchEnd");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
function whenSelection(p_action) {

  document.form1.p_action.value = p_action;
  if (p_action == 'go') {
    top.ftop.setPam();
  }

  document.form1.action='/servlet/controller.statistics.SubjYnAdminServlet';
  document.form1.target = "_self";
  document.form1.p_process.value = 'SubjYnExe';
  document.form1.submit();
}

//�޺��ڽ� �Է¿��ο� ���� �޼����� ����ش�.
function chkParam() {
  if (document.form1.s_grcode.value == '----') {
    alert("�����׷��� �����ϼ���.");
    return false;
  }
}


// excel file ����.
function whenExcel() {
        f = document.form1;
        if (chkParam() == false) {
          return;
        }
        document.form1.method = 'post';
        document.form1.target = '_self';

        document.form1.action='/servlet/controller.statistics.SubjYnAdminServlet';
        document.form1.p_process.value = 'ExcelDown';
        document.form1.p_action.value = "go";
        document.form1.submit();
}

</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/statistics/tit_sum_d4.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>

<!------------------------------------- form ���� ------------------------------------->
<form name = "form1" method = "post" action="/servlet/controller.statistics.SubjYnAdminServlet">
    <input type="hidden" name= "p_process" value="listPage">
    <input type="hidden" name= "p_masternm"  value="">
    <input type="hidden" name= "p_mastercd"  value="">
    <input type="hidden" name= "p_action"  value="<%=v_action%>">
    <input type="hidden" name= "p_order"  value="name">
    <input type="hidden" name= "p_gubun"  >
	<input type="hidden" name= "p_startdate" value = "">
	<input type="hidden" name= "p_enddate"   value = "">
    <input type="hidden" name= "p_subj"  >
	<input type="hidden" name= "p_year" value = "">
	<input type="hidden" name= "p_subjseq"   value = "">
	<input type="hidden" name= "p_grcode" value = "">
	<input type="hidden" name= "p_grseq"   value = "">

        <table class="form_table_out" cellspacing="0" cellpadding="1">
          <tr>
            <td bgcolor="#C6C6C6" align="center">
              <table class="form_table_bg" cellspacing="0" cellpadding="0" border='0'>
                <tr>
                  <td height="7"></td>
                </tr>
                <tr>
                  <td align="center">
                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                      <td width="22.5%" colspan="2" align="left" valign="middle">
                      	<!------------------- ���ǰ˻� ���� ------------------------->
						 	<%= SelectEduBean.getGrcode(box, true, true)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
					  </td>
					  <td width="76.5%" colspan="2">
						  <%= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
						  <%= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
						  <%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
						     ��뱸��
							 <select name="ss_isuse" size="1">
							    <option value="ALL" <% if(ss_isuse.equals("ALL")) { %> selected <% } %>>��ü</option>
							    <option value="Y" <% if(ss_isuse.equals("Y")) { %> selected <% } %>>���</option>
								<option value="N" <% if(ss_isuse.equals("N")) { %> selected <% } %>>�̻��</option>
							</select>
					   </td>
	                  <td width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td><!-- whenSelection('go') -->
					</tr>
                  </table>
                  </td>
                </tr>
                <tr>
                  <td height="9"></td>
                </tr>
                <tr>
                  <td align="center">
                  </td>
                </tr>
                <tr>
                  <td height="7"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>

<!------------------------------------- form �� ------------------------------------->
        <!----------------- Excel ��ư ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="6"></td>
          </tr>
          <tr>
            <td align="right" height="20"><a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a></td>
          </tr>
          <tr>
            <td height="6"></td>
          </tr>
        </table>
        <!----------------- Excel ��ư �� ----------------->

        <!----------------- ��ȸ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="11" class="table_top_line"></td>
          </tr>

	      <tr>
            <td class="table_title" width="5%">No</td>
            <td class="table_title" width="15%">�ڵ�</a></td>
            <td class="table_title" width="35%">����</td>
			<td class="table_title" width="20%">��米��</td>
            <td class="table_title" width="20%">����ȸ��</td>
            <td class="table_title" width="5%">�����</td>
          </tr>
<%
    if ( v_action.equals("go") ) {
		for (i=0; i<list.size(); i++ ) {
			DataBox dbox = (DataBox)list.get(i);
%>
          <tr class="table_02_1">
			<td class="table_02_1"><%= (i+1) %></td>
			<td class="table_02_1"><%=dbox.getString("d_subj")%></td>
			<td class="table_02_1"><%=dbox.getString("d_subjnm")%></td>
            <td class="table_02_1"><%=dbox.getString("d_musernm")%></td>
			<td class="table_02_1"><%=dbox.getString("d_compnm")%></td>
			<td class="table_02_1"><%=dbox.getString("d_isuse")%></td>
           </tr>
<%
		}
	}

	if(i == 0) {
%>
		<tr>
            <td colspan="11" class="table_02_1"> �ش� �����Ͱ� �����ϴ�. </td>
          </tr>
		  <% } %>

        </table>


        <!----------------- ��ȸ �� ----------------->


        <br>
      </td>
  </tr>
</table>
</form>
<table>
    <tr><td>
    <%@ include file = "/learn/library/getJspName.jsp" %>
    </td></tr>
</table>
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false'
ondragstart='return false' onselectstart='return false'
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>
</body>
</html>
