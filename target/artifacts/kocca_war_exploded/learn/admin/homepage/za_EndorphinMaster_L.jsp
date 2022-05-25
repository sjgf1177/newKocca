<%
//**********************************************************
//  1. ��      ��: Endorphin
//  2. ���α׷���: za_Endorphin_L.jsp
//  3. ��      ��: ������ ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 8. 03
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.homepage.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");    
    String  v_process   = box.getString("p_process");    
    String  v_content	= "";  
	String  v_isuse		= "";
    String  v_ldate     = "";    

    int     v_seq		=  0;
    int     i           =  0;    

    String  ss_action   = box.getString("s_action");    

	ArrayList list      = null;

	list = (ArrayList)request.getAttribute("endorphinList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
  function endorphin_insert() { 
  	
		if(!confirm("�߰��Ͻðڽ��ϱ�?")) {
  			 return;
		}    	  	       
        if (document.form1.p_content.value == "") {
            alert("������ �Է��ϼ���");
            document.form1.p_content.focus();
            return;
        }
/*
        if (document.form1.p_content.value.length > 100) {
            alert("100���̳��� ������ �Է��ϼ���!");
            document.form1.p_content.focus();
            return;
        }
*/		
        document.form1.target = "_self";
        document.form1.p_process.value = 'Insert';        
        document.form1.submit();
    }

  function endorphin_update(p_seq) { 
  		

		if(!confirm("�����Ͻðڽ��ϱ�?")) {
  			 return;
		}   

        document.form1.target = "_self";
        document.form1.p_process.value = 'Update';        
        document.form1.p_seq.value = p_seq;  
        document.form1.submit();
    }

  function endorphin_delete(p_seq) { 
  	
		if(!confirm("�����Ͻðڽ��ϱ�?")) {
  			 return;
		}    	  	       
		
        document.form1.target = "_self";
        document.form1.p_process.value = 'Delete';        
        document.form1.p_seq.value = p_seq;  
        document.form1.submit();
    }

</SCRIPT>    
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post" action="/servlet/controller.homepage.EndorphinServlet">
    <input type="hidden" name="p_process" value="">
    <input type="hidden" name="p_seq" value="">

<table width="780" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="/images/admin/homepage/tit_endol.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->
      <br>

      <!-------------������ ����-------------------------->
	  <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>������Ǯ ���</td>
          <td width="10%" align="right"><a href="javascript:endorphin_insert()"><img src="/images/admin/button/btn_add.gif" border="0" tabindex=73></a></td>
        </tr>
       <tr> 
         <td height=6></td>
         <td height=6></td>
       </tr>
      </table> 
      <!--------------������ ��---------------------------->

        <table width="97%"  cellpadding="0" cellspacing="1" class="table_out">
		<tr> 
		  <td width="15%" class="table_title"><b>������ ����</b></td>
		  <td width="85%" class="table_02_2"><textarea name="p_content" rows="5" cols="150"></textarea></td>
		</tr>
        </table>
      <br>
	  �� 500�� �̳��� ����Ͻñ� �ٶ��ϴ�. ������ ������ ȭ���� ��ũ�ѵ˴ϴ�.
      <br>

     <!-------------������ ����-------------------------->
	  <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>������Ǯ ���</td>
        </tr>
       <tr> 
         <td height=6></td>
         <td height=6></td>
       </tr>
      </table> 
      <!--------------������ ��---------------------------->

	  <!----------------- �߰� ��ư �� ----------------->
      <table width="575" border="0" cellspacing="1" cellpadding="0" class="table_out">
        <tr> 
          <td width="5%" height="20" class="table_title">No</td>
          <td class="table_title">����</td>
          <td width="10%" class="table_title">���</td>
        </tr>

<%
	for( i = 0 ; i < list.size() ; i++ ){
		DataBox dbox = (DataBox)list.get(i);		 
		
		v_seq		= dbox.getInt("d_seq");  
		v_content	= dbox.getString("d_content");  
		v_ldate		= dbox.getString("d_ldate");
%> 
		<tr> 
		  <td class="table_title"><%=list.size()-i%></td>
		  <td class="table_02_2"><textarea name="p_content<%=v_seq%>" rows="3" cols="160" ><%=v_content%></textarea></td>
		  <td class="table_02_1">
			<a href="javascript:endorphin_update('<%=v_seq%>')"><img src="/images/admin/button/btn_modify.gif" border="0"></a> <a href="javascript:endorphin_delete('<%=v_seq%>')"><img src="/images/admin/button/btn_del.gif" border="0"></a>
		  </td>
		</tr>
<%		
	}
%>
	  </table>
    </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
