<%
//**********************************************************
//  1. ��      ��: �������� ���� ��ϰ���
//  2. ���α׷���: za_cpcourseSeq_l.jsp
//  3. ��      ��: �������� ���� ��ϰ��� ����Ʈȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005.7.18
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />


<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

if (box == null) {
        box = RequestManager.getBox(request);
}

int i = 0, v_dispnum = 0, v_totalpage = 0, v_rowcount = 0;
String v_serno          = "";
String v_groupid        = "";
String v_comid          = "";
String v_userid         = "";
String v_name           = "";
String v_resno          = "";
String v_category       = "";
String v_customerid     = "";
String v_customername   = "";
String v_serialno       = "";
String v_groupcount     = "";
String v_contentid      = "";
String v_subjnm         = "";
String v_edustart       = "";
String v_eduend         = "";
String v_processpoint   = "";
String v_reportpoint    = "";
String v_discusspoint   = "";
String v_ideapoint      = "";
String v_qnapoint       = "";
String v_attendpoint    = "";
String v_testpoint      = "";
String v_finaltestpoint = "";
String v_score          = "";
String v_enterdate      = "";
String v_isgraduated    = "";
String v_ipcode         = "";
String v_gubun          = "";

String p_gubun = box.getString("p_gubun");
String p_subjnm = box.getString("p_subjnm");
String p_userid = box.getString("p_userid");
String p_edustart = box.getString("p_edustart");
String p_eduend   = box.getString("p_eduend");
String p_edustart1 = box.getString("p_edustart1");
String p_eduend1   = box.getString("p_eduend1");
String p_isgraduated = box.getString("p_eduend1");
String s_aes_code = box.getString("s_aes_code");

String v_searchtext = box.getString("p_searchtext");
int v_pageno = box.getInt("p_pageno");
String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="javascript">
<!--//
function whenSelection(ss_action){
    document.form1.p_action.value = ss_action;

	//if (ss_action=="go") {
	//	if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
	//	    alert("�����׷��� �����ϼ���.");
	//	    return ;
	//	}
	//	top.ftop.setPam();
	//}
	//dateChk();
	//alert(document.form1.p_edustart.value);
	//alert(document.form1.p_eduend.value);

	document.form1.p_edustart.value = document.form1.p_edustart.value + "00";
	document.form1.p_eduend.value = document.form1.p_eduend.value + "00";
	
	document.form1.p_edustart1.value = document.form1.p_edustart.value + "00";
	document.form1.p_eduend1.value = document.form1.p_eduend.value + "00";

	if (document.form1.p_edustart.value > document.form1.p_eduend.value) {
        alert("�н��������� �н������� �����̾�� �մϴ�.");
        return;
    }

	document.form1.action = "/servlet/controller.complete.DbMgrServlet";
	document.form1.p_process.value = "listPage";
	//document.form1.p_pageno.value = "1";
	document.form1.target = "_self";
	document.form1.submit();
}

// �������ĺ�ȯ 
    function dateChk(){
        ff = document.form1;
        
        if(ff.p_edustart1.value != null){
            ff.p_edustart.value=make_date(ff.p_edustart1.value)+"00";
        }
        
        if(ff.p_eduend1.value != null){
            ff.p_eduend.value=make_date(ff.p_eduend1.value)+"00";
        }       

    }
    
    //����
    function whenOrder(column) {
        if (document.form1.p_orderType.value == " asc") {
            document.form1.p_orderType.value = " desc";
        } else {
            document.form1.p_orderType.value = " asc";
        }
        document.form1.p_orderColumn.value = column;
        whenSelection("go");
    }

    function go(index) {
        document.form1.target = "_self";
        document.form1.p_action.value = "go";
         document.form1.p_pageno.value = index;
         //document.form1.action = '/servlet/controller.complete.DbMgrServlet';
         //document.form1.p_process.value = "listPage";
         //document.form1.submit();
        whenSelection('go');
    }
    
    function goPage(pageNum) {
        document.form1.target = "_self";
        document.form1.p_action.value = "go";
        document.form1.p_pageno.value = pageNum;
        //document.form1.action = '/servlet/controller.complete.DbMgrServlet';
        //document.form1.p_process.value = "listPage";
        //document.form1.submit();
        whenSelection('go');
    }

    // �������
    function whenMemberInfo(userid) {
        window.self.name = "ProposeMemberList";
        open_window("openMember","","100","100","600","260");
        document.form1.target = "openMember";
        document.form1.action='/servlet/controller.library.SearchServlet?p_userid='+userid;
        document.form1.p_process.value = 'memberInfo';
        document.form1.submit();
        document.form1.target = window.self.name;
    }
-->
</script>
</head>
<body topmargin=0 leftmargin=0>
<form name="form1" action="" method="post">
<input type="hidden" name="p_process" value="">
<input type="hidden" name="p_grcode" value="">
<input type="hidden" name="p_action" value="">
<input type="hidden" name="p_year" value="">
<input type="hidden" name="p_subj" value="">
<input type="hidden" name="p_subjseq" value="">
<input type="hidden" name="p_subjseqgr" value="">
<input type="hidden" name="p_pageno" value="<%=v_pageno%>">
<input type="hidden" name="p_orderColumn">
<input type="hidden" name="p_orderType" value="<%=v_orderType%>">
<input type="hidden" name="p_edustart1">
<input type="hidden" name="p_eduend1">

<table width="1000" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td align="center">

	  <table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><!--img src="/images/admin/cp/cp_tit_cha.gif" --><br><b>���ᵥ������ȸ(yeslearn)</b></td>
          <td align="right"><!--img src="/images/admin/common/sub_title_tail.gif" --></td>
        </tr>
      </table>

      <br>
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>���ᵥ������ȸ(yeslearn)</td>
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
                <td>
                  <table  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="20"></td>
					  <td>
					  �з����� <select name="p_gubun">
					    <option value="ALL" <%if(p_gubun.equals("ALL")){out.println("selected");}%>>ALL</option>
					    <option value="la" <%if(p_gubun.equals("la")){out.println("selected");}%>>����</option>
					    <option value="ji" <%if(p_gubun.equals("ji")){out.println("selected");}%>>����</option>
					  </select>
					  ȸ�� <%=SelectCompanyBean.getAesCompany(box, false, true)%>
					  �����Ⱓ : <input type="text" name="p_edustart" value="<%=p_edustart%>" class="input" size="10" maxlength=10> - <input type="text" name="p_eduend" value="<%=p_eduend%>" class="input" size="10" maxlength=10>
					  ���ᱸ�� <select name="p_isgraduated">
					    <option value="ALL" <%if(p_isgraduated.equals("ALL")){out.println("selected");}%>>ALL</option>
					    <option value="Y"> <%if(p_isgraduated.equals("Y")){out.println("selected");}%>����</option>
					    <option value="N" <%if(p_isgraduated.equals("N")){out.println("selected");}%>>�̼���</option>
					  </select>
					  
					  �� �� �� : <input type="text" name="p_subjnm" value="<%=p_subjnm%>" class="input" size="9">
					  USERID : <input type="text" name="p_userid" value="<%=p_userid%>" class="input" size="9">
					  <a href="javascript:whenSelection('go');"><img src="/images/admin/button/b_go.gif"  border="0"></a>
					  </td>
					  <td width="20"></td>
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
          <td colspan="10" class="table_top_line"></td>
        </tr>

        <tr>
          <td class="table_title" width="6%">��ȣ</td>
          <td class="table_title"  width="12%">��������ȣ</td>
          <td class="table_title"  width="25%"><a href="javascript:whenOrder('subjnm')" class="e">������</a></td>
          <td class="table_title"  width="10%"><a href="javascript:whenOrder('customername')" class="e">ȸ��</a></td>
          <td class="table_title"  width="8%"><a href="javascript:whenOrder('userid')" class="e">userid</a></td>
          <td class="table_title"  width="8%"><a href="javascript:whenOrder('name')" class="e">����</a></td>
          <td class="table_title"  width="15%">�����Ⱓ</td>
          <td class="table_title"  width="8%">����</td>
          <td class="table_title"  width="8%"><a href="javascript:whenOrder('isgraduated')" class="e">���Ῡ��</a></td>
        </tr>
<%
ArrayList list = (ArrayList)request.getAttribute("CompleteList");
if (box.getString("p_action").equals("go")) {

	for(i = 0; i < list.size(); i++) {
	//DataBox dbox = (Databox)list.get(i);
	DataBox dbox = (DataBox)list.get(i);
    
    v_dispnum 		= dbox.getInt("d_dispnum");
	v_serno          = dbox.getString("d_serno");
    v_groupid        = dbox.getString("d_groupid");
    v_comid          = dbox.getString("d_comid");
    v_userid         = dbox.getString("d_userid");
    v_name           = dbox.getString("d_name");
    v_resno          = dbox.getString("d_resno");
    v_category       = dbox.getString("d_category");
    v_customerid     = dbox.getString("d_customerid");
    v_customername   = dbox.getString("d_customername");
    v_serialno       = dbox.getString("d_serialno");
    v_groupcount     = dbox.getString("d_groupcount");
    v_contentid      = dbox.getString("d_contentid");
    v_subjnm         = dbox.getString("d_subjnm");
    v_edustart       = dbox.getString("d_edustart");
    v_eduend         = dbox.getString("d_eduend");
    v_processpoint   = dbox.getString("d_processpoint");
    v_reportpoint    = dbox.getString("d_reportpoint");
    v_discusspoint   = dbox.getString("d_discusspoint");
    v_ideapoint      = dbox.getString("d_ideapoint");
    v_qnapoint       = dbox.getString("d_qnapoint");
    v_attendpoint    = dbox.getString("d_attendpoint");
    v_testpoint      = dbox.getString("d_testpoint");
    v_finaltestpoint = dbox.getString("d_finaltestpoint");
    v_score          = dbox.getString("d_score");
    v_enterdate      = dbox.getString("d_enterdate");
    v_isgraduated    = dbox.getString("d_isgraduated");
    v_ipcode         = dbox.getString("d_ipcode");
    v_gubun          = dbox.getString("d_gubun");
    
    
	v_dispnum   = dbox.getInt("d_dispnum");
	v_totalpage = dbox.getInt("d_totalpage");
	v_rowcount  = dbox.getInt("d_rowcount");
    
    v_edustart      = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");
    v_eduend        = FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");
%>
        <tr>
          <td class="table_02_1" height="28"><%=v_dispnum%></td>
          <td class="table_02_1" height="28"><%=v_serno%></td>
          <td class="table_02_2" height="28"><%=v_subjnm%></td>
          <td class="table_02_1" height="28"><%=v_customername%></td>
          <td class="table_02_1" height="28"><a href="javascript:whenMemberInfo('<%=v_userid%>')" class="e"><%=v_userid%></a></td>
          <td class="table_02_1" height="28"><%=v_name%></td>
          <td class="table_02_1" height="28"><%=v_edustart%>-<%=v_eduend%></td>
          <td class="table_02_1" height="28"><%=v_score%></td>
          <td class="table_02_1" height="28"><%=v_isgraduated%></td>
        </tr>
<%
	}
	if(list.size() <= 0){
%>
        <tr>
          <td class="table_02_1" colspan="10" height="28" bgcolor="#ffffff">��ȸ�� �����Ͱ� �����ϴ�.</td>
        </tr>
<%
	}
}
%>
      </table>

    </td>
  </tr>
</table>
<br>
<table width="1000" border="0" cellpadding="5" cellspacing="1">
  <tr>
    <td><%= PageUtil.printPageList(v_totalpage, v_pageno, v_rowcount) %></td>
  </tr>
    <tr height="100">
    <td>
      <%@ include file = "/learn/library/getJspName.jsp" %>
    </td>
  </tr>
</table>
<br>
</form>
</body>
</html>

