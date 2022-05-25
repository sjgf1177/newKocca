<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<%
    RequestBox box		= (RequestBox)request.getAttribute("requestbox");
	String p_link		= box.getStringDefault("p_link","H");
	String p_gubun		= box.getStringDefault("p_gubun","S");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>���̹���������ī���� ���� �������� (������)</title>
<link href="/css/2012/research_style.css" type="text/css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script> 
<script type="text/javascript">
	$(document).ready(function(){
		var useragent = navigator.userAgent;
		if(useragent.indexOf("MSIE 8.0") != -1 || useragent.indexOf("MSIE 9.0") != -1 || useragent.indexOf("MSIE 7.0") != -1){
			$("#br_show").attr("style", "display:none;");
			$("#br_show2").attr("style", "display:none;");
		}

		$("#q_ans_4 li input").click(function(){
			var t = "";
			t = $("#etc_che_4").is(":checked");
			if(t){
				$("#question_5").attr("style","display:block;");
			}else{
				$("#question_5").attr("style","display:none;");
				$("input[name=q_ans_5]").attr('checked', false);
			}
		});

		$("#q_ans_6 li input").click(function(){
			var t = $("input[name=q_ans_6]:checked").val();
			if(t == "1" || t == "2"){
				$("#question_7").attr("style","display:block;");
				$("#question_8").attr("style","display:none;");
				$("input[name=q_ans_8]").attr('checked', false);
			}else{
				$("#question_8").attr("style","display:block;");
				$("#question_7").attr("style","display:none;");
				$("input[name=q_ans_7]").attr('checked', false);
			}
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
		var ans_9 = "";		var ans_10 = "";	var ans_11 = "";		var ans_12 = "";		var ans_13 = "";		var ans_14 = "";	var ans_15;

		ans_1 = $("input[name=q_ans_1]:checked").val();//1�� ���� ���
		if($("[name='r_ans_1']").val() != ""){ans_1 += "-" + $("[name='r_ans_1']").val();}
		
		ans_2 = $("input[name=q_ans_2]:checked").val();//2�� ���� ���
		
		ans_3 = $("input[name=q_ans_3]:checked").val();//3�� ���� ���

		for(var i = 0; i< $("[name='q_ans_4']:checked").length; i++){// 4�� ���� ���
			ans_4 += "," + $("[name='q_ans_4']:checked").eq(i).val();
		}
		if(ans_4 != ""){ans_4 = ans_4.substring(1);}
		
		for(var i = 0; i< $("[name='q_ans_5']:checked").length; i++){// 5�� ���� ���
			ans_5 += "," + $("[name='q_ans_5']:checked").eq(i).val();
		}
		if(ans_5 != ""){ans_5 = ans_5.substring(1);}
		
		ans_6 = $("input[name=q_ans_6]:checked").val();//6�� ���� ���
		
		ans_7 = $("input[name=q_ans_7]:checked").val();//7�� ���� ���
		if($("[name='r_ans_7']").val() != ""){ans_7 += "-" + $("[name='r_ans_7']").val();}
		
		ans_8 = $("input[name=q_ans_8]:checked").val();//8�� ���� ���
		if($("[name='r_ans_8']").val() != ""){ans_8 += "-" + $("[name='r_ans_8']").val();}
		
		for(var i = 0; i< $("[name='q_ans_9']:checked").length; i++){// 9�� ���� ���
			ans_9 += "," + $("[name='q_ans_9']:checked").eq(i).val();
		}
		if(ans_9 != ""){ans_9 = ans_9.substring(1);}
		
		ans_10 = $("input[name=q_ans_10]:checked").val();//10�� ���� ���
		if($("[name='r_ans_10']").val() != ""){ans_10 += "-" + $("[name='r_ans_10']").val();}
		
		ans_11 = $("input[name=r_ans_11]").val();//11�� ���� ���

		ans_12 = $("input[name=q_ans_12]:checked").val();//12�� ���� ���
		if($("[name='r_ans_12']").val() != ""){ans_12 += "-" + $("[name='r_ans_12']").val();}
		
		ans_13 = $("input[name=r_ans_13]").val();//13�� ���� ���

		for(var i = 0; i< $("[name='q_ans_14']:checked").length; i++){// 14�� ���� ���
			ans_14 += "," + $("[name='q_ans_14']:checked").eq(i).val();
		}
		if(ans_14 != ""){
			ans_14 = ans_14.substring(1);
			if($("[name='r_ans_14']").val() != ""){
				ans_14 += "-" + $("[name='r_ans_14']").val();
			}
		}

		ans_15 = $("input[name=r_ans_15]").val();//15�� ���� ���

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
		
		if(f.p_ans_1.value == "" || f.p_ans_1.value == "undefined"){return false;}
		if(f.p_ans_2.value == "" || f.p_ans_2.value == "undefined"){return false;}
		if(f.p_ans_3.value == "" || f.p_ans_3.value == "undefined"){return false;}
		if(f.p_ans_4.value == "" || f.p_ans_4.value == "undefined"){return false;}

		if(f.p_ans_6.value == "" || f.p_ans_6.value == "undefined"){return false;}

		if(f.p_ans_9.value == "" || f.p_ans_9.value == "undefined"){return false;}
		if(f.p_ans_10.value == "" || f.p_ans_10.value == "undefined"){return false;}
		if(f.p_ans_11.value == "" || f.p_ans_11.value == "undefined"){return false;}
		if(f.p_ans_12.value == "" || f.p_ans_12.value == "undefined"){return false;}
		if(f.p_ans_13.value == "" || f.p_ans_13.value == "undefined"){return false;}
		if(f.p_ans_14.value == "" || f.p_ans_14.value == "undefined"){return false;}
		if(f.p_ans_15.value == "" || f.p_ans_15.value == "undefined"){return false;}

		if(f.p_ans_4.value.substring(0,1) == "1"){
			if(f.p_ans_5.value == "" || f.p_ans_5.value == "undefined"){return false;}
		}

		if(f.p_ans_6.value == "1" || f.p_ans_6.value == "2"){
			if(f.p_ans_7.value == "" || f.p_ans_7.value == "undefined"){return false;}
		}else if(f.p_ans_6.value == "3" || f.p_ans_6.value == "4"){
			if(f.p_ans_8.value == "" || f.p_ans_8.value == "undefined"){return false;}
		}

		return true;
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
						<span>� ��θ� ���� ���̹���������ī���̿� ���� �˰� �Ǿ����ϱ�?</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_1" type="radio" value="1" onclick="javascript:toogle_radio('1','N');" /> TV / ����</li>
						<li class="wf"><input name="q_ans_1" type="radio" value="2" onclick="javascript:toogle_radio('1','N');" /> �Ź� / ���� / ����</li>
						<li class="wf"><input name="q_ans_1" type="radio" value="3" onclick="javascript:toogle_radio('1','N');" /> ���ͳ� (����, ��α�, Ʈ���� �� SNS)</li>
						<li class="wf"><input name="q_ans_1" type="radio" value="4" onclick="javascript:toogle_radio('1','N');" /> �ѱ������������ Ȩ������</li>
						<li class="wf"><input name="q_ans_1" type="radio" value="5" onclick="javascript:toogle_radio('1','N');" /> �ѱ������������ ȫ����, �ҽ��� ��</li>
						<li class="wf"><input name="q_ans_1" type="radio" value="6" onclick="javascript:toogle_radio('1','N');" /> �ѱ������������ ���, ���̳� ��</li>
						<li class="wf"><input name="q_ans_1" type="radio" value="7" onclick="javascript:toogle_radio('1','N');" /> ���� ���</li>
						<li class="wf"><input name="q_ans_1" type="radio" value="8" onclick="javascript:toogle_radio('1','Y');" /> ��Ÿ <input name="r_ans_1" type="text" readonly="readonly"/></li>
					</ul>
				</div>


				<div class="question" id="question_2">
					<p class="question_tit">
						<span>���� � ������ �о߿� ������ �ֽ��ϱ�?</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_2" type="radio" value="1" /> ���� / �μ�</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="2" /> ��ȭ</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="3" /> �ִϸ��̼�</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="4" /> ����</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="5" /> ��ȭ</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="6" /> ���</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="7" /> ����</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="8" /> ĳ����</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="9" /> ��������</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="10" /> ����</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="11" /> ����</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="12" /> ������ �ַ��</li>
					</ul>
				</div>


				<div class="question" id="question_3">
					<p class="question_tit">
						<span>�����ڴԲ��� ���̹���������ī������ �¶��� ���� �������� �н������ν� ����� �ϴ� ������ ������ ��� �����Դϱ�?</span>
					</p>
		            <ul>
						<li class="wf"><input name="q_ans_3" type="radio" value="1" > ���� ������ ���� ����</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="2" > ��� �غ� ������ �⺻ ����</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="3" > �⺻ ���� ������ ������ �ǹ� ����</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="4" > ���� ���� ������ ������ �ǹ� ����</li>
					</ul>
				</div>


				<div class="question" id="question_4">
					<p class="question_tit">
						<span>�����ڴԲ��� ���̹���������ī���̿��� �н��Ͻ� ���´� �����Դϱ�? (�ߺ����� ����)</span>
					</p>
					<ul id="q_ans_4">
						<li class="wf"><input id="etc_che_4" name="q_ans_4" type="checkbox" value="1" /> ���� ���� (����/��ȭ/��� �о� 1���� ����)</li>
						<li class="wf"><input name="q_ans_4" type="checkbox" value="2" /> ���� ���� (���ĵ�����/���Ŭ���� �� 1���� �з��� ������ ����)</li>
					</ul>
				</div>


				<div class="question" id="question_5" style="display:none;">
					<p class="question_tit">
						<span>� �о��� ���԰��¸� �н��ϼ̳���? (�ߺ����� ����)</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_5" type="checkbox" value="1"/> ��� �о� ��ȹ</li>
						<li class="wf"><input name="q_ans_5" type="checkbox" value="2"/> ��� �о� ����</li>
						<li class="wf"><input name="q_ans_5" type="checkbox" value="3"/> ��� �о� �濵����/����</li>
						<li class="wf"><input name="q_ans_5" type="checkbox" value="4"/> ���� �о� ��ȹ</li>
						<li class="wf"><input name="q_ans_5" type="checkbox" value="5"/> ���� �о� ����</li>
						<li class="wf"><input name="q_ans_5" type="checkbox" value="6"/> ���� �о� �濵����/����</li>
						<li class="wf"><input name="q_ans_5" type="checkbox" value="7"/> ��ȭ �о� ��ȹ</li>
						<li class="wf"><input name="q_ans_5" type="checkbox" value="8"/> ��ȭ �о� ����</li>
						<li class="wf"><input name="q_ans_5" type="checkbox" value="9"/> ��ȭ �о� �濵����/����</li>
					</ul>
				</div>


				<div class="question" id="question_6">
					<p class="question_tit">
						<span>���̹������� ��ī���̿��� �����ϴ� ���̹������� ���� ���������� ��� ���� �����Ͻʴϱ�? </span>
					</p>
					<ul id="q_ans_6">
						<li class="wf"><input name="q_ans_6" type="radio" value="1" > �ſ� �����Ѵ�</li>
						<li class="wf"><input name="q_ans_6" type="radio" value="2" > �ణ �����Ѵ�</li>
						<li class="wf"><input name="q_ans_6" type="radio" value="3" > �ణ �Ҹ��̴�</li>
						<li class="wf"><input name="q_ans_6" type="radio" value="4" > �ſ� �Ҹ��̴�</li>
					</ul>
				</div>


				<div class="question" id="question_7" style="display:none;">
					<p class="question_tit">
						<span>�н��Ͻ� ���̹� �������� ���� ������ ���� �����Դϱ�?</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_7" type="radio" value="1" onclick="javascript:toogle_radio('7','N');"/> ����� �н� ����</li>
						<li class="wf"><input name="q_ans_7" type="radio" value="2" onclick="javascript:toogle_radio('7','N');" /> ����/���� ����</li>
						<li class="wf"><input name="q_ans_7" type="radio" value="3" onclick="javascript:toogle_radio('7','N');" /> ���� ���� ����</li>
						<li class="wf"><input name="q_ans_7" type="radio" value="4" onclick="javascript:toogle_radio('7','N');" /> �������� ���� � ����</li>
						<li class="wf"><input name="q_ans_7" type="radio" value="5" onclick="javascript:toogle_radio('7','N');" /> ���� �н� ����Ʈ</li>
						<li class="wf"><input name="q_ans_7" type="radio" value="6" onclick="javascript:toogle_radio('7','Y');" /> ��Ÿ <input name="r_ans_7" type="text" value="" size="50" readonly="readonly"/></li>
					</ul>
				</div>


				<div class="question" id="question_8" style="display:none;">
					<p class="question_tit">
						<span>�н��Ͻ� ���̹� �������� ���� �Ҹ��� ���� �����Դϱ�? </span>
					</p>
					<ul id="q_ans_8">
						<li class="wf"><input name="q_ans_8" type="radio" value="1" onclick="javascript:toogle_radio('8','N');" /> ����Ȯ�ϰ� ������ �н� ����</li>
						<li class="wf"><input name="q_ans_8" type="radio" value="2" onclick="javascript:toogle_radio('8','N');" /> ���� ���� ����</li>
						<li class="wf"><input name="q_ans_8" type="radio" value="3" onclick="javascript:toogle_radio('8','N');" /> ������ ������ ���� �н� �ߴ�</li>
						<li class="wf"><input name="q_ans_8" type="radio" value="4" onclick="javascript:toogle_radio('8','N');" /> ��ģ���� ���� �</li>
						<li class="wf"><input name="q_ans_8" type="radio" value="5" onclick="javascript:toogle_radio('8','N');" /> ������ Ȩ������ ����</li>
						<li class="wf"><input name="q_ans_8" type="radio" value="6" onclick="javascript:toogle_radio('8','Y');" /> ��Ÿ <input name="r_ans_8" type="text" value="" size="50" readonly="readonly"/></li>
					</ul>
				</div>


				<div class="question" id="question_9">
					<p class="question_tit">
						<span>���� ���̹���������ī���̿��� Ȯ�������� �ϴ� ������ �о߰� �ִٸ� �����Դϱ�? (�ߺ����� ����)</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_9" type="checkbox" value="1" /> ���� / �μ�</li>
						<li class="wf"><input name="q_ans_9" type="checkbox" value="2" /> ��ȭ</li>
						<li class="wf"><input name="q_ans_9" type="checkbox" value="3" /> �ִϸ��̼�</li>
						<li class="wf"><input name="q_ans_9" type="checkbox" value="4" /> ����</li>
						<li class="wf"><input name="q_ans_9" type="checkbox" value="5" /> ��ȭ</li>
						<li class="wf"><input name="q_ans_9" type="checkbox" value="6" /> ���</li>
						<li class="wf"><input name="q_ans_9" type="checkbox" value="7" /> ����</li>
						<li class="wf"><input name="q_ans_9" type="checkbox" value="8" /> ĳ����</li>
						<li class="wf"><input name="q_ans_9" type="checkbox" value="9" /> ��������</li>
						<li class="wf"><input name="q_ans_9" type="checkbox" value="10" /> ����</li>
						<li class="wf"><input name="q_ans_9" type="checkbox" value="11" /> ����</li>
						<li class="wf"><input name="q_ans_9" type="checkbox" value="12" /> ������ �ַ��</li>
					</ul>
				</div>

				<div class="question" id="question_10">
					<p class="question_tit">
						<span>�տ��� �����Ͻ� ������ �о߿��� � ���������� �� Ȯ���ϸ� ���ڽ��ϱ�?</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_10" type="radio" value="1" onclick="javascript:toogle_radio('10','N');"/> ��ȹ/â�� ����</li>
						<li class="wf"><input name="q_ans_10" type="radio" value="2" onclick="javascript:toogle_radio('10','N');"/> ����/����/ǥ�� ����</li>
						<li class="wf"><input name="q_ans_10" type="radio" value="3" onclick="javascript:toogle_radio('10','N');"/> ����/������ ����</li>
						<li class="wf"><input name="q_ans_10" type="radio" value="4" onclick="javascript:toogle_radio('10','N');"/> �濵/�濵���� ����</li>
						<li class="wf"><input name="q_ans_10" type="radio" value="5" onclick="javascript:toogle_radio('10','Y');"/> ��Ÿ <input name="r_ans_10" type="text" value="" size="50" readonly="readonly"/></li>
					</ul>
				</div>


				<div class="question" id="question_11">
					<p class="question_tit">
						<span>Ȥ�� �н��ϱ⸦ ���ϴ� ��ü���� ������ �ִٸ� �����Դϱ�? ������� ��ü������ �����ֽʽÿ�.</span>
					</p><span id="br_show"><br/></span>
					<div class="view_box">
						<span class="tit_center">&lt;����� ����&gt;</span><br/>
						��� : ��ü���� / �������� / ������ ���� / ������ ���븶���� / ��ۿ��� ���� / ��ۿ��� ��ȹ<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   / ��������� ���丮�ڸ� ��<br/>
						���� : 2D-3D ���� �׷��� / ���ӹ�� / ���� ĳ���� / ���� ����Ʈ / �ִϸ��̼� ���� / ���� ���̵��<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   / ���� ���� ������ / ���� �ó����� / ���� ������ / ���� �˰��� / ���ӱ������ / 3D ���α׷���<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   / C# / DirectX / �������� ��<br/>
						��ȭ : ���丮�ڸ� / ��ȭ������ ��ȹ / ���߹�ȭ / ���� ���� / ���� / ���� / ���� / ����Ͼ�<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   / ����������� ���� / ����å / ������ ��
					</div>
					<ul>
						<li class="wf"><input name="r_ans_11" type="text" value="" size="95"></li>
					</ul>
				</div>

				<div class="question" id="question_12">
					<p class="question_tit">
						<span>���� ���̹���������ī���̿��� ���ο� �������� ������ �� � ���� ���� Ȥ�� ������������ �����ϴ� ���� ���ڽ��ϱ�?</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_12" type="radio" value="1" onclick="javascript:toogle_radio('12','N');"/> ���б�, ������ �� �й����� ������ ���Ǹ� �Ͻô� ��</li>
						<li class="wf"><input name="q_ans_12" type="radio" value="2" onclick="javascript:toogle_radio('12','N');"/> ������ ���� ���� ������ �����ؿ� ���� ������ �� �ǹ���</li>
						<li class="wf"><input name="q_ans_12" type="radio" value="3" onclick="javascript:toogle_radio('12','N');"/> �ڰ��� ��濡 ������ �� �� �ִ� ������ ���� ���� ����</li>
						<li class="wf"><input name="q_ans_12" type="radio" value="4" onclick="javascript:toogle_radio('12','N');"/> �ѱ������������ ���� �� ���Ǵɷ��� �پ�� ��</li>
						<li class="wf"><input name="q_ans_12" type="radio" value="5" onclick="javascript:toogle_radio('12','Y');"/> ��Ÿ <input name="r_ans_12" type="text" value="" size="50" readonly="readonly"/></li>
					</ul>
				</div>


				<div class="question" id="question_13">
					<p class="question_tit">
						<span>�����ڴԲ��� ���Ǹ� ��� ���� ���� Ȥ�� ������������ �ִٸ� ��ü������ �����ֽʽÿ�.</span>
					</p><span id="br_show2"><br/></span>
					<div class="view_box">
						<span class="tit_center">&lt;����&gt;</span><br/>
						���̳���, ���̻��� ����ȣ �۰� / �������ϰ� �����ϰԡ� ������ �۰� / ��������Ʈ ������ ��ǥ /�������� ���� ���¿� PD <br/>
						/ �����Ρ� ������ �Կ����� / ���ѵ��� ����ȣ PD ��
					</div>
					<ul>
						<li class="wf"><input name="r_ans_13" type="text" value="" size="95"/></li>
					</ul>
				</div>
				
				
				<div class="question" id="question_14">
					<p class="question_tit">
						<span>���� �� ���� ����� ���̹���������ī���̸� ã�ƿ����� �ϱ� ���ؼ� ���� ������ �ΰ� �ؾ� �� ���� �����̶�� �����Ͻʴϱ�? (�ߺ����� ����)</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_14" type="checkbox" value="1" /> �������� �������� ������ ����� ������ Ȯ��</li>
						<li class="wf"><input name="q_ans_14" type="checkbox" value="2" /> �������뿡 ���� �ȳ� �� ȫ�� Ȯ��</li>
						<li class="wf"><input name="q_ans_14" type="checkbox" value="3" /> �����ϰ� ���� �н� ����Ʈ ����</li>
						<li class="wf"><input name="q_ans_14" type="checkbox" value="4" /> ������ ����� ���� �پ��� ���� ����</li>
						<li class="wf"><input name="q_ans_14" type="checkbox" value="5" /> ������Ʈ��ũ ������ ���� Ŀ�´�Ƽ Ȱ�� ��ȭ</li>
						<li class="wf"><input name="q_ans_14" type="checkbox" value="6" /> ������ ����� ����/�������� Ưȭ�� �н� �� ��°��� ��� ����</li>
						<li class="wf"><input name="q_ans_14" type="checkbox" value="7" id="etc_che_14" onclick="javascript:toogle_checkbox('14');" /> ��Ÿ <input name="r_ans_14" type="text" value="" size="50" readonly="readonly"/></li>
					</ul>
				</div>
				
				<div class="question" id="question_13">
					<p class="question_tit">
						<span>���������� ���̹���������ī���̿� ���� ���� ������� �湮�Ͽ� ������ ���� ������ �н��ϵ��� �ϱ� ���� ���̵� �ִٸ�, �����̵� ��������� �����Ӱ� ������ �ֽʽÿ�.</span>
					</p>
					<ul>
						<li class="wf"><input name="r_ans_15" type="text" value="" size="95"/></li>
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
