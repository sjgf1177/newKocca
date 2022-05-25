<%
//**********************************************************
//  1. ��      ��: PROJECT JUDGE
//  2. ���α׷���: za_ProjectSubmit.jsp
//  3. ��      ��: ����Ʈ ���� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 7. 29
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
    String  v_returnprocess   = box.getString("p_returnprocess");    
    String  v_subj      = box.getString("p_subj");
    String  v_subjnm    = box.getString("p_subjnm");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");
    String  v_ordseq    = box.getString("p_ordseq");
    String  v_lesson    = box.getString("p_lesson");
    String  v_projgrp   = box.getString("p_projgrp");
    String  v_seq       = box.getString("p_seq");
    String  v_reptype   = box.getString("p_reptype");    
    String  v_title     = "";  
    String  v_contents  = "";
    String  v_title2    = "";  
    String  v_contents2 = "";           
    String  v_upfile    = "";
    String  v_upfile_value="";
		String  v_realfile  = "";
		String  v_upfilesize= "";
    String  v_tucontents= "";
    String  v_userid    = "";
    String  v_name      = "";
		String  v_isret	    = "";
		String  v_retreason = "";     
		String  v_retuserid = "";
    String  v_retdate   = "";
    int     v_score     =  0;
    int     v_score2    =  0;
    int     v_wreport   =  0;
    int     i           =  0;    
    ProjectData data1   = null;
    ArrayList list      = null;
    //DEFINED class&variable END
    
    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getString("s_grseq");         //��������
    String  ss_uclass    = box.getString("s_uclass");        //�����з�
    String  ss_subjcourse= box.getString("s_subjcourse");    //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");       //���� ����
    String  ss_action    = box.getString("s_action");   
    //DEFINED in relation to select END    
    
    data1 = (ProjectData)request.getAttribute("projectSubmitOpenPage");
    v_title       =  data1.getTitle();
    v_contents    =  StringManager.replace(data1.getContents(),"\n;","<br>");   
    v_upfile      =  data1.getUpfile();
		v_realfile    =  data1.getRealfile();
		v_upfilesize  =  data1.getUpfilesize();
    v_tucontents  =  data1.getTucontents();
    v_score       =  data1.getScore();
    v_score2      =  data1.getScore2();
		v_isret       =  data1.getIsret();
		v_retreason   =  data1.getRetreason();
    v_retuserid   =  data1.getRetuserid();
		v_retdate     =  data1.getRetdate();
    v_retdate     =  FormatDate.getFormatDate(v_retdate,"yyyy/MM/dd");	    
    v_wreport     =  data1.getWreport();
    v_title2      =  data1.getTitle2();
    v_contents2   =  data1.getContents2();    
	
    if(v_upfile.length() == 0){    v_upfile   = "";    
    }else{ v_upfile_value =    v_upfile;
		//v_upfile_value = v_projgrp + v_upfile.substring(v_upfile.lastIndexOf("."));    
	}      
    list = (ArrayList)request.getAttribute("projectSubmitListOpen");
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
        if (parseInt(document.form1.h_score2.value) < parseInt(document.form1.p_score_mas.value)) {
            alert(document.form1.h_score2.value+" �������� Ů�ϴ�.");
            document.form1.p_score_mas.focus();
            return;
        }
        
        // ����üũ
        if(!numeric_chk(document.form1.p_score_mas)) return;
            
        document.form1.action='/servlet/controller.study.ProjectAdminServlet';
        document.form1.p_process.value = 'ProjectJudgeAtOpenWin';
        document.form1.submit();        
    }
-->
</SCRIPT>    
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_returnprocess" value="<%=v_returnprocess%>">
    <input type="hidden" name="s_action"    value="<%=ss_action%>">     <!--in relation to select-->
    <input type="hidden" name="s_grcode"    value="<%=ss_grcode%>">     <!--in relation to select-->
    <input type="hidden" name="s_gyear"     value="<%=ss_gyear%>">      <!--in relation to select-->
    <input type="hidden" name="s_grseq"     value="<%=ss_grseq%>">      <!--in relation to select-->
    <input type="hidden" name="s_uclass"    value="<%=ss_uclass%>">     <!--in relation to select-->
    <input type="hidden" name="s_subjcourse"value="<%=ss_subjcourse%>"> <!--in relation to select-->
    <input type="hidden" name="s_subjseq"   value="<%=ss_subjseq%>">    <!--in relation to select-->         
    <input type="hidden" name="p_subj"      value="<%=v_subj%>">
    <input type="hidden" name="p_subjnm"    value="<%=v_subjnm%>">
    <input type="hidden" name="p_year"      value="<%=v_year%>">
    <input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
    <input type="hidden" name="p_ordseq"    value="<%=v_ordseq%>">
    <input type="hidden" name="p_lesson"     value="<%=v_lesson%>">      
    <input type="hidden" name="p_projgrp"   value="<%=v_projgrp%>"> <!-- �ݷ��� -->
    <input type="hidden" name="p_seq"       value="<%=v_seq%>">
    <input type="hidden" name="p_reptype"   value="<%=v_reptype%>">              
    <input type="hidden" name="h_score2"    value="<%=v_score2%>">      <!--set ������ ��������-->     


                
  <table width="730" border="0" cellpadding="0" cellspacing="10" class="table_02_1">
    <tr> 
    <td> 
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
          <tr> 
            <td align="center" bgcolor="#FFFFFF"> 
            
              <!----------------- Ÿ��Ʋ ----------------->
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td  height=30><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">
                <b><%=v_subjnm%> ���� &gt; <%=StringManager.cutZero(v_subjseq)%>��</b></td>
              </tr>
            </table>
           
              <!----------------- ���� ���� ���� ----------------->
              <table width="100%" class="table_out" border=0  cellspacing="1" cellpadding="5">
                <tr> 
                  <td colspan="2" class="table_top_line"></td>
                </tr>
                <tr> 
                  <td colspan="2" height="25" class="table_01"><b>���� ����</b></td>
                </tr>
                <tr> 
                  <td width="20%" height="25" class="table_title"><b>����</b></td>
                  <td class="table_02_2"><b><%=v_title2%></b></td>
                </tr>
                <tr> 
                  <td class="table_title" height="25"><b>����</b></td>
                  <td class="table_02_2"><%= StringManager.replace(v_contents2,"\r\n","<br>") %></td>
                </tr>
              </table><br>
              
              <!----------------- project ������ ���� ----------------->
              <table width="100%" class="table_out" border=0  cellspacing="1" cellpadding="5">
                <tr> 
                  <td colspan="2" class="table_top_line"></td>
                </tr>
                <tr> 
                  <td colspan="2" height="25" class="table_01"><b>����Ʈ ���⳻��</b></td>
                </tr>
                <tr> 
                  <td width="20%" height="25" class="table_title"><b>����</b></td>
                  <td class="table_02_2"><b><%=v_title%></b></td>
                </tr>
                <tr> 
                  <td class="table_title" height="25"><b>����</b></td>
                  <td class="table_02_2"><%= StringManager.replace(v_contents,"\n","<br>") %></td>
                </tr>
                <tr> 
                  <td class="table_title" height="25"><b>÷������</b></td>
                  <td class="table_02_2"> <% if(v_upfile.length() > 0){ %> <a href = '/servlet/controller.library.DownloadServlet?p_year=<%=v_year%>&p_subj=<%=v_subj%>&p_savefile=<%= v_upfile %>&p_realfile=<%= v_upfile_value %>'><%=v_realfile%>
                   (<b><%=v_upfilesize%></b> Byte)</a> <% } %> </td>
                </tr>
                <tr> 
                  <td class="table_title" height="25"><b>����</b></td>
                  <td class="table_02_2"> 
                    <b><%=v_score2%></b>�� ������ <font color=red>������</font>:<input name="p_score_mas" type="text" class="input" size="5" value="<%=v_score%>">�� &nbsp; (�ذ���ġ:<b><%=v_wreport%></b>%)
                  </td>
                </tr>
                <tr> 
                  <td class="table_title" height="25"><b>÷������</b></td>
                  <td class="table_02_2"> <textarea name="p_tucontents" cols="80" rows=15"><%=v_tucontents%></textarea> 
                  </td>
                </tr>
                <tr> 
                  <td rowspan="2" class="table_title"><b>�ݷ�����</b></td>
                  <td height="25" class="table_02_2"> <input type="checkbox" name="p_isret" value="Y" <%if (v_isret.equals("Y")) out.println("checked");%>>
                    �ݷ��ϱ� 
                    <%if (v_isret.equals("Y")) {%> <font color="#999999">[�ݷ��� : <b><%=v_retuserid%></b> , �ݷ����� : <b><%=v_retdate%></b>]</font>  <%}%>
                  <br>
                  �ذ������� ������� ��� �ݷ��ϱ⸦ ������ �ڵ� '0'�� ó���˴ϴ�.
                  <textarea name="p_retreason" cols="80" rows=5"><%=v_retreason%></textarea> 
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
