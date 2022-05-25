<%
//**********************************************************
//  1. ��      ��: ����� ��� - ������ ��Ȳ
//  2. ���α׷��� : za_TotalStat_L.jsp
//  3. ��      ��: ����� ��� - ���� New
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.07
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
    Date dt = new Date();
    int currYear = Integer.parseInt( sdf.format(dt) );
    
    String v_code = "";
    String v_cdnm = "";

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/assets/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="/css/assets/jquery.multiselect.filter.css" />
<link rel="stylesheet" type="text/css" href="/css/assets/style.css" />
<link rel="stylesheet" type="text/css" href="/css/assets/prettify.css" />
<link rel="stylesheet" type="text/css" href="/css/jqueryui/1.8.2/themes/ui-lightness/jquery-ui.css" />
<script type="text/javascript" src="/js/jquery/1.8.2/jquery.js"></script>
<script type="text/javascript" src="/js/jqueryui/1.8.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/assets/jquery.multiselect.js"></script>
<script type="text/javascript" src="/js/assets/jquery.multiselect.filter.js"></script>
<script type="text/javascript" src="/js/assets/prettify.js"></script>
<script type="text/javascript" src="/js/assets/amcharts/flash/swfobject.js"></script>
<script type="text/javascript" src="/js/assets/amcharts/amcharts.js"></script>
<script type="text/javascript" src="/js/assets/amcharts/amfallback.js"></script>
<script language="JavaScript">
<!--
// �˻�


function whenExcel32() {   
	 //alert('1');
	 document.form1.target = 'mainFrame';
     $("#isExcel").val("true");
     document.form1.action='/servlet/controller.study.StudyTotalStatusServlet';
     document.form1.p_process.value = 'LearningStatusExcelByTotal';
     //document.form1.submit();
     $("#isExcel").val("false");

 }


$("#tabs").tabs({
    select: function(event, ui) {
       window.location = $.data(ui.tab, 'href.tabs');
    }
});

/* 
function whenExcel() {
	alert(111);
	var newyear = $("#ss_year").val();//.indexOf(',');
	var newmonth = $("#ss_month").val();
	var newcate =  $("#ss_category").val();				
	var newsubjseq = $("#ss_subjseq").val();
	var newpart =  $("#ss_part").val();
	$("#isExcel").val("true");
	//document.form1.s_action.value = "go";
	//document.form1.p_process.value = 'selectTotalStat';
	document.form1.action="/servlet/controller.course.CourseStateAdminServlet?isExcel=true&p_process=selectTotalStat&param="+newsubjseq+"&param1="+newpart;
	document.form1.submit();
	$("#isExcel").val("false");
}
 */

$(document).ready(function() { 
	$("#ss_month").change(   // ���� ����
	function(){ 
		//alert('est');
		var newyear = $("#ss_year").val();//.indexOf(',');
		var newmonth = $("#ss_month").val();
		var newcate =  $("#ss_category").val();
		
		 $.ajax({ type : "POST", 			
	   		url : "/servlet/controller.common.TagServlet", 
	   		data: "sqlNum=onlinecourse&type=7&param="+newyear+"&param1="+newmonth+"&param2="+newcate, 
	   		//beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); }, 
	   		success: function(msg){ 
	   			//alert(msg);
	   			if(msg.length > 0) { $('#s_subjseq').html(msg); } 
	   			
	   			$("select").multiselect();
	   			
	   		}  
	   	});//end ajax    
	
	});  	
	
		$("#ss_part").change(
			function(){ 
								
				var newpart =  $("#ss_part").val();				
				var newsubjseq = $("#ss_subjseq").val();
				
				
				 $.ajax({ type : "POST", 			
				   		url : "/servlet/controller.common.TagServlet", 
				   		data: "sqlNum=onlinecourselist&type=9&param="+newsubjseq+"&param1="+newpart, 
				   		//beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); }, 
				   		success: function(msg){ 
				   			if(msg.length > 0) { $('#s_subjcourse').html(msg); } 
				   			//$("select").multiselect();
				   			//$("#ss_subjcourse").multiselect().multiselectfilter();
				   			
				   			  $("#ss_subjcourse").multiselect({
				   		       selectedList: 10,
				   		       noneSelectedText: "�������˻�",
				   		       minWidth: 190  
				   		    }).multiselectfilter();  
				   			
				   			
				   		}  
				   	});//end ajax   
			
			});  	
	 	
	 	$('#b_group, #b_part, #b_subjseq, #b_subj, #b_satisfy, #b_age, #b_gender,#b_location, #b_vocation, #b_detail').click(function(e) {
	 		//alert('start');
	 		var newpart =  $("#ss_part").val();				
			var newsubjseq = $("#ss_subjseq").val();
			var newsubjcourse = $("#ss_subjcourse").val();
			
			if ($(e.target).is("#b_group")) { // �����׷캰
	 			$.ajax({ type : "POST", 			
			   		url : "/servlet/controller.course.CourseStateAdminServlet?p_process=selectGroupStat", 
			   		//data: "&param="+newsubjseq+"&param1="+newcourse, 
			   		data: "&param="+newsubjseq+"&param1="+newpart+"&param2="+newsubjcourse, 
			   		beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); }, 
			   		success: function(msg){ 
			   			if(msg.length > 0) { $('#s_list').html(msg); } 
			   		}  
			   	});//end ajax   
			   	
	 		} else if ($(e.target).is("#b_part")) {  // �оߺ�
	 			
	 			$.ajax({ type : "POST", 			
			   		url : "/servlet/controller.course.CourseStateAdminServlet?p_process=selectGubunStat", 
			   		data: "&param="+newsubjseq+"&param1="+newpart, 
			   		beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); },
			   		success: function(msg){ 
			   			//alert(msg);
			   			if(msg.length > 0) { $('#s_list').html(msg); } 
			   			$("select").multiselect();
			   		}  
			   	});//end ajax   
	 		} else if ($(e.target).is("#b_subjseq")) { // ������
	 			 $.ajax({ type : "POST", 			
				   		url : "/servlet/controller.course.CourseStateAdminServlet?p_process=selectSeqStat", 
				   		data: "&param="+newsubjseq+"&param1="+newpart,
				   		beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); },
				   		success: function(msg){ 
				   			if(msg.length > 0) { $('#s_list').html(msg); } 
				   			$("select").multiselect();
				   		}  
				   	});//end ajax    
			   	
	 		} else if ($(e.target).is("#b_subj")) { // ������
	 			$.ajax({ type : "POST", 			
			   		url : "/servlet/controller.course.CourseStateAdminServlet?p_process=selectCourseStat", 
			   		//data: "&param="+newsubjseq+"&param1="+newcourse, 
			   		data: "&param="+newsubjseq+"&param1="+newpart+"&param2="+newsubjcourse, 
			   		beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); }, 
			   		success: function(msg){ 
			   			if(msg.length > 0) { $('#s_list').html(msg); } 
			   		}  
			   	});//end ajax   
			   	
	 		} else if ($(e.target).is("#b_satisfy")) { // ������
	 			$.ajax({ type : "POST", 			
	 				url : "/servlet/controller.course.CourseStateAdminServlet?p_process=selectSatisfyStat", 
			   		data: "&param="+newsubjseq+"&param1="+newpart+"&param2="+newsubjcourse, 
			   		beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); }, 
			   		success: function(msg){ 
			   			if(msg.length > 0) { $('#s_list').html(msg); } 
			   		}  
			   	});//end ajax   
	 		} else if ($(e.target).is("#b_age")) { // ���ɺ���
	 			$.ajax({ type : "POST", 			
	 				url : "/servlet/controller.course.CourseStateAdminServlet?p_process=selectAgeStat", 
			   		data: "&param="+newsubjseq+"&param1="+newpart+"&param2="+newsubjcourse, 
			   		beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); }, 
			   		success: function(msg){ 
			   			if(msg.length > 0) { $('#s_list').html(msg); } 
			   		}  
			   	});//end ajax   
	 		} else if ($(e.target).is("#b_gender")) { // ����
	 			$.ajax({ type : "POST", 			
	 				url : "/servlet/controller.course.CourseStateAdminServlet?p_process=selectGenderStat", 
			   		data: "&param="+newsubjseq+"&param1="+newpart+"&param2="+newsubjcourse, 
			   		beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); }, 
			   		success: function(msg){ 
			   			if(msg.length > 0) { $('#s_list').html(msg); } 
			   		}  
			   	});//end ajax   
	 		} else if ($(e.target).is("#b_location")) { // ������
	 			$.ajax({ type : "POST", 			
	 				url : "/servlet/controller.course.CourseStateAdminServlet?p_process=selectLocationStat", 
			   		data: "&param="+newsubjseq+"&param1="+newpart+"&param2="+newsubjcourse, 
			   		beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); }, 
			   		success: function(msg){ 
			   			if(msg.length > 0) { $('#s_list').html(msg); } 
			   		}  
			   	});//end ajax   
	 		} else if ($(e.target).is("#b_vocation")) { // ������
	 			$.ajax({ type : "POST", 			
	 				url : "/servlet/controller.course.CourseStateAdminServlet?p_process=selectVocationStat", 
			   		data: "&param="+newsubjseq+"&param1="+newpart+"&param2="+newsubjcourse, 
			   		beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); }, 
			   		success: function(msg){ 
			   			if(msg.length > 0) { $('#s_list').html(msg); } 
			   		}  
			   	});//end ajax   
	 		} else if ($(e.target).is("#b_detail")) { // �󼼺���
	 			$.ajax({ type : "POST", 			
			   		url : "/servlet/controller.course.CourseStateAdminServlet?p_process=selectTotalStat", 
			   		data: "&param="+newsubjseq+"&param1="+newpart, 
			   		beforeSend: function(){ $('#s_list').html('<img src="/learn/user/contents/loading.gif" border="0"/>'); },
			   		success: function(msg){ 
			   			if(msg.length > 0) { $('#s_list').html(msg); } 
			   			//$("select").multiselect();
			   		}  
			   	});//end ajax   
	 		}
	 	    
	 	});
	} 
	
); 

//-->
</script>

</head>

<body id="test" onload="prettyPrint();" bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
      
<table width="1000" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td align="center" valign="top">
       <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td align="left"><img src="/images/admin/course/co_title04.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
     </td>
     </tr>
     <tr>
     <td align="center" valign="top">

     
      <br/>
      <!------------------------------------- form ���� ------------------------------------->
    
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="left">
                  <style>
                  table#cellp td { padding:3px 0px 3px 0px; }
                  dl,dt,dd { padding:0; margin:0; list-style:none; }
                  </style>
                  <table id="cellp" border="0" cellspacing="0" cellpadding="0" width="100%"  class="form_table">                
                    <tr>
                      <td align="left" valign="middle">&nbsp;</td>
                      <td align="left" valign="middle">	�⵵��</td>
                      <td align="left" valign="middle">	
							<select name="ss_year" id="ss_year" multiple="multiple" >
<%
            for ( int i = currYear ; i >= 2004 ; i-- ) {
%>
                                <option value="<%= i %>"><%= i %></option>
<%
            }
%>

							</select>
						</td>		
					
                     <td align="left" valign="middle">�з�</td>
                     <td align="left" valign="middle">	
							<select name="ss_category" multiple="multiple" id="ss_category" size="8">
							<optgroup label="B2C" >
							<option value="01">�Ϲ�</option>
							</optgroup>
							<optgroup label="B2B">
							<option value="02">����</option>
							<option value="03">���</option>	
							<option value="04">����</option>
							<option value="05">Ưȭ��</option>
							<option value="06">�����б���</option>
							</optgroup>						
							</select>
                     </td>
                     
                     	<td align="left" valign="middle">����</td>
						
						<td align="left" valign="middle">	
							<select title="������" multiple="multiple" name="ss_month" id="ss_month" size="5" >
							<option value="01">1��</option>
							<option value="02">2��</option>
							<option value="03">3��</option>
							<option value="04">4��</option>
							<option value="05">5��</option>
							<option value="06">6��</option>
							<option value="07">7��</option>
							<option value="08">8��</option>
							<option value="09">9��</option>
							<option value="10">10��</option>
							<option value="11">11��</option>
							<option value="12">12��</option>
							</select>
                     </td>
                     </tr>
                     
                     <tr>
                     <td align="left" valign="middle" width="10">&nbsp;</td>
                     <td align="left" valign="middle" width="50">������</td>
                     <td align="left" valign="middle" colspan="4" width="450">
                      		<div id="s_subjseq" style="width:450px">                      	
							<select name="ss_subjseq" multiple="multiple" id="ss_subjseq" style="width:450px">		
							</select>				
							</div>		
                     </td>
                     <td align="left" valign="middle">&nbsp;</td>
                     </tr>
                   <tr>
                     <td align="left" valign="middle" width="10">&nbsp;</td>
                     <td align="left" valign="middle" width="40">�оߺ�</td>
                      <td align="left" valign="middle" colspan="4" width="450">
							<select name="ss_part" id="ss_part" multiple="multiple">
							<option value="B0">���</option>
							<option value="K0">��ȭ</option>
							<option value="G0">����</option>						
							</select>
					 </td>	
					 <td align="left" valign="middle">&nbsp;</td>
					 </tr>
					 <tr>
                     <td align="left" valign="middle">&nbsp;</td>
                     <td align="left" valign="middle" >������</td>
                     <td align="left" valign="middle" colspan="4" width="450">
                     	<dl>
                     	  <dd style="float:left;" id="s_subjcourse"><select name="ss_subjcourse" multiple="multiple" id="ss_subjcourse" style="width:450px"></select></dd>
                     	  <dd style="float:left; margin-left:5px;"></dd>
                     	</dl>
                     </td>
                     <td></td>  
                     </tr>
                     
                     <tr>
                     <td align="left" valign="middle">&nbsp;</td>
                     <td align="left" valign="middle" colspan="6" >
                     	<dl>
                  	  		<dd style="float:left;"><button id="b_group">�����׷캰�˻�</button></dd>
	                  	  	<dd style="float:left; margin-left:5px;"><button id="b_part">�оߺ��˻�</button></dd>
	                  	  	<dd style="float:left; margin-left:5px;"><button id="b_subjseq">�������˻�</button> </dd>
	                  	  	<dd style="float:left; margin-left:5px;"><button id="b_subj">�������˻�</button></dd>
	                  	  	<!-- <dd style="float:left; margin-left:5px;"><button id="b_satisfy">�������˻�</button></dd> -->
	                  	  	<dd style="float:left; margin-left:5px;"><button id="b_age">���ɺ���</button></dd>
	                  	  	<dd style="float:left; margin-left:5px;"><button id="b_gender">��������</button></dd>
	                  	  	<dd style="float:left; margin-left:5px;"><button id="b_location">����������</button></dd>
	                  	  	<dd style="float:left; margin-left:5px;"><button id="b_vocation">����������</button></dd>
	                  	  	<dd style="float:left; margin-left:5px;"><button id="b_detail">�󼼺���</button></dd>
                     	</dl>
                     </td>
                     
                     </tr>
                  </table>
                </td>
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
          <td colspan="8" class="table_top_line"></td>
        </tr>
        <tr>
          
          <td class="table_title"><b>No</b></td>
          <td class="table_title"><b>�о�</b></td>
          <td class="table_title"><b>������</b></td>
          <td class="table_title"><b>�����ο�</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>�̼���</b></td>
          <td class="table_title"><b>������</b></td>
          <td class="table_title"><b>������</b></td>
         </tr>

        <tr>
        	<td align="center" bgcolor="#FFFFFF" height="100" colspan="15">��ϵ� ������ �����ϴ�.</td>
        </tr>

     
      </table>
      </div>
    <!----------------- ����������ȸ �� ----------------->
    <br>
    </td>
  </tr>
</table>
<script type="text/javascript">
//$("select").multiselect().multiselectfilter();
$(function(){
	$("select").multiselect({
		selectedList: 5
	});
});
</script>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>