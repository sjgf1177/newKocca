<%
/**
 * file name : za_ETestQuestion_I.jsp
 * date      : 
 * programmer:
 * function  : �� ���װ��� - ����������
 */
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.etest.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_grcode    = box.getString("p_grcode");        //�����ְ�

    String  v_etestsubj    = box.getString("p_etestsubj");
    int     v_etestnum = box.getInt("p_etestnum");

	String v_reloadlist = box.getString("p_reloadlist");
%>
<html>
<head>
<title>�� ���� ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--

// ���� ���
function InsertQuestion() {
    if(!chkData()) {
      return;
    }
  document.form2.action = "/servlet/controller.etest.ETestQuestionServlet?p_file=1&p_motion=1&p_sound=1";
  document.form2.p_process.value = "ETestQuestionInsert";
  document.form2.p_reloadlist.value = 'true';
  document.form2.submit();
}

// �Է�üũ
function chkData() {
  if (blankCheck(document.form2.p_etesttext.value)) {
    document.form2.p_etesttext.focus();
    alert('������ �Է��Ͻʽÿ�.');
    return false;
  }
  
  var v_etesttype = document.form2.p_etesttype.value;
  var v_selcount = 0;
  var v_seltextcnt = 0;
  var v_test      = '';
  var v_isanswer = false;
  var i=1;
  for (i=1; i<=10; i++) {
    v_test = eval('document.form2.p_seltext'+i+'.value');
    if (!blankCheck(v_test)) {
      v_seltextcnt++;
    }
  }

    if (v_seltextcnt < 2) {
      document.form2.p_seltext1.focus();
      alert('���� ���⸦ 2���̻� �Է��Ͻʽÿ�.');
      return false;
    }

  var v_answercnt = 0;
  for (k=1; k<=10; k++) {
    v_isanswer = eval('document.form2.p_isanswer'+k+'.checked');
    if (v_isanswer) {
      v_test = eval('document.form2.p_seltext'+k+'.value');
      if (blankCheck(v_test) && (v_etesttype=='1'||v_etesttype=='3')) {
        document.form2.p_seltext1.focus();
        alert('������ ������ ���Ⱑ �����ϴ�.');
        return false;
      }
      v_answercnt++;
    }
  }

  /* ������ ���� */
  if (v_etesttype == '1') {
    if (v_answercnt == 0) {
      document.form2.p_seltext1.focus();
      alert('���俩�θ� ������ �ֽʽÿ�.');
      return false;
    } else if (v_answercnt > 1) {
      document.form2.p_seltext1.focus();
      alert('���俩�θ� 1���� ������ �ֽʽÿ�.');
      return false;
    }
  }
  
  for(i=0;i<document.form2.length;i++) {
    if (document.form2.elements[i].type=="checkbox") {
      if (document.form2.elements[i].checked==true) {
        document.form2.elements[i].value = 'Y';
      } else {
        document.form2.elements[i].value = 'N';
      }
    }
  }    
	v_selcount = v_seltextcnt;
	document.form2.p_selcount1.value = v_selcount;

  return true;
}

// �ְ��� ����ȭ������ �̵�
function display(){
        document.form2.target = "openWinQuestion";
		document.form2.action = "/servlet/controller.etest.ETestQuestionServlet";
        document.form2.p_process.value = 'ETestQuestionInsertPage';
		document.form2.submit();

        window.focus();
        document.form2.target = window.self.name;
}
<% if (v_reloadlist.equals("true")) { %>
opener.ReloadPage('go');
<% } %>
-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<table width="667" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
	
	
	
     
     
	
     
	<!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/etest/tit_etestman.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	        <!----------------- title �� ----------------->
     <br>
      <!----------------- ������ ���� ----------------->
      <table cellpadding="0" cellspacing="0" class="table1">
        <tr>
		   <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td valign="bottom" height="20" class=sub_title>[<%=ETestQuestionBean.get_subjnm(v_etestsubj)%>] �űԹ��� ���</td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ������ �� ----------------->
      <!----------------- ������� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
      <form name="form2" method="post" enctype="multipart/form-data">
        <input type="hidden" name="p_process"    value="">
        <input type="hidden" name="p_action"     value="">
        <input type="hidden" name="p_etestsubj"       value="<%=v_etestsubj%>">
        <input type="hidden" name="p_grcode"  value="<%=v_grcode%>">
        <input type="hidden" name="p_etestnum"    value="<%=String.valueOf(v_etestnum)%>">
        <input type="hidden" name="p_reloadlist" value="">

        <tr>
          <td colspan="6" class="table_top_line"></td>
        </tr>
		<tr>
          <td class="table_title">�����з�</td>
          <td class="table_02_1">
		  <%=CodeConfigBean.getCodeGubunSelect("0048","", 1, "p_gubun", "", "", 0)%>
          </td>		
    	  <td class="table_title">���̵�</td>
          <td class="table_02_1" align="left"><%=CodeConfigBean.getCodeGubunSelect(ETestBean.ETEST_LEVEL,"", 1, "p_levels", "", "", 0)%>
          <td class="table_title">����Ÿ��</td>
          <td class="table_02_1">
		  <SELECT name="p_etesttype" onchange="display();"> 
            <option value=1>������</option> 
            <option value=2>�ְ���</option> 
			<script LANGUAGE="JavaScript">document.form2.p_etesttype.value = "<%=box.getString("p_etesttype")%>";</script>
          </SELECT> 
          </td>
		</tr>
		<tr>
          <td class="table_title">����</td>
          <td class="table_02_1" valign="top" colspan="5">
            <textarea name="p_etesttext" cols="70" rows="7" class="input"></textarea>
		  </td>
        </tr>
		<tr>
          <td class="table_title">�����ؼ�</td>
          <td class="table_02_1" valign="top" colspan="5">
            <textarea name="p_exptext" cols="70" rows="7" class="input"></textarea>
		  </td>
        </tr>
	   </table>

      <table cellspacing="1" cellpadding="5" class="table_out" ID="etesttype1" STYLE="display:">
	    <input type="hidden" name="p_selcount1"  value="">	
		<tr>
		  <td></td>
		</tr>
		<tr>
		  <td colspan="6" class="table_title">����</td>
		</tr>
<%  
    for (int k=1; k <= 10; k++) {
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext<%=String.valueOf(k)%>" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1" width="10%">
             <input type="checkbox" name="p_isanswer<%=String.valueOf(k)%>" value="">���俩��
          </td>
        </tr>
<% } %>
        <tr>
          <td class="table_title">�̹�������</td>
          <td colspan="3" class="table_02_2" width="60%">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td width="100%">
                  <input name="p_img1" type="FILE" class="input" size="40">&nbsp;
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="table_title">���������</td>
          <td colspan="3" class="table_02_2" width="60%">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td width="100%">
                  <input name="p_audio1" type="FILE" class="input" size="40">&nbsp;
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="table_title">����������</td>
          <td colspan="3" class="table_02_2" width="60%">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td width="100%">
                  <input name="p_movie1" type="FILE" class="input" size="40">&nbsp;
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="table_title">�÷�������</td>
          <td colspan="3" class="table_02_2" width="60%">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td width="100%">
                  <input name="p_flash1" type="FILE" class="input" size="40">&nbsp;
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      </form>

	  <!----------------- ������� �� ----------------->
      <!----------------- ��� ��ư ���� ----------------->
      <table cellspacing="0" cellpadding="0" align=center>
        <tr>
          <td><a href="javascript:InsertQuestion()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ��� ��ư �� ----------------->
      <br>
    </td>
  </tr>
<form name="form3" method="post" action="/servlet/controller.etest.ETestQuestionServlet">
  <input type="hidden" name="p_process"    value="">
  <input type="hidden" name="p_action"     value="">
  <input type="hidden" name="p_etestsubj"       value="<%=v_etestsubj%>">
  <input type="hidden" name="p_etestnum"    value="<%=String.valueOf(v_etestnum)%>">
</form>

  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>     

</table>

</body>
</html>
