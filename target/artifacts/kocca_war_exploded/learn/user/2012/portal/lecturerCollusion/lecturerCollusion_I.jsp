<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.cp.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
	box.put("topmenu","8");
	box.put("submenu","1");
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>


<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">

$(document).ready(function(){
		
});

//�Էµ� ���� ����
function insert_check() {
	var f = document.form1;
	var subjgubun = "";
	if(check_value()){
		f.reg7.value = f.reg.value + "-" + $("input[name='sex']:checked").val();
		f.comptel.value = f.comptel1.value +"-"+ f.comptel2.value +"-"+ f.comptel3.value;
		f.handphone.value = f.mobile1.value +"-"+ f.mobile2.value +"-"+ f.mobile3.value;
		f.email.value = f.email1.value +"@"+ f.email2.value;

		//�����о� üũ�ڽ��� �ߺ� ������ ��� ���� ��´�
		//for(var i = 0; i< $("[name='subjgubun']:checked").length; i++){
		//	subjgubun += "," + $("[name='subjgubun']:checked").eq(i).val();
		//}
		//if(subjgubun != ""){
		//	f.p_subjgubun.value = subjgubun.substring(1); 
		//}
		f.p_subjgubun.value = $("input[name='subjgubun']:checked").val();

	    document.form1.action = "/servlet/controller.off.OffLecturerCollusionServlet";
	    document.form1.p_process.value = "insert";
	    document.form1.submit();
	}else{
		return;
	}
}

function check_value(){
	var f = document.form1;
	if(f.name.value == ""){
		alert("������ �Է��� �ּ���");
		f.name.focus();
		return false;
	}
	if(f.p_file1.value == ""){
		alert("������ ������ ����� �ּ���");
		f.p_file1.focus();
		return false;
	}
	var c_file1 = f.p_file1.value;
	c_file1 = c_file1.substring(c_file1.lastIndexOf(".")+1).toLowerCase();
	if(c_file1 != "gif" && c_file1 != "jpg" && c_file1 != "png"){
		alert("������ ������ gif, jpg, png ���ϸ� ��� �� �� �ֽ��ϴ�.");
		f.p_file1.focus();
		return false;
	}
	
	if(f.reg.value == ""){
		alert("��������� �Է��� �ּ���");
		f.reg.focus();
		return false;
	}
	if(f.compnm.value == ""){
		alert("������� �Է��� �ּ���");
		f.compnm.focus();
		return false;
	}
	if(f.compaddr.value == ""){
		alert("�ּҸ� �Է��� �ּ���");
		f.compaddr.focus();
		return false;
	}
	if(f.comptel1.value == "" || f.comptel2.value == "" || f.comptel3.value == ""){
		alert("��ȭ��ȣ�� �Է��� �ּ���");
		f.comtel1.focus();
		return false;
	}
	if(f.mobile1.value == "" || f.mobile2.value == "" || f.mobile3.value == ""){
		alert("�ڵ�����ȣ�� �Է��� �ּ���");
		f.mobile3.focus();
		return false;
	}
	if(f.email1.value == "" || f.email2.value == ""){
		alert("�̸����� �Է��� �ּ���");
		f.email1.focus();
		return false;
	}
	
	var lectgubun = $("input[name='lectgubun']:checked").val();
	if(lectgubun == "C"){
		if(f.p_file2.value == ""){
			alert("���ǰ�ȹ���� ����� �ּ���");
			f.p_file2.focus();
			return false;
		}
		var c_file2 = f.p_file2.value;
		c_file2 = c_file2.substring(c_file2.lastIndexOf(".")+1).toLowerCase();
		if(c_file2 != "hwp"){
			alert("���ǰ�ȹ���� �ѱ� ���ϸ� ��� �� �� �ֽ��ϴ�.");
			f.p_file1.focus();
			return false;
		}
	}

	if(f.p_file3.value != ""){
		var c_file3 = f.p_file3.value;
		c_file3 = c_file3.substring(c_file3.lastIndexOf(".")+1).toLowerCase();
		if(c_file3 != "zip" && c_file3 != "alz" && c_file3 != "rar" && c_file3 != "ace"){
			alert("�����ڷ�� zip, alz, rar, ace ���ϸ� ��� �� �� �ֽ��ϴ�.");
			f.p_file3.focus();
			return false;
		}
	}
	
	return true;
}

function syllabus_chek(){
	var lectgubun = $("input[name='lectgubun']:checked").val();
	if(lectgubun == "C"){
		$("#syllabus").attr("style","");
	}
	else if(lectgubun == "S"){
		$("#syllabus").attr("style","display:none;");
	}
}

function numberCheck(loc) {
	if(/[^0123456789]/g.test(loc.value)) {
	alert("���ڸ� �Է��� �ּ���!");
	loc.value = "";
	loc.focus();
	}
}

//üũ�ڽ� �ߺ� �ִ� ���� ����
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
<!-- ��ũ��Ʈ�������� -->
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ &gt; <u>���������</u></td>
			</tr>
		</table>
		<div>
			<div><img src="/images/2012/sub/lectur/recruit.png" alt="2014�� �ѱ���������ī���� ���縦 �����մϴ�."></div>
		</div>
		<div class="grouptip">
			<h5>
			�ѱ������������ �ѱ���������ī���� ������� ���� ���縦 �����մϴ�.
			</h5>
		</div>
		
		<form id="groupinsert" name="form1" method="post" enctype="multipart/form-data" action="/servlet/controller.off.OffLecturerCollusionServlet">
   		<input type = "hidden" name="p_process"    value = "insert">
   		<input type = "hidden" name="reg7">
   		<input type = "hidden" name="comptel">
   		<input type = "hidden" name="fax">
   		<input type = "hidden" name="hometel">
   		<input type = "hidden" name="handphone">
   		<input type = "hidden" name="email">
   		<input type = "hidden" name="p_subjgubun">
   		
		<div class="namefont"><h3>�⺻�����Է�</h3><p><img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�">�� �ʼ� �Է� �׸��Դϴ�.</p></div>
		<div class="contactform contactformtopcolor1">
			<table class="insertform" cellpadding="0" cellspacing="0" summary="��������� �⺻������ �Է��մϴ�">
				<colgroup><col width="130"><col width="*"><col width="130"><col width="*"></colgroup>
				<tr>
					<th>�����з� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3">
						<input type="radio" name="lectgubun" value="C" class="radio" onclick="syllabus_chek()" id="lectgubun_c" tabindex="171" title="�������縦 �����մϴ�" checked="checked"><label for="lectgubun_c" class="label" title="�������縦 �����մϴ�">��������</label>
						<input type="radio" name="lectgubun" value="S" class="radio" onclick="syllabus_chek()" id="lectgubun_s" tabindex="172" title="�ǽ����縦 �����մϴ�"><label for="lectgubun_s" class="label" title="�ǽ����縦 �����մϴ�">�ǽ�����</label>
					</td>
				</tr>
				<tr>
					<th>���� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td><input type="text" name="name" tabindex="173" title="������ �Է����ּ���" style="width:220px;"></td>
					<td class="addtitle2">���� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></td>
					<td>
						<input type="FILE" name="p_file1" tabindex="174" title="�����̷�ī�忡 ���� ������ ������ ���ε� ���ּ���" style="width:350px;">
					</td>
				</tr>
				<tr>
					<th>������� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"><br/>(�� : 990701)</th>
					<td><input type="text" name="reg" tabindex="175" title="��������� �Է����ּ���" style="width:220px;" onkeyup="numberCheck(this);" maxlength="6"></td>
					<td class="addtitle2">���� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></td>
					<td>
						<input type="radio" name="sex" value="1" class="radio" id="sex_male" tabindex="176" title="������ �����մϴ�" checked="checked"><label for="sex_male" class="label" title="������ �����մϴ�">����</label>
						<input type="radio" name="sex" value="2" class="radio" id="sex_female" tabindex="177" title="������ �����մϴ�"><label for="sex_female" class="label" title="������ �����մϴ�">����</label>
					</td>
				</tr>
				<tr>
					<th>����� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3"><input type="text" name="compnm" tabindex="178" title="������� �Է����ּ���" style="width:220px;"></td>
				</tr>
				<tr>
					<th>�ּ� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3"><input type="text" name="compaddr" tabindex="179" title="�ּҸ� �Է����ּ���" style="width:635px;"></td>
				</tr>
				<tr>
					<th>��ȭ <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td>
						<dl class="colbath">
							<dd>
								<select class="select" name="comptel1" tabindex="180" title="������ȣ�� �������ּ���">
									<option value="">������ȣ ����</option>
									<option value="070">070</option>
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="053">053</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
								</select>
							</dd>
							<dd class="hyphen">-</dd>
							<dd><input type="text" name="comptel2" tabindex="181" title="��ȭ��ȣ ��� ��ȣ�� �Է����ּ���" style="width:30px; text-align:center;" maxlength="4" onkeyup="numberCheck(this);"></dd>
							<dd class="hyphen">-</dd>
							<dd><input type="text" name="comptel3" tabindex="182" title="��ȭ��ȣ �� 4�ڸ� ��ȣ�� �Է����ּ���" style="width:30px; text-align:center;" maxlength="4" onkeyup="numberCheck(this);"></dd>
						</dl>
					</td>
					<td class="addtitle2">�ڵ��� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></td>
					<td>
						<dl class="colbath">
							<dd>
								<select class="select" name="mobile1" tabindex="183" title="�ڵ�����ȣ�� �������ּ���">
									<option value="">�̵���ȣ ����</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</dd>
							<dd class="hyphen">-</dd>
							<dd><input type="text" name="mobile2" tabindex="184" title="�ڵ��� ��� ��ȣ�� �Է����ּ���" style="width:30px; text-align:center;" maxlength="4" onkeyup="numberCheck(this);"></dd>
							<dd class="hyphen">-</dd>
							<dd><input type="text" name="mobile3" tabindex="185" title="�ڵ��� �� 4�ڸ� ��ȣ�� �Է����ּ���" style="width:30px; text-align:center;" maxlength="4" onkeyup="numberCheck(this);"></dd>
						</dl>
					</td>
				</tr>
				<tr>
					<th>�̸��� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3">
						<dl class="colbath">
							<dd><input type="text" name="email1" tabindex="186" style="width:100px;" title="�̸��� ���̵� �Է����ּ���"></dd>
							<dd class="hyphen">@</dd>
							<dd><input type="text" name="email2" id="inmeildomain" tabindex="187" style="width:130px;" title="�̸��� �������� �Է����ּ���"></dd>
							<dd>
								<select id="selectmailtype" class="select" tabindex="188" title="�����Է� �Ǵ� ���ֻ��Ǵ� ���� ��ȣ�� �������ּ���">
									<option>�����Է�</option>
									<option>chol.com</option>
									<option>daum.net</option>
									<option>dreamwiz.com</option>
									<option>empal.com</option>
									<option>freechal.com</option>
									<option>gmail.com</option>
									<option>hanafos.com</option>
									<option>hanmail.net</option>
									<option>hanmir.com</option>
									<option>hitel.net</option>
									<option>hotmail.com</option>
									<option>korea.com</option>
									<option>lycos.co.kr</option>
									<option>naver.com</option>
									<option>nate.com</option>
									<option>netian.com</option>
									<option>paran.com</option>
									<option>yahoo.co.kr</option>
								</select>
							</dd>
						</dl>
					</td>
				</tr>
				<tr id="syllabus">
					<th>���ǰ�ȹ�� <img src="/images/2012/common/icon_check.gif" alt="�ʼ��Է�"></th>
					<td colspan="3">
						<input type="FILE" name="p_file2" tabindex="189" title="���ǰ�ȹ���� ������ �ּ���" style="width:350px;">
						<a href="/servlet/controller.library.DownloadServlet?p_savefile=/upload/KOCCA_Syllabus.hwp&p_realfile=���ǰ�ȹ��.hwp" target="_blank" tabindex="189" title="(��â) ���ǰ�ȹ�� ������ �ٿ�ε� �մϴ�"> <img src="/images/2012/sub/lectur/btn_teachprogram.gif" alt="���ǰ�ȹ�� �ٿ�ε�"> </a>
					</td>
				</tr>
				<tr>
					<th>�����о�</th>
					<td colspan="3">
						<input name="subjgubun" type="radio" tabindex="192" value="���ӵ�����(��ȹ)" checked="checked" /> ���ӵ�����(��ȹ)
						&nbsp;<input name="subjgubun" type="radio" tabindex="193" value="�������α׷���" /> �������α׷���
						&nbsp;<input name="subjgubun" type="radio" tabindex="194" value="���ӱ׷���" /> ���ӱ׷���
						&nbsp;<input name="subjgubun" type="radio" tabindex="195" value="VFX" /> VFX
						&nbsp;<input name="subjgubun" type="radio" tabindex="196" value="VJ����" /> VJ����
						<!--
						[��������]&nbsp;&nbsp;
						<input name="subjgubun" type="checkbox" value="���ӵ�����(��ȹ)" tabindex="192" onclick="checkboxLimit(this.form,this,3)" /> ���ӵ�����(��ȹ)&nbsp;&nbsp;
						<input name="subjgubun" type="checkbox" value="�������α׷���" tabindex="193" onclick="checkboxLimit(this.form,this,3)" /> �������α׷���&nbsp;&nbsp;
						<input name="subjgubun" type="checkbox" value="���ӱ׷���" tabindex="194" onclick="checkboxLimit(this.form,this,3)" /> ���ӱ׷���&nbsp;&nbsp;
						<input name="subjgubun" type="checkbox" value="����ϰ�������" tabindex="195" onclick="checkboxLimit(this.form,this,3)" /> ����ϰ�������&nbsp;&nbsp;
						<input name="subjgubun" type="checkbox" value="�����ۺ���" tabindex="196" onclick="checkboxLimit(this.form,this,3)" /> �����ۺ���
						<br/>
						[��������]&nbsp;&nbsp;
						<input name="subjgubun" type="checkbox" value="VFX" tabindex="197" onclick="checkboxLimit(this.form,this,3)" /> VFX&nbsp;&nbsp;
						<input name="subjgubun" type="checkbox" value="��Ǳ׷���" tabindex="198" onclick="checkboxLimit(this.form,this,3)" /> ��Ǳ׷���&nbsp;&nbsp;
						<input name="subjgubun" type="checkbox" value="VJ����" tabindex="199" onclick="checkboxLimit(this.form,this,3)" /> VJ����
						<br/>
						[3D]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="subjgubun" type="checkbox" value="Production" tabindex="200" onclick="checkboxLimit(this.form,this,3)" /> Production&nbsp;&nbsp;
						<input name="subjgubun" type="checkbox" value="Post-Production" tabindex="201" onclick="checkboxLimit(this.form,this,3)" /> Post-Production
						-->
					</td>
				</tr>
				<tr>
					<th>�����о�<br/>�󼼳���<br/><br/><a href="/images/2012/sub/lectur/reference.jpg" target="_blank" tabindex="202" title="(��â) �����о� ���۷��� ����"> <img src="/images/2012/sub/lectur/btn_reference.gif" alt="�����о� ���۷��� ����"> </a></th>
					<td colspan="3">
						<textarea id="etc" name="etc" title="�����о߿� ���� �� ���������� �Է����ּ���" tabindex="203" style="width:700px;"></textarea>
					</td>
				</tr>
			</table>
		</div>
		
		<!-- --------------------------�з�------------------------------------- -->
		<div class="namefont"><h3>�з�</h3></div>
		<div class="contactform contactformtopcolor1">
			<table class="insertform" cellpadding="0" cellspacing="0" summary="��������� �з������� �Է��մϴ�">
				<colgroup><col width="80"><col width="200"><col width="200"><col width="*"></colgroup>
				<tr>
					<th>No</th>
					<th>�� ��<br/>(���)</th>
					<th>�� ��<br/>(20120101~20120301)</th>
					<th>�� ��</th>
				</tr>
				<tr>
					<td class="contents">1</td>
					<td class="contents_l">
						<input type="text" name="h_position1" class="unqueryform" tabindex="205" style="width:90%;"  title="�з� ������� �Է����ּ���">
					</td>
					<td class="contents_l">
						<dl class="colbath">
							<dd><input type="text" name="h_edustart1" tabindex="206" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
							<dd class="hyphen">~</dd>
							<dd><input type="text" name="h_eduend1" tabindex="207" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
						</dl>
					</td>
					<td class="contents_l">
						<input type="text" name="h_contents1" class="unqueryform" tabindex="208" style="width:98%;"  title="�з� ������ �Է����ּ���">
					</td>
				</tr>
				<tr>
					<td class="contents">2</td>
					<td class="contents_l">
						<input type="text" name="h_position2" class="unqueryform" tabindex="209" style="width:90%;"  title="�з� ������� �Է����ּ���">
					</td>
					<td class="contents_l">
						<dl class="colbath">
							<dd><input type="text" name="h_edustart2" tabindex="210" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
							<dd class="hyphen">~</dd>
							<dd><input type="text" name="h_eduend2" tabindex="211" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
						</dl>
					</td>
					<td class="contents_l">
						<input type="text" name="h_contents2" class="unqueryform" tabindex="212" style="width:98%;"  title="�з� ������ �Է����ּ���">
					</td>
				</tr>
				<tr>
					<td class="contents">3</td>
					<td class="contents_l">
						<input type="text" name="h_position3" class="unqueryform" tabindex="213" style="width:90%;"  title="�з� ������� �Է����ּ���">
					</td>
					<td class="contents_l">
						<dl class="colbath">
							<dd><input type="text" name="h_edustart3" tabindex="214" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
							<dd class="hyphen">~</dd>
							<dd><input type="text" name="h_eduend3" tabindex="215" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
						</dl>
					</td>
					<td class="contents_l">
						<input type="text" name="h_contents3" class="unqueryform" tabindex="216" style="width:98%;"  title="�з� ������ �Է����ּ���">
					</td>
				</tr>
			</table>
		</div>
		
		<!-- --------------------------�ֿ���------------------------------------- -->
		<div class="namefont"><h3>�ֿ���</h3></div>
		<div class="contactform contactformtopcolor1">
			<table class="insertform" cellpadding="0" cellspacing="0" summary="��������� �з������� �Է��մϴ�">
				<colgroup><col width="80"><col width="200"><col width="200"><col width="*"></colgroup>
				<tr>
					<th>No</th>
					<th>�ٹ�ó<br/>(�����)</th>
					<th>�� ��<br/>(20120101~20120301)</th>
					<th>�� ��</th>
				</tr>
				<tr>
					<td class="contents">1</td>
					<td class="contents_l">
						<input type="text" name="c_position1" class="unqueryform" tabindex="221" style="width:90%;"  title="�ֿ��� ������� �Է����ּ���">
					</td>
					<td class="contents_l">
						<dl class="colbath">
							<dd><input type="text" name="c_edustart1" tabindex="222" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
							<dd class="hyphen">~</dd>
							<dd><input type="text" name="c_eduend1" tabindex="223" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
						</dl>
					</td>
					<td class="contents_l">
						<input type="text" name="c_contents1" class="unqueryform" tabindex="224" style="width:98%;"  title="�ֿ��� ������ �Է����ּ���">
					</td>
				</tr>
				<tr>
					<td class="contents">2</td>
					<td class="contents_l">
						<input type="text" name="c_position2" class="unqueryform" tabindex="226" style="width:90%;"  title="�ֿ��� ������� �Է����ּ���">
					</td>
					<td class="contents_l">
						<dl class="colbath">
							<dd><input type="text" name="c_edustart2" tabindex="227" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
							<dd class="hyphen">~</dd>
							<dd><input type="text" name="c_eduend2" tabindex="228" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
						</dl>
					</td>
					<td class="contents_l">
						<input type="text" name="c_contents2" class="unqueryform" tabindex="229" style="width:98%;"  title="�ֿ��� ������ �Է����ּ���">
					</td>
				</tr>
				<tr>
					<td class="contents">3</td>
					<td class="contents_l">
						<input type="text" name="c_position3" class="unqueryform" tabindex="231" style="width:90%;"  title="�ֿ��� ������� �Է����ּ���">
					</td>
					<td class="contents_l">
						<dl class="colbath">
							<dd><input type="text" name="c_edustart3" tabindex="232" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
							<dd class="hyphen">~</dd>
							<dd><input type="text" name="c_eduend3" tabindex="233" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
						</dl>
					</td>
					<td class="contents_l">
						<input type="text" name="c_contents3" class="unqueryform" tabindex="234" style="width:98%;"  title="�ֿ��� ������ �Է����ּ���">
					</td>
				</tr>
			</table>
		</div>
		
		<!-- --------------------------�������------------------------------------- -->
		<div class="namefont"><h3>�������</h3></div>
		<div class="contactform contactformtopcolor1">
			<table class="insertform" cellpadding="0" cellspacing="0" summary="��������� ��������� �Է��մϴ�">
				<colgroup><col width="80"><col width="200"><col width="200"><col width="*"></colgroup>
				<tr>
					<th>No</th>
					<th>�����<br/>(�б�)</th>
					<th>�� ��<br/>(20120101~20120301)</th>
					<th>��������</th>
				</tr>
				<tr>
					<td class="contents">1</td>
					<td class="contents_l">
						<input type="text" name="p_position1" class="unqueryform" tabindex="240" style="width:90%;"  title="������� ������� �Է����ּ���">
					</td>
					<td class="contents_l">
						<dl class="colbath">
							<dd><input type="text" name="p_edustart1" tabindex="241" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
							<dd class="hyphen">~</dd>
							<dd><input type="text" name="p_eduend1" tabindex="242" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
						</dl>
					</td>
					<td class="contents_l">
						<input type="text" name="p_contents1" class="unqueryform" tabindex="243" style="width:98%;"  title="������� ������ �Է����ּ���">
					</td>
				</tr>
				<tr>
					<td class="contents">2</td>
					<td class="contents_l">
						<input type="text" name="p_position2" class="unqueryform" tabindex="245" style="width:90%;"  title="������� ������� �Է����ּ���">
					</td>
					<td class="contents_l">
						<dl class="colbath">
							<dd><input type="text" name="p_edustart2" tabindex="246" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
							<dd class="hyphen">~</dd>
							<dd><input type="text" name="p_eduend2" tabindex="247" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
						</dl>
					</td>
					<td class="contents_l">
						<input type="text" name="p_contents2" class="unqueryform" tabindex="248" style="width:98%;"  title="������� ������ �Է����ּ���">
					</td>
				</tr>
				<tr>
					<td class="contents">3</td>
					<td class="contents_l">
						<input type="text" name="p_position3" class="unqueryform" tabindex="250" style="width:90%;"  title="������� ������� �Է����ּ���">
					</td>
					<td class="contents_l">
						<dl class="colbath">
							<dd><input type="text" name="p_edustart3" tabindex="251" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
							<dd class="hyphen">~</dd>
							<dd><input type="text" name="p_eduend3" tabindex="252" title="�Ⱓ�� �Է����ּ���" style="width:80px; text-align:center;" maxlength="8" onkeyup="numberCheck(this);"></dd>
						</dl>
					</td>
					<td class="contents_l">
						<input type="text" name="p_contents3" class="unqueryform" tabindex="253" style="width:98%;"  title="������� ������ �Է����ּ���">
					</td>
				</tr>
			</table>
		</div>
		
		<div class="namefont"><h3>�ֿ��� �� ������� �����ڷ�</h3><h4>�����ڷ�� �����Ͽ� ����� �ּ���. (zip, alz, rar, ace �� ��ϰ���)</h4></div>
		<div class="contactform contactformtopcolor1">
			<input type="FILE" name="p_file3" tabindex="254" title="���ǰ�ȹ���� ������ �ּ���" style="width:99%;margin-top: 5px;">
		</div>
		<!-- --------------------------�������------------------------------------- -->
		<div class="namefont"><h3>�ֿ���ǰ �� ����</h3></div>
		<div class="contactform contactformtopcolor1">
			<textarea id="worknbook" name="worknbook" title="�ֿ���ǰ �� ������ �Է��� �ּ���" tabindex="260" style="width:99%;margin-top: 5px;" rows="10"></textarea>
		</div>
		<div class="contactbtm">
		<a href='javascript:insert_check()'><img src="/images/2012/sub/page7/btn_request.gif" alt="�� �������� ��û�մϴ�"></a>
		</div>
		</form>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
