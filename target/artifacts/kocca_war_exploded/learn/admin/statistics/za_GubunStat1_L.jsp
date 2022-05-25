<%
//**********************************************************
//  1. ��      ��: ����� ��� - ��ü ��Ȳ
//  2. ���α׷��� : za_TotalStat_L.jsp
//  3. ��      ��: ����� ��� - ��ü
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.07
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
   
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
 
<link rel="stylesheet" type="text/css" href="/css/assets/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="/css/assets/style.css" />
<link rel="stylesheet" type="text/css" href="/css/assets/prettify.css" />
<link rel="stylesheet" type="text/css" href="/css/jqueryui/1/themes/ui-lightness/jquery-ui.css" />
<script type="text/javascript" src="/js/jquery/1/jquery.js"></script>
<script type="text/javascript" src="/js/jqueryui/1/jquery-ui.min.js"></script> 
<script type="text/javascript" src="/js/assets/jquery.multiselect.js"></script>
<script type="text/javascript" src="/js/assets/prettify.js"></script>



<script type="text/javascript">
$(function(){
	$("select").multiselect();
});
</script>

<script language="JavaScript">
<!--


$(document).ready(function() { 
	$("#ss_year").change(
	function(){ 
		//alert('est');
		var newyear = $("#ss_year").val();//.indexOf(',');
		
		 $.ajax({ type : "POST", 			
	   		url : "/servlet/controller.common.TagServlet", 
	   		data: "sqlNum=onlinecourse&type=8&param="+newyear, 
	   		//beforeSend: function(){ $('#ss_subjseq').html('<img src="loading.gif" border="0"/>'); }, 
	   		success: function(msg){ 
	   			if(msg.length > 0) { $('#s_subjseq').html(msg); } 
	   			$("select").multiselect();
	   		}  
	   	});//end ajax    
	
	});  	
	
		
	 $("#exec").bind('click',function(){ 
			//alert('est');
			var newyear = $("#ss_year").val();//.indexOf(',');
			var newsubjseq = $("#ss_subjseq").val();
			
			 $.ajax({ type : "POST", 			
		   		url : "/servlet/controller.course.CourseStateAdminServlet?p_process=selectGubunStat", 
		   		data: "&param="+newsubjseq, 
		   		beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); },
		   		success: function(msg){ 
		   			//alert(msg);
		   			if(msg.length > 0) { $('#s_list').html(msg); } 
		   			$("select").multiselect();
		   		}  
		   	});//end ajax    
		
		});  
	 
	} 
	
	
	
); 

//-->
</script>

<style type="text/css">
li.tabnavi { font-size:12px; font-weight:bold; }
p {
	margin: 0;
	padding: 0;
}
#tabs_wrapper {
	width: 422px;
}
#tabs_container {
	border-bottom: 1px solid #ccc;
}
#tabs {
	list-style: none;
	padding: 5px 0 4px 0;
	margin: 0 0 0 10px;
	font: 0.75em arial;
}
#tabs li {
	display: inline;
}
#tabs li a {
	border: 1px solid #ccc;
	padding: 4px 6px;
	text-decoration: none;
	background-color: #eeeeee;
	border-bottom: none;
	outline: none;
	border-radius: 5px 5px 0 0;
	-moz-border-radius: 5px 5px 0 0;
	-webkit-border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
}
#tabs li a:hover {
	background-color: #dddddd;
	padding: 4px 6px;
}
#tabs li.active a {
	border-bottom: 1px solid #fff;
	background-color: #fff;
	padding: 4px 6px 5px 6px;
	border-bottom: none;
}
#tabs li.active a:hover {
	background-color: #eeeeee;
	padding: 4px 6px 5px 6px;
	border-bottom: none;
}

#tabs li a.icon_accept {
	background-image: url(/learn/admin/statistics/accept.png);
	background-position: 5px;
	background-repeat: no-repeat;
	padding-left: 24px;
}
#tabs li a.icon_accept:hover {
	padding-left: 24px;
}

#tabs_content_container {
	border: 1px solid #ccc;
	border-top: none;
	padding: 10px;
	width: 400px;
}
.tab_content {
	display: none;
}
</style>
</head>
<body id="test"  bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


      
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title04.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
 
      <br>
      
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
         
          <td align="left">
          <div id="tabs_wrapper">
			<div id="tabs_container">
			
				<ul id="tabs">
					<li class="active tabnavi"><a href="#tab1">�оߺ�</a></li>
					<li class="tabnavi"><a class="icon_accept" href="/servlet/controller.course.CourseStateAdminServlet?p_process=selectPreSeqStat">������</a></li>
					<li class="tabnavi"><a class="icon_accept" href="/servlet/controller.course.CourseStateAdminServlet?p_process=selectPreCourseStat">������ </a></li>
					<li class="tabnavi"><a class="icon_accept" href="#tab2">������ </a></li>
					<li class="tabnavi"><a class="icon_accept" href="/servlet/controller.course.CourseStateAdminServlet?p_process=selectPreTotalStat">�󼼰˻�</a></li>
				</ul>
				
				
			</div>
			</div>	
          
          
          </td>
        </tr>
      </table>
     
      <!------------------------------------- form ���� ------------------------------------->
      <form name = "form1" method = "post">
        <input type="hidden" name="p_process">
        <input type="hidden" name="p_action">
        <input type="hidden" name="p_order"     value="">
        <input type="hidden" name="p_orderType" value="">
        <input type="hidden" name="p_grcode" >
        <input type="hidden" name="p_grseq" >
        <input type="hidden" name="p_gyear">
        <input type="hidden" name="p_subj" >
        <input type="hidden" name="p_subjseq" >
      
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="left">
                  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="form_table">
                    <tr>
                      <td align="left" valign="middle">&nbsp;</td>
                      <td align="left" valign="middle" width="40">	�⵵��</td>
                      <td align="left" valign="middle" width="100">	
							<select name="ss_year" id="ss_year" multiple="multiple">
							<option value="2013">2013</option>
							<option value="2012">2012</option>
							<option value="2011">2011</option>
							<option value="2010">2010</option>
							<option value="2009">2009</option>
							<option value="2008">2008</option>
							<option value="2007">2007</option>
							<option value="2006">2006</option>
							<option value="2005">2005</option>
							<option value="2004">2004</option>
							</select>
						</td>	
					  <td align="left" valign="right" widt="10">&nbsp;</td>
                      <td align="left" valign="middle" width="40">������</td>
                       
                      <td align="left" valign="middle" width="200">
                     
                      		<!-- <div id="s_subjseq">                      	
							<select name="ss_subjseq" multiple="multiple" id="ss_subjseq">		
							<option value='B0'></option>                                                                                                    								
							</select>				
							</div>	 -->
                     </td> 
                     <td align="left" valign="right" width="30">&nbsp;</td>
                      <td align="left" valign="middle">
							<button id="exec">�˻�</button>
					 </td>	
					 
					 <td align="left" valign="right">&nbsp;</td>
					  
                     </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table><br>
      <!----------------- ������� ��ư ���� ----------------->
      <div id="s_list">
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="left" height="20">&nbsp;<b>������Ȳ</b></td>
          <td align="right">
          <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a>
             <!-- <button id="exCel">�������</button> -->
          </td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>           
      <!----------------- ��ȸ ���� ----------------->
      
      <table class="table_out" cellspacing="1" cellpadding="5">		
        <tr>
          <td colspan="7" class="table_top_line"></td>
        </tr>
        <tr>
          
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>�о�</b></td>
          <td class="table_title"><b>�����</b></td>
          <td class="table_title"><b>�����ο�</b></td>
          <td class="table_title"><b>�����ο�</b></td>
          <td class="table_title"><b>������</b></td>
          <td class="table_title"><b>������</b></td>
         </tr>
         
        </tr>

        <tr>
        	<td align="center" bgcolor="#FFFFFF" height="100" colspan="7">��ϵ� ������ �����ϴ�.</td>
        </tr>

     
      </table>
      </div>
       </form>
    <!----------------- ����������ȸ �� ----------------->
    <br>
    </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>