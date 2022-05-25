<%
//**********************************************************
//  1. ��      ��: PROJECT CORRECTION
//  2. ���α׷���: za_TutorCorrection_L.jsp
//  3. ��      ��: ����Ʈ ÷�� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 7. 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.tutor.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");    
    String  v_process   = box.getString("p_process");    
	String  v_subj		= "";
	String  v_subjnm	= "";
    String  v_comments  = "";  
    String  v_ldate     = "";    

	String  ss_action		= box.getString("s_action");

    int     v_seq =  0;
    int     i           =  0;    
    
    ArrayList list      = null;
    //DEFINED class&variable END

    if (ss_action.equals("go")) {    //go button ���ýø� list ���
		list = (ArrayList)request.getAttribute("correctionList");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">

    function whenSelection(p_action) {
	    if (p_action=="go"){

/*			if (document.form1.s_subjcourse.value == "----") {
				alert("������ �����ϼ���");
				document.form1.s_subjcourse.focus();
				return;
			}
*/
            opener.top.ftop.setPam();
		}
		
        document.form1.s_action.value = p_action;
        document.form1.target = "_self";
        document.form1.p_process.value = 'CorrectionList';  
        document.form1.submit();
    }
    

  function correction_insert() { 
  	
		if(!confirm("�߰��Ͻðڽ��ϱ�?")) {
  			 return;
		}  
		
        if (document.form1.s_subjcourse.value == "----") {
            alert("������ �����ϼ���");
            document.form1.s_subjcourse.focus();
            return;
        }

        if (document.form1.p_comment.value == "") {
            alert("������ �Է��ϼ���");
            document.form1.p_comment.focus();
            return;
        }
        
		if (realsize(document.form1.p_comment.value) > 500) {
            alert("������ �ѱ۱��� 500�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_comment.focus();
            return;
        } 
		
        document.form1.target = "_self";
        document.form1.p_process.value = 'CorrectionInsert';        
        document.form1.submit();
    }

  function correction_update(p_seq, p_subj) { 
  	
		if(!confirm("�����Ͻðڽ��ϱ�?")) {
  			 return;
		}
		
        document.form1.target = "_self";
        document.form1.p_process.value = 'CorrectionUpdate';        
        document.form1.p_seq.value = p_seq;
        document.form1.e_subj.value = p_subj;  
        document.form1.submit();
    }

  function correction_delete(p_seq) { 
  	
		if(!confirm("�����Ͻðڽ��ϱ�?")) {
  			 return;
		}    	  	       
		
        document.form1.target = "_self";
        document.form1.p_process.value = 'CorrectionDelete';        
        document.form1.p_seq.value = p_seq;  
        document.form1.submit();
    }

</SCRIPT>    
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post" action="/servlet/controller.tutor.TutorAdminMainServlet">
    <input type="hidden" name="p_process" value="">
    <input type="hidden" name="p_seq" value="">
    <input type="hidden" name="e_subj" value="">
    <input type="hidden" name="s_action" value="">

<table width="780" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/tutor/tit_new_ch.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>

		<table width="97%" cellpadding="1" cellspacing="0" class="form_table_out">
			<tr> 
				<td align="center">
					<table width="970" cellpadding="0" cellspacing="0" class="form_table_bg">
						<tr> 
							<td height="7"></td>
						</tr>
						<tr> 
						  <td>
							<table  border="0" cellspacing="0" cellpadding="0">
							  <tr> 
								<td>&nbsp; 
								 <%= SelectSubjBean.getSubj(box, true, true)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
								</td>
								<td width="10%" align="right"><a href="javascript:whenSelection('go');"><img src="/images/admin/button/b_go.gif"  border="0"></a></td>
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
		</table>
		<br>
		<!-------------������ ����-------------------------->
		<table width="97%" border="0" cellspacing="0" cellpadding="0">
			<tr> 
				<td width="1%"><img src="/images/admin/common/icon.gif"></td>
				<td class=sub_title>÷�� ���</td>
				<td align="right"><a href="javascript:correction_insert()"><img src="/images/admin/button/btn_add.gif" border="0"></a></td>
				<td width=8></td>
			</tr>
			<tr> 
				<td height=6></td>
				<td height=6></td>
			</tr>
		</table> 
		<!--------------������ ��---------------------------->

		 <table width="97%"  cellpadding="0" cellspacing="1" class="table_out">
			<tr> 
			  <td width="20%" height="25" class="table_title"><b>÷���߰�</b></td>
			  <td width="80%" class="table_02_2"><textarea name="p_comment" rows="5" cols="155"></textarea></td>
			</tr>
		</table>
		<br>

		<!-------------������ ����-------------------------->
		<table width="97%" border="0" cellspacing="0" cellpadding="0">
			<tr> 
				<td width="1%"><img src="/images/admin/common/icon.gif" ></td>
				<td class=sub_title>÷�� ���</td>
				<td width=8></td>
			</tr>
			<tr> 
				<td height=6></td>
				<td height=6></td>
			</tr>
		</table> 
		<!--------------������ ��---------------------------->
		 <table width="97%"  cellpadding="0" cellspacing="1" class="table_out">
			<tr> 
			  <td width="5%"	class="table_title"><b>No.</b></td>
			  <td width="20%"	class="table_title">����</td>
			  <td width=""		class="table_title">����</td>
			  <td width="10%"	class="table_title">���</td>
			</tr>
<%
	if (ss_action.equals("go")) {    //go button ���ýø� list ���

		for( i = 0 ; i < list.size() ; i++ ){
			DataBox dbox = (DataBox)list.get(i);		 
			
			v_seq		= dbox.getInt("d_seq");
			v_subj		= dbox.getString("d_subj");
			v_subjnm	= GetCodenm.get_subjnm(v_subj);
			v_comments	= dbox.getString("d_comments");  
			v_ldate		= dbox.getString("d_ldate");
%>
			<tr> 
			  <td width="5%" height="25" class="table_title"><b><%=list.size()-i%></b></td>
			  <td width="20%" class="table_02_2"><%=v_subjnm%></td>
			  <td class="table_02_2"><textarea name="p_comments<%=v_seq%>" rows="3" cols="160" ><%=v_comments%></textarea></td>
			  <td width="10%" class="table_02_1"><a href="javascript:correction_update('<%=v_seq%>', '<%=v_subj%>')"><img src="/images/admin/button/btn_modify.gif" border="0"></a> <a href="javascript:correction_delete('<%=v_seq%>')"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
			</tr>
<%		
		}

		if(list.size() == 0){ 
%>
            <tr> 
				<td align="center" class="table_02_1" height="25" colspan="4">��ϵ� ������ �����ϴ�</td>
            </tr>
<%		}
	}
%>
	  </table>
	  <table width="97%" border="0" cellspacing="0" cellpadding="0">
		<tr height="30">                 
		  <td align="right"> <a href="javascript:javascript:self.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
		</tr>
	  </table>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>    
</table>
</form>
</body>
</html>
