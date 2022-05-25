<%
//**********************************************************
//  1. ��      ��: ���� ������ ����Ʈ
//  2. ���α׷��� : za_SCO_U.jsp
//  3. ��      ��: ������ ����
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 24
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
    	box = RequestManager.getBox(request);
    }
    
    String	p_process	= box.getString("p_process");
    String	p_job		= box.getString("p_job");
    String	p_oid		= box.getString("p_oid");
	String	s_gubun		= box.getString("s_gubun");
	String  v_starting = "";
	    
    SCOData	d	= (SCOData)request.getAttribute("SCOData");
	
   // SelectParam param = new SelectParam("p_mftype", "", false, 1, box.getHttpSession()); 

	v_starting = d.getStarting();

	if(v_starting==null){
		v_starting = "";
	}
	if (v_starting != null && !(v_starting.trim().equals("")) && v_starting.length()>11 )
	{
		v_starting = v_starting.substring(11,v_starting.length());
	}
    
	ErrorManager.systemOutPrintln(box);
%>

	<html>
	<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
	<script language="JavaScript" src="/js/default.js"></script>
	<script language = "javascript" src = "/script/cresys_lib.js"></script>
	<script language = "javascript" src = "/script/scorm_lib.js"></script>
	</head>

	<script language="javascript">
<%	if(p_process.equals("updatePage")) { %>	
		function whenSubmit(){
			document.form1.p_process.value="updateSave";
			document.form1.p_job.value="update";
			document.form1.submit();
		}
		function whenList(){			
			document.form1.p_process.value="PackageContentList";            
			document.form1.submit();
		}

		function searchMember(){
		  var p_key1  = document.form1.p_mastername.value;
		  var p_key2  = 'p_master';
		  var url = "/servlet/controller.library.SearchServlet?p_process=member&p_gubun=name"+"&p_key1="+ p_key1 +"&p_key2="+p_key2;
		  open_window("",url,"0","0","100","100");
		}
		function receiveMember(userid, name, resno, email, cono, jikwi, jikwinm, comp, compnm, tmp1, tmp2, tmp3){
			document.form1.p_mastername.value =  name;
		    document.form1.p_master.value = userid;  
		}
<%	} else {	%>
		function whenList(){
			document.form1.p_process.value="searchList";
			document.form1.submit();
		}
<%	} 	%>
	</script>
	
	<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" >
	<table width="95%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td align="center" valign="top">
	      <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/c_title05.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>	      
	  <!----------------- title �� ----------------->
	      <br>
        <!-------------������ ����-------------------------->
 <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>����</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table> 
        <!--------------������ ��---------------------------->
			      <!----------------- Object ���� ----------------->
	      <table cellspacing="1" cellpadding="5" class="table_out">
	      <FORM name="form1" method="post" action="/servlet/controller.contents.SCOServlet" enctype = "multipart/form-data">
	      		<input type=hidden name="p_process" value="">
	      		<input type=hidden name="p_job" value="update">
	      		<input type=hidden name="s_subj"   value="<%=box.getString("s_subj")%>">
	      		<input type=hidden name="s_gubun"   value="<%=box.getString("s_gubun")%>">
	      		<input type=hidden name="p_action" value="go">
	      		<input type=hidden name="p_oid" value="<%=d.getOid()%>">
	      		<input type=hidden name="p_master" value="<%=d.getMaster()%>">
				<input type=hidden name="p_scolocate"   value="<%=box.getString("p_scolocate")%>">
	        <tr> 
	          <td colspan="11" class="table_top_line"></td>
	        </tr>
	        <tr>
	          <td class="table_title" width="18%"><b>Object ID</b></td>
	          <td class="table_02_2"><%=d.getOid()%></td>
	        </tr>
	        <tr>
	          <td class="table_title" width="18%"><b>SCO ��</b></td>
	          <td class="table_02_2"><input type="text" class="input" name="p_sdesc" size="50" maxlength="100" value="<%=d.getSdesc()%>"></td>
	        </tr>
	        <tr>
	          <td class="table_title" width="18%"><b>�ʱ����ϸ�</b></td>
			  <td class="table_02_2">

			  <table border=0 cellspacing=0 cellpadding=0>
				<tr>
				<td width="300">
	          	<input type="text" class="input" name="p_starting" size="50" maxlength="100" value="<%=v_starting%>"></td>
	          	<td>&nbsp;</td>
				<td>
	          	<OBJECT ID="ETNG_FTP" CLASSID="CLSID:526A654F-760C-49DD-B971-5517ECB98B12"
						CODEBASE="/myclasses/ETNG_FTP.CAB#version=1,0,0,2" width="52" height="22">
								  <param name="FtpAddr"   value="<%= conf.getProperty("ftp.server.ip")%>">
								  <param name="UserID"   value="<%= conf.getProperty("ftp.server.id")%>">
								  <param name="UserPwd"   value="<%= conf.getProperty("ftp.server.pw")%>">
								  <param name="MainDir"     value="/attach/edu/dp/contents/scobject/<%=d.getScolocate()%>">
											   </OBJECT>
</td>
						<td>&nbsp;</td>
						<td>
					
						</td>
				</tr>
				</table>
	          </td>

	        </tr>
	        <tr>
	          <td class="table_title" width="18%"><b>�������</b></td>
	          <td class="table_02_2"><input type="text" class="input" name="p_masteryscore" size="5" maxlength="3" value="<%=d.getMasteryscore()%>"> ��</td>
	        </tr>
	       </FORM>	
	      </table>
	      				
	      <!----------------- ���� ���� �� ----------------->
	      <br>
	      <!----------------- ���� ��ư ���� ----------------->
	      <table cellpadding="0" cellspacing="0" class="table1">
	        <tr>
	          <td align="center" height="20"> 
<%	if(p_process.equals("updatePage")) { %>	
	          	<a href='javascript:whenSubmit()'><img src="/images/admin/button/btn_save.gif" border="0"></a> 
<%	} 	%>	          	
	          	<a href='javascript:whenList()'><img src="/images/admin/button/btn_cancel.gif"  border="0"></a></td>
	        </tr>
	        <tr>
	          <td height="3"></td>
	        </tr>
	      </table>
	      <!----------------- ���� ��ư �� ----------------->
	      <br>
				<div id="Div_WinSearch" class="winsearch_style">
					<table border=0 cellpadding=0 cellspacing=0>
					<tr height="29">
						<td width="5"><img src="/images/fileicon/title_left.gif" width="5" height="29"></td>
						<td width="400" background="/images/fileicon/title_middle.gif" onMousedown="initializedragie()" style="cursor:hand">
							<ilayer width="100%">
								<layer width="100%" onMouseover="dragswitch=1;drag_dropns(showimage)" onMouseout="dragswitch=0">
									<font face="����" color="#FFFFFF" size="2">
									&nbsp;&nbsp;<b>�ʱ����ϼ���</b>
									</font>
								</layer>
							</ilayer>
						</td>
						<td width="5"><img src="/images/fileicon/title_right.gif" width="5" height="29"></td>
					</tr>
					<tr>
						<td background="/images/fileicon/window_border_left.gif"></td>
						<td><IFrame name="Frame_WinSearch" scrolling=no frameborder=0 marginwidth=0 marginheight=0 width=414 height=397></IFrame></td>
						<td background="/images/fileicon/window_border_right.gif"></td>
					</tr>
					<tr height="4"><td colspan="3" background="/images/fileicon/window_border_bottom.gif"></td></tr>
					</table>
				</div>
	    </td>
	  </tr>
	</table>
	</body>
	</html>
<%@ include file = "/learn/library/getJspName.jsp" %>
