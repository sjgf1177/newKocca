<%
//**********************************************************
//  1. ��      ��: �����Ͱ�������
//  2. ���α׷���: za_MasterMain_L.jsp
//  3. ��      ��: �����Ͱ��� ��ȸȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2004. 11. 11
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    ArrayList list = null;

	String v_grcode	= box.getString("grcode");
	String v_gryear	= box.getString("gryear");
	String v_grseq		= box.getString("grseq");
	String v_conditioncode    = box.getString("conditioncode");
	String v_userid			= "";
    String v_name			= "";
    String v_companynm		= "";
    String v_jikwinm		= "";
    String v_gubun			= "";    
    
    String v_process = box.getString("p_process");            
        
    int    i = 0;
    
//    if(ss_action.equals("go")){
      list = (ArrayList)request.getAttribute("blacklist");
//    }
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script> 
<script language="JavaScript">
<!--

function chkSelected() {
      var selectedcnt = 0;
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            if (document.form1.p_checks[i].checked == true) {
              selectedcnt++;
            }
          }
        } else {
          if (document.form1.p_checks.checked == true) {
            selectedcnt++;
          }
        }
      }
      return selectedcnt;
}


function whenDelete(){
    if (chkSelected() <1) {
            alert("����ڸ� �����ϼ���.");
            return;
    }
    
    
    if(!confirm("�����Ͻðڽ��ϱ�?")){
       return;
    }

    document.form1.p_process.value="blacklistDelete";
    document.form1.action = "/servlet/controller.propose.AcceptFileToDBServlet";
    document.form1.p_action.value = 'go';
    document.form1.submit();

}

//-->
</script>

</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


<form name="form1" method="post">
<input type=hidden name=p_process value="">
<input type=hidden name=p_action value="">
<input type="hidden" name="grcode" value="<%=v_grcode%>">
<input type="hidden" name="gryear"  value="<%=v_gryear%>">
<input type="hidden" name="grseq" value="<%=v_grseq%>">
<input type="hidden" name="conditioncode"  value="<%=v_conditioncode%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
       <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/system/tit_new_cancelapply.gif"> </td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif"></td>
        </tr>
       </table>
        <!----------------- title �� ----------------->
        <br>

		  <table cellspacing="0" cellpadding="1" class="form_table_out">
			<tr>
			  <td bgcolor="#C6C6C6" align="center">
				<table cellspacing="0" cellpadding="0" class="form_table_bg" >
				  <tr>
					<td height="7"></td>
				  </tr>
				  <tr>
					<td align="center" valign="middle">
					  <table cellspacing="0" cellpadding="0" width="99%" class="form_table">
						<tr>
						  <td>
						 �� �����׷� : <b>[<%=GetCodenm.get_grcodenm(v_grcode)%>]</b> �� �������� : <b>[<%=GetCodenm.get_grseqnm(v_grcode, v_gryear, v_grseq)%>]</b> �� �������౸�� :  <b>[<%=CodeConfigBean.getCodeName("0050",v_conditioncode)%>]</b>
						  </td>
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
        <!----------------- ����, ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="right" height="20"><a href="javascript:whenDelete()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
            <td align="right" width="10">&nbsp;</td>
            <!--td align="right" width="65"><a href="javascript:insertexcel()"><img src="/images/admin/button/btn_excelregist.gif" border="0"></a></td>
            <!--
            <td align="right" width="65"><a href="javascript:sendMail()"><img src="/images/admin/course/mail1_butt.gif" width="58" height="18" border="0"></a></td>
            -->
          </tr>
          <tr> 
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- �����ְ��߰�, ��μ���, �������� ��ư �� ----------------->


        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="7" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="5%" height="25" class="table_title"><b>NO</b></td>
            <td width="15%"class="table_title"><b>ȸ��</b></td>
            <td width="15%"class="table_title"><b>USERID</b></td>
            <td width="15%"class="table_title"><b>����</b></td>
            <td width="15%"class="table_title"><b>����</b></td>
            <td width="20%"class="table_title"><b>����</b></td>
            <td width="10%"class="table_title"><b>����</b></td>
          </tr>

<%  int v_total = 0;

    
    if(list != null) {
        v_total = list.size();
        for(i = 0; i < v_total; i++) {
          DataBox dbox  = (DataBox)list.get(i);

          v_grseq        = dbox.getString("d_grseq");
          v_companynm  = dbox.getString("d_companynm");
          v_userid     = dbox.getString("d_userid");
          v_name       = dbox.getString("d_name");
          v_jikwinm    = dbox.getString("d_jikwinm"); 
          v_gubun    = dbox.getString("d_gubun");   		  
%>
          <tr> 
            <td height="25" class="table_02_1"><%=i+1%></td>
            <td  class="table_02_1"><%=v_companynm%></td>
            <td  class="table_02_1"><%=v_userid%></td>
            <td  class="table_02_1"><%=v_name%></td>
            <td  class="table_02_1"><%=v_jikwinm%></td>
            <td  class="table_02_1"><%=CodeConfigBean.getCodeName("0049",v_gubun) %></td>
            <td class="table_02_1"><input type="checkbox" name="p_checks" value="<%=v_userid%>,<%=v_gubun%>"></td>
          </tr>
<%
       }
   }
%>

        </table>
        <!----------------- �����ְ��� ----------------->
        <br>
      </td>
  </tr>

  <tr><td>

<%@ include file = "/learn/library/getJspName.jsp" %>

</form>
</body>
</html>
