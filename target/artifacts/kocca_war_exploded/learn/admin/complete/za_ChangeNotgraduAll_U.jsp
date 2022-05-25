<%
//**********************************************************
//  1. ��      ��: �̼����������
//  2. ���α׷���: za_ChangeNotgraduAll_U.jsp
//  3. ��      ��: �̼����������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005-8-18
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");    
    String  v_process   = box.getString("p_process");    
    String  v_subj      = box.getString("p_subj");
    String  v_subjnm    = box.getString("p_subjnm");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");
	String  v_userid	= box.getString("p_userid");
	String  v_name  	= box.getString("p_name");
	String  v_jikwinm	= box.getString("p_jikwinm");
	String  v_compnm	= box.getString("p_compnm");
	String  v_isclosed  =  box.getString("p_isclosed");
	String  v_notgraduetc =  box.getString("p_notgraduetc");
	String  v_frompage =  box.getString("p_frompage"); //���ռ���ó������ ȣ��� "off"
	String  v_notgraducds   = box.getString("p_notgraducds");   // ���õ� id

    
    String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getStringDefault("s_grseq","ALL");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����
    String  ss_action    = box.getString("s_action");   
    //DEFINED in relation to select END    
    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function projectJudge() {
		if (document.form1.p_notgraducd.value=='') {
			alert('�̼��� ������ �����ϼ���.');
			return;
		}
	
        document.form1.action='/servlet/controller.complete.FinishServlet';
        document.form1.p_process.value = 'changeNotgraduSave';
        document.form1.submit();        
    }
-->
</SCRIPT>    
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
	<input type="hidden" name="p_process"   value="<%=v_process%>">
    <input type="hidden" name="s_grcode"      value="<%=ss_grcode%>">
  	<input type="hidden" name="s_gyear"       value="<%=ss_gyear%>">
  	<input type="hidden" name="s_grseq"       value="<%=ss_grseq%>">
  	<input type="hidden" name="s_upperclass"  value="<%=ss_upperclass%>">
  	<input type="hidden" name="s_middleclass" value="<%=ss_middleclass%>">
  	<input type="hidden" name="s_lowerclass"  value="<%=ss_lowerclass%>">
  	<input type="hidden" name="s_subjcourse"  value="<%=ss_subjcourse%>">
  	<input type="hidden" name="s_subjseq"     value="<%=ss_subjseq%>">    
	
    <input type="hidden" name="p_subj"      value="<%=v_subj%>">
    <input type="hidden" name="p_year"      value="<%=v_year%>">
    <input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
	<input type="hidden" name="p_userid"    value="<%=v_userid%>">
	<input type="hidden" name="p_isclosed"  value="<%=v_isclosed%>">
	<input type="hidden" name="p_subjnm"    value="<%=v_subjnm%>">
	<input type="hidden" name="p_frompage"    value="<%=v_frompage%>">
	<input type="hidden" name="p_notgraducds"    value="<%=v_notgraducds%>">
	

  <table width="530" border="0" cellpadding="0" cellspacing="10" class="table_02_1">
    <tr> 
    <td> 
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
          <tr> 
            <td align="center" bgcolor="#FFFFFF"> 
              <br>

              <!----------------- project ������ ���� ----------------->
              <table class="table_out" cellspacing="1" cellpadding="5">
                <tr> 
                  <td colspan="2" class="table_top_line"></td>
                </tr>
                <tr> 
                  <td colspan="2" height="25" class="table_01"><b>�̼��� �������� �ϰ�ó��</b></td>
                </tr>
                <tr> 
                  <td width="20%" height="25" class="table_title"><b>����</b></td>
                  <td class="table_02_2"><%=v_subjnm%> <%=Integer.parseInt(v_subjseq)%> ����</td>
                </tr>
                <tr> 
                  <td class="table_title" height="25"><b>����</b></td>
                  <td class="table_02_2"><%=CodeConfigBean.getCodeGubunSelect ("0028", "", 1, "p_notgraducd", "", "", 1)%></td>
                </tr>
              </table>
              <table width="95%" border="0" cellspacing="0" cellpadding="0">
			      <tr>
                  <td height=6></td>
                  <td height=6></td>
                  <td width="32" height=6></td>
                </tr>
                <tr> 
                  <td width="443" align="right" > <a href="javascript:projectJudge()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
                  <td width=8></td>
                  <td  align="right"> <a href="javascript:javascript:self.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
                </tr>
              </table>
              <!----------------- project ������ �� ----------------->
              <!----------------- �ݱ� ��ư ���� ----------------->
              <!----------------- �ݱ� ��ư �� ----------------->
              <br>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>    
</table>
</form>
</body>
</html>
