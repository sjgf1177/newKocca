<%
//**********************************************************
//  1. ��      ��: ������û ���� ����� ���
//  2. ���α׷���: za_BlackCondition_L.jsp
//  3. ��      ��: ������û ���� ����� ��� ��ȸȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 07. 18
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
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

    String v_grcode				= "";
    String v_gryear				= "";
    String v_grseq				= "";
    String v_conditioncode		= "";
    String v_alertmsg			= "";

    String v_process = box.getString("p_process"); 
    String ss_action = box.getString("p_action"); 
    String s_gadmin	 = box.getSession("gadmin");

    ArrayList list = null;

    if(ss_action.equals("go")){
      list = (ArrayList)request.getAttribute("blackconditionlist");
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script> 
<script language="JavaScript">
<!--

//��ȸ
function whenSelection(p_action) {
        document.form1.p_action.value = p_action;
        document.form1.target = "_self";
        document.form1.action = '/servlet/controller.propose.AcceptFileToDBServlet';
        document.form1.p_process.value = 'blackCoditionPage';
        top.ftop.setPam();
        document.form1.submit();
}

// ������û ���� ���� ����
function whenUpdateCondition(i, grcode, gryear, grseq, conditioncode){
		document.form1.unum.value = i;
		document.form1.grcode.value = grcode;
		document.form1.gryear.value = gryear;
		document.form1.grseq.value = grseq;
		document.form1.conditioncode.value = conditioncode;
        document.form1.target = "_self";
        document.form1.action = "/servlet/controller.propose.AcceptFileToDBServlet";
        document.form1.p_process.value="blackCoditionUpdate";
        document.form1.submit();
}

// ������û ���� ���� ����
function whenDeleteCondition(i, grcode, gryear, grseq, conditioncode){
		document.form1.unum.value = i;
		document.form1.grcode.value = grcode;
		document.form1.gryear.value = gryear;
		document.form1.grseq.value = grseq;
		document.form1.conditioncode.value = conditioncode;
        document.form1.target = "_self";
        document.form1.action = "/servlet/controller.propose.AcceptFileToDBServlet";
        document.form1.p_process.value="blackCoditionDelete";
        document.form1.submit();
}

// ������û ���� ���� �߰�
function whenInsertCondition(){
	  if(document.form1.s_grcode.value == "ALL"){
		alert("�����׷��� �����Ͽ� �ֽʽÿ�.");
		return;
	  }

	  if(document.form1.s_gyear.value == ""){
		alert("�����⵵�� �����Ͽ� �ֽʽÿ�.");
		return;
	  }

	  if(document.form1.s_grseq.value == "ALL"){
		alert("���������� �����Ͽ� �ֽʽÿ�.");
		return;
	  }

	  if(document.form1.p_conditioncode.value == "ALL"){
		alert("�������౸���� �����Ͽ� �ֽʽÿ�.");
		return;
	  }

	document.form1.target = "_self";
	document.form1.action = "/servlet/controller.propose.AcceptFileToDBServlet";
	document.form1.p_process.value="blackCoditionInsert";
	document.form1.submit();
}

function insertexcel(grcode,gryear,grseq,conditioncode){
  open_window("insertexcel","","0","0","1020","600","","","","yes","no");
  document.form1.target = "insertexcel";
  document.form1.grcode.value = grcode;
  document.form1.gryear.value = gryear;
  document.form1.grseq.value = grseq;
  document.form1.conditioncode.value = conditioncode;
  document.form1.action='/servlet/controller.propose.AcceptFileToDBServlet';
  document.form1.p_process.value = "FileToDB";
  document.form1.submit();
}


function selectblacklist(grcode,gryear,grseq,conditioncode){
  open_window("blacklist","","0","0","1020","600","","","","yes","no");
  document.form1.target = "blacklist";
  document.form1.grcode.value = grcode;
  document.form1.gryear.value = gryear;
  document.form1.grseq.value = grseq;
  document.form1.conditioncode.value = conditioncode;
  document.form1.action='/servlet/controller.propose.AcceptFileToDBServlet';
  document.form1.p_process.value = "blacklist";
  document.form1.submit();
}

//-->
</script>

</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


<form name="form1" method="post">
<input type=hidden name=p_process value="">
<input type=hidden name=p_action value="">
<input type="hidden" name="grcode" value="">
<input type="hidden" name="gryear" value="">
<input type="hidden" name="grseq" value="">
<input type="hidden" name="conditioncode" value="">
<input type="hidden" name="alertmsg" value="">
<input type="hidden" name="unum" value="">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
            <td><img src="/images/admin/system/tit_new_cancelapply.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>

	  <!----------------- form ���� ----------------->
      <table  width="1000" border=0 cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="left">

            <table border=0 cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="left">

                  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="form_table">
                    <tr>
                      <!------------------- ���ǰ˻� ���� ------------------------->
                      <td width="90%" align="left" valign="middle">&nbsp;
                      <%
                      	if(s_gadmin.equals("A1")){
                      %>
					     				<%= SelectEduBean.getGrcode(box, true, true)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
					     				<%
					     					} else {
					     				%>
					     				<%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
					     				<%}	%>
        			     		<%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)  �����⵵  -->
				         			<%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
					  </td>
					  <td width="10%" align="center">
	                    <%@ include file="/learn/admin/include/za_GoButton.jsp" %><!-- whenSelection('go') -->
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- form �� ----------------->
	  <br>

      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class=sub_title><img src="/images/admin/common/icon.gif"> ������û ���� �߰�</td>
		  <td align="right">
			<img src="/images/admin/button/btn_add.gif" style="cursor:hand" onClick="whenInsertCondition()">		  	
		  </td>
        </tr>
      </table>

        <!----------------- ���� ���� �߰� ----------------->
        <table width="100%" class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="7" class="table_top_line"></td>
          </tr>
		  <tr>
            <td width="10%" class="table_title"><b>�������౸��</b></td>
            <td width="15%" class="table_02_1">
				<%=CodeConfigBean.getCodeGubunSelect("0050","",1,"p_conditioncode","","",2)%>
			</td>
            <td class="table_title"><b>Ȯ��â�޼���</b></td>
            <td class="table_02_2" align="left"><input type="text" class="input" name="p_alertmsg" size="80" maxlength="100" value=""></td>
		  </tr>
		</table>
        <!----------------- ���� ���� �߰� ----------------->
		<br>
		<br>
		<table width="97%" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
		    <td class=sub_title><img src="/images/admin/common/icon.gif"> ������û ���� ���</td>
		  </tr>
		</table>
        <!----------------- ���� ���� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="7" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="3%" height="25" class="table_title"><b>NO</b></td>
            <td width="12%" class="table_title"><b>�����׷�</b></td>
            <td width="10%" class="table_title"><b>��������</b></td>
            <td width="10%" class="table_title"><b>�������౸��</b></td>
            <td width="30%" class="table_title"><b>Ȯ��â�޼���</b></td>
            <td width="35%" class="table_title"><b>���</b></td>
          </tr>
<%
    if(ss_action.equals("go")){
        for(int i = 0; i < list.size(); i++) {
          DataBox dbox		= (DataBox)list.get(i);
          v_grcode			= dbox.getString("d_grcode");
          v_gryear			= dbox.getString("d_gryear");
          v_grseq			= dbox.getString("d_grseq");
          v_conditioncode   = dbox.getString("d_conditioncode");
          v_alertmsg		= dbox.getString("d_alertmsg");
%>
          <tr> 
            <td class="table_02_1"><%=i+1%></td>
            <td class="table_02_1"><%=GetCodenm.get_grcodenm(v_grcode)%></td>
            <td class="table_02_1"><%=GetCodenm.get_grseqnm(v_grcode, v_gryear, v_grseq)%></td>
            <td class="table_02_1"><%=CodeConfigBean.getCodeName("0050",v_conditioncode)%></td>
            <td class="table_02_2" align="left"><input type="text" class="input" name="alertmsg<%=i%>" size="50" maxlength="100"  value="<%=v_alertmsg%>"></td>
            <td class="table_02_1">
				<a href="javascript:whenUpdateCondition('<%=i%>','<%=v_grcode%>','<%=v_gryear%>','<%=v_grseq%>','<%=v_conditioncode%>')"><img src="/images/admin/button/btn_modify.gif" border="0"></a> 
				<a href="javascript:whenDeleteCondition('<%=i%>','<%=v_grcode%>','<%=v_gryear%>','<%=v_grseq%>','<%=v_conditioncode%>')"><img src="/images/admin/button/btn_del.gif" border="0"></a> 
				<a href="javascript:insertexcel('<%=v_grcode%>','<%=v_gryear%>','<%=v_grseq%>','<%=v_conditioncode%>')"><img src="/images/admin/button/bt_blaklist.gif" border="0"></a>
				<a href="javascript:selectblacklist('<%=v_grcode%>','<%=v_gryear%>','<%=v_grseq%>','<%=v_conditioncode%>')"><img src="/images/admin/button/btn_peoplelist.gif"
				border="0"></a>
			</td>
          </tr>
<%
       }
	}
%>

        </table>
        <!----------------- �������� �����Է� �� ----------------->
      </td>
    </tr>
    <tr>
     <td>

<%@ include file = "/learn/library/getJspName.jsp" %>
	 </td>
   </tr>
 </table>
</form>
</body>
</html>
