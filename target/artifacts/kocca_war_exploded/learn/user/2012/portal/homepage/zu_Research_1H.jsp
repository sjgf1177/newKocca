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
<title>���̹���������ī���� ���� �������� (����Ʈ������)</title>
<link href="/css/2012/research_style.css" type="text/css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script> 
<script type="text/javascript">
	

	$(document).ready(function(){
		var useragent = navigator.userAgent;
		if(useragent.indexOf("MSIE 8.0") != -1 || useragent.indexOf("MSIE 9.0") != -1 || useragent.indexOf("MSIE 7.0") != -1){
			$("#br_show").attr("style", "display:none;");
			$("#br_show2").attr("style", "display:none;");
		}
		
		$("#q_ans_2 li input").click(function(){
			var t = $("input[name=q_ans_2]:checked").val();
			if(t == "1" || t == "2"){
				$("#question_3").attr("style","display:block;");
				$("#question_4").attr("style","display:block;");
				$("#question_5").attr("style","display:block;");
			}else{
				$("#question_3").attr("style","display:none;");
				$("#question_4").attr("style","display:none;");
				$("#question_5").attr("style","display:none;");
				$("input[name=q_ans_3]").attr('checked', false);
				$("input[name=q_ans_4]").attr('checked', false);
				$("input[name=q_ans_5]").attr('checked', false);
				$("input[name=r_ans_4]").val("");
				$("input[name=r_ans_5]").val("");
			}
		});

		$("#q_ans_6 li input").click(function(){
			var t = $("input[name=q_ans_6]:checked").val();
			if(t == "1" || t == "2"){
				$("#question_7").attr("style","display:block;");// 7������ ������
				$("#question_8").attr("style","display:none;");// 8������ ����
				$("#question_9").attr("style","display:none;");// 9������ ����
				$("input[name=q_ans_8]").attr('checked', false);// 8�� ���� ����
				$("input[name=r_ans_8]").val("");// 8�� ���� ����
				$("input[name=r_ans_9]").val("");// 9�� ���� ����
			}else{
				$("#question_8").attr("style","display:block;");// 8������ ������
				$("#question_7").attr("style","display:none;");// 7������ ����
				$("input[name=r_ans_7]").val("");// 7�� ���� ����
			}
		});

		$("#q_ans_8 li input[type=radio]").click(function(){
			var t = $("input[name=q_ans_8]:checked").val();
			if(t == "4"){
				$("#question_9").attr("style","display:block;");// 9������ ������
			}else{
				$("#question_9").attr("style","display:none;");// 9������ ������
				$("input[name=r_ans_9]").val("");// 9�� ���� ����
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
		
		var ans_1 = "";		var ans_2 = "";		var ans_3 = "";			var ans_4 = "";			var ans_5 = "";			var ans_6 = "";		var ans_7 = "";
		var ans_8 = "";		var ans_9 = "";		var ans_10 = "";		var ans_11 = "";		var ans_12 = "";		var ans_13 = "";
		
		//1�� ���� ���
		for(var i = 0; i< $("[name='q_ans_1']:checked").length; i++){
			ans_1 += "," + $("[name='q_ans_1']:checked").eq(i).val();
		}
		if(ans_1 != ""){
			ans_1 = ans_1.substring(1);
			if($("[name='r_ans_1']").val() != ""){
				ans_1 += "-" + $("[name='r_ans_1']").val();
			}
		}
		
		ans_2 = $("input[name=q_ans_2]:checked").val();//2�� ���� ���
		
		ans_3 = $("input[name=q_ans_3]:checked").val();//3�� ���� ���

		ans_4 = $("input[name=q_ans_4]:checked").val();//4�� ���� ���
		if($("[name='r_ans_4']").val() != ""){
			ans_4 += "-" + $("[name='r_ans_4']").val();
		}
		
		ans_5 = $("input[name=q_ans_5]:checked").val();//5�� ���� ���
		if($("[name='r_ans_5']").val() != ""){
			ans_5 += "-" + $("[name='r_ans_5']").val();
		}
		
		ans_6 = $("input[name=q_ans_6]:checked").val();//6�� ���� ���
		
		ans_7 = $("input[name=r_ans_7]").val();//7�� ���� ���
		
		ans_8 = $("input[name=q_ans_8]:checked").val();//8�� ���� ���
		if($("[name='r_ans_8']").val() != ""){
			ans_8 += "-" + $("[name='r_ans_8']").val();
		}
		
		ans_9 = $("input[name=r_ans_9]").val();//9�� ���� ���
		
		ans_10 = $("input[name=q_ans_10]:checked").val();//10�� ���� ���
		if($("[name='r_ans_10']").val() != ""){
			ans_10 += "-" + $("[name='r_ans_10']").val();
		}
		
		ans_11 = $("input[name=r_ans_11]").val();//11�� ���� ���


		for(var i = 0; i< $("[name='q_ans_12']:checked").length; i++){//12�� ���� ���
			ans_12 += "," + $("[name='q_ans_12']:checked").eq(i).val();
		}
		if(ans_12 != ""){
			ans_12 = ans_12.substring(1);
			if($("[name='r_ans_12']").val() != ""){
				ans_12 += "-" + $("[name='r_ans_12']").val();
			}
		}
		
		ans_13 = $("input[name=r_ans_13]").val();//13�� ���� ���

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

		if(f.p_ans_6.value == "" || f.p_ans_6.value == "undefined"){return false;}

		if(f.p_ans_10.value == "" || f.p_ans_10.value == "undefined"){return false;}
		if(f.p_ans_11.value == "" || f.p_ans_11.value == "undefined"){return false;}
		if(f.p_ans_12.value == "" || f.p_ans_12.value == "undefined"){return false;}
		if(f.p_ans_13.value == "" || f.p_ans_13.value == "undefined"){return false;}

		if(f.p_ans_2.value == "1" || f.p_ans_2.value == "2"){
			if(f.p_ans_3.value == "" || f.p_ans_3.value == "undefined"){return false;}
			if(f.p_ans_4.value == "" || f.p_ans_4.value == "undefined"){return false;}
			if(f.p_ans_5.value == "" || f.p_ans_5.value == "undefined"){return false;}
		}

		if(f.p_ans_6.value == "1" || f.p_ans_6.value == "2"){
			if(f.p_ans_7.value == "" || f.p_ans_7.value == "undefined"){return false;}
		}else if(f.p_ans_6.value == "3" || f.p_ans_6.value == "4"){
			if(f.p_ans_8.value == "" || f.p_ans_8.value == "undefined"){
				return false;
			}else if(f.p_ans_8.value == "4"){
				if(f.p_ans_9.value == "" || f.p_ans_9.value == "undefined"){return false;}
			}
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
						<span>��� ������(���)�� ���õ� ������ � ��θ� ���� ����ϱ�? (�ߺ����� ����)</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_1" type="checkbox" value="1" /> TV / ����</li>
						<li class="wf"><input name="q_ans_1" type="checkbox" value="2" /> �Ź� / ���� / ����</li>
						<li class="wf"><input name="q_ans_1" type="checkbox" value="3" /> ���ͳ� (����, ��α�, Ʈ���� �� SNS)</li>
						<li class="wf"><input name="q_ans_1" type="checkbox" value="4" /> �ѱ������������ Ȩ������</li>
						<li class="wf"><input name="q_ans_1" type="checkbox" value="5" /> �ѱ������������ ȫ����, �ҽ��� ��</li>
						<li class="wf"><input name="q_ans_1" type="checkbox" value="6" /> �ѱ������������ ���, ���̳� ��</li>
						<li class="wf"><input name="q_ans_1" type="checkbox" value="7" /> ���� ���</li>
						<li class="wf"><input name="q_ans_1" type="checkbox" value="8" id="etc_che_1" onclick="javascript:toogle_checkbox('1');"/> ��Ÿ <input name="r_ans_1" type="text" readonly="readonly"/></li>
					</ul>
				</div>


				<div class="question" id="question_2">
					<p class="question_tit">
						<span>��� ���, ����, ��ȭ �� ������(���)�� ���� ������ ���� ��� ���� ������ �ֽ��ϱ�?</span>
					</p>
					<ul id="q_ans_2">
						<li class="wf"><input name="q_ans_2" type="radio" value="1" > �ſ� �����ִ�</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="2" > �ణ �����ִ�</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="3" > ���� ���ɾ���</li>
						<li class="wf"><input name="q_ans_2" type="radio" value="4" > ���� ���ɾ���</li>
					</ul>
				</div>


				<div class="question" id="question_3" style="display:none;">
					<p class="question_tit">
						<span>���̹���������ī���̿����� �پ��� �о��� �������� �����ϰ�, �̸� ���̹��������� �����ϰ� �ֽ��ϴ�. ���� ���̹���������ī���̿��� �����ϴ� ���¸� ��� �ȴٸ� ��� �о߸� �����Ͻðڽ��ϱ�?</span>
					</p>
		            <ul>
						<li class="wf"><input name="q_ans_3" type="radio" value="1" > ���� / �μ� �о�</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="2" > ��ȭ �о�</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="3" > �ִϸ��̼� �о�</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="4" > ���� �о�</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="5" > ��ȭ �о�</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="6" > ��� �о�</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="7" > ���� �о�</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="8" > ĳ���� �о�</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="9" > �������� �о�</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="10" > ���� �о�</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="11" > ���� �о�</li>
						<li class="wf"><input name="q_ans_3" type="radio" value="12" > ������ �ַ�� �о�</li>
					</ul>
				</div>


				<div class="question" id="question_4" style="display:none;">
					<p class="question_tit">
						<span>�����Ͻ� ������ �о߿��� � ������ ���õ� ���������� �����Ͻðڽ��ϱ�?</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_4" type="radio" value="1" onclick="javascript:toogle_radio('4','N');"  > ��ȹ / â�� ����</li>
						<li class="wf"><input name="q_ans_4" type="radio" value="2" onclick="javascript:toogle_radio('4','N');"  > ���� / ǥ�� ����</li>
						<li class="wf"><input name="q_ans_4" type="radio" value="3" onclick="javascript:toogle_radio('4','N');"  > ���� / ������ ����</li>
						<li class="wf"><input name="q_ans_4" type="radio" value="4" onclick="javascript:toogle_radio('4','N');"  > �濵 / �濵���� ����</li>
						<li class="wf"><input name="q_ans_4" type="radio" value="5" onclick="javascript:toogle_radio('4','Y');"  > ��Ÿ <input name="r_ans_4" type="text" readonly="readonly"/></li>
					</ul>
				</div>


				<div class="question" id="question_5" style="display:none;">
					<p class="question_tit">
						<span>���̹���������ī���̿��� � ������ ���¸� �����ϴ� ���� �ٶ����ϴٰ� �����Ͻʴϱ�?</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_5" type="radio" value="1" onclick="javascript:toogle_radio('5','N');" /> ����ְų� �ǻ�Ȱ�� ������ ����</li>
						<li class="wf"><input name="q_ans_5" type="radio" value="2" onclick="javascript:toogle_radio('5','N');" /> ����� ����Ǵ� ����</li>
						<li class="wf"><input name="q_ans_5" type="radio" value="3" onclick="javascript:toogle_radio('5','N');" /> �ڰ��� ��濡 ����Ǵ� ����</li>
						<li class="wf"><input name="q_ans_5" type="radio" value="4" onclick="javascript:toogle_radio('5','N');" /> ���� Ȥ�� �й��� ���Ľ��濡 ����Ǵ� ����</li>
						<li class="wf"><input name="q_ans_5" type="radio" value="5" onclick="javascript:toogle_radio('5','N');" /> �������� ���� ������ ����Ű�� ����</li>
						<li class="wf"><input name="q_ans_5" type="radio" value="6" onclick="javascript:toogle_radio('5','Y');" /> ��Ÿ <input name="r_ans_5" type="text" readonly="readonly"/></li>
					</ul>
				</div>


				<div class="question" id="question_6">
					<p class="question_tit">
						<span>���� ���̹���������ī����(http://edu.kocca.or.kr)������ �Ʒ� ǥ�� �ش��ϴ� �о��� �¶��� ���� �������� ����� �����ϰ� �ֽ��ϴ�. �����ڴԲ����� ���� ���̹���������ī���̿��� ����� �����ϴ� ���԰��� �� �������¸� �н��Ͻ� ������ �ֽ��ϱ�?</span> 
					</p><span id="br_show"><br/><br/><br/></span>
					<div class="view_box">
						<span class="tit_center">&lt;���԰���&gt;</span><br/>
						��� : ��ü���� / �������� / ������ ���� / ������ ���븶���� / ��ۿ��� ���� / ��ۿ��� ��ȹ<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   / ��������� ���丮�ڸ� ��<br/>
						���� : 2D-3D ���� �׷��� / ���ӹ�� / ���� ĳ���� / ���� ����Ʈ / �ִϸ��̼� ���� / ���� ���̵��<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   / ���� ���� ������ / ���� �ó����� / ���� ������ / ���� �˰��� / ���ӱ������ / 3D ���α׷���<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   / C# / DirectX / �������� ��<br/>
						��ȭ : ���丮�ڸ� / ��ȭ������ ��ȹ / ���߹�ȭ / ���� ���� / ���� / ���� / ���� / ����Ͼ�<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   / ����������� ���� / ����å / ������ ��<br/>
						<span class="tit_center">&lt;��������&gt;</span><br/>
						������ �о� ������ Ư��, ������ �о� Ʈ���� �� �̽�
					</div>
					<ul id="q_ans_6">
						<li class="wf"><input name="q_ans_6" type="radio" value="1" > �ſ� ������ �ִ�</li>
						<li class="wf"><input name="q_ans_6" type="radio" value="2" > �ణ ������ �ִ�</li>
						<li class="wf"><input name="q_ans_6" type="radio" value="3" > ���� ������ ����</li>
						<li class="wf"><input name="q_ans_6" type="radio" value="4" > ���� ������ ����</li>
					</ul>
				</div>


				<div class="question" id="question_7" style="display:none;">
					<p class="question_tit">
						<span>���� ���̹���������ī���̿��� �����ǰ� �ִ� ����, Ȥ�� �����ǰ� ���� ������ �н��ϱ⸦ ���ϴ� ������ �ִٸ� ��ü������ �����ֽʽÿ�.</span>
					</p>
					<ul>
						<li class="wf"><input name="r_ans_7" type="text" value="" size="95" /></li>
					</ul>
				</div>


				<div class="question" id="question_8" style="display:none;">
					<p class="question_tit">
						<span>���̹���������ī������ ���� ���¿� ���� ���� ������ ���� ������ �����Դϱ�?</span>
					</p>
					<ul id="q_ans_8">
						<li class="wf"><input name="q_ans_8" type="radio" value="1" onclick="javascript:toogle_radio('8','N');" /> �о� / ������ ������ ����</li>
						<li class="wf"><input name="q_ans_8" type="radio" value="2" onclick="javascript:toogle_radio('8','N');" /> ����� ������ ���� �ʴ´�</li>
						<li class="wf"><input name="q_ans_8" type="radio" value="3" onclick="javascript:toogle_radio('8','N');" /> ���̹������� ���ŷӴ�</li>
						<li class="wf"><input name="q_ans_8" type="radio" value="4" onclick="javascript:toogle_radio('8','N');" /> �����ִ� �������� ����</li>
						<li class="wf"><input name="q_ans_8" type="radio" value="5" onclick="javascript:toogle_radio('8','Y');" /> ��Ÿ <input name="r_ans_8" type="text" value="" size="50" readonly="readonly"/></li>
					</ul>
				</div>


				<div class="question" id="question_9" style="display:none;">
					<p class="question_tit">
						<span>���̹���������ī���̿��� � �������� �����Ǹ� �����Ͻ� ������ �ִ��� ��ü���� �н������̳� ������� �ۼ��� �ּ���.</span>
					</p>
					<ul>
						<li class="wf"><input name="r_ans_9" type="text" value="" size="95" /></li>
					</ul>
				</div>

				<div class="question" id="question_10">
					<p class="question_tit">
						<span>���� ���̹���������ī���̿��� ���ο� �������� ������ �� � ���� ���� Ȥ�� ������������ �����ϸ� ������ ������ �����ʴϱ�?</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_10" type="radio" value="1" onclick="javascript:toogle_radio('10','N');"/> ���б�, ������ �� �й����� ������ ���Ǹ� �Ͻô� ��</li>
						<li class="wf"><input name="q_ans_10" type="radio" value="2" onclick="javascript:toogle_radio('10','N');"/> ������ ���� ���� ������ �����ؿ� ���� ������ �� �ǹ���</li>
						<li class="wf"><input name="q_ans_10" type="radio" value="3" onclick="javascript:toogle_radio('10','N');"/> �ڰ��� ��濡 ������ �� �� �ִ� ������ ���� ���� ����</li>
						<li class="wf"><input name="q_ans_10" type="radio" value="4" onclick="javascript:toogle_radio('10','N');"/> �ѱ������������ ���� �� ���Ǵɷ��� �پ�� ��</li>
						<li class="wf"><input name="q_ans_10" type="radio" value="5" onclick="javascript:toogle_radio('10','Y');"/> ��Ÿ <input name="r_ans_10" type="text" value="" size="50" readonly="readonly"/></li>
					</ul>
				</div>


				<div class="question" id="question_11">
					<p class="question_tit">
						<span>�����ڴԲ��� ���Ǹ� ��� ���� ���� Ȥ�� ������������ �ִٸ� ��ü������ �����ֽʽÿ�.</span>
					</p><span id="br_show2"><br/></span>
					<div class="view_box">
						<span class="tit_center">&lt;����&gt;</span><br/>
						���̳���, ���̻��� ����ȣ �۰� / �������ϰ� �����ϰԡ� ������ �۰� / ��������Ʈ ������ ��ǥ /�������� ���� ���¿� PD <br/>
						/ �����Ρ� ������ �Կ����� / ���ѵ��� ����ȣ PD ��
					</div>
					<ul>
						<li class="wf"><input name="r_ans_11" type="text" value="" size="95"></li>
					</ul>
				</div>

				<div class="question" id="question_12">
					<p class="question_tit">
						<span>���� �� ���� ����� ���̹���������ī���̸� ã�ƿ����� �ϱ� ���ؼ� ���� ������ �ΰ� �ؾ� �� ���� �����̶�� �����Ͻʴϱ�? (�ߺ����� ����)</span>
					</p>
					<ul>
						<li class="wf"><input name="q_ans_12" type="checkbox" value="1" /> �������� �������� ������ ����� ������ Ȯ��</li>
						<li class="wf"><input name="q_ans_12" type="checkbox" value="2" /> �������뿡 ���� �ȳ� �� ȫ�� Ȯ��</li>
						<li class="wf"><input name="q_ans_12" type="checkbox" value="3" /> �����ϰ� ���� �н� ����Ʈ ����</li>
						<li class="wf"><input name="q_ans_12" type="checkbox" value="4" /> ������ ����� ���� �پ��� ���� ����</li>
						<li class="wf"><input name="q_ans_12" type="checkbox" value="5" /> ������Ʈ��ũ ������ ���� Ŀ�´�Ƽ Ȱ�� ��ȭ</li>
						<li class="wf"><input name="q_ans_12" type="checkbox" value="6" /> ������ ����� ����/�������� Ưȭ�� �н� �� ��°��� ��� ����</li>
						<li class="wf"><input name="q_ans_12" type="checkbox" value="7" id="etc_che_12" onclick="javascript:toogle_checkbox('12');" /> ��Ÿ <input name="r_ans_12" type="text" value="" size="50" readonly="readonly"/></li>
					</ul>
				</div>


				<div class="question" id="question_13">
					<p class="question_tit">
						<span>���������� ���̹���������ī���̿� ���� ���� ������� �湮�Ͽ� ������ ���� ������ �н��ϵ��� �ϱ� ���� ���̵� �ִٸ�, �����̵� ��������� �����Ӱ� ������ �ֽʽÿ�.</span>
					</p>
					<ul>
						<li class="wf"><input name="r_ans_13" type="text" value="" size="95"/></li>
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
