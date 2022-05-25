<%
/**
 * file name : za_ExamMaster_I.jsp
 * date      : 2003/09/03
 * programmer:
 * function  : �򰡸����� ���
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.exam.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

	String v_end = box.getString("p_end");
	String v_onload = "";
	if(v_end.equals("0")) { v_onload = "onload='javascript:onload();'"; }

	String v_reloadlist = box.getString("p_reloadlist");

    String  ss_upperclass  = box.getStringDefault("s_upperclass", "ALL");
    String  ss_middleclass = box.getStringDefault("s_middleclass","ALL");
    String  ss_lowerclass  = box.getStringDefault("s_lowerclass", "ALL");
    String  ss_subjcourse  = box.getStringDefault("s_subjcourse","ALL");    //����&�ڽ�
    String  v_ctype    = box.getString("p_ctype");  // ������Ÿ��
    String  v_subj       = box.getString("p_subj");

%>
<html>
<head>
<title>�򰡸����͵��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--

// ���
function InsertNext() {
  if (!chkData()) {
    return;
  }
  document.form1.p_process.value = 'ExamMasterInsertNextPage';
  document.form1.p_step.value  = '2';
  document.form1.submit();
}

// ��� ���� üũ
function chkData() {
  //var v_examtime = parseInt(document.form1.p_examtime.value);
  //if (v_examtime < 1) {
  //  document.form1.p_examtime.focus();
  //  alert('����ð��� �Է��� �ֽʽÿ�.');
  //  return false;
  //}

  /*
  if (blankCheck(document.form1.p_startdate.value)) {
    alert('���۽ð��� �߸� �ԷµǾ����ϴ�.');
    return false;
  }
  if (blankCheck(document.form1.p_enddate.value)) {
    alert('����ð��� �߸� �ԷµǾ����ϴ�.');
    return false;
  }
  var v_startdt = make_date(form1.p_startdate.value) + form1.p_starthour.value + form1.p_startminute.value; 
  var v_enddt = make_date(form1.p_enddate.value) + form1.p_endhour.value + form1.p_endminute.value;  
  var v_gap = v_enddt - v_startdt; 
  document.form1.p_startdt.value = v_startdt; 
  document.form1.p_enddt.value = v_enddt; 

  if ( 1 > v_gap) {
    alert('����ð��� �����Ͻʽÿ�.');
    return false;  
  }
  */
  
  if (document.form1.p_lesson.value.length < 1) {
    alert('������ ���ð� ��ϵǾ� ���� �ʽ��ϴ�.');
    return false;
  }  

  return true;
}
<% if (v_reloadlist.equals("true")) { %>
opener.ReloadPage('go');
<% } %>
function onload() {
  window.self.close();
}
-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" <%=v_onload%>>
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false' 
ondragstart='return false' onselectstart='return false' 
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index:99">
</div>

<form name="form1" method="post" action="/servlet/controller.exam.ExamMasterServlet">
    <input type="hidden" name="p_process"     value="">
    <input type="hidden" name="p_action"      value="">
    <input type="hidden" name="s_upperclass"  value="<%=ss_upperclass%>">
    <input type="hidden" name="s_middleclass" value="<%=ss_middleclass%>">
    <input type="hidden" name="s_lowerclass"  value="<%=ss_lowerclass%>">
    <input type="hidden" name="s_subjcourse"  value="<%=ss_subjcourse%>">
    <input type="hidden" name="p_subj"        value="<%=v_subj%>">
    <input type="hidden" name="p_step"        value="">
    <input type="hidden" name="p_startdt"        value="">
    <input type="hidden" name="p_enddt"        value="">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/exam/e_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	        <!----------------- title �� ----------------->
      <br>
      <!----------------- ������ ���� ----------------->
      <table cellspacing="0" cellpadding="0" class="table1">
        <tr>
		<td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>������ 
            : <%=GetCodenm.get_subjnm(v_subj)%>(<%=v_subj%>)</td>
        </tr>
        <tr> 
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ������ �� ----------------->

      <!----------------- �򰡸����� ��� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="2" class="table_top_line"></td>
        </tr>

        <%if(v_ctype.equals("Y")){%>
        <tr> 
          <td width="16%" class="table_title">��Ÿ��</td>
          <td width="81%" class="table_02_2">
<SELECT name=p_examtype  > 
 <option value=H>������</option> 
 <option value=E>������</option> 
 <!--<option value=M>�߰���</option> -->
  </SELECT>           
          </td>
        </tr>        
        <tr> 
          <td class="table_title">������</td>
          <td class="table_02_2">
<SELECT name=p_lesson  > 
 <option value=001>001</option> 
 <option value=002>002</option> 
  </SELECT>            
          &nbsp;&nbsp;<font color="red">* [������Ÿ��]�����򰡴� 001, �����򰡴� 002 �Դϴ�.</font>
          </td>
        </tr>
        <tr> 
          <td  class="table_title">�򰡹���</td>
          <td class="table_02_2">
<SELECT name=p_lessonstart  > 
 <option value=001>001</option> 
 <option value=002>002</option> 
  </SELECT>  ~ 
<SELECT name=p_lessonend  > 
 <option value=001>001</option> 
 <option value=002>002</option> 
  </SELECT>              
&nbsp;&nbsp;<font color="red">* [������Ÿ��]�����򰡴� 001~001, �����򰡴� 002~002 �Դϴ�.</font>                       
          </td>
        </tr>        
        <%}else{%>
        <tr> 
          <td width="16%" class="table_title">��Ÿ��</td>
          <td width="81%" class="table_02_2"><%=CodeConfigBean.getCodeGubunSelect(ExamBean.PTYPE,"", 1, "p_examtype", "", "", 0)%></td>
        </tr>        
        <tr> 
          <td class="table_title">������</td>
          <td class="table_02_2"><%=SelectBoxBean.get_SelectSubjLesson("p_lesson", "", v_subj)%> &nbsp;&nbsp;<font color="red">* �ϳ��� �������� ������ ��Ÿ���� ������ �� �����Ƿ� �����Ͽ� �����Ͻñ� �ٶ��ϴ�.</font></td>
        </tr>
        <tr> 
          <td  class="table_title">�򰡹���</td>
          <td class="table_02_2"><%=SelectBoxBean.get_SelectSubjLesson("p_lessonstart", "", v_subj)%> ~ <%=SelectBoxBean.get_SelectSubjLesson("p_lessonend", "", v_subj)%></td>
        </tr>
        <%}%>

        <!--tr> 
          <td class="table_title">���۽ð�</td>
          <td class="table_02_2">
            ���� <input name="p_startdate" type="text" class="input" size="10" value="" OnClick="MiniCal(this)" readonly> &nbsp;
            �ð�
            <select name="p_starthour">
              <%=FormatDate.getDateOptions(0, 23)%>
            </select>
            &nbsp;��
            <select name="p_startminute">
              <%=FormatDate.getDateOptions(0, 59)%>
            </select>
          </td>
        </tr>
        <tr> 
          <td class="table_title">����ð�</td>
          <td class="table_02_2">
            ���� <input name="p_enddate" type="text" class="input" size="10" value="" OnClick="MiniCal(this)" readonly> &nbsp;
            �ð�
            <select name="p_endhour">
              <%=FormatDate.getDateOptions(0, 23)%>
            </select>
            &nbsp;��
            <select name="p_endminute">
              <%=FormatDate.getDateOptions(0, 59)%>
            </select>
          </td>
        </tr-->
        <tr>
          <td class="table_title">�����������</td>
          <td class="table_02_2"> 
            <input name="p_isopenanswer" type="radio" size="5" value="Y" checked>&nbsp;�� 
            <input name="p_isopenanswer" type="radio" size="5" value="N">&nbsp;�ƴϿ� 
          </td>
        </tr>
        <tr>
          <td class="table_title">�������(�ؼ�)����</td>
          <td class="table_02_2"> 
            <input name="p_isopenexp" type="radio" size="5" value="Y" checked>&nbsp;�� 
            <input name="p_isopenexp" type="radio" size="5" value="N">&nbsp;�ƴϿ� 
          </td>
        </tr>
        <!--<tr>
          <td class="table_title">����ð�</td>
          <td class="table_02_2"> 
            <input name="p_examtime" type="text" class="input" size="4" value="0">��
          </td>
        </tr>-->
         <input name="p_examtime" type="hidden" class="input" size="4" value="0">
        <tr>
          <td class="table_title">������</td>
          <td class="table_02_2"><input name="p_retrycnt" type="text" class="input" size="3" value="0">ȸ
		  </td>
        </tr>
        <tr>
          <td class="table_title">����������</td>
          <td class="table_02_2"><input name="p_progress" type="text" class="input" size="3" value="0" maxlength="3">%
		  </td>
        </tr>
      </table>
      <!----------------- �򰡸����� ��� �� ----------------->
      <br>
      <!----------------- ���, ����Ʈ ��ư ���� ----------------->
      <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td ><a href="javascript:InsertNext()"><img src="/images/admin/button/btn_next.gif"  border="0"></a></td>
          <td width=8></td>
		  <td><a href="javascript:window.close()"><img src="/images/admin/button/btn_cancel.gif"  border="0"></a></td>
        </tr>
      </table>
      <!-----------------  ���, ����Ʈ ��ư �� ----------------->
      <br>
      <br>
      <br>
    <!--  <font color= blue>(�б�İ����� �ش��� ��쿡�� �б�� �б� �ƴ� ������ ���� �򰡹����� ���� �� �����ϴ�.)</font>   -->
    </td>
  </tr>
</table>

</form>  
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>

