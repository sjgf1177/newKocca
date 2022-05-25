<%
//**********************************************************
//  1. ��      ��: PROJECT ���� �� LIST
//  2. ���α׷���: za_ProjectEndSubmit_I.jsp
//  3. ��      ��: ����Ʈ ���� �� ������
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 8. 30
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
    String  v_projseq   = box.getString("p_projseq");    
    String  v_ordseq    = box.getString("p_ordseq");
    String  v_userid    = box.getString("p_userid");
	String  v_name      = box.getString("p_name");
    String  v_ptitle    = box.getString("p_ptitle");     // ����Ʈ ����
    String  v_assign    = box.getString("p_assign");     // ���������� flag
    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    // ���
    function projectJudge() {
        if (blankCheck(document.form1.p_title.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_title.focus();
            return;
        }                
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }   
                
        // ����üũ
        //if(!numeric_chk(document.form1.p_score_mas)) return;

        document.form1.p_contentsbyte.value = realsize(document.form1.p_contents.value);   
        document.form1.action='/servlet/controller.study.ProjectAdminServlet?g_subj=<%=v_subj%>&g_year=<%=v_year%>';
        document.form1.p_process.value = 'ProjectEndSubmit';
        document.form1.submit();        
    }
-->
</SCRIPT>    
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post" enctype = "multipart/form-data">
    <input type="hidden" name="p_process"   value="<%=v_process%>">
    <input type="hidden" name="p_subj"      value="<%=v_subj%>">
    <input type="hidden" name="p_subjnm"    value="<%=v_subjnm%>">
    <input type="hidden" name="p_year"      value="<%=v_year%>">
    <input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
    <input type="hidden" name="p_ordseq"    value="<%=v_ordseq%>">
    <input type="hidden" name="p_projseq"   value="<%=v_projseq%>"> 
    <input type="hidden" name="p_contentsbyte"   >
	<input type="hidden" name="p_userid"   value="<%=v_userid%>" >
	<input type="hidden" name="p_assign"   value="<%=v_assign%>" >	
	<input type="hidden" name="p_ptitle"   value="<%=v_ptitle%>" >	

	
  <table width="730" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
    <tr> 
    <td> 
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
          <tr> 
            <td align="center" bgcolor="#FFFFFF">
			<!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/tit_reportman.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>  
	          <!----------------- title �� -----------------> 
            <br>
              <!----------------- Ÿ��Ʋ ----------------->
                <table width="97%" border="0" cellpadding="0" cellspacing="0">
                  <tr> 
        		    <td width="305"><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">
                    <%=v_subjnm%> &gt; <%=StringManager.cutZero(v_subjseq)%>����
                    &gt; <b><%=v_ptitle%></b>
                    </td>
                  </tr>
                </table>
           
              <br>
              <!----------------- project ������ ���� ----------------->
              <table width="100%" class="table_out" border=0  cellspacing="1" cellpadding="5">
                <tr> 
                  <td colspan="2" class="table_top_line"></td>
                </tr>
                <tr> 
                  <td colspan="2" height="25" class="table_01"><b>����Ʈ ���⳻��</b></td>
                </tr>
                <tr> 
                  <td width="20%" height="25" class="table_title"><b>������</b></td>
                  <td class="table_02_2"> <%=v_name%></td>
                </tr>                
                <tr> 
                  <td width="20%" height="25" class="table_title"><b>����</b></td>
                  <td class="table_02_2"> <input size="90" maxlength="50" name="p_title" class="input" value=""></td>
                </tr>
                <tr> 
                  <td class="table_title" height="25"><b>����</b></td>
                  <td class="table_02_2">  <textarea name="p_contents" cols="85" rows="15" ></textarea>
                  </td>
                </tr>
                <tr> 
                  <td class="table_title" height="25"><b>÷������</b></td>
                  <td class="table_02_2"> 
                      <input type="file" name="p_file1" maxlength="30" size="60" class="input"> 
                  </td>
                </tr>                
              </table>
              <table border="0" cellspacing="0" cellpadding="0">
			  <tr>
                  <td>&nbsp;</td>
                  <td></td>
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td> <a href="javascript:projectJudge()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
                  <td width=8></td>
                  <td> <a href="javascript:javascript:self.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
                </tr>
              </table>
              <!----------------- project ������ �� ----------------->
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
