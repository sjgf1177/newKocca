<%
//**********************************************************
//  1. ��      ��: ���ְ��� �������� ���ȭ��
//  2. ���α׷���: zu_CpNotice_I.jsp
//  3. ��      ��: ���ְ��� �������� ���ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̿��� 2005. 08. 09
//  7. ��      ��: �̿��� 2005. 08. 09
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.gatepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");
ArrayList list = (ArrayList)request.getAttribute("selectCpinfo");
DataBox dbox = null;
String v_title = "", v_content = "", v_usernm = "", v_userid = "", v_regdt = "";
String v_cpnm = "", v_cpseq = ""; 
int    v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
int    v_pageno     = box.getInt("p_pageno");
int    v_seq        = box.getInt("p_seq");
String v_searchtext = box.getString("p_searchtext");
String v_select     = box.getString("p_select");
String s_usernm     = box.getSession("name");
String s_cpseq      = box.getSession("cpseq");
String s_gadmin     = box.getSession("gadmin");
String content = "";
String width   = "650";
String height  = "200";
//String s_gubun = "";

//s_gubun = box.getString("p_gubun");

%>

<html>
<head>
<title>GateSystem��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language = "javascript">
<!--
//����Ʈ �������� �̵�
function cancel() {
    document.form1.action = "/servlet/controller.cp.CpNoticeAdminServlet";
    document.form1.p_process.value = "selectList";      
    document.form1.p_searchtext.value = "<%= v_searchtext %>";   
    document.form1.p_select.value = "<%= v_select %>";   
    document.form1.p_pageno.value = "<%= v_pageno %>";     
    document.form1.submit();	
}
//�Է��Ͽ� �����ϱ�
function insert() { 
    var chkselectcnt = chkSelected();
	form1.p_content.value = document.form1.Wec.MIMEValue;
	form1.p_content.value.replace("&","&amp;");

    if (blankCheck(document.all.p_title.value)) {
        alert("������ �Է��ϼ���!");
        document.all.p_title.focus();
        return;
    }                
    if (realsize(document.all.p_title.value) > 100) {
        alert("������ �ѱ۱��� 50�ڸ� �ʰ����� ���մϴ�.");
        document.all.p_title.focus();
        return;
    }
    if(chkselectcnt < 1 && document.form1.p_loginyn[0].checked == true){
        alert("ȸ�縦 �����Ͽ��ֽʽÿ�");
        return;
    }
	if (document.form1.Wec.Value.length < 3) {
		alert("������ �Է��ϼ���");
		return;
	}
    document.form1.action = "/servlet/controller.cp.CpNoticeAdminServlet";
	document.form1.p_process.value = "insert";              
    document.form1.submit();
}

//�� ���� üũ
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;
    
    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);
    
    return (false);
}
//���� ũ�� üũ
function realsize( value ) {
    var len = 0;
    if ( value == null ) return 0;
    for(var i=0;i<value.length;i++){
        var c = escape(value.charAt(i));
        if ( c.length == 1 ) len ++;
        else if ( c.indexOf("%u") != -1 ) len += 2;
        else if ( c.indexOf("%") != -1 ) len += c.length/3;
    }
    return len;
     }
	//üũ�ڽ� üũ
    function chkSelected() {
      var selectedcnt = 0;
      
      document.form1.p_compcd.value = "";
      
      if(document.form1.all['p_cpseq'] == '[object]') {
        if (document.form1.p_cpseq.length > 0) {
          for (i=0; i<document.form1.p_cpseq.length; i++) {
            if (document.form1.p_cpseq[i].checked == true) {
              selectedcnt++;
              document.form1.p_compcd.value += document.form1.p_cpseq[i].value+",";
            }
          }
        } else {
          if (document.form1.p_cpseq.checked == true) {
            selectedcnt++;
            document.form1.p_compcd.value += document.form1.p_cpseq.value;
          }
        }
      }
      return selectedcnt;
    }
    
    function whenLoginSelect(){
    //alert("1111");
    if(document.form1.p_loginyn[0].checked == true) { //loginY���ý�
          if (document.form1.p_cpseq.length > 0) {
            for (i=0; i<document.form1.p_cpseq.length; i++) {
              document.form1.p_cpseq[i].checked = false;
              document.form1.p_cpseq[i].disabled = false;
            }
          } else {
              document.form1.p_cpseq.checked = false;
              document.form1.p_cpseq.disabled = false;
          }
    }
    else if(document.form1.p_loginyn[1].checked == true){
      if (document.form1.p_cpseq.length > 0) {
            for (i=0; i<document.form1.p_cpseq.length; i++) {
              document.form1.p_cpseq[i].checked = false;
              document.form1.p_cpseq[i].disabled = true;
            }
      } else {
          document.form1.p_cpseq.checked = false;
          document.form1.p_cpseq.disabled = true;
      }
    }
    }
//-->
	</script>
</head>

<body topmargin=0 leftmargin=0>
<form name = "form1" enctype = "multipart/form-data" method = "post">
<input type = "hidden" name = "p_seq"         value = "<%= v_seq %>">
<input type = "hidden" name = "p_upfilecnt"   value = "<%= v_upfilecnt %>">
<input type = "hidden" name = "p_searchtext"  value = "">
<input type = "hidden" name = "p_select"      value = "">
<input type = "hidden" name = "p_pageno"      value = "">
<input type = 'hidden' name = "p_content"     value = "">
<input type = "hidden" name = "p_compcd"    value = "">
<input type = "hidden" name = "p_process">
<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="/images/admin/cp/cp_title06.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
       <br>
      <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
        <tr>
          <td class="table_title" width="18%">����</td>
          <td class="table_02_2"  width="82%"><input type = "text" style="padding:1; border:1 solid #D1D1D1;" onFocus = "this.style.background='#FFFAE1'" onBlur = "this.style.background='#ffffff'" name = "p_title" size = "84" maxlength = "100" value = ""></td>
        </tr>
        <tr>
          <td class="table_title">�ۼ���</td>
          <td class="table_02_2"><%= s_usernm %></td>
        </tr>
        <!--tr>
          <td class="table_title">��ü��������</td>
          <td class="table_02_2"><input type='checkbox' name='p_isall' value=''>(��ܰɱ�� üũ)</td>
        </tr-->
        <tr>
          <td class="table_title">�α��ο���</td>
          <td class="table_02_2">
            <input type='radio' name='p_loginyn' value='Y' checked onclick="javascript:whenLoginSelect()">�α�����
            <input type='radio' name='p_loginyn' value='N' onclick="javascript:whenLoginSelect()">�α�����
          </td>
        </tr>
		<%
		//if(s_gadmin.equals("A1") || s_gadmin.equals("A2") || s_gadmin.equals("H1")){
			if("".equals(s_cpseq)){

		%>

        <tr>
          <td class="table_title">��ü��</td>
          <td class="table_02_2">
		  <%
		  		for( int i = 0; i < list.size(); i++) {

					dbox     = (DataBox)list.get(i);  
					v_cpseq  = dbox.getString("d_cpseq");
					v_cpnm   = dbox.getString("d_cpnm");
		%>

		<input type='checkbox' name='p_cpseq' value='<%=v_cpseq%>'><%=v_cpnm%>
			<%}%>
		  </td>
		
        </tr>
		<%}else{%>
		<input type = "hidden" name = "p_cpseq" value ="<%=s_cpseq%>">
		<%}%>

        <tr>
          <td class="table_title">����</td>
          <td class="table_02_2">
                <!-- ���� Editor  -->
                <p align="left">
                <OBJECT WIDTH=0 HEIGHT=0 CLASSID="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
                   <PARAM NAME="LPKPath" VALUE="/namo/NamoWec5_Bobs_Consulting.lpk">
                </OBJECT>
                <OBJECT ID="Wec" WIDTH="600" HEIGHT="350"
                CLASSID="CLSID:DB1A8D98-97E8-4a42-9624-0E4BCD77F109" CODEBASE="/namo/NamoWec.cab#version=5,0,0,69">
                <param name="InitFileURL" value="/namo/namowec.env">
                <param name="InitFileVer" value="1.0">
                </OBJECT>
                </p>
                <!-- ���� Editor  -->
		  </td>
        </tr>
        <tr>
          <td class="table_title">����÷��</td>
          <td class="table_02_2">
			<input type="FILE" name="p_file1" size="85" class="input"><br>
			<input type="FILE" name="p_file2" size="85" class="input"><br>
			<input type="FILE" name="p_file3" size="85" class="input"><br>
			<input type="FILE" name="p_file4" size="85" class="input"><br>
			<input type="FILE" name="p_file5" size="85" class="input"><br>
		  </td>
        </tr>
      </table>
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
			<!--�����ϱ�-->
			<td align = "right"><a href = "javascript:insert();"><img src="/images/admin/button/btn_save.gif" border="0"></a> &nbsp;&nbsp;
			<!--����ϱ�-->
			<a href = "javascript:cancel();"><img src="/images/admin/button/btn_list.gif" border="0"></a</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>

