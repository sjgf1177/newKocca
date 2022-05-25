<%
//**********************************************************
//  1. ��      ��: ���� ������ ����Ʈ
//  2. ���α׷��� : za_SCOPackage_L.jsp
//  3. ��      ��: ��Ű�� ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 24
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
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

	SCOBean bean = new SCOBean();
    
	ArrayList  list = bean.performScoPackageList(box);
	SCOData d = null;

	ErrorManager.systemOutPrintln(box);	
%>

    <html>
    <head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <link rel="stylesheet" href="/css/admin_style.css" type="text/css">
    <script language = "javascript" src = "/script/cresys_lib.js"></script>
    <script language="JavaScript" src="/js/default.js"></script>
    </head>
    
    <script language="javascript">

	function whenDelete(scolocate){	
		if(confirm("�������� �����ϸ� ������ ����� �� �����ϴ�. \n�������� �����Ͻðڽ��ϱ�?")){
			if(confirm("Ȯ���� ������ ������,�������� �����˴ϴ�. \n�������� �����Ͻðڽ��ϱ�?")){
				document.form1.p_process.value = "deletepackage";
				document.form1.p_scolocate.value = scolocate;	
				document.form1.submit();
			} else {
				return;
			}
		} else {
			return;
		}
	} 

	function whenContent(scolocate){			
			document.form1.p_process.value = "PackageContentList";
			document.form1.p_scolocate.value = scolocate;	
			document.form1.submit();		
	} 

	function whenSelection() {
            document.form1.p_process.value="listPage";                        
            document.form1.submit();
    }

    </script>
    
    <body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" >
    <table width="95%" border="0" cellspacing="0" cellpadding="0" >
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
          <td class=sub_title>����������Ʈ</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table> 
        <!--------------������ ��---------------------------->
      <!----------------- �ڽ� ���� ----------------->
      <table cellspacing="0" cellpadding="3" class="form_table_out">
        <FORM name="form1" method="post" action="/servlet/controller.contents.SCOServlet">
          <input type="hidden" name="p_process"  value="">
          <input type="hidden" name="p_action" value="">
          <input type="hidden" name="p_job"   value="">
          <input type="hidden" name="p_subj"   value="">
          <input type="hidden" name="p_oid"   value="">
		  <input type="hidden" name="p_scolocate"   value="">
          
        <tr>
          <td bgcolor="#C6C6C6" align="center">            
          </td>
        </tr>
        </FORM>
      </table>
      <!----------------- �ڽ� �� ----------------->
      <br>
      <!----------------���̺� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="3" class="table_top_line"></td>
        </tr>
        <tr>
          <td class="table_title" width="6%"><b>No</b></td>
          <td class="table_title" width="60%"><b>��Ű�� ��</b></td> 
		  <td class="table_title" width="20%"><b>�����</b></td> 
          <td class="table_title" width="14%"><b>���</b></td>
        </tr>

		<%
        for (int i=0; i<list.size(); i++) {
			d = (SCOData)list.get(i);  
		%>

        <tr>
          <td class="table_01" align=center><%=(i+1)%></td>
          <td class="table_02_2" align=center><a href="javascript:whenContent('<%=d.getScolocate()%>')"><%=d.getScoTitle()%></a></td>
		  <td class="table_02_1" align=center><%=FormatDate.getFormatDate(d.getLdate(),"yyyy/MM/dd HH")%>��</td>
          <td class="table_02_1" align=center><a href="javascript:whenDelete('<%=d.getScolocate()%>')"><img src='/images/admin/button/b_delete.gif' border='0'></a></td>          
        </tr>

		<% 
		}
		%>
      </table>
      <!----------------- ���̺� �� ----------------->
      <br>
    </td>
  </tr>
    </table>
	<table border=0 width=100%><tr><td align=center><a href="javascript:whenSelection()"><img src=/images/admin/button/btn_list.gif border=0></a></td></tr></table>
    </body>
    </html>
<%@ include file = "/learn/library/getJspName.jsp" %>