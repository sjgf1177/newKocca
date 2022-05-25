<%
//**********************************************************
//  1. ��      ��: ���� ������ ����Ʈ
//  2. ���α׷��� : za_SCO_I.jsp
//  3. ��      ��: ������ ���ε� ���ȭ��
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
 
    String v_scolocateno_1	= "";
	String v_manifestfilename = "";
	String v_unzip_filename = "";
	String v_unzip_flag = "";
	String p_scolocate	= "";
	String p_content_sync	= "";
	String p_cpseq = "";
    
	if(v_unzip_flag == null || v_unzip_flag.equals("") || v_unzip_flag.equals("0")){
		v_unzip_flag = "0";		
	}else{
		v_unzip_flag = "1";
	}

	RequestBox box = null;	
    box = (RequestBox)request.getAttribute("requestbox");
	
    if (box == null) {
    	box = RequestManager.getBox(request);
    }
 	
	ErrorManager.systemOutPrintln(box); 

	
	p_cpseq =  box.getString("p_cpseq");
    

	v_scolocateno_1	= box.getString("v_scolocateno_1");
	v_manifestfilename = box.getString("v_manifestfilename");
	v_unzip_filename = box.getString("v_unzip_filename");
	v_unzip_flag = box.getString("v_unzip_flag");
	p_scolocate	= box.getString("p_scolocate");
	p_content_sync	= box.getString("p_content_sync");
	p_cpseq	= box.getString("p_cpseq");

//	out.println(p_cpseq);
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

function start(){		
		menu_bar.innerHTML = "�� ������ ������� (.ZIP) :"		
}

function whenList(){
	document.form1.p_process.value="listPage";
	document.form1.submit();
}

function whenDelete(){
	document.form1.p_process.value="folderdelete";
	document.form1.submit();
}

function sco_change(){
		if (document.form1.p_content_sync.checked ) {			
			menu_bar.innerHTML = "�� ������ ������� (.ZIP) :"
		}else{			
			menu_bar.innerHTML = "�� ���� (imsmanifest.xml) :"
		}
}


function searchMember(){
  var p_key1  = document.form1.p_mastername.value;
  var p_key2  = 'p_master';
  var url = "/servlet/controller.library.SearchServlet?p_process=member&p_gubun=name" +"&p_key1="+ p_key1 +"&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}
function receiveMember(userid, name, resno, email, cono, jikwi, jikwinm, comp, compnm, tmp1, tmp2, tmp3){
	document.form1.p_mastername.value =  name;
    document.form1.p_master.value = userid;  
}

	function ZipFileUpload(){

		if (document.form1.p_content_sync.checked ) {
			p_content_sync_1 = 1;

			if(IsSpace(document.form1.Attach_ZIPFile)){
				alert("ZIP ������ �����ϼ���");
				document.form1.Attach_ZIPFile.focus();
				return;
			}else if(isZipFile(document.form1.Attach_ZIPFile.value)){
				alert("ZIP ������ �ƴմϴ�");
				document.form1.Attach_ZIPFile.focus();
				return;
			}

		}else{			
			p_content_sync_1 = 0;

			if(IsSpace(document.form1.Attach_ZIPFile)){
				alert("imsmanifest ������ �����ϼ���");
				document.form1.Attach_ZIPFile.focus();
				return;
			}else if(isManifestXML(document.form1.Attach_ZIPFile.value)){
				alert("imsmanifest ������ ����� �ּ���");
				document.form1.Attach_ZIPFile.focus();
				return;
			}
		}
		
		document.form1.action = "/servlet/com.credu.scorm.xmlFileUpload?NextPage_URL=/learn/admin/contents/za_SCO_I.jsp&p_content_sync="+p_content_sync_1;
		document.form1.encoding = "multipart/form-data";
		document.form1.mehtod = "post";
		document.form1.submit();
	}
	function isZipFile(filename){
		var file = filename.split("\\");
		file = file[file.length-1];
		if(file.indexOf(".zip") > -1){
			return false;
		}return true;
	}

	function isManifestXML(filename){
		var file = filename.split("\\");
		file = file[file.length-1];
		if(file.indexOf("imsmanifest.xml") > -1){
			return false;
		}return true;
	}
	
	
	function whenSubmit(){
		var form1 = document.form1;

		if(form1.v_unzip_flag.value != "1"){
			alert("������ ���� ���ε��ϼ���.");
			return;
		}

		if(confirm("������ ����Ͻðڽ��ϱ�?")){			
			document.form1.submit();
		}		
	}

function IsSpace(item){
	if (item.value.length < 1){
		item.focus();
		return true;
	}else{
		var i,tot;
		tot = 0;
		for (i = 0; i < item.value.length; i++){
			if (item.value.charAt(i) == " "){
				tot++;
			}else if (item.value.charAt(i) == "\r"){
				tot++;
			}else if (item.value.charAt(i) == "\n"){
				tot++;
			}else{
				break;
			}
		}
		if (tot == item.value.length){
			item.value = "";
			item.focus();
			return true;
		}else{
			return false;
		}
	}
}
</script>

<%	if(v_unzip_flag.equals("1")){	%>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0"  >
<% } else { %>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onload="start();" >
<% } %>
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
<FORM name="form1" method="post" action="/servlet/controller.contents.SCOServlet" enctype = "multipart/form-data">
      	  <input type=hidden name="p_process" value="insertsco">  
		  <input type=hidden name="v_unzip_flag" value="<%=v_unzip_flag%>">  
		  <input type=hidden name="v_manifestfilename" value="<%=v_manifestfilename%>"> 
		  <input type=hidden name="ScoLocateNo" value="<%=v_scolocateno_1%>">
		  <input type=hidden name="p_scolocate" value="<%=p_scolocate%>">
		  <input type=hidden name="p_cpseq" value="<%=p_cpseq%>">
  <tr>
  <tr>
    <td align="center"  valign="top">
      <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/c_title05.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	  <!----------------- title �� ----------------->
	  <br>
     
	  
	  <table>	 
		<%	if(v_unzip_flag.equals("1")){	%>
		  <tr>
		  <td align=left width=100%>&nbsp;&nbsp;	
		  	
			  <% if(p_content_sync.equals("1")){	%>
			  <b>�� ������ ������� (.ZIP) : 	  
			  <%=v_unzip_filename%> &nbsp;&nbsp;
			  ���þ��ε�<input type=checkbox name="p_content_sync" checked >
			  <% } else { %>
			  <b>�� ���� (imsmanifest.xml) : 	  
			  <%=v_unzip_filename%> &nbsp;&nbsp;
			  �ϰ����ε�<input type=checkbox name="p_content_sync" >
			  <% } %>
		  </td>
		  </tr>
	  <% } else { %>
		 <tr>
		 <td align=left width=10%>�ϰ����ε�<input type=checkbox name="p_content_sync" checked onclick=sco_change()></td>
		  <td align=left width=75%>
		  &nbsp;&nbsp;&nbsp;&nbsp;<b><span id="menu_bar" style="position:relative;"></span> 	  
		  <input type="file" name="Attach_ZIPFile" class="input"  size="50">&nbsp;&nbsp;&nbsp;
		  <a href="#" onclick="ZipFileUpload()"><img src="/images/admin/button/btn_com.gif" border="0" align=absmiddle></a>
		  </td>
		  <td align=center width=17%>		  
		  </td>
		  	  
		  </tr>
	  <% } %>
	  </table>

      <!----------------- Object ���� ----------------->
      <table align="center" cellspacing="1" cellpadding="5" class="table_out">      
      <tr> 
          <td colspan="11" class="table_top_line">
 <!--	    <APPLET  WIDTH = "100%" HEIGHT = "180" NAME = "manifestTable" ALIGN = "middle" VSPACE = "0" HSPACE = "0" >
  				    <PARAM NAME = CODE VALUE = "JTableApplet.class" >
					<PARAM NAME = CODEBASE VALUE = "/learn/admin/contents/applet" >
					<PARAM NAME = CODEBASE VALUE = "/learn/admin/" >
					<PARAM NAME = NAME VALUE = "manifestTable" >
					<PARAM NAME = MAYSCRIPT VALUE = "true" >
					<PARAM NAME = "type" VALUE = "application/x-java-applet;jpi-version=1.4.1_01">
					<PARAM NAME = "scriptable" VALUE = "false">
					<PARAM NAME = "filename" VALUE ="<%=v_manifestfilename%>">
					<PARAM NAME = "course_code" VALUE ="<%=v_scolocateno_1%>">
                </APPLET>-->

  
				<script language = "javascript" src = "/script/user_patch.js"></script>
				<script language='javascript'>
					setParam1('<%=v_manifestfilename%>');
					setParam2('<%=v_scolocateno_1%>');
					setParam3('<%=v_manifestfilename%>');
					setParam4('<%=v_scolocateno_1%>');
					//alert("1111");
					object_patch('sco_insert');
					
					setParam1('');
					setParam2('');
					setParam3('');
					setParam4('');
				</script>
			 		<!--OBJECT 
				classid = "clsid:CAFEEFAC-0014-0001-0001-ABCDEFFEDCBA"
				codebase = "http://java.sun.com/products/plugin/autodl/jinstall-1_4_1_01-windows-i586.cab#Version=1,4,1,01"
				WIDTH = "100%" HEIGHT = "180" NAME = "manifestTable" ALIGN = "middle" VSPACE = "0" HSPACE = "0" >
				<PARAM NAME = CODE VALUE = "JTableApplet.class" >
				<PARAM NAME = CODEBASE VALUE = "/learn/admin/contents/applet" >
				<PARAM NAME = NAME VALUE = "manifestTable" >
				<PARAM NAME = MAYSCRIPT VALUE = "true" >
				<PARAM NAME = "type" VALUE = "application/x-java-applet;jpi-version=1.4.1_01">
				<PARAM NAME = "scriptable" VALUE = "false">
				<PARAM NAME = "filename" VALUE ="<%=v_manifestfilename%>">
				<PARAM NAME = "course_code" VALUE ="<%=v_scolocateno_1%>">				

				<COMMENT>
				<EMBED 
						type = "application/x-java-applet;jpi-version=1.4.1_01" 
						CODE = "JTableApplet.class"
						JAVA_CODEBASE = "/learn/admin/contents/applet"
						NAME = "manifestTable"
						WIDTH = "100%"
						HEIGHT = "180"
						ALIGN = "middle"
						VSPACE = "0"
						HSPACE = "0"
						MAYSCRIPT = "true" 
						filename ="<%=v_manifestfilename%>"
						course_code ="<%=v_scolocateno_1%>" 
						scriptable = false 
						pluginspage = "http://java.sun.com/products/plugin/index.html#download">
						<NOEMBED>
						
						</NOEMBED>
				</EMBED>
				</COMMENT>
			</OBJECT-->
		</td>
        </tr>
	  </FORM>	
      </table>
      <!----------------- ���� ���� �� ----------------->
      <br>
      <!----------------- ���� ��ư ���� ----------------->
      <table cellpadding="0" cellspacing="0" class="table1">
        <tr>
          <td align="center" height="20"> 
          	<a href='javascript:whenSubmit()'><img src="/images/admin/button/btn_save.gif" border="0"></a> 
          	
			<%	if(v_unzip_flag.equals("1")){	%>
			<a href='javascript:whenDelete()'><img src="/images/admin/button/btn_del.gif" border="0"></a>			
			<% } %>
			<a href='javascript:whenList()'><img src="/images/admin/button/btn_list.gif" border="0"></a>
			</td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ���� ��ư �� ----------------->
      <br>
    </td>
  </tr>
</table>
</body>
</html>
<%@ include file = "/learn/library/getJspName.jsp" %>
