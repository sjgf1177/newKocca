<%
/**
 * file name : za_ETestQuestionPreview.jsp
 * date      : 2003/09/01
 * programmer:
 * function  : �� ���� �̸����� - �ְ���
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

	String v_end = box.getString("p_end");
	String v_onload = "";
	if(v_end.equals("0")) { v_onload = "onload='javascript:onload();'"; }

    String  v_grcode    = box.getString("p_grcode");        //�����ְ�

    String  v_etestsubj    = box.getString("p_etestsubj");

	String v_reloadlist = box.getString("p_reloadlist");

    ArrayList  list = (ArrayList)request.getAttribute("QuestionExampleData");
	DataBox dbox0 = null;
	if(list.size() > 0) {
		 dbox0 = (DataBox)list.get(0);
    } else {
	    dbox0 = new DataBox("resoponsebox");
	}

	int v_etestnum = dbox0.getInt("d_etestnum");
	String v_etesttype = box.getStringDefault("p_etesttype", dbox0.getString("d_etesttype"));

    String v_urldir = "/upload/etest/";
%>
<html>
<head>
<title>E-TEST ���� �̸�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
function UpdateQuestion() {
  ActionPage('ETestQuestionUpdate');
}
function DeleteQuestion() {
  if (confirm("�򰡹����� ���� �Ͻðڽ��ϱ�?")) {
    ActionPage('ETestQuestionDelete');
  }
}
function ActionPage(p_process) {
  if (p_process == 'ETestQuestionDelete') {
    document.form2.action = "/servlet/controller.etest.ETestQuestionServlet";
  } else {
    if(!chkData()) {
      return;
    }
    document.form2.action = "/servlet/controller.etest.ETestQuestionServlet?p_file=1&p_motion=1&p_sound=1";
  }
  document.form2.p_process.value = p_process;
  document.form2.p_reloadlist.value = 'true';
  document.form2.submit();
}
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
function display(){
        document.form2.target = "openWinQuestion";
		document.form2.action = "/servlet/controller.etest.ETestQuestionServlet";
        document.form2.p_process.value = 'ETestQuestionUpdatePage';
        document.form2.p_action.value = 'go';
		document.form2.submit();

        farwindow.window.focus();
        document.form2.target = window.self.name;
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
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="150" <%=v_onload%>>

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
          <td valign="bottom" height="20"><b>[<%=ETestQuestionBean.get_subjnm(v_etestsubj)%>] [<%=dbox0.getString("d_etestnum")%>��] ���� �̸�����</b></td>
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
        <input type="hidden" name="p_img2"      value="<%=dbox0.getString("d_saveimage")%>">  
        <input type="hidden" name="p_audio2"     value="<%=dbox0.getString("d_saveaudio")%>">
        <input type="hidden" name="p_movie2"    value="<%=dbox0.getString("d_savemovie")%>"> 
        <input type="hidden" name="p_flash2"    value="<%=dbox0.getString("d_saveflash")%>"> 
        <input type="hidden" name="p_img3"      value="<%=dbox0.getString("d_realimage")%>">  
        <input type="hidden" name="p_audio3"     value="<%=dbox0.getString("d_realaudio")%>">
        <input type="hidden" name="p_movie3"    value="<%=dbox0.getString("d_realmovie")%>"> 
        <input type="hidden" name="p_flash3"    value="<%=dbox0.getString("d_realflash")%>"> 
        <input type="hidden" name="p_reloadlist" value="">

        <tr>
          <td colspan="4" class="table_top_line"></td>
        </tr>
<!-- �������� �̹���, ����, ������ ���� ���� -->
<%      if (!dbox0.getString("d_saveimage").equals("")) { %> 
        <tr> 
          <td bgcolor="#FFFFFF"> 
            <table cellspacing="0" cellpadding="0" class="img_table_out">
              <tr> 
                <td> 
                  <table cellspacing="2" cellpadding="2">
                    <tr> 
                      <td class="img_table" height="26"><img src='<%=v_urldir+dbox0.getString("d_saveimage")%>'></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
<%      }  %>  
<%      if (!dbox0.getString("d_saveaudio").equals("")) { %> 
        <tr> 
          <td class="board_text4"> <img src="/images/user/study/voice_icon1.gif" width="20" height="17" border="0"><a href="<%=v_urldir+dbox0.getString("d_saveaudio")%>"><%=dbox0.getString("d_realaudio")%></a></td>
        </tr>
<%      }  %>  
<%      if (!dbox0.getString("d_savemovie").equals("")) { %> 
        <tr> 
          <td class="board_text3"> <img src="/images/user/study/meida_icon1.gif" width="20" height="17" border="0"><a href="<%=v_urldir+dbox0.getString("d_savemovie")%>"><%=dbox0.getString("d_realmovie")%></a></td>
        </tr>
<%      }  %>        
<!-- �������� �̹���, ����, ������ ���� �� -->
		<tr>
          <td class="table_title_01">�����з�</td>
          <td class="table_02_1"><%=dbox0.getString("d_etesttypenm")%></td>
          <td class="table_title_01">���̵�</td>
          <td class="table_02_1"><%=dbox0.getString("d_levelsnm")%></td>
		</tr>
		<tr>
          <td class="table_title_01">����</td>
          <td class="table_02_1" valign="top" colspan="3"><%=dbox0.getString("d_etesttext")%></td>
        </tr>
		<tr>
          <td class="table_title_01">�����ؼ�</td>
          <td class="table_02_1" valign="top" colspan="3"><%=dbox0.getString("d_exptext")%></td>
        </tr>
	   </table>

      <table cellspacing="1" cellpadding="5" class="table_out" ID="etesttype1" STYLE="display:">
	    <input type="hidden" name="p_selcount1"  value="">	
		<tr>
		  <td></td>
		</tr>
		<tr>
		  <td colspan="4" class="table_title_01">�������</td>
		</tr>
<%  
    for (int k=1; k <= list.size(); k++) {
         DataBox dbox = (DataBox)list.get(k-1);   
%>
        <tr>
          <td class="table_01" width="15%"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <%=StringManager.replace(dbox.getString("d_seltext"), "`", "'")%>
          </td>
		  <input type="hidden" name="p_isanswer<%=String.valueOf(k)%>" value="<%=dbox.getString("d_isanswer")%>">
        </tr>
<%
 }
%>
        <tr>
          <td class="table_title_01">�̹�������</td>
          <td colspan="3" class="table_02_2" width="60%">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td width="100%">
                  <input name="p_img1" type="FILE" class="input" size="40">&nbsp;<%=dbox0.getString("d_realimage")%>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="table_title_01">���������</td>
          <td colspan="3" class="table_02_2" width="60%">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td width="100%">
                  <input name="p_audio1" type="FILE" class="input" size="40">&nbsp;<%=dbox0.getString("d_realaudio")%>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="table_title_01">����������</td>
          <td colspan="3" class="table_02_2" width="60%">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td width="100%">
                  <input name="p_movie1" type="FILE" class="input" size="40">&nbsp;<%=dbox0.getString("d_realmovie")%>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="table_title_01">�÷�������</td>
          <td colspan="3" class="table_02_2" width="60%">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td width="100%">
                  <input name="p_flash1" type="FILE" class="input" size="40">&nbsp;<%=dbox0.getString("d_realflash")%>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      </form>

	  <!----------------- ������� �� ----------------->
      <!----------------- ��� ��ư ���� ----------------->
      <table cellspacing="0" cellpadding="0" class="table1">
        <tr>
            <td align=center><a href="javascript:history.go(-1)"><img src="/images/admin/button/btn_list.gif" border="0"></a></a></td>
			<!--<td align="right" width="54"><a href="javascript:window.close()"><img src="/images/admin/research/close1_butt.gif" width="37" height="18" border="0"></a></td>-->
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
