<%
//**********************************************************
//  1. ��      ��: �н���������
//  2. ���α׷���: za_StudyControl_L.jsp
//  3. ��      ��: �н���������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: S.W.Kang 2005. 02. 22
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %> 
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    
	//DataBox dbox = (DataBox)request.getAttribute("StudyControl");

    ArrayList list1 = (ArrayList)request.getAttribute("StudyControlExp"); 		//�н���������

    String  ss_gubun     = box.getString("p_gubun");            //����
	
	int		v_seq	= 0;

%>
<html>	
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="Javascript">
<!--

	//�н��������� ����Ʈ ȭ�� ��ȸ��
	function whenSubmit() {
		document.form1.p_process.value="ExpListPage";
		document.form1.submit();
	}

	//�н��������� �����ڸ� ����Ҷ�
	function whenSave(sc) {

		  if(document.form1.s_company.value == "ALL"){
			alert("ȸ�縦 �����Ͽ� �ֽʽÿ�.");
			document.form1.s_company.focus();
			return;
		  }

		  if(document.form1.p_gubun.value == "ALL"){
			alert("������ �����Ͽ� �ֽʽÿ�.");
			document.form1.p_gubun.focus();
			return;
		  }

		  if( blankCheck(document.form1.p_userid.value) ){
				alert("���̵� �Է��Ͻʽÿ�.");
				return;
		  }

		  document.form1.p_process.value= "ExpInsert";
		  document.form1.submit();
	}

	//�н��������� �����ڸ� �����Ҷ�
	function whenUpdate(seq) {
		document.form1.p_seq.value		 = seq;
		document.form1.p_process.value = "ExpUpdate";
		document.form1.submit();
	}

	//�н��������� �����ڸ� �����Ҷ�
	function whenDelete(seq) {
		if (confirm("�����Ͻðڽ��ϱ�?")) {
			document.form1.p_seq.value 		= seq;
			document.form1.p_process.value 	= "ExpDelete";
			document.form1.submit();
		}
	}

//��ڴ�� �˻�
function searchMuser() {
  var p_gubun = 'name';
  var p_key1  = '';
  var p_key2  = 'p_muser';
  var url = "/servlet/controller.library.SearchServlet?p_process=member";
  open_window("",url,"0","0","100","100");
}

// ��� �˻� �� ó��
function receiveMember(userid, name, resno, email, cono, jikwi, jikwinm, comp, compnm, tmp1, tmp2, tmp3){
    document.form1.p_userid.value   = userid;
}
-->
</script>
</head>
<body topmargin=0 leftmargin=0>
<form name="form1" method="post" action="/servlet/controller.system.StudyControlServlet">
<input type="hidden" name="p_process" 	value="">
<input type="hidden" name="p_seq" 		value="">

<table width="780" border="0" cellspacing="0" cellpadding="0">
	<tr>
    	<td align="center">
			<table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        		<tr> 
          			<td><img src="/images/admin/system/unite_title22.gif" ></td>
          			<td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        		</tr>
      		</table>
		   	<br>
	   		<table width="97%" cellpadding="1" cellspacing="0" class="form_table_out">
        		<tr> 
          			<td align="center">
          				<table width="97%" cellpadding="0" cellspacing="0" class="form_table_bg">
              				<tr> 
                				<td height="7"></td>
              				</tr>
              				<tr> 
                			  <td>
                				<table  border="0" cellspacing="0" cellpadding="0">
                    			  <tr> 
                      				<td> &nbsp; 
										<%= SelectCompanyBean.getCompany(box, false, true)%><!-- getCompany(RequestBox, isChange, isALL)    ȸ�� -->
									</td>
                      				<td width=10></td>
                      				<td align="right"> ���� </td>
                      				<td>&nbsp; <%=CodeConfigBean.getCodeGubunSelect("0049","",1,"p_gubun",ss_gubun,"",2)%>
									</td>
                      				<td width=10></td>
                      				<td><a href="javascript:whenSubmit();"><img src="/images/admin/button/b_go.gif"  border="0"></a></td>
                      				<td width=10></td>
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
          			<td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          			<td class=sub_title>�н� �������� ������ ���</td>
            		<td align="right"><a href="javascript:whenSave()"><img src="/images/admin/button/btn_add.gif" border="0" tabindex=73></a></td>
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
            		<td width="80" height="50" class="table_title">���̵�</td>
            		<td width="200" class="table_02_1"><input type="text" name="p_userid" class="input" size="10" maxlength="20" readonly> <a href="javascript:searchMuser()" tabindex="21"><img src="/images/admin/button/btn_imsearch.gif" border="0" valign="middle"></a></td>
            		<td width="80" height="50" class="table_title">���ܻ���</td>
            		<td width="200" class="table_02_2"><input type="text" name="p_reason" class="input" size="50" maxlength="40">
          		</tr>
        	</table>
      		<br>
	  		<br>
			<!--------------�н����� ���� ����Ʈ------------------>
			<table width="97%" cellpadding="0" cellspacing="1" class="table_out">
				<tr>
					<td class="table_title" width="20%" height="20">ȸ��</td>
					<td class="table_title" width="10%">����</td>
					<td class="table_title" width="10%">���̵�</td>
					<td class="table_title" width="10%">����</td>
					<td class="table_title" width="40%">���ܻ���</td>
					<td class="table_title" width="10%">���</td>
				</tr>
				<%
				if (list1.size() != 0) {

					for (int i=0 ; i < list1.size() ; i++) {
						DataBox dbox = (DataBox)list1.get(i);
						v_seq	= dbox.getInt("d_seq");						
				%>
				<tr>
					<td class="table_02_1" width="20%"><%= dbox.getString("d_companynm")%></td>
					<td class="table_02_1" width="10%"><%=CodeConfigBean.getCodeName("0049",dbox.getString("d_gubun")) %></td>
					<td class="table_02_1"><%= dbox.getString("d_userid")%></td>
					<td class="table_02_1"><%= dbox.getString("d_usernm")%></td>
					<td class="table_02_2"><%= dbox.getString("d_reason")%></td>
					<td class="table_02_1">
						<!--a href="javascript:whenUpdate('<%=v_seq%>','0')"><img src="/images/admin/button/btn_save.gif" border="0"></a-->
						<a href="javascript:whenDelete('<%=v_seq%>')"><img src="/images/admin/button/btn_del.gif" border="0"></a>
					</td>
				<%
					}
				}else {
				%>
				<tr>
                	<td class="table_02_1" colspan="7">��ϵ� ������ �����ϴ�</td>
              	</tr>
              	<%
              	}
              	%>
			</table>
      		<br>
    	</td>
  	</tr>
  	<tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
</body>
</html>