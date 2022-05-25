<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<%
    RequestBox box		= (RequestBox)request.getAttribute("requestbox");
	String p_link		= box.getStringDefault("p_link","H");
	String p_gubun		= box.getStringDefault("p_gubun","A");
%>
<!DOCTYPE HTML>
<html>
<head>
<title>�ѱ������������ �������� ���������� (�¶��� ������)</title>
<link href="/css/2012/research_style.css" type="text/css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script> 
<script type="text/javascript">
	$(document).ready(function(){
		var useragent = navigator.userAgent;
		if(useragent.indexOf("MSIE 8.0") != -1 || useragent.indexOf("MSIE 9.0") != -1 || useragent.indexOf("MSIE 7.0") != -1){
			$("#br_show1").attr("style", "display:none;");
			$("#br_show2").attr("style", "display:none;");
			$("#br_show3").attr("style", "display:none;");
			$("#br_show4").attr("style", "display:none;");
		}

		$("#q_ans_1 li input").click(function(){
			var t = $("input[name=q_ans_1]:checked").val();
			if(t == "1" || t == "2"){
				$("#question_2").attr("style","display:block;");
			}else{
				$("#question_2").attr("style","display:none;");
				$("input[name=q_ans_2]").attr('checked', false);
				toogle_radio('2','N');
			}
		});

		$("#q_ans_11 li input").click(function(){
			var t = $("input[name=q_ans_11]:checked").val();
			if(t == "1" || t == "2"){
				$("#question_12").attr("style","display:block;");
			}else{
				$("#question_12").attr("style","display:none;");
				$("input[name=q_ans_12]").attr('checked', false);
				toogle_radio('12','N');
			}
		});

		$("#etc_che_15").click(function(){
			toogle_checkbox('15');
		});
		
	});

	function toogle_radio(exnum, sta){
		if(sta == "N"){
			$("input[name=r_ans_"+exnum+"]").val("");
			$("input[name=r_ans_"+exnum+"]").attr("readonly", true); 
		}else{
			$("input[name=r_ans_"+exnum+"]").removeAttr("readonly");
		}
	}

	function toogle_checkbox(exnum){
		var t = "";
		t = $("#etc_che_"+exnum).is(":checked");
		if(t){
			$("input[name=r_ans_"+exnum+"]").removeAttr("readonly");				
		}else{
			$("input[name=r_ans_"+exnum+"]").val("");
			$("input[name=r_ans_"+exnum+"]").attr("readonly", true);
		}
	}

	function next(){
		
		var f = document.form1;
		var ans_1 = "";		var ans_2 = "";		var ans_3 = "";			var ans_4 = "";			var ans_5 = "";			var ans_6 = "";		var ans_7 = "";		var ans_8 = "";
		var ans_9 = "";		var ans_10 = "";	var ans_11 = "";		var ans_12 = "";		var ans_13 = "";		var ans_14 = "";	var ans_15 = "";

		ans_1 = $("input[name=q_ans_1]:checked").val();//1�� ���� ���
		ans_2 = $("input[name=q_ans_2]:checked").val();//2�� ���� ���
			if($("[name='r_ans_2']").val() != ""){ans_2 += "-" + $("[name='r_ans_2']").val();}
		ans_3 = $("input[name=q_ans_3]:checked").val();//3�� ���� ���
		ans_4 = $("input[name=q_ans_4]:checked").val();//4�� ���� ���
		ans_5 = $("input[name=q_ans_5]:checked").val();//5�� ���� ���
		ans_6 = $("input[name=q_ans_6]:checked").val();//6�� ���� ���
		ans_7 = $("input[name=q_ans_7]:checked").val();//7�� ���� ���
		ans_8 = $("input[name=q_ans_8]:checked").val();//8�� ���� ���
		ans_9 = $("input[name=q_ans_9]:checked").val();//9�� ���� ���
		ans_10 = $("input[name=q_ans_10]:checked").val();//10�� ���� ���
		ans_11 = $("input[name=q_ans_11]:checked").val();//11�� ���� ���
		ans_12 = $("input[name=q_ans_12]:checked").val();//12�� ���� ���
			if($("[name='r_ans_12']").val() != ""){ans_12 += "-" + $("[name='r_ans_12']").val();}
		ans_13 = $("input[name=q_ans_13]:checked").val();//13�� ���� ���
		ans_14 = $("input[name=q_ans_14]:checked").val();//14�� ���� ���
		for(var i = 0; i< $("[name='q_ans_15']:checked").length; i++){// 15�� ���� ���
			ans_15 += "," + $("[name='q_ans_15']:checked").eq(i).val();
		}
		if(ans_15 != ""){
			ans_15 = ans_15.substring(1);
			if($("[name='r_ans_15']").val() != ""){
				ans_15 += "-" + $("[name='r_ans_15']").val();
			}
		}
		
		f.p_ans_1.value = ans_1;
		f.p_ans_2.value = ans_2;
		f.p_ans_3.value = ans_3;
		f.p_ans_4.value = ans_4;
		f.p_ans_5.value = ans_5;
		f.p_ans_6.value = ans_6;
		f.p_ans_7.value = ans_7;
		f.p_ans_8.value = ans_8;
		f.p_ans_9.value = ans_9;
		f.p_ans_10.value = ans_10;
		f.p_ans_11.value = ans_11;
		f.p_ans_12.value = ans_12;
		f.p_ans_13.value = ans_13;
		f.p_ans_14.value = ans_14;
		f.p_ans_15.value = ans_15;
		if(value_checking()){
			f.submit();
		}else{
			alert("������ �׸��� �ֽ��ϴ�.");
		}
	}

	function value_checking(){
		var f = document.form1;
		
		if(f.p_ans_1.value == "" || f.p_ans_1.value == "undefined"){$("#question_1").focus(); return false;}
		if(f.p_ans_1.value == "1" || f.p_ans_1.value == "2"){
			if(f.p_ans_2.value == "" || f.p_ans_2.value == "undefined"){$("#question_2").focus(); return false;}
		}
		if(f.p_ans_3.value == "" || f.p_ans_3.value == "undefined"){$("#question_3").focus(); return false;}
		if(f.p_ans_4.value == "" || f.p_ans_4.value == "undefined"){$("#question_4").focus(); return false;}
		if(f.p_ans_5.value == "" || f.p_ans_5.value == "undefined"){$("#question_5").focus(); return false;}
		if(f.p_ans_6.value == "" || f.p_ans_6.value == "undefined"){$("#question_6").focus(); return false;}
		if(f.p_ans_7.value == "" || f.p_ans_7.value == "undefined"){$("#question_7").focus(); return false;}
		if(f.p_ans_8.value == "" || f.p_ans_8.value == "undefined"){$("#question_8").focus(); return false;}
		if(f.p_ans_9.value == "" || f.p_ans_9.value == "undefined"){$("#question_9").focus(); return false;}
		if(f.p_ans_10.value == "" || f.p_ans_10.value == "undefined"){$("#question_10").focus(); return false;}
		if(f.p_ans_11.value == "" || f.p_ans_11.value == "undefined"){$("#question_11").focus(); return false;}
		if(f.p_ans_11.value == "1" || f.p_ans_11.value == "2"){
			if(f.p_ans_12.value == "" || f.p_ans_12.value == "undefined"){$("#question_12").focus(); return false;}
		}
		if(f.p_ans_13.value == "" || f.p_ans_13.value == "undefined"){$("#question_13").focus(); return false;}
		if(f.p_ans_14.value == "" || f.p_ans_14.value == "undefined"){$("#question_14").focus(); return false;}
		if(f.p_ans_15.value == "" || f.p_ans_15.value == "undefined"){$("#question_15").focus(); return false;}
		if($("[name='q_ans_15']:checked").length < 2){$("#question_15").focus(); return false;}
		
		
		return true;
	}

	function checkboxLimit(frm,obj,num){
		var str = obj.name;
		var len = frm.length;
		var chk = 0;
		for(i=0; i<len; i++){
			if(frm[i].name == str && frm[i].checked == true){
				chk++;
			}
			if(chk > num){
				alert(num + "�� ���� ������ �� �ֽ��ϴ�.");
				obj.checked = false;
				break;
			}
		}
	}

</script>
</head>
<BODY>
<form name="form1" id="form1" method="post" action="/servlet/controller.homepage.MainServlet">
<input type="hidden" name="p_gubun" value="<%=p_gubun %>"/>
<input type="hidden" name="p_link" value="<%=p_link %>"/>
<input type="hidden" name="p_process" value="research_2"/>
<input type="hidden" name="p_ans_1"/>
<input type="hidden" name="p_ans_2"/>
<input type="hidden" name="p_ans_3"/>
<input type="hidden" name="p_ans_4"/>
<input type="hidden" name="p_ans_5"/>
<input type="hidden" name="p_ans_6"/>
<input type="hidden" name="p_ans_7"/>
<input type="hidden" name="p_ans_8"/>
<input type="hidden" name="p_ans_9"/>
<input type="hidden" name="p_ans_10"/>
<input type="hidden" name="p_ans_11"/>
<input type="hidden" name="p_ans_12"/>
<input type="hidden" name="p_ans_13"/>
<input type="hidden" name="p_ans_14"/>
<input type="hidden" name="p_ans_15"/>
<div id="wrap">
	<!-- header -->
	<div id="header">
		<h1><img src="/images/2012/main/research/logo.gif" /></h1>
	</div>
	<!-- //header -->

	<!-- content -->
	<div id="con">
		<div class="box_header">
			<div class="box">
				<div class="question" id="question_1">
					<p class="question_tit">
						<span>�н��ڴԲ����� �ѱ�������������� �η¾缺����� ���� ��� ���� �˰� ��ʴϱ�?</span>
					</p>
					<ul id="q_ans_1">
						<li class="wf"><input name="q_ans_1" type="radio" value="1"/> �� �˰� �ִ�.</li>
						<li class="wf"><input name="q_ans_1" type="radio" value="2"/> �ణ �˰� �ִ� ���̴�.</li>
						<li class="wf"><input name="q_ans_1" type="radio" value="3"/> �� �𸥴�.</li>
						<li class="wf"><input name="q_ans_1" type="radio" value="4"/> ���� �𸥴�.</li>
					</ul>
				</div>

				<div class="question" id="question_2" style="display: none;">
					<p class="question_tit">
						<span>�ַ� � ��θ� ���� ��ų� �˰� �Ǿ����ϱ�?</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_2" type="radio" value="1" onclick="javascript:toogle_radio('2','N');" /> TV, ����, �Ź� ���� ��ü</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="2" onclick="javascript:toogle_radio('2','N');" /> ���ͳ� (�ѱ������������ Ȩ������ ����)</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="3" onclick="javascript:toogle_radio('2','N');" /> �ѱ������������ Ȩ������</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="4" onclick="javascript:toogle_radio('2','N');" /> ģ��, ����, ģô �� ���� ���</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="5" onclick="javascript:toogle_radio('2','N');" /> ���� �η¾缺���(����) ������ ����</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="6" onclick="javascript:toogle_radio('2','Y');" /> ��Ÿ <input name="r_ans_2" type="text" value="" size="50" readonly="readonly"/></li>
					</ul>
				</div>

				<div class="question" id="question_3">
					<p class="question_tit">
						<span>������ ���̹���������ī���� ���� ���� ���뿡 ���� �������Դϴ�. <br>1������ 5�� �� �н��ڴԲ��� �����Ͻô� ������ Ŭ���� ���� ������ ����ֽʽÿ�.</span>
					</p><span id="br_show1"><br/></span>
		            <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border-style: solid;border-color: gray;border-width: 1px;">
						<colgroup><col width=""/><col width="50px"/><col width="50px"/><col width="50px"/><col width="50px"/><col width="50px"/></colgroup>
						<thead>
							<tr height="70px" bgcolor="#efefef">
								<th>�� ��</th>
								<th>����<br>�׷���<br>�ʴ�</th>
								<th>�׷���<br>����<br>���̴�</th>
								<th>����<br>�̴�</th>
								<th>�׷�<br>���̴�</th>
								<th>�ſ�<br>�׷���</th>
							</tr>
						</thead>
						<tbody>
							<tr height="30px" valign="middle">
								<td align="left">&nbsp; ���������� ������ ���� ���� ���濡 ������ �ȴ�</td>
								<td><input name="q_ans_3" type="radio" value="1" /></td>
								<td><input name="q_ans_3" type="radio" value="2" /></td>
								<td><input name="q_ans_3" type="radio" value="3" /></td>
								<td><input name="q_ans_3" type="radio" value="4" /></td>
								<td><input name="q_ans_3" type="radio" value="5" /></td>
							</tr>
							<tr height="30px" valign="middle">
								<td align="left">&nbsp; ����� ������ �ʿ��� ���İ� ���Ǵɷ��� ���߰� �ִ�</td>
								<td><input name="q_ans_4" type="radio" value="1" /></td>
								<td><input name="q_ans_4" type="radio" value="2" /></td>
								<td><input name="q_ans_4" type="radio" value="3" /></td>
								<td><input name="q_ans_4" type="radio" value="4" /></td>
								<td><input name="q_ans_4" type="radio" value="5" /></td>
							</tr>
							<tr height="30px" valign="middle">
								<td align="left">&nbsp; ���������� ü�����̴�</td>
								<td><input name="q_ans_5" type="radio" value="1" /></td>
								<td><input name="q_ans_5" type="radio" value="2" /></td>
								<td><input name="q_ans_5" type="radio" value="3" /></td>
								<td><input name="q_ans_5" type="radio" value="4" /></td>
								<td><input name="q_ans_5" type="radio" value="5" /></td>
							</tr>
							<tr height="30px" valign="middle">
								<td align="left">&nbsp; �¶��� ����ȯ�� ������ ���� ����Ѵ�</td>
								<td><input name="q_ans_6" type="radio" value="1" /></td>
								<td><input name="q_ans_6" type="radio" value="2" /></td>
								<td><input name="q_ans_6" type="radio" value="3" /></td>
								<td><input name="q_ans_6" type="radio" value="4" /></td>
								<td><input name="q_ans_6" type="radio" value="5" /></td>
							</tr>
						</tbody>
						<tfoot>
							<tr height="1px">
								<td colspan="6"></td>
							</tr>
						</tfoot>
					</table> <span id="br_show2"><br/></span><br/>
				</div>
				
				<div class="question" id="question_4">
					<p class="question_tit">
						<span>������ ���̹���������ī���� ���� ���� �̿���� �� �̿�ȯ�濡 ���� �������Դϴ�. <br>1������ 5�� �� �н��ڴԲ��� �����Ͻô� ������ Ŭ���� ���� ������ ����ֽʽÿ�.</span>
					</p><span id="br_show3"><br/></span>
		            <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border-style: solid;border-color: gray;border-width: 1px;">
						<colgroup><col width=""/><col width="50px"/><col width="50px"/><col width="50px"/><col width="50px"/><col width="50px"/></colgroup>
						<thead>
							<tr height="70px" bgcolor="#efefef">
								<th>�� ��</th>
								<th>����<br>�׷���<br>�ʴ�</th>
								<th>�׷���<br>����<br>���̴�</th>
								<th>����<br>�̴�</th>
								<th>�׷�<br>���̴�</th>
								<th>�ſ�<br>�׷���</th>
							</tr>
						</thead>
						<tbody>
							<tr height="30px" valign="middle">
								<td align="left">&nbsp; �������� ��û �� ���� �� �̿��� ���ϴ� </td>
								<td><input name="q_ans_7" type="radio" value="1" /></td>
								<td><input name="q_ans_7" type="radio" value="2" /></td>
								<td><input name="q_ans_7" type="radio" value="3" /></td>
								<td><input name="q_ans_7" type="radio" value="4" /></td>
								<td><input name="q_ans_7" type="radio" value="5" /></td>
							</tr>
							<tr height="30px" valign="middle">
								<td align="left">&nbsp; �������� �䱸������ �����Ϸ��� ����Ѵ�</td>
								<td><input name="q_ans_8" type="radio" value="1" /></td>
								<td><input name="q_ans_8" type="radio" value="2" /></td>
								<td><input name="q_ans_8" type="radio" value="3" /></td>
								<td><input name="q_ans_8" type="radio" value="4" /></td>
								<td><input name="q_ans_8" type="radio" value="5" /></td>
							</tr>
							<tr height="30px" valign="middle">
								<td align="left">&nbsp; ���� ���� ������ ���� ã�ų� ���� �� �ִ�</td>
								<td><input name="q_ans_9" type="radio" value="1" /></td>
								<td><input name="q_ans_9" type="radio" value="2" /></td>
								<td><input name="q_ans_9" type="radio" value="3" /></td>
								<td><input name="q_ans_9" type="radio" value="4" /></td>
								<td><input name="q_ans_9" type="radio" value="5" /></td>
							</tr>
							<tr height="30px" valign="middle">
								<td align="left">&nbsp; ����Ʈ �޴��� ������ �����ϰ� ��ġ�Ǿ� �ִ�</td>
								<td><input name="q_ans_10" type="radio" value="1" /></td>
								<td><input name="q_ans_10" type="radio" value="2" /></td>
								<td><input name="q_ans_10" type="radio" value="3" /></td>
								<td><input name="q_ans_10" type="radio" value="4" /></td>
								<td><input name="q_ans_10" type="radio" value="5" /></td>
							</tr>
						</tbody>
						<tfoot>
							<tr height="1px">
								<td colspan="6"></td>
							</tr>
						</tfoot>
					</table> <span id="br_show4"><br/></span><br/>
				</div>

				<div class="question" id="question_11">
					<p class="question_tit">
						<span>���̹������� ��ī���̿��� �����ϴ� ��������, �̿�����, �̿�ȯ�� ���� ��� ������� ��, �¶��� ���� ���񽺿� ���� ���������� ��� ���� �����Ͻʴϱ�?</span>
					</p>
					<ul id="q_ans_11">
						<li class="wf"><input name="q_ans_11" type="radio" value="1" > �ſ� �Ҹ����Ѵ�</li>
						<li class="wf"><input name="q_ans_11" type="radio" value="2" > �ణ �Ҹ����Ѵ�</li>
						<li class="wf"><input name="q_ans_11" type="radio" value="3" > �����̴�</li>
						<li class="wf"><input name="q_ans_11" type="radio" value="4" > �ణ �����Ѵ�</li>
						<li class="wf"><input name="q_ans_11" type="radio" value="5" > �ſ� �����Ѵ�</li>
					</ul>
				</div>

				<div class="question" id="question_12" style="display: none;">
					<p class="question_tit">
						<span>�н��Ͻ� ���̹� �������� ���� �Ҹ��� ���� �����Դϱ�?</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_12" type="radio" value="1" onclick="javascript:toogle_radio('12','N');"/> ��Ȯ�ϰ� ������ �н� ����</li>
						<li class="wf"><input name="q_ans_12" type="radio" value="2" onclick="javascript:toogle_radio('12','N');"/> ���� ���� ����</li>
						<li class="wf"><input name="q_ans_12" type="radio" value="3" onclick="javascript:toogle_radio('12','N');"/> ������ ������ ���� �н� �ߴ�</li>
						<li class="wf"><input name="q_ans_12" type="radio" value="4" onclick="javascript:toogle_radio('12','N');"/> ��ģ���� ���� �</li>
						<li class="wf"><input name="q_ans_12" type="radio" value="5" onclick="javascript:toogle_radio('12','N');"/> ������ Ȩ������ ����</li>
						<li class="wf"><input name="q_ans_12" type="radio" value="6" onclick="javascript:toogle_radio('12','Y');"/> ��Ÿ <input name="r_ans_12" type="text" value="" size="50" readonly="readonly"/></li>
					</ul>
				</div>

				<div class="question" id="question_13">
					<p class="question_tit">
						<span>�н��ڴԲ��� ���̽� �ð�, ���, ��� ���� ����Ͽ� ����ϼ̴� �Ϳ� ���� �¶��� ���� ���񽺿� ���� ��� ���� �����Ͻʴϱ�?</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_13" type="radio" value="1" > �ſ� �Ҹ����Ѵ�</li>
						<li class="wf"><input name="q_ans_13" type="radio" value="2" > �ణ �Ҹ����Ѵ�</li>
						<li class="wf"><input name="q_ans_13" type="radio" value="3" > �����̴� (���� ����ϴ�)</li>
						<li class="wf"><input name="q_ans_13" type="radio" value="4" > �ణ �����Ѵ�</li>
						<li class="wf"><input name="q_ans_13" type="radio" value="5" > �ſ� �����Ѵ�</li>
					</ul>
				</div>
				
				<div class="question" id="question_14">
					<p class="question_tit">
						<span>���� ������ �������� �����ִ� ģ���� ���ᰡ �ִٸ�, �н��ڴԲ����� ���̹������� ��ī���̸� ���� ����鿡�� ��õ�� ������ ��� ���� �ֽ��ϱ�?</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_14" type="radio" value="1" > ���� ��õ������ ����</li>
						<li class="wf"><input name="q_ans_14" type="radio" value="2" > ���� ��õ������ ����</li>
						<li class="wf"><input name="q_ans_14" type="radio" value="3" > �����̴�</li>
						<li class="wf"><input name="q_ans_14" type="radio" value="4" > ������ ��õ�ϰڴ�</li>
						<li class="wf"><input name="q_ans_14" type="radio" value="5" > ���� ��õ�ϰڴ�</li>
					</ul>
				</div>
				
				<div class="question" id="question_15">
					<p class="question_tit">
						<span>���� �� ���� ������� ���̹������� ��ī���̸� ã�ƿ����� �ϱ� ���ؼ� ���� ������ �ΰ� �ؾ� �� ���� �����̶�� �����Ͻʴϱ�? <font color="red">(2�� ����)</font></span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_15" type="checkbox" value="1" onclick="checkboxLimit(this.form,this,2)" /> �������� �������� ������ ����� ������ Ȯ��</li>
						<li class="wf"><input name="q_ans_15" type="checkbox" value="2" onclick="checkboxLimit(this.form,this,2)" /> �������뿡 ���� �ȳ� �� ȫ�� Ȯ��</li>
						<li class="wf"><input name="q_ans_15" type="checkbox" value="3" onclick="checkboxLimit(this.form,this,2)" /> �����ϰ� ���� �н� ����Ʈ ����</li>
						<li class="wf"><input name="q_ans_15" type="checkbox" value="4" onclick="checkboxLimit(this.form,this,2)" /> ������ ����� ���� �پ��� ���� ����</li>
						<li class="wf"><input name="q_ans_15" type="checkbox" value="5" onclick="checkboxLimit(this.form,this,2)" /> ������Ʈ��ũ ������ ���� Ŀ�´�Ƽ Ȱ�� ��ȭ</li>
						<li class="wf"><input name="q_ans_15" type="checkbox" value="6" onclick="checkboxLimit(this.form,this,2)" /> ������ ����� ����/�������� Ưȭ�� �н� �� ��°��� ��� ����</li>
						<li class="wf"><input name="q_ans_15" type="checkbox" value="7" onclick="checkboxLimit(this.form,this,2)" id="etc_che_15" /> ��Ÿ <input name="r_ans_15" type="text" value="" size="50" readonly="readonly"/></li>
					</ul>
				</div>
				
			</div>
		</div>
	</div>
	<div id="footer">
	<a href="javascript:next();"><img src="/images/2012/main/research/nextbutton.gif"/></a>
</div>
</div>
<!-- //content -->

</form>
</BODY>
</HTML>
