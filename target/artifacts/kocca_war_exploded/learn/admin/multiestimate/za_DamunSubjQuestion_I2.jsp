<%
/**
 * file name : za_DamunSubjQuestion_I2.jsp
 * date      : 2003/08/20
 * programmer:
 * function  : �ٸ��� ���װ��� - ������������
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.multiestimate.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    String  v_gubun = box.getStringDefault("p_gubun", DamunSubjBean.DEFAULT_SUBJ);
    String  v_grcode    = box.getString("p_grcode");        //�����ְ�
	String v_gubunnm = "";
	    v_gubunnm = "�����ٸ���";

    String  v_subj = box.getString("p_subj");
    String  v_damuntype = box.getString("p_damuntype");
    
    ArrayList  list = (ArrayList)request.getAttribute("ScaleQuestionExampleData");
	ArrayList blist1 = new ArrayList();
	ArrayList blist2 = new ArrayList();
 
    String v_reloadlist = box.getString("p_reloadlist");
	int v_scalecode = Integer.parseInt(box.getString("p_scalecode"));
	int v_fscalecode = Integer.parseInt(box.getString("p_fscalecode"));
	int v_sscalecode = Integer.parseInt(box.getString("p_sscalecode"));

%>
<html>
<head>
<title>�ٸ��򰡹�������-���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
function InsertQuestion() {
  ActionPage('DamunQuestionInsert');
}
function ActionPage(p_process) {
	  if(!chkData()) {
         return;
      }
  document.form2.p_process.value = p_process;
  document.form2.p_reloadlist.value = 'true';
  document.form2.submit();
}
function chkData() {
  if (blankCheck(document.form2.p_damuntext.value)) {
    document.form2.p_damuntext.focus();
    alert('�ٸ��򰡹�������  �Է��Ͻʽÿ�.');
    return false;
  }

  var v_damuntype = document.form2.p_damuntype.options[document.form2.p_damuntype.selectedIndex].value;
  var v_selcount = 0;
  var v_seltextcnt = 0;

  if (v_damuntype == "1"){
    for (k=0; k<document.form2.p_seltext1.length; k++) {
      if (!blankCheck(document.form2.p_seltext1[k].value)) {
        v_seltextcnt++;
      }
    }
    if (v_seltextcnt == 0) {
      alert('�ٸ��򰡹��� ���⸦  �Է��Ͻʽÿ�.');
      return false;
     }     
	v_selcount = v_seltextcnt;
	document.form2.p_selcount1.value = v_selcount;

  } else if (v_damuntype == "2") {
    for (k=0; k<document.form2.p_seltext2.length; k++) {
      if (!blankCheck(document.form2.p_seltext2[k].value)) {
        v_seltextcnt++;
      }
    }
    if (v_seltextcnt == 0) {
      alert('�ٸ��򰡹��� ���⸦  �Է��Ͻʽÿ�.');
      return false;
     }     

	if (v_seltextcnt < document.form2.p_selmax2.value) {
      alert('���� ���ü��� ���⺸�� �����ϴ�.');
      return false;	 
	 }    
	v_selcount = v_seltextcnt;
	document.form2.p_selcount2.value = v_selcount;

  } else if (v_damuntype == "4") {
    for (k=0; k<document.form2.p_seltext4.length; k++) {
      if (!blankCheck(document.form2.p_seltext4[k].value)) {
        v_seltextcnt++;
      }
    }
    if (v_seltextcnt == 0) {
      alert('�ٸ��򰡹��� ���⸦  �Է��Ͻʽÿ�.');
      return false;
     }     
	v_selcount = v_seltextcnt;
	document.form2.p_selcount4.value = v_selcount;
  }  else if (v_damuntype == "5") {
	if (1 > document.form2.p_fscalecode5.value || document.form2.p_fscalecode5.value=="") {
      alert('ô���� ������ �ּ���,');
      return false;	 
	 }    
	document.form2.p_selcount5.value = "5";
  }  else if (v_damuntype == "6") {
	if (1 > document.form2.p_fscalecode6.value || document.form2.p_fscalecode6.value=="") {
      alert('ô���� ������ �ּ���,');
      return false;	 
	 }    
	document.form2.p_selcount6.value = "7";
  }  else if (v_damuntype == "7") {
	if (1 > document.form2.p_fscalecode7.value || document.form2.p_fscalecode7.value=="") {
      alert('��1ô���� ������ �ּ���,');
      return false;	 
	 }
	 if (1 > document.form2.p_sscalecode7.value || document.form2.p_sscalecode7.value=="") {
      alert('��2ô���� ������ �ּ���,');
      return false;	 
	 }
	document.form2.p_selcount7.value = "10";
  }

  return true;
}

<% if (v_reloadlist.equals("true")) { %>
opener.ReloadPage('go');
<% } %>

function changeScale(flag) {

  var v_damuntype = document.form2.p_damuntype.options[document.form2.p_damuntype.selectedIndex].value;
  var v_scalecode = 0;
  var v_fscalecode = 0;
  var v_sscalecode = 0;
  var v_scaleflag = flag;
  if(v_damuntype == 5){
   v_scalecode = document.form2.p_fscalecode5.options[document.form2.p_fscalecode5.selectedIndex].value;
  }else if(v_damuntype==6){
   v_scalecode = document.form2.p_fscalecode6.options[document.form2.p_fscalecode6.selectedIndex].value;
  }else if(v_damuntype==7){
   v_fscalecode = document.form2.p_fscalecode7.options[document.form2.p_fscalecode7.selectedIndex].value;
   v_sscalecode = document.form2.p_sscalecode7.options[document.form2.p_sscalecode7.selectedIndex].value;
  }

  if(v_scalecode > 0 || v_fscalecode > 0 || v_sscalecode > 0){
	    document.form2.target = "openWinQuestion";
		document.form2.action = "/servlet/controller.multiestimate.DamunSubjQuestionServlet";
		document.form2.p_process.value = "DamunQuestionInsertS";
		document.form2.p_scalecode.value = v_scalecode;
		document.form2.p_fscalecode.value = v_fscalecode;
		document.form2.p_sscalecode.value = v_sscalecode;
		document.form2.p_damuntype.value = v_damuntype;
		document.form2.submit();
  }
  }

-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onload="javascript:display('<%=v_damuntype%>')">
<table width="667" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
     <br>
      <!----------------- ������ ���� ----------------->
      <table cellpadding="0" cellspacing="0" class="table1">
        <tr>
		<td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td valign="bottom" height="20" class=sub_title>
		  <%=v_gubunnm%> �űԹ��� ���</td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ������ �� ----------------->
      <!----------------- ������� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
      <form name="form2" method="post" action="/servlet/controller.multiestimate.DamunSubjQuestionServlet">
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_action"  value="">
        <input type="hidden" name="p_gubun"   value="<%=v_gubun%>">
        <input type="hidden" name="p_subj"    value="<%=v_subj%>">
        <input type="hidden" name="p_grcode"  value="<%=v_grcode%>">
        <input type="hidden" name="p_scaleflag"  value="">
        <input type="hidden" name="p_scalecode"  value="<%=v_scalecode%>">
        <input type="hidden" name="p_fscalecode"  value="<%=v_fscalecode%>">
        <input type="hidden" name="p_sscalecode"  value="<%=v_sscalecode%>">
        <input type="hidden" name="p_reloadlist"  value="">
        <tr>
          <td colspan="4" class="table_top_line"></td>
        </tr>
<script language="JavaScript">
<!--
function display(flag) {
   
	var v_damuntype = "";
	if(flag == "0"){
	    v_damuntype = document.form2.p_damuntype.options[document.form2.p_damuntype.selectedIndex].value;
	}else {
	    v_damuntype = flag;
	}
	if(v_damuntype=="1"){ 
		damuntype1.style.display="";
        damuntype2.style.display="none";
        damuntype3.style.display="none";
        damuntype4.style.display="none";
        damuntype5.style.display="none";
        damuntype6.style.display="none";
        damuntype7.style.display="none";
    }else if(v_damuntype=="2"){ 
		damuntype1.style.display="none";
        damuntype2.style.display="";
        damuntype3.style.display="none";
        damuntype4.style.display="none";
        damuntype5.style.display="none";
        damuntype6.style.display="none";
        damuntype7.style.display="none";
    }else if(v_damuntype=="3"){ 
		damuntype1.style.display="none";
        damuntype2.style.display="none";
        damuntype3.style.display="";
        damuntype4.style.display="none";
        damuntype5.style.display="none";
        damuntype6.style.display="none";
        damuntype7.style.display="none";
    }else if(v_damuntype=="4"){ 
		damuntype1.style.display="none";
        damuntype2.style.display="none";
        damuntype3.style.display="none";
        damuntype4.style.display="";
        damuntype5.style.display="none";
        damuntype6.style.display="none";
        damuntype7.style.display="none";
    }else if(v_damuntype=="5"){ 
		damuntype1.style.display="none";
        damuntype2.style.display="none";
        damuntype3.style.display="none";
        damuntype4.style.display="none";
        damuntype5.style.display="";
        damuntype6.style.display="none";
        damuntype7.style.display="none";
    }else if(v_damuntype=="6"){ 
		damuntype1.style.display="none";
        damuntype2.style.display="none";
        damuntype3.style.display="none";
        damuntype4.style.display="none";
        damuntype5.style.display="none";
        damuntype6.style.display="";
        damuntype7.style.display="none";
    }else if(v_damuntype=="7"){ 
		damuntype1.style.display="none";
        damuntype2.style.display="none";
        damuntype3.style.display="none";
        damuntype4.style.display="none";
        damuntype5.style.display="none";
        damuntype6.style.display="none";
        damuntype7.style.display="";
    }
}
-->
</script>
		<tr>
          <td class="table_title" width="15%">�����з�</td>
          <td class="table_02_1">
		  <SELECT name="p_damuntype" onchange="display('0');"> 
            <option value=1>���ϼ���</option> 
            <option value=2>��������</option> 
            <option value=3>������</option> 
            <option value=4>������</option> 
            <option value=5>5��ô��</option> 
            <option value=6>7��ô��</option> 
            <option value=7>GAP��</option> 
		   <script>document.form2.p_damuntype.value = <%=v_damuntype%>;</script>
          </SELECT> 
          </td>
		</tr>
		<tr>
          <td class="table_title" width="15%">����</td>
          <td class="table_02_1" valign="top">
            <textarea name="p_damuntext" cols="60" rows="12"><%=box.getString("p_damuntext")%></textarea>
		  </td>
	   </table>

      <table cellspacing="1" cellpadding="5" class="table_out" ID="damuntype1" STYLE="display:">
	    <input type="hidden" name="p_selmax1"  value="">
	    <input type="hidden" name="p_fscalecode1"  value="">	
	    <input type="hidden" name="p_sscalecode1"  value="">	
	    <input type="hidden" name="p_selcount1"  value="">	
        <input type="hidden" name="p_scalename1"  value="">	
		<tr>
		  <td></td>
		</tr>
		<tr>
		  <td colspan="4" class="table_title">����</td>
		</tr>
<%  
    for (int k=1; k <= 10; k++) {
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext1" type="text" class="input" size="60" value="">
	         <input type="hidden" name="p_selpoint1"  value="0">	
          </td>
        </tr>
<% } %>
	  </table>

	  <table cellspacing="1" cellpadding="5" class="table_out" ID="damuntype2" STYLE="display:none">
	    <input type="hidden" name="p_fscalecode2"  value="">	
	    <input type="hidden" name="p_sscalecode2"  value="">	
	    <input type="hidden" name="p_selcount2"  value="">		
	         <input type="hidden" name="p_scalename2"  value="">	
		<tr>
    	  <td class="table_title" width="15%">���� ���ü�</td>
          <td class="table_02_1">
		  <SELECT name="p_selmax2"> 
            <option value=1>1</option> 
            <option value=2>2</option> 
            <option value=3>3</option> 
            <option value=4>4</option> 
            <option value=5>5</option> 
            <option value=6>6</option> 
            <option value=7>7</option> 
            <option value=8>8</option> 
            <option value=9>9</option> 
            <option value=10>10</option> 
          </SELECT> 
		  </td>
		</tr>
		<tr>
		  <td></td>
		</tr>
		<tr>
		  <td colspan="4" class="table_title">����</td>
		</tr>
<%  
    for (int k=1; k <= 10; k++) {
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext2" type="text" class="input" size="60" value="">
	         <input type="hidden" name="p_selpoint2"  value="0">	
          </td>
        </tr>
<% } %>
	  </table>

      <table cellspacing="1" cellpadding="5" class="table_out" ID="damuntype3" STYLE="display:none">
	    <input type="hidden" name="p_selmax3"  value="">
	    <input type="hidden" name="p_selcount3"  value="">
	    <input type="hidden" name="p_seltext3"  value="">	
	    <input type="hidden" name="p_fscalecode3"  value="">	
	    <input type="hidden" name="p_sscalecode3"  value="">
        <input type="hidden" name="p_scalename3"  value="">		
        <input type="hidden" name="p_selpoint3"  value="0">	
	  </table>

      <table cellspacing="1" cellpadding="5" class="table_out" ID="damuntype4" STYLE="display:none">
	    <input type="hidden" name="p_selmax4"  value="">
	    <input type="hidden" name="p_fscalecode4"  value="">	
	    <input type="hidden" name="p_sscalecode4"  value="">	
	    <input type="hidden" name="p_selcount4"  value="">	
	         <input type="hidden" name="p_scalename4"  value="">	
		<tr>
		  <td></td>
		</tr>
		<tr>
		  <td colspan="4" class="table_title">����</td>
		</tr>
<%  
    for (int k=1; k <= 10; k++) {
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext4" type="text" class="input" size="60" value="">
	         <input type="hidden" name="p_selpoint4"  value="0">	
          </td>
        </tr>
<% } %>
	  </table>

      <table cellspacing="1" cellpadding="5" class="table_out" ID="damuntype5" STYLE="display:none">
	    <input type="hidden" name="p_selmax5"  value="">
	    <input type="hidden" name="p_selcount5"  value="">		
	    <input type="hidden" name="p_sscalecode5"  value="">	
		<tr>
    	  <td class="table_title" width="15%">ô����</td>
          <td class="table_01" colspan="3" align="left">
		  <%=ScaleBean.getScaleCodeSelect ("5", v_grcode, "D", "p_fscalecode5", v_scalecode, "onchange=changeScale('1')")%>
		  </td>
		</tr>
		<tr>
		  <td></td>
		</tr>
		<tr>
		  <td colspan="4" class="table_title">����</td>
		</tr>
<%  
    blist1 = (ArrayList)list.get(0);
    for (int k=1; k <= 5; k++) {
       if (v_damuntype.equals("5")){
         DataBox dbox = (DataBox)blist1.get(k-1);   
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext5" type="text" class="input" size="60" value='<%=StringManager.replace(dbox.getString("d_seltext"), "`", "'")%>' readonly>
	         <input type="hidden" name="p_scalename5"  value="<%=dbox.getString("d_scalename")%>">	
          </td>
          <td class="table_02_1"><%=dbox.getInt("d_selpoint")%>��
	      <input type="hidden" name="p_selpoint5"  value="<%=dbox.getInt("d_selpoint")%>">	
          </td>
        </tr>
<%
	   } else {
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext5" type="text" class="input" size="60" value='' readonly>
	         <input type="hidden" name="p_scalename5"  value="">	
	         <input type="hidden" name="p_selpoint5"  value="0">	
          </td>
          <td class="table_02_1">
          </td>
        </tr>
<%
      }
    }
%>
	  </table>

      <table cellspacing="1" cellpadding="5" class="table_out" ID="damuntype6" STYLE="display:none">
	    <input type="hidden" name="p_selmax6"  value="">
	    <input type="hidden" name="p_selcount6"  value="">	
	    <input type="hidden" name="p_sscalecode6"  value="">	
		<tr>
    	  <td class="table_title" width="15%">ô����</td>
          <td class="table_01" colspan="3" align="left">
		  <%=ScaleBean.getScaleCodeSelect ("7", v_grcode, "D", "p_fscalecode6", v_scalecode, "onchange=changeScale('2')")%>
		  </td>
		</tr>
		<tr>
		  <td></td>
		</tr>
		<tr>
		  <td colspan="4" class="table_title">����</td>
		</tr>
<%  
    blist1 = (ArrayList)list.get(0);
    for (int k=1; k <= 7; k++) {
       if (v_damuntype.equals("6")){
        DataBox dbox = (DataBox)blist1.get(k-1);   
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext6" type="text" class="input" size="60" value='<%=StringManager.replace(dbox.getString("d_seltext"), "`", "'")%>' readonly>
	         <input type="hidden" name="p_scalename6"  value="<%=dbox.getString("d_scalename")%>">	
          </td>
          <td class="table_02_1"><%=dbox.getInt("d_selpoint")%>��
	    <input type="hidden" name="p_selpoint6"  value="<%=dbox.getInt("d_selpoint")%>">	
          </td>
        </tr>
<%
	   } else {
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext6" type="text" class="input" size="60" value='' readonly>
	         <input type="hidden" name="p_scalename"  value="">	
	    <input type="hidden" name="p_selpoint6"  value="0">	
          </td>
          <td class="table_02_1">
          </td>
        </tr>
<%
      }
    }
%>
	  </table>

      <table cellspacing="1" cellpadding="5" class="table_out" ID="damuntype7" STYLE="display:none">
	    <input type="hidden" name="p_selmax7"  value="">
	    <input type="hidden" name="p_selcount7"  value="">	
		<tr>
    	  <td class="table_title" width="15%">��1ô����</td>
          <td class="table_01" colspan="3" align="left">
		  <%=ScaleBean.getScaleCodeSelect ("5", v_grcode, "D", "p_fscalecode7", v_fscalecode, "onchange=changeScale('3')")%>
		  </td>
		</tr>
		<tr>
		  <td></td>
		</tr>
		<tr>
		  <td colspan="4" class="table_title">����</td>
		</tr>
<%  
    blist1 = (ArrayList)list.get(0);
	for (int k=1; k <= 5; k++) {
       if (v_damuntype.equals("7") && blist1.size()>0){

        DataBox dbox = (DataBox)blist1.get(k-1);   
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext7" type="text" class="input" size="60" value='<%=StringManager.replace(dbox.getString("d_seltext"), "`", "'")%>' readonly>
	         <input type="hidden" name="p_scalename7"  value="<%=dbox.getString("d_scalename")%>">	
          </td>
          <td class="table_02_1"><%=dbox.getInt("d_selpoint")%>��
	    <input type="hidden" name="p_selpoint7"  value="<%=dbox.getInt("d_selpoint")%>">	
          </td>
        </tr>
<%
	   } else {
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext7" type="text" class="input" size="60" value='' readonly>
	         <input type="hidden" name="p_scalename7"  value="">	
	    <input type="hidden" name="p_selpoint7"  value="0">	
          </td>
          <td class="table_02_1">
          </td>
        </tr>
<%
      }
    }
%>
		<tr>
    	  <td class="table_title" width="15%">��2ô����</td>
          <td class="table_01" colspan="3" align="left">
		  <%=ScaleBean.getScaleCodeSelect ("5", v_grcode, "D", "p_sscalecode7", v_sscalecode, "onchange=changeScale('4')")%>
		  </td>
		</tr>
		<tr>
		  <td></td>
		</tr>
		<tr>
		  <td colspan="4" class="table_title">����</td>
		</tr>
<%  
    blist2 = (ArrayList)list.get(1);
	for (int k=1; k <= 5; k++) {
       if (v_damuntype.equals("7") && blist2.size()>0){

        DataBox dbox = (DataBox)blist2.get(k-1);   
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext7" type="text" class="input" size="60" value='<%=StringManager.replace(dbox.getString("d_seltext"), "`", "'")%>' readonly>
	         <input type="hidden" name="p_scalename7"  value="<%=dbox.getString("d_scalename")%>">	
          </td>
          <td class="table_02_1"><%=dbox.getInt("d_selpoint")%>��
	    <input type="hidden" name="p_selpoint7"  value="<%=dbox.getInt("d_selpoint")%>">	
          </td>
        </tr>
<%
	   } else {
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext7" type="text" class="input" size="60" value='' readonly>
	         <input type="hidden" name="p_scalename7"  value="">	
	    <input type="hidden" name="p_selpoint7"  value="0">	
          </td>
          <td class="table_02_1">
          </td>
        </tr>
<%
      }
    }
%>
	  </table>

      </form>
	  <!----------------- ������� �� ----------------->
      <!----------------- ��� ��ư ���� ----------------->
      <table cellspacing="0" cellpadding="0">
        <tr>
          <td align="right"><a href="javascript:InsertQuestion()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
		  <td align="right" width="8"></td>
          <td align="right"><a href="javascript:self.close()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ��� ��ư �� ----------------->
      <br>
    </td>
  </tr>

  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>     

</table>
</body>
</html>
