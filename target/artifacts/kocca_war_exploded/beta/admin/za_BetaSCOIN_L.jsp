<%
//**********************************************************
//  1. ��      ��: ���� ������ ����Ʈ
//  2. ���α׷��� : za_SCOIN_L.jsp
//  3. ��      ��: ���� ������ ��� ����Ʈ
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
    	box = RequestManager.getBox(request);    }
	
    String	p_scolocate	= box.getString("p_scolocate");

	ArrayList  list = (ArrayList)request.getAttribute("ScoObjectList");  
	SCOData d = null;
	Hashtable   ht;
	String v_depthimg	= "";
	String v_masteryscore = "";
	String v_objdelbutton = "";
	String v_object_title = "";

	ErrorManager.systemOutPrintln(box);

	d = (SCOData)list.get(0);
	
   %>

    <html>
    <head>
    <title></title>
	<META HTTP-EQUIV="Pragma" CONTENT="No-Cache">
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <link rel="stylesheet" href="/css/admin_style.css" type="text/css">
    <script language = "javascript" src = "/script/cresys_lib.js"></script>
	<script language = "javascript" src = "/script/scorm_metadata.js"></script>
    <script language="JavaScript" src="/js/default.js"></script>

	<script language="javascript">
       
	function whenUpdate(oid,scolocate){		
		document.form1.p_process.value = "updatePage";
		document.form1.p_job.value = "update";		
		document.form1.p_oid.value = oid;
		document.form1.p_scolocate.value = scolocate;
		document.form1.submit();
	} 

	function whenDelete(oid,scolocate){	
		
		if(confirm("�������� �����Ͻðڽ��ϱ�?")){
			document.form1.p_process.value = "deletesco";
			document.form1.p_job.value = "delete";
			document.form1.p_oid.value = oid;	
			document.form1.p_scolocate.value = scolocate;	
			document.form1.submit();
		} else {
			return;
		}
	} 

	function whenSelection() {
            document.form1.p_process.value="listPage";                        
            document.form1.submit();
    }
	
	function Sco_View(oid){	
	
		window.open("/learn/admin/contents/scorm/za_SCO_Contents_V.jsp?oid="+oid+"&s_gubun=1", "SCOVIEW", "width=670,height=730,scrollbars=yes,toolbars=no,resizable=yes");	
    }

    </script>

    </head>
    
    <body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" oncontextmenu="return false" ondragstart="return false" onselectstart="return false"  >
  <table width="95%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
         
          <td background="/images/admin/community/title_bg.gif"><img src="/images/admin/system/system_sco1.gif" width="138" height="36" border="0"></td>
  
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- �ڽ� ���� ----------------->
      <table cellspacing="0" cellpadding="3" class="form_table_out">
        <FORM name="form1" method="post" action="/servlet/controller.contents.SCOServlet">
          <input type="hidden" name="p_process"  value="">
          <input type="hidden" name="p_action" value="">
          <input type="hidden" name="p_job"   value="">
          <input type="hidden" name="p_subj"   value="">
		  <input type="hidden" name="s_gubun"   value="">
          <input type="hidden" name="p_oid"   value="">
		  <input type="hidden" name="p_scolocate"   value="">
         
      
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7" width="99%"></td>
              </tr>
			  
              <tr>
                <td align="left" width="99%" >&nbsp;&nbsp;
                  <b>����������:</b>  <b><font color=blue><%= d.getScoTitle()%></font></b>&nbsp;&nbsp;&nbsp;&nbsp;

				   <OBJECT ID="ALEX_FTP" CLASSID="CLSID:796DEC5E-5851-4EE8-91D3-72E69BD270BA"
						CODEBASE="/myclasses/ALEX_FTP.CAB#version=1,0,0,2" width="52" height="22">
								  <param name="FtpAddr"   value="<%= conf.getProperty("ftp.server.ip")%>">
								  <param name="UserID"   value="<%= conf.getProperty("ftp.server.id")%>">
								  <param name="UserPwd"   value="<%= conf.getProperty("ftp.server.pw")%>">
								  <param name="MainDir"     value="<%= d.getScolocate()%>">
				   </OBJECT>

                </td>
              </tr>
              <tr>
                <td height="7" width="99%"></td>
              </tr>
            </table>
          </td>
        </tr>
        </FORM>
      </table>
      <!----------------- �ڽ� �� ----------------->
      <br>
      <!----------------���̺� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="6" class="table_top_line"></td>
        </tr>
        <tr>
          <td class="table_title" width="6%"><b>No</b></td>
          <td class="table_title" width="16%"><b>Sco ID</b></td>
          <td class="table_title" width="43%"><b>SCO ����</b></td>
          <td class="table_title"><b>�������</b></td>         
          <td class="table_title" width="10%"><b>��Ÿ����Ÿ</b></td>
          <td class="table_title" width="12%"><b>���</b></td>
        </tr>

<% 

	for (int i=0; i<list.size(); i++) {
            d = (SCOData)list.get(i);   
		
			if(d.getThelevel() == 1){
				v_depthimg	= "&nbsp;<img src='/images/admin/system/folderopen.gif' border='0' width='16' height='14'  align='absmiddle'> ";
			}else{
				v_depthimg	= "<img src='/images/admin/system/blanknode.gif' border='0' width='"+ (20 * (d.getThelevel() -1)) +"' height='2' align='absmiddle'><img src='/images/admin/system/lastnode.gif' border='0' align='absmiddle' ><img src='/images/admin/system/folderopen.gif' border='0' width='16' height='14' align='absmiddle'> ";
			}

			if (d.getMasteryscore() == 0 ) {
				v_masteryscore = "-";
			} else {
				v_masteryscore = String.valueOf(d.getMasteryscore())+"��";
			}

				v_objdelbutton		= "<a href=javascript:whenUpdate('"+d.getOid()+"','"+d.getScolocate()+"')><img src='/images/admin/common/modify_butt.gif' width='37' height='18' border='0'></a> &nbsp <a href=javascript:whenDelete('"+d.getOid()+"','"+d.getScolocate()+"')> ����</a>";
			
			if (d.getStarting().equals("")){
				v_object_title = d.getSdesc();
			} else {
				v_object_title = "<a href=javascript:Sco_View('"+ d.getOid() +"')>"+ d.getSdesc() +"</a>";
			}
%>
        <tr>
          <td class="table_01"><%=(i+1)%></td>
          <td class="table_02_1"><%=d.getOid()%></td>
          <td class="table_02_2"><%=v_depthimg%><%=v_object_title%></td>
          <td class="table_02_1"><%=v_masteryscore%></td>

<% if ((d.getHighoid() != "" ) && (d.getMetalocation() != "")) { %>

           <% if( d.getMetadata() != 0 ) {  %>
		   <td class="table_02_1">
           <a href="javascript:Meta_Add('<%=d.getOid()%>','<%=d.getMetalocation()%>','<%=d.getScolocate()%>')">����</a></td>         
		   <% } else { %>
		    <td class="table_02_1">
           <a href="javascript:Meta_Add('<%=d.getOid()%>','<%=d.getMetalocation()%>','<%=d.getScolocate()%>')">���</a></td> 
		   <% } %>
<% } else { %>
           <td class="table_02_1"> - 
           </td>         
<% } %>
         
          <td class="table_02_1"><%=v_objdelbutton%></td>
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

	<table border=0 width=100%><tr><td align=center><a href="javascript:whenSelection()">����Ʈ</a></td></tr></table>

    </body>
    </html>


<%@ include file = "/learn/library/getJspName.jsp" %>
    