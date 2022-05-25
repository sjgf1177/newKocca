<%
//**********************************************************
//  1. ��      ��: ������������ ȭ��
//  2. ���α׷���: za_Grseq_U.jsp
//  3. ��      ��: ������������ ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 11
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    String v_grcode = box.getString("p_grcode");
    String v_gyear = box.getString("p_gyear");
    String v_grseq = box.getString("p_grseq");

	//DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_subjcourse= box.getString("s_subjcourse");       //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");          //���� ����
    //DEFINED in relation to select END

    GrseqData da = (GrseqData)request.getAttribute("GrseqData");

	GrseqBean grseqbean = new GrseqBean();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
function whenSubmit(){
	if (document.form1.p_gyear.value.length != 4){
		alert("�⵵�� 4�ڸ��� �Է��Ͽ� �ֽʽÿ�");
		return;
	}
	if (document.form1.p_grseqnm.value.length < 2){
		alert("������������ 2~25�ڸ��� �Է��Ͽ� �ֽʽÿ�");
		return;
	}

	document.form1.submit();
}
function whenDelete(){
	if(!confirm('��� �ڽ��� ������ �н��������� ��� �����Ǹ� ������ �� �����ϴ�.\n\n���������� �����Ͻðڽ��ϱ�?'))	return;

	document.form1.p_process.value = "delGrseq";
	document.form1.submit();
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post" action="/servlet/controller.course.GrseqServlet">
	<input type="hidden" name="p_process" 	value="update">
	<input type="hidden" name="p_grcode"	value="<%=v_grcode%>">
	<input type="hidden" name="p_gyear"		value="<%=v_gyear%>">
	<input type="hidden" name="p_grseq"		value="<%=v_grseq%>">
	<input type="hidden" name="s_grcode"    	value="<%=ss_grcode%>">     <!--in relation to select-->
    <input type="hidden" name="s_gyear"     	value="<%=ss_gyear%>">      <!--in relation to select-->
    <input type="hidden" name="s_upperclass"    value="<%=ss_upperclass%>"> <!--in relation to select-->
    <input type="hidden" name="s_middleclass"   value="<%=ss_middleclass%>"><!--in relation to select-->
    <input type="hidden" name="s_subjcourse"	value="<%=ss_subjcourse%>"> <!--in relation to select-->
    <input type="hidden" name="s_subjseq"   	value="<%=ss_subjseq%>">    <!--in relation to select-->


<table width="600" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/course/c_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
        <br>
        <br>

        <!----------------- �������� ���� ���/���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="16%" height="25" class="table_title"><b>�����׷�</b></td>
            <td class="table_02_2" width="81%"> <b><%=GetCodenm.get_grcodenm(v_grcode)%></b></td>
          </tr>
          <tr>
            <td class="table_title" height="25"><b>�⵵</b></td>
            <td class="table_02_2">
                <b><%=da.getGyear()%></b>
            </td>
          </tr>
          <tr>
            <td class="table_title" height="25"><b>����������</b></td>
            <td class="table_02_2"> <input name="p_grseqnm" type="text" class="input" size="40" maxlength="50" value="<%=da.getGrseqnm()%>"> <b>ex) 2006.01.01 ~ 2006.01.31</b>
            </td>
          </tr>
          <tr>
            <td class="table_title" height="25"><b>Ȩ���������⿩��</b></td>
            <td class="table_02_2">
            	<input type="radio" name="p_homepageyn" value="Y" id="p_homepageyn_y" <%=(da.getHomepageyn().equals("Y"))? "checked":"" %>><label for="p_homepageyn_y">����</label>
            	<input type="radio" name="p_homepageyn" value="N" id="p_homepageyn_n" <%=(da.getHomepageyn().equals("N"))? "checked":"" %>><label for="p_homepageyn_n">�̳���</label>
            </td>
          </tr>
        </table>
        <!----------------- �������� ���� ���/���� �� ----------------->

        <br>

        <!----------------- ����, ��� ��ư ���� ----------------->
        <table  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><a href="javascript:whenSubmit()"><img src="/images/admin/button/btn_save.gif"  border="0"></a></td>
			<td width=8></td>
            <td align="center"><a href="javascript:whenDelete()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
			<td width=8></td>
            <td align="center"><a href="javascript:window.close()"><img src="/images/admin/button/btn_cancel.gif"  border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->





        <br>





      </td>
  </tr>

    <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>

</form>
</body>
</html>







