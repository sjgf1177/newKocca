<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    
    DataBox gbBox = null;

    ArrayList<DataBox> gubunList1 = (ArrayList)request.getAttribute("gubunList1");
    ArrayList<DataBox> gubunNmList = (ArrayList)request.getAttribute("gubunNmList");

    String upperClsCd = box.getStringDefault("upperClsCd", "0000");
    String gubun1 = box.getString("gubun1");
    String gubun2 = box.getString("gubun2");
    String gubun3 = box.getString("gubun3");
%>

<html>
<head>
<title>��� | �����з� ���� | ���� | ������ | �ѱ���������ī����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/css/admin_style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">

<style type="text/css">
    button{display:inline-block; padding:2px 4px 0px 4px; margin-bottom:0; font-size:12px; font-weight:bold; text-align:center; white-space:nowrap; vertical-align:middle; border-style: solid 1px; }
    button.btn_reg {width:80px; height:24px; background-color:#efefef; color:#000000; border-color:#808080; border-width:1px;}
    button.btn_basic {width:80px; height:20px; background-color:#efefff; color:#000000; border-color:#808090; border-width:1px;}
</style>

<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//���� üũ
	$(".gubunBox").change(function (){
		fnLvCodeList($(this));
	});
});

function fnModifySubjectClassify() {

    if ( $("#gubun1").val() == "" ) {
        alert("�帣�� �����ϼ���.");
        $("#gubun1").focus();
        return;
    } else if ( $("#gubun2").val() == "" ) {
        alert("��з��� �����ϼ���.");
        $("#gubun2").focus();
        return;
    } else if ( $("#gubun3").val() == "" ) {
        alert("�ҷ��� �����ϼ���.");
        $("#gubun3").focus();
        return;
    } else {
        $("#oSubjClassifyRegisterForm").action = "/servlet/controller.course.SubjectClassifyServlet";

        $("#oProcess").val("update");
        $("#oSubjClassifyRegisterForm").submit();
    }
}

//���� �з��ڵ� ���
function fnLvCodeList($this){
	var ordr = $this.attr("ordr");
	
	if(ordr > 2){
		return;
	}
	
		$.ajax({
        type: "POST",
        dataType:"json",
        url:"/servlet/controller.course.SubjectClassifyServlet",
        data: {
            "process": "levelCodeList",
            "p_ordr": Number(ordr) + 1,
            "p_hcd" : $this.val() 
        },
        success: function(data) {
        	if(ordr == 1){
	        	$("#gubun2 > option").remove();
        		$("#gubun2").append("<option value=\"\">�����ϼ���.</option>");
	        	$("#gubun3 > option").remove();	
	        	$("#gubun3").append("<option value=\"\">�����ϼ���.</option>");
        		
	        	$.each(data, function(idx, obj) {
	        		$("#gubun2").append("<option value=\""+obj.d_code+"\">"+ obj.d_codenm +"</option>")
	        	});
        	}else if(ordr == 2){
	        	$("#gubun3 > option").remove();
        		$("#gubun3").append("<option value=\"\">�����ϼ���.</option>");
	        	$.each(data, function(idx, obj) {
	        		$("#gubun3").append("<option value=\""+obj.d_code+"\">"+ obj.d_codenm +"</option>")
	        	});		        		
        	}
		},
		error:function (){
        	if(ordr == 1){
	        	$("#gubun2 > option").remove();
        		$("#gubun2").append("<option value=\"\">�����ϼ���.</option>");
	        	$("#gubun3 > option").remove();
        		$("#gubun3").append("<option value=\"\">�����ϼ���.</option>");	
        	}else if(ordr == 2){
	        	$("#gubun3 > option").remove();
        		$("#gubun3").append("<option value=\"\">�����ϼ���.</option>");	        		
        	}	        		
		}
  	});
}
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form id="oSubjClassifyRegisterForm" name="subjClassifyRegisterForm" method="post">
    <input type="hidden" id="oProcess" name="process"  value="" />
    <input type="hidden" id="oUpperClsCd" name="upperClsCd"  value="<%= upperClsCd %>" />
    <input type="hidden" id="p_gubun1" name="p_gubun1"  value="<%= gubun1 %>" />
    <input type="hidden" id="p_gubun2" name="p_gubun2"  value="<%= gubun2 %>" />
    <input type="hidden" id="p_gubun3" name="p_gubun3"  value="<%= gubun3 %>" />

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">
            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td style="font-size:14pt; font-weight:bold; padding-top:16px;">���� �з� ����</td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->
            <br/>

            <!-- tab ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="12%">
                        <table cellspacing="0" cellpadding="0" class="s_table">
                            <tr>
                                <td rowspan="3" class="blue_butt_left" id="oTb1Td1"></td>
                                <td class="blue_butt_top" id="oTb1Td2"></td>
                                <td rowspan="3" class="blue_butt_right" id="oTb1Td3"></td>
                            </tr>
                            <tr>
                                <td class="blue_butt_middle" id="oTb1Td4">�¶��� �з���</td>
                            </tr>
                            <tr>
                                <td class="blue_butt_bottom" id="oTb1Td5"></td>
                            </tr>
                        </table>
                    <td width="87%">&nbsp;</td>
                </tr>
                <tr>
                    <td height="2" colspan="4" bgcolor="#6699CC"></td>
                </tr>
            </table>
            <!-- tab �� //-->

            <!-- ��� ȭ�� ���� //-->
            <table class="table_out" cellspacing="1" cellpadding="5">
                <colgroup>
                    <col width="120px;" />
                    <col width="200px;" />
                    <col width="120px;" />
                    <col width="*;" />
                </colgroup>
                <tr>
                    <td colspan="4" class="table_top_line"></td>
                </tr>
                <tr>
                    <td height="25" class="table_title"><strong>�з�</strong></td>
                    <td class="table_02_2" colspan="3">
                        <select id="gubun1" name="gubun1" class="gubunBox" ordr="1">
                        	<option value="">�����ϼ���.</option>
                        	<%
						    if (gubunList1.size() > 0) {
						        for ( DataBox dbox : gubunList1) {
						        	if(!"A".equals(dbox.getString("d_code"))){
						    %>
                        				<option value="<%=dbox.getString("d_code")%>"><%=dbox.getString("d_codenm")%></option>
						    <% 
						        	}
						        }
						    }
							%>
                        </select>
                        <select id="gubun2" name="gubun2" class="gubunBox" ordr="2">
                        	<option value="">�����ϼ���.</option>
                        </select>
                        <select id="gubun3" name="gubun3" class="gubunBox" ordr="3">
                        	<option value="">�����ϼ���.</option>
                        </select>
                        <span>
                        	<= [
			   	<%
			        if ( gubunNmList.size() > 0 ) {
			            for( int i = 0 ; i < gubunNmList.size() ; i++ ){
			            	gbBox = (DataBox)gubunNmList.get(i);
				%>
							<%= gbBox.getString("d_codenm") %> 
				<%
							if(gubunNmList.size() - 1 > i){
				%>
								>
				<%				
							}
			            }
			        }
				%>
                    	]
                        </span>
                    </td>
                </tr>
            </table>
            <br/>
            <br/>
            <button id="oRegisterBtn" name="registerBtn" class="btn_reg" onclick="fnModifySubjectClassify();return false;" >����</button>&nbsp;&nbsp;
            <button id="oCancelBtn" name="cancelBtn" class="btn_reg" onclick="history.back(-1);" >���</button>

        </td>
    </tr>
</table>
</form>

</body>
</html>
