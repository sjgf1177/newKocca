<%
/**
 * file name : mScreenFbody.jsp
 * date      : 2003/7/11
 * programmer: LeeSuMin
 * function  : manager screen Initial Body
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    String  ss_grcode	= box.getStringDefault("s_grcode","N000001");		   //�����׷�
	String  ss_gyear	 = box.getString("s_gyear");			//�⵵
	String  ss_grseq	 = box.getString("s_grseq");			//��������
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
    Date dt = new Date();
    int currYear = Integer.parseInt( sdf.format(dt) );
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/assets/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="/css/assets/jquery.multiselect.filter.css" />
<link rel="stylesheet" type="text/css" href="/css/assets/style.css" />
<link rel="stylesheet" type="text/css" href="/css/assets/prettify.css" />
<link rel="stylesheet" type="text/css" href="/css/jqueryui/1.9.2/themes/redmond/jquery-ui.css" />
<script type="text/javascript" src="/js/jquery/1.7.2/jquery.js"></script>
<script type="text/javascript" src="/js/jqueryui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="/js/assets/jquery.multiselect.js"></script>
<script type="text/javascript" src="/js/assets/jquery.multiselect.filter.js"></script>
<script type="text/javascript" src="/js/assets/prettify.js"></script>

</head>

<body>
<!-- table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center">&nbsp;</td>
  </tr>
  <tr> 
    <td valign="top" align="center" style="background-color: #dfdfdf;">
    	<b>�޴��� �Ⱥ��ϰ�� <a href="javascript:winopen();">����</a>�� Ŭ���Ͻñ� �ٶ��ϴ�.(�ӽø޴�)</b>
    </td>
  </tr>
</table-->


<form name = "form1" method="post">

<!-- ���� ��� ���� -->
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<div style="text-align: left;">
    <strong style="font-size:15px;">����� ���</strong><br/>
    <b>�����׷�</b> : <kocca_select:select name="s_grcode" onChange="fnChangeGrcode();" sqlNum="course.0001" selectedValue="<%= ss_grcode %>" isLoad="true" all="false" />
    &nbsp;&nbsp;
    <b>��������</b> :
        <select name="s_gyear" id="s_gyear">
            <option value="">-- ���� --</option>
        </select>
    &nbsp;&nbsp;
    <b>��������</b> :
        <select name="s_grseq" id="s_grseq">
            <option value="">-- ���� --</option>
        </select>
    &nbsp;&nbsp;
    <button id="b_status1">�˻�</button>&nbsp;<button id="b_status1_hide">����</button>&nbsp;<button id="b_status1_show">��ġ��</button>&nbsp;&nbsp;&nbsp;<button onclick="javascript:pop_SetStat();">����뼳��</button>
</div><br/>
<div id="status1" style="text-align: center;">
	<table class="table_out" cellspacing="1" cellpadding="5">
		<tr>
			<td colspan="9" class="table_top_line"></td>
		</tr>
		<tr>
            <td class="table_title" width="10%" height="25"><b>�⵵</b></td>
   	        <td class="table_title"><b>����������</b></td>
   	        <td class="table_title" width="8%"><b>������</b></td>
   	        <td class="table_title" width="8%"><b>��û��</b></td>
   	        <td class="table_title" width="8%"><b>���μ�</b></td>
   	        <td class="table_title" width="8%"><b>�ݷ���</b></td>
   	        <td class="table_title" width="8%"><b>����</b></td>
   	        <td class="table_title" width="8%"><b>�̼���</b></td>
   	        <td class="table_title" width="8%"><b>�����</b></td>
       	    
		</tr>
		<tr>
			<td colspan="9" class="table_02_1">
			���� ���� �� �˻���ư�� Ŭ�����ּ���
			</td>
		</tr>
	</table>
</div>
<!-- ���� ��� �� -->
<hr></hr>
<br/>

<!-- �������� ��� ���� -->
<div style="text-align: left;">
	<strong>�������� ���</strong><br/>
	�˻����� : <select name="status2_year" id="status2_year">
	  	<option value="2014" >2014</option>
	  	<option value="2013" >2013</option>
	  	<option value="2012" >2012</option>
	</select>&nbsp;&nbsp;
	<button id="b_status2">�˻�</button>&nbsp;<button id="b_status2_hide">����</button>&nbsp;<button id="b_status2_show">��ġ��</button>
</div><br/>
<div id="status2" style="text-align: center;">
	<table class="table_out" cellspacing="1" cellpadding="5">
		<tr>
			<td colspan="14" class="table_top_line"></td>
		</tr>
		<tr>
            <td class="table_title" width="9%" height="25"><b>�з�</b></td>
   	        <td class="table_title" width="7%"><b>1��</b></td>
   	        <td class="table_title" width="7%"><b>2��</b></td>
   	        <td class="table_title" width="7%"><b>3��</b></td>
   	        <td class="table_title" width="7%"><b>4��</b></td>
   	        <td class="table_title" width="7%"><b>5��</b></td>
   	        <td class="table_title" width="7%"><b>6��</b></td>
   	        <td class="table_title" width="7%"><b>7��</b></td>
   	        <td class="table_title" width="7%"><b>8��</b></td>
   	        <td class="table_title" width="7%"><b>9��</b></td>
   	        <td class="table_title" width="7%"><b>10��</b></td>
   	        <td class="table_title" width="7%"><b>11��</b></td>
   	        <td class="table_title" width="7%"><b>12��</b></td>
   	        <td class="table_title" width="7%"><b>�հ�</b></td>
       	    
		</tr>
		<tr>
			<td colspan="14" class="table_02_1">
			��ȸ�Ͻ� �⵵�� ���� �� �˻���ư�� Ŭ�����ּ���
			</td>
		</tr>
	</table>
</div>
<!-- �������� ��� �� -->
<hr></hr>
<br/>

<!-- Ʃ�� ��� ���� -->
<div style="text-align: left;">
	<strong>Ʃ��Ȱ�� ���</strong><br/>
	�˻����� : <select name="status3_gubun" id="status3_gubun">
		<option value="I">�����Խ�</option>
		<option value="Q">��������</option>
	</select>&nbsp;&nbsp;
	�˻����� : <select name="status3_year" id="status3_year">
<%
    for( int i = currYear; i > 2011  ; i-- ) {
%>
        <option value="<%= i %>" ><%= i %></option>
<%
    }
%>
    </select> 
	<button id="b_status3">�˻�</button>&nbsp;<button id="b_status3_hide">����</button>&nbsp;<button id="b_status3_show">��ġ��</button>
</div><br/>
<div id="status3" style="text-align: center;">
	<table class="table_out" cellspacing="1" cellpadding="5">
		<tr>
			<td colspan="14" class="table_top_line"></td>
		</tr>
		<tr>
            <td class="table_title" width="9%" height="25"><b>�з�</b></td>
   	        <td class="table_title" width="7%"><b>1��</b></td>
   	        <td class="table_title" width="7%"><b>2��</b></td>
   	        <td class="table_title" width="7%"><b>3��</b></td>
   	        <td class="table_title" width="7%"><b>4��</b></td>
   	        <td class="table_title" width="7%"><b>5��</b></td>
   	        <td class="table_title" width="7%"><b>6��</b></td>
   	        <td class="table_title" width="7%"><b>7��</b></td>
   	        <td class="table_title" width="7%"><b>8��</b></td>
   	        <td class="table_title" width="7%"><b>9��</b></td>
   	        <td class="table_title" width="7%"><b>10��</b></td>
   	        <td class="table_title" width="7%"><b>11��</b></td>
   	        <td class="table_title" width="7%"><b>12��</b></td>
   	        <td class="table_title" width="7%"><b>�հ�</b></td>
       	    
		</tr>
		<tr>
			<td colspan="14" class="table_02_1">
			��ȸ�Ͻ� �⵵�� ���� �� �˻���ư�� Ŭ�����ּ���
			</td>
		</tr>
	</table>
</div>
<!-- Ʃ�� ��� �� -->
<hr></hr>
<br/>
<br/>

<a href="javascript:var popup = window.open('/learn/admin/event/za_OnlinePropEvent_2014_Lottery.jsp', 'eventWin', 'width=1024, height=900, scrollbars=yes');">2014�� 12�� 1�� ������û �̺�Ʈ ��÷�� ��÷�ϱ�</a><br/><br/>
<a href="javascript:var popup = window.open('/learn/admin/event/za_OnlineGradEvent_2014_Lottery.jsp', 'eventWin', 'width=1024, height=900, scrollbars=yes');">2014�� ����� �̺�Ʈ ��÷�� ��÷�ϱ�</a><br/>

</form>
</body>
<script language="Javascript">
<!--
	function winopen() {
		popwin = window.open("mMenutempLeft.jsp", "openAdminpop", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=200,height=700,top=0,left=0");
	}

	function pop_SetStat(){
		popwin = window.open("/learn/admin/statistics/main/za_SettingStat.jsp", "openSetStat", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=600,height=700,top=0,left=0");
	}

	$(document).ready(function() { 
	 	
	 	$('#b_status1_hide, #b_status1_show, #b_status1').click(function(e) {
	 		if ($(e.target).is("#b_status1")) {  // ���԰���
		 		var s2_grcode = $("#s_grcode").val();
		 		var s2_gyear = $("#s_gyear").val();
		 		var s2_grseq = $("#s_grseq").val();

				if(s2_grcode == "") {
					alert("�����׷��� �����ϼ���.");
					return false;
				}
				if(s2_gyear == "") {
					alert("�����⵵�� �����ϼ���.");
					return false;
				}
				
	 			$.ajax({ type : "POST", 			
			   		url : "/servlet/controller.statistics.MainStatusticServlet?p_process=selectStat", 
			   		data: "&param1="+s2_grcode+"&param2="+s2_gyear+"&param3="+s2_grseq, 
			   		beforeSend: function(){
	 					$("#status1").show();
	 					$('#status1').html('<img src="/learn/user/contents/loading.gif" border="0"/>');
 					},
			   		success: function(msg){ 
			   			if(msg.length > 0) {
				   			 //$('#goldclass_stat').html(msg);
				   			 $("#status1").children().remove();
				   			 $("#status1").append(msg);
			   			} 
			   		}  
			   	});//end ajax   
	 		}
	 		if ($(e.target).is("#b_status1_hide")) {  // ���԰��� ����
		 		$("#status1").hide();
	 		}
	 		if ($(e.target).is("#b_status1_show")) {  // ���԰��� ��ġ��
	 			$("#status1").show();
	 		}
	 		return false;
	 	});

	 	$('#b_status2, #b_status2_hide, #b_status2_show').click(function(e) {
		 	if ($(e.target).is("#b_status2")) {  // �������� 
		 		var search2_year = $("#status2_year").val();
	 			$.ajax({ type : "POST", 			
			   		url : "/servlet/controller.statistics.MainStatusticServlet?p_process=selectStat2", 
			   		data: "&param1="+search2_year, 
			   		beforeSend: function(){
							$("#status2").show();
							$("#status2").html('<img src="/learn/user/contents/loading.gif" border="0"/>');
					},
			   		success: function(msg){ 
			   			if(msg.length > 0) {
				   			 //$('#goldclass_stat').html(msg);
				   			 $("#status2").children().remove();
				   			 $("#status2").append(msg);
			   			} 
			   		}  
			   	});//end ajax   
	 		}
	 		if ($(e.target).is("#b_status2_hide")) {  // ��������
		 		$("#status2").hide();
	 		}
	 		if ($(e.target).is("#b_status2_show")) {  // ��������
	 			$("#status2").show();
	 		}
	 		return false;
	 	});

	 	$('#b_status3, #b_status3_hide, #b_status3_show').click(function(e) {
		 	if ($(e.target).is("#b_status3")) {  // Ʃ�� 
		 		var search3_year = $("#status3_year").val();
		 		var status3_gubun = $("#status3_gubun").val();
	 			$.ajax({ type : "POST", 			
			   		url : "/servlet/controller.statistics.MainStatusticServlet?p_process=selectStat3", 
			   		data: "&param1="+search3_year+"&param2="+status3_gubun, 
			   		beforeSend: function(){
							$("#status3").show();
							$('#status3').html('<img src="/learn/user/contents/loading.gif" border="0"/>');
					},
			   		success: function(msg){ 
			   			if(msg.length > 0) {
				   			 //$('#goldclass_stat').html(msg);
				   			 $("#status3").children().remove();
				   			 $("#status3").append(msg);
			   			} 
			   		}  
			   	});//end ajax   
	 		}
	 		if ($(e.target).is("#b_status3_hide")) {  // Ʃ��
		 		$("#status3").hide();
	 		}
	 		if ($(e.target).is("#b_status3_show")) {  // Ʃ��
	 			$("#status3").show();
	 		}
	 		return false;
	 	});
	 	
        $("#s_gyear").bind("change", function(){
            var grcode = $("select[name=s_grcode]").val();
            var param = "type=sqlID&sqlID=selectBox.grSeqList&param=" + grcode + "," + $(this).val();
            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "get"
                ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                ,   dataType : "json"
                ,   data : param
                ,   success : fnSetGrSeq
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(arg1, arg2) {
                        // alert("error : " + arg1);
                    }
            });
        });
	} 
	
	); 
	
	function fnChangeGrcode(){
		var param = "type=sqlID&sqlID=selectBox.grYearList&param=" + $("select[name=s_grcode]").val();
        $.ajaxSetup({cache:false});
        $.ajax({
                type : "get"
            ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
            ,   dataType : "json"
            ,   data : param
            ,   success : fnSetGrYear
            ,   complete : function(arg1, arg2) {
                    // alert("complete : " + arg1);
                }
            ,   error :  function(arg1, arg2) {
                    // alert("error : " + arg1);
                }
        });
	}
	
	/**
     * ���� �׷캰 ���� selectbox ����
     */
    function fnSetGrYear( result ) {
        $("#s_gyear").empty();
        $("#s_grseq").empty();
        $("#oSubjcourse").empty();
        $("#s_gyear").append("<option value=\"\">-- ���� --</option>");
        $("#s_grseq").append("<option value=\"\">-- ���� --</option>");

        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#s_gyear").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });

        }
    }

    /**
     * ���� �׷� ������ �������� selectbox ����
     */
    function fnSetGrSeq( result ) {
        $("#s_grseq").empty();
        $("#oSubjcourse").empty();
        $("#s_grseq").append("<option value=\"\">-- ���� --</option>");

        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#s_grseq").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });
        }
    }
-->
</script>
</html>
