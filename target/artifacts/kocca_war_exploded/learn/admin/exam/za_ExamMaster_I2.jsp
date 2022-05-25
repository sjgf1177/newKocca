<%
/**
 * file name : za_ExamMaster_I2.jsp
 * date      : 2003/09/03
 * programmer:
 * function  : �򰡸����� ���
 */
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
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

	String  v_subj       = box.getString("p_subj");
	String  v_examtype       = box.getString("p_examtype");
	String  v_examtime       = box.getString("p_examtime");
	String  v_isopenanswer       = box.getString("p_isopenanswer");
	String  v_isopenexp       = box.getString("p_isopenexp");
	int  v_retrycnt       = box.getInt("p_retrycnt");
	int  v_progress       = box.getInt("p_progress");

    String v_lesson    = box.getString("p_lesson");
    String v_lessonstart    = box.getString("p_lessonstart");
    String v_lessonend    = box.getString("p_lessonend");

    String v_startdt    = box.getString("p_startdt");
    String v_enddt    = box.getString("p_enddt");

	int s_lesson = 0;
	int s_levels = 0;
	int s_type = 0;
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
<form name="form1" method="post" action="/servlet/controller.exam.ExamMasterServlet">
    <input type="hidden" name="p_process"     value="">
    <input type="hidden" name="p_action"      value="">
    <input type="hidden" name="s_upperclass"  value="<%=ss_upperclass%>">
    <input type="hidden" name="s_middleclass" value="<%=ss_middleclass%>">
    <input type="hidden" name="s_lowerclass"  value="<%=ss_lowerclass%>">
    <input type="hidden" name="s_subjcourse"  value="<%=ss_subjcourse%>">
    <input type="hidden" name="p_subj"        value="<%=v_subj%>">
    <input type="hidden" name="p_lesson"        value="<%=v_lesson%>">
	<input type="hidden" name="p_examtype"        value="<%=v_examtype%>">
    <input type="hidden" name="p_lessonstart"        value="<%=v_lessonstart%>">
    <input type="hidden" name="p_lessonend"        value="<%=v_lessonend%>">
	<input type="hidden" name="p_examtime"        value="<%=v_examtime%>">
    <input type="hidden" name="p_totalscore"        value="100">
    <input type="hidden" name="p_level1text"        value="">
    <input type="hidden" name="p_level2text"        value="">
    <input type="hidden" name="p_level3text"        value="">
    <input type="hidden" name="p_cntlevel1"        value="">
    <input type="hidden" name="p_cntlevel2"        value="">
    <input type="hidden" name="p_cntlevel3"        value="">
	<input type="hidden" name="p_isopenanswer"        value="<%=v_isopenanswer%>">
    <input type="hidden" name="p_isopenexp"        value="<%=v_isopenexp%>">
    <input type="hidden" name="p_retrycnt"        value="<%=v_retrycnt%>">
    <input type="hidden" name="p_progress"        value="<%=v_progress%>">
    <input type="hidden" name="p_reloadlist" value="">
    <input type="hidden" name="p_startdt" value="<%=v_startdt%>">
    <input type="hidden" name="p_enddt" value="<%=v_enddt%>">



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
		  <td height="3"></td>
        </tr>
      </table>
      <!----------------- ������ �� ----------------->

      <!----------------- �򰡸����� ��� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="4" class="table_top_line"></td>
        </tr>
        <tr> 
          <td width="16%" class="table_title">������ ����</td>
          <td width="" class="table_02_2"><input name="p_exampoint" type="text" class="input" size="5" value="0">��</td>
          <td width="16%" class="table_title">������</td>
          <td class="table_02_2"><input name="p_examcnt" type="text" class="input" size="5" value="0"></td>
        </tr>
      </table>
      <br>
	  <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="4" class="table_top_line"></td>
        </tr>
        <tr> 
          <td width="5%" class="table_title">����</td>
          <td width="" class="table_title">���̵� ��</td>
          <td width="" class="table_title">���̵� ��</td>
          <td width="" class="table_title">���̵� ��</td>
        </tr>

<%
    ArrayList  lessonlist = (ArrayList)request.getAttribute("ExamLevelsData");
	ArrayList levelslist = null;
	ArrayList typelist = null;
	s_lesson = lessonlist.size();

    int istlesson = Integer.parseInt(v_lessonstart)-1;  // ���� ����
    
    for ( int i =0; i < lessonlist.size() ; i++){

%>
        <tr> 
		  <td width="5%" class="table_01" ><%=String.valueOf(i+1+istlesson)%></td>
<%
	      levelslist = (ArrayList)lessonlist.get(i);
          s_levels = levelslist.size();
         
	      for ( int j = 0 ; j < levelslist.size() ;  j++) {

			  typelist = (ArrayList)levelslist.get(j);
			  s_type = typelist.size();
%>     
		  <td width="" class="table_02_1">
		     <table cellspacing="1" cellpadding="5" class="">
<%

			  for ( int k = 0; k < typelist.size() ; k++) {
				  DataBox dbox = (DataBox)typelist.get(k);	

				  if ( (k+1)%3 == 0 ) {
%>
				<tr>
				   <td>
				       OX��
				   </td>
				   <td>
				       (<input name="p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>" type="text" class="input" size="3" value="0">&nbsp;/ <%=dbox.getInt("d_levelscount")%>)
					    <input type="hidden" name="v_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>"        value="<%=dbox.getInt("d_levelscount")%>">
				   </td>
				</tr>
<%				  
				  } else if ( (k+1)%2 == 0 ) {
%>
				<tr>
				   <td>
				       �ְ���
				   </td>
				   <td>
				       (<input name="p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>" type="text" class="input" size="3" value="0">&nbsp;/ <%=dbox.getInt("d_levelscount")%>)
					    <input type="hidden" name="v_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>"        value="<%=dbox.getInt("d_levelscount")%>">
				   </td>
				</tr>
<%
                 }  else {					  
%>
			    <tr>
				   <td>
				       ������
				   </td>
				   <td>
				       (<input name="p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>" type="text" class="input" size="3" value="0">&nbsp;/ <%=dbox.getInt("d_levelscount")%>)
					   <input type="hidden" name="v_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>"        value="<%=dbox.getInt("d_levelscount")%>">
				   </td>
				</tr>
<%
                  } 

              }
%>
			 </table>
		  </td>
<%
		}
%>          
        </tr>
<%
   }
%>
      </table>
      <!----------------- �򰡸����� ��� �� ----------------->
      <br>
      <!----------------- ���, ����Ʈ ��ư ���� ----------------->
      <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><a href="javascript:history.go(-1)"><img src="/images/admin/button/btn_before.gif"  border="0"></a></td>
		  <td width=8></td>
          <td><a href="javascript:InsertMaster('<%=s_lesson%>','<%=s_levels%>','<%=s_type%>')"><img src="/images/admin/button/btn_apply.gif"  border="0"></a></td>
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
<script language="JavaScript">
<!--
function InsertMaster(s_lesson, s_levels, s_type) {
  if (!chkData()) {
    return;
  }
  document.form1.p_process.value = 'ExamMasterInsert';
  document.form1.p_action.value  = 'go';
  document.form1.p_reloadlist.value = 'true';
  document.form1.submit();
}
function chkData( ) {
  var v_examcnt = 0;

  if (!number_chk_noalert(document.form1.p_exampoint.value) || 1 > document.form1.p_exampoint.value) {
    document.form1.p_exampoint.focus();
    alert('������ ������ �߸� �ԷµǾ����ϴ�.');
    return false;
  }
  if (!number_chk_noalert(document.form1.p_examcnt.value) || 1 > document.form1.p_examcnt.value) {
    document.form1.p_examcnt.focus();
    alert('�������� �߸� �ԷµǾ����ϴ�.');
    return false;
  }
  if (document.form1.p_exampoint.value * document.form1.p_examcnt.value != 100) {
    document.form1.p_exampoint.focus();
    alert('�������� 100���Դϴ�. ������ �����̳� �������� ������ �ֽʽÿ�.');
    return false;
  }

	var s_level1text = "";
	var s_level2text = "";
	var s_level3text = ""; 
	var s_cntlevel1 = 0; 
	var s_cntlevel2 = 0; 
	var s_cntlevel3 = 0; 
<%
  // "1,5|1,1|1,4  /" ( ����������,�����Ĺ����� | �ְ�������,�ְ��Ĺ����� | ox����,ox������ / )
  for ( int i = 0; i < s_lesson; i++){
      for ( int j = 0; j < s_levels; j++){
	        for ( int k =0; k < s_type; k++){

%>
   if ( <%=j+1%> == 1 ) {
      s_level1text += <%=i+1+istlesson%> + "," + document.form1.p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>.value;
	  s_cntlevel1 += parseInt(document.form1.p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>.value);

	  if (<%=k+1%> == 2) {
		  //if(<%=s_lesson%>-<%=i%> >1)  s_level1text = s_level1text + "/";
          s_level1text += "|";	
	  }else if (<%=k+1%> == 3) {	
		  if(<%=s_lesson%>-<%=i%> >1) s_level1text += "/";	  
	  }else{
	      s_level1text += "|";	       
	  }
   }
   if ( <%=j+1%> == 2 ) {
      s_level2text += <%=i+1+istlesson%> + "," + document.form1.p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>.value;
	  s_cntlevel2 += parseInt(document.form1.p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>.value);
	  if (<%=k+1%> == 2) {
		  //if(<%=s_lesson%>-<%=i%> >1) s_level2text += "/";
          s_level2text += "|";
	  }else if (<%=k+1%> == 3) {
		  if(<%=s_lesson%>-<%=i%> >1) s_level2text += "/";		  		  
	  }else{
	       s_level2text += "|";
	  }
   }
   if ( <%=j+1%> == 3 ) {
      s_level3text += <%=i+1+istlesson%> + "," + document.form1.p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>.value;
	  s_cntlevel3 += parseInt(document.form1.p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>.value);
	  if (<%=k+1%> == 2) {
		  //if(<%=s_lesson%>-<%=i%> >1) s_level3text += "/";
		  s_level3text += "|";
	  }else if (<%=k+1%> == 3) {
		  if(<%=s_lesson%>-<%=i%> >1) s_level3text += "/";		  
	  }else{
	       s_level3text += "|";
	  }
   }

if (!number_chk_noalert(document.form1.p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>.value) || parseInt(document.form1.v_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>.value) < parseInt(document.form1.p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>.value) ) {
    alert('���̵��� ���׼��� �߸��ԷµǾ����ϴ�.');
    document.form1.p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>.focus();
    return false;
  }
 v_examcnt += parseInt(document.form1.p_cntlevelM<%=i+1+istlesson%>M<%=j+1%>M<%=k+1%>.value,10)
<%			
			}
	  }
  }
%>

  if (v_examcnt != document.form1.p_examcnt.value) {
    document.form1.p_cntlevelM2M1M1.focus();
    alert('�Է��� �������� ' + v_examcnt + '�� �Դϴ�. \n�������� �°� ���� ����� �� �ּ���.');
    return false;
  }
document.form1.p_level1text.value = s_level1text;
document.form1.p_level2text.value = s_level2text;
document.form1.p_level3text.value = s_level3text;

document.form1.p_cntlevel1.value = s_cntlevel1;
document.form1.p_cntlevel2.value = s_cntlevel2;
document.form1.p_cntlevel3.value = s_cntlevel3;

  return true;
}
-->
</script>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>

