<%
//**********************************************************
//  1. ��      �� : ���հ��� ������ �ϰ�����ó��
//  2. ���α׷��� : za_OffSubjFinishInput_L.jsp
//  3. ��      �� : ���հ��� ������ �ϰ�����ó��
//  4. ȯ      �� : JDK 1.3
//  5. ��      �� : 0.1
//  6. ��      �� : 2004/02/02
//  7. ��      �� :
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.complete.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
  RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_grseq     = box.getStringDefault("s_grseq","ALL");            //��������
    String  ss_grseqnm   = box.getString("s_grseqnm");          //����������
    String  ss_subjcourse   = box.getString("s_subjcourse");       //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");          //���� ����

%>
<html>
<head>
<title>����FileToDB </title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function insert_check() {
  action("insertFileToDB");
}

function preview() {
  action("previewFileToDB");
}

function action(p_process) {
  ff1 = document.form1;
  ff3 = document.form3;

  if (ff1.s_grcode.value == 'ALL' || ff1.s_grcode.value == '----') {
         alert("�����׷��� �����ϼ���.");
         return;
  }
  
  if (top.ftop != null) { 
      top.ftop.setPam();
  }
  
  if (ff1.s_subjcourse.value == '----') {
    alert("���հ����� �����ϼ���.");
    return;
  }
  if (ff1.s_subjseq.value == '----') {
    alert("������ �����ϼ���.");
    return;
  }
  if(blankCheck(ff3.p_file.value)){
    alert("DB�� ������ ������ ������ �ּ���");
    return;
  }
  if (ff3.p_file.value.length > 0 ){
    var data = ff3.p_file.value;
    data = data.toUpperCase(data);
    if (data.indexOf(".XLS") < 0) {
      alert("DB�� �ԷµǴ� ���������� XLS ���ϸ� �����մϴ�.");
      return;
    }
  }

  ff3.s_grcode.value     = ff1.s_grcode.value; 
  ff3.s_gyear.value      = ff1.s_gyear.value; 
  ff3.s_grseq.value      =  ff1.s_grseq.value; 
  //ff3.s_grseq.value      = "0001"; 
  ff3.s_subjcourse.value = ff1.s_subjcourse.value; 
  ff3.s_subjseq.value   = ff1.s_subjseq.value; 
  
  ff3.s_grname.value = ff1.s_grcode.options[ff1.s_grcode.selectedIndex].text;
  ff3.s_subjnm.value = ff1.s_subjcourse.options[ff1.s_subjcourse.selectedIndex].text;
  ff3.s_subjseqnm.value = ff1.s_subjseq.options[ff1.s_subjseq.selectedIndex].text;

  ff3.action = "/servlet/controller.complete.FinishInputServlet";
  ff3.p_process.value = p_process;
  ff3.submit();
}
function whenSelection(p_action) {
  ff1 = document.form1;

  ff1.p_process.value = 'listPage';
  ff1.p_action.value = p_action;
  ff1.submit();
}
//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 
    <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title11.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
    <!----------------- title �� ----------------->
      <br>
      <!----------------- form ���� ----------------->
      <table class="form_table_out" cellspacing="0" cellpadding="1">
      <form name="form1" method="post" action="/servlet/controller.complete.FinishInputServlet">
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_action"  value="">
        <input type="hidden" name="isOffSubj" value="Y">
        
        <tr> 
          <td align="center"> 
            <table class="form_table_bg" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td align="center"> 
                  <table class="form_table" cellspacing="0" cellpadding="0" width="99%">
                    <tr> 
                      <td><font color="red">��</font> 
                          <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                          <font color="red">��</font> <%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
                          <font color="red">��</font> <%= SelectEduBean.getGrseq(box, true, false)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  --><br>
                          <font color="red">��</font> <%= SelectSubjBean.getSubj(box, true, false, false, true)%><!-- getSubj(RequestBox, isChange, isALL, justOn, justOff)    ���հ���  -->
                          <%= SelectSubjBean.getSubjseq(box, false, true)%><!-- getSubjseq(RequestBox, isChange, isALL)    ��������  -->

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
      </form>  
      </table>
      <!----------------- form �� ----------------->
      <br>
      <!----------------- ã�ƺ��� ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
      <form name="form3" method="post" action="/servlet/controller.complete.FinishInputServlet" enctype="multipart/form-data">
      
        <input type="hidden" name="s_grname">
        <input type="hidden" name="s_subjnm">
        <input type="hidden" name="s_subjseqnm">
        
        <input type="hidden" name="s_grcode"      value="<%=ss_grcode%>">
        <input type="hidden" name="s_gyear"       value="<%=ss_gyear%>">
        <input type="hidden" name="s_grseq"       value="<%=ss_grseq%>">
        <input type="hidden" name="s_subjcourse"  value="<%=ss_subjcourse%>">
        <input type="hidden" name="s_subjseq"     value="<%=ss_subjseq%>">

    
        <input type="hidden" name="p_process"    value="">
        <input type="hidden" name="p_action"     value="">
        <input type="hidden" name="isOffSubj"    value="Y">
        
        <tr> 
          <td align="center"> 
            <table width="21%" height="26" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="center"> 
                  <input name="p_file" type="FILE" class="input" size=70>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </form>  
      </table>
      <!----------------- ã�ƺ��� �� ----------------->
      <br>
      <!----------------- ���, �̸����� ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="930" height="20" align="right"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_apply.gif"  border="0"></a></td>
          <td width=8></td>
          <td align="right" width="32"><a href="javascript:preview()"><img src="/images/admin/button/btn_preview.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ���, �̸����� ��ư �� ----------------->
      <br>
      <br>
      <!----------------- ���ǻ��� ���� ----------------->
      <table cellspacing="0" cellpadding="0" class="heed_table">
        <tr> 
          <td class="text_02">(���ǻ���)</td>
        </tr>
        <tr> 
          <td height="8"></td>
        </tr>
        <tr> 
          <td class="heed_table">1. �������� ����� ���� �������� �����Ͽ� ����� ��</td>
        </tr>
        <tr> 
          <td class="heed_table">2. �������� �ۼ��� [<b><font color="#003AEA">ID, ����, 
            �⼮������,������,����Ʈ����, ��Ÿ����</font></b>]�� ������ 
            ���� ��.</td>
        </tr>
        <tr> 
          <td class="heed_table">3. <font color="red">���� ��� ����� ������ �߻��� �� �ֽ��ϴ�.</font></td>
        </tr>
        <tr>
          <td class="heed_table">4. ���� ������ ������ ��. ( <a href = '/servlet/controller.library.DownloadServlet?p_savefile=OffSubj.xls&p_realfile=OffSubj.xls'><b>��������</b></a>)</td>
        </tr>
        <tr>
          <td class="heed_table">5. ������ ALL�� ������ ��쿡�� ������ �Է��Ͽ��� �մϴ�.</td>
        </tr>
        <tr>
          <td class="heed_table">6. ������ ����ġ�� �������� ���� 100���� ���� ������ �Է��մϴ�.</td>
        </tr>
        <tr>
          <td class="heed_table">7. ������ ���� ��� 0������ �Է��Ͽ��� �մϴ�..</td>
        </tr>
      </table>
      <!----------------- ���ǻ��� �� ----------------->
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/admin/complete/OffSubj.gif" border="0"></td>
        </tr>
      </table>      
      </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>      
</table>
</body>
</html>
