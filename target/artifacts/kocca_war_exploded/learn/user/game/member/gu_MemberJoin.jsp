
<%
//**********************************************************
//  1. ��      ��: ȸ������ ��
//  2. ���α׷��� : gu_MemberJoin.jsp
//  3. ��      ��: ȸ������ ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.15
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	box.put("leftmenu","02");
	String v_kor_name = box.getString("p_kor_name");
	String v_resno    = box.getString("p_resno");
	String v_userid   = "";
	String v_check    = (String)request.getAttribute("check");
	String v_process  = box.getString("p_process");

	String v_degree   = box.getString("d_degree");
	String v_jikup    = box.getString("d_jikup");
	String v_comptext = box.getSession("tem_grcode");
%>


<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topMember.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT>

function checkId(){
	var userid = document.mform1.p_userid.value;
	var p_userid_len = userid.length;

		if(p_userid_len > 0){
			if(p_userid_len > 3 && p_userid_len < 13){
			// ID �ߺ��˻�
			var url = "/servlet/controller.homepage.MemberJoinServlet?p_userid="+userid+"&p_process=checkId";
			var v_win = window.open(url, "selfTest1"," left=20, top=20, width=394, height=312, menubar=no, scrollbars=no, resizable=yes");
			}else{
				alert("���̵� 4�� �̻� 12�� ���Ϸ� �ٽ� �Է����ּ���..");
				return;
			}
		}else{
			alert("���̵� �Է����ּ���..");
			return;
		}
	}

// �����ȣ�˻�
function searchPost(gubun) {
	window.self.name = "PersonalSelect";
	open_window("openPost","","100","100","417","400","","","","yes","");
	document.mform1.target = "openPost";
	document.mform1.action='/servlet/controller.library.PostSearchServlet';
	document.mform1.p_postgubun.value = gubun;
	document.mform1.p_process.value = 'SearchPostOpenPage';
	document.mform1.submit();
	document.mform1.target = window.self.name;
}

function delAddr(no){
	if( no == 1 ){
		document.mform1.p_home_addr2.value = ""
	}else if( no == 2){
		document.mform1.p_comp_addr2.value = ""
	}
}

function receivePost(post1, post2, addr, postgubun){
	if( postgubun == "1" ){
		document.mform1.p_post1.value = post1;
		document.mform1.p_post2.value = post2;
		document.mform1.p_home_addr1.value = addr;
		document.mform1.p_home_addr2.focus();
	}else if( postgubun == "2" ){
		document.mform1.p_comp_post1.value = post1;
		document.mform1.p_comp_post2.value = post2;
		document.mform1.p_comp_addr1.value = addr;
		document.mform1.p_comp_addr2.focus();
    }
}


function Submit_Check(){
	var fm=document.mform1;
	var v_handphone = fm.p_handphone1.value+'-'+fm.p_handphone2.value+'-'+fm.p_handphone3.value;

		if( (fm.p_userid.value) == "" ){
			alert("���̵� �ٸ��� �Է��ϼ���");
			fm.p_userid.focus();return;
		}

		if(fm.p_chk.value != "Y"){
			alert("���̵� �ߺ�üũ�� �ϼ���"); return;
		}

		// ��й�ȣ ���� ����
	var pass = document.mform1.p_pwd.value;
	var p_pwd_len = pass.length;

		if(p_pwd_len < 0){
			alert("��й�ȣ�� �Է����ּ���..");
			return;
		}else{
			if(p_pwd_len < 3 && p_pwd_len > 13){
				alert("��й�ȣ�� 4���̻� 12�� ���Ϸ� �ٽ� �Է����ּ���..");
				fm.p_pwd.value ="";
				fm.p_pwd.focus();
				return;
			}
		}

		if( (fm.p_pwd2.value) == ""){
			alert("��й�ȣȮ���� �Է��ϼ���");
			fm.p_pwd2.focus();return;
		}

		if(fm.p_pwd.value != fm.p_pwd2.value){
			alert("��й�ȣ�� �ٸ��� �ԷµǾ����ϴ�.");
			fm.p_pwd.value ="";
			fm.p_pwd2.value ="";
			fm.p_pwd.focus();
			return;
		}

		if( (fm.p_kor_name.value) == ""){
			alert("�̸��� �Է��ϼ���");
			fm.p_kor_name.focus();return;
		}

// �ּ� (�����ϳ��� �Է�)
	var v_post      = fm.p_post1.value + fm.p_post2.value;
	var v_comp_post = fm.p_comp_post1.value + fm.p_comp_post2.value;
	var v_home_addr = fm.p_home_addr1.value + fm.p_home_addr2.value;
	var v_comp_addr = fm.p_comp_addr1.value + fm.p_comp_addr2.value;

		if( (v_post) == "" && (v_comp_post) == "" ){
			alert("�����ȣ�� �Է��ϼ���");
			fm.p_post1.focus();	return;

			if( v_post != ""){
				if( v_home_addr == "" ){
					if( (fm.p_home_addr1.value) == "" ){
						alert("�ּҸ� �Է��ϼ���");
						fm.p_home_addr1.focus();	return;
					}else if( (fm.p_home_addr2.value) == "" ){
						alert("�ּҸ� �Է��ϼ���");
						fm.p_home_addr2.focus();	return;
					}
				}
			}else if( v_comp_post != "" ){
				if( v_comp_addr == "" ){
					if( (fm.p_comp_addr1.value) == "" ){
						alert("�ּҸ� �Է��ϼ���");
						fm.p_comp_addr1.focus();	return;
					}else if( (fm.p_comp_addr2.value) == "" ){
						alert("�ּҸ� �Է��ϼ���");
						fm.p_comp_addr2.focus();	return;
					}
				}
			}
		}

		if( (v_home_addr) == "" && (v_comp_addr) == "" ){
			alert("�����ּ�/���ּ� �� �ϳ��� �� �Է��ϼž߸� �˴ϴ�."); return;
		}

		// -->

		if( (fm.p_email.value) == ""){
			alert("Email �ּҸ� �ٸ��� �Է��ϼ���");
			fm.p_email.focus();return;
		}
		// �̸���
		/*if(isValInput(fm.p_email, "�̸���", 50, "U") == false)
		{
	    	return false;
		}*/

		// e-mail check
		if(is_mail(fm.p_email.value) == false)
		{
	    	alert("��Ȯ�� E-Mail�� �Է��Ͻʽÿ�.");
	    	fm.p_email.focus();
	    	return;
		}
		<% if(!v_comptext.equals("N000017")) {	//����ΰ���������� ���� %>
		if( (fm.p_comptext.value) == ""){
			alert("�Ҽ��� �Է��ϼ���");
			fm.p_comptext.focus(); return;
		}
		<% } %>

		//
		if(mform1.p_jikup.options.selectedIndex == ""){
			alert("������ �����ϼ���");  return;
		}
		if(mform1.p_degree.options.selectedIndex == ""){
			alert("�����з��� �����ϼ���");  return;
		}

			if( (fm.p_handphone1.value) == "" ){
				alert("�ڵ��� ��ȣ�� �Է��ϼ���");
				fm.p_handphone1.focus(); return;
			}else if( (fm.p_handphone2.value) == "" || fm.p_handphone2.length > 5 ){
				alert("�ڵ��� ��ȣ�� �ٸ��� �Է��ϼ���");
				fm.p_handphone2.focus(); return;
			}else if( (fm.p_handphone3.value) == "" || fm.p_handphone3.length > 5 ){
				alert("�ڵ��� ��ȣ�� �Է��ϼ���");
				fm.p_handphone3.focus(); return;
			}

		if( (fm.p_hometel.value) == "" && (fm.p_comptel.value) == "" ){
			alert("2���� ����ó 1���� �ݵ�� ����ٶ��ϴ�."); return;
			if( (fm.p_hometel.length) > 12 ){
				alert("����ó�� �ٸ��� �Է��ϼ���");
			}
			if( (fm.p_comptel.length) > 12 ){
				alert("����ó�� �ٸ��� �Է��ϼ���");
			}
		}

	// ����
		document.mform1.target="_self";
		document.mform1.action="/servlet/controller.homepage.MemberJoinServlet";
		document.mform1.p_handphone.value = v_handphone;
		document.mform1.p_process.value="joinOk";
		document.mform1.submit();

}


//-------------------------------------------------------
	// �̸��� �� �̸������� ID�˻�
	//-------------------------------------------------------
	function is_mail(strEmail)
	{
	    /** ��������
	     - @�� 2���̻�
	     - .�� �پ ������ ���
	     -  @.��  .@�� �����ϴ� ���
	     - ��ó����.�� ��� **/
	    var regDoNot = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;

	    /** �ʼ�����
	     - @������ �ϳ��̻��� ���ڰ� �־�� ��
	     - @�� �ϳ��־�� ��
	     - Domain�� .�� �ϳ� �̻� �־�� ��
	     - Domain���� ������ ���ڴ� ������ 2~4���̾�� �� **/
	    var regMust = /^[a-zA-Z0-9\-\.\_]+\@[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4})$/;

	    if ( !regDoNot.test(strEmail) && regMust.test(strEmail) )
	    {
	        return true;
	    }
	    else
	    {
	        return false;
	    }
	}

	// �̺�Ʈȸ�� ����üũ
	function is_authcheck() {
		var form = document.mform1;
		if(!form.p_iseventchk.value) {
			alert("������ȣ�� �Է��ϼ���!");
			return;
		}
		form.target="authifr";
		form.action="/learn/user/game/member/gu_MemberAuthChk.jsp";
		form.submit();
	}

	// ��õȸ�� ����üũ
	function is_usrcheck() {
		var form = document.mform1;
		if((form.p_userid.value) == "" ){
			alert("���̵� �ٸ��� �Է��ϼ���");
			form.p_userid.focus();return;
		}

		if(form.p_chk.value != "Y"){
			alert("���̵� �ߺ�üũ�� �ϼ���"); return;
		}
		if(!form.p_ruserid.value) {
			alert("��õ���̵� �Է��ϼ���!");
			return;
		}
		form.target="authifr";
		form.action="/servlet/controller.homepage.EventInfoServlet?p_process=eventRecom&p_userid="+form.p_userid.value+"&p_ruserid="+form.p_ruserid.value+"&p_message=Y";
		form.submit();
	}

</SCRIPT>
		<!-- title -->
		<div style="width:720px;height:35px;margin-left:0px;margin-bottom:20px;background-image:url('/images/user/game/member/<%=tem_subimgpath%>/tit_join.gif');text-align:right;padding:19px 25px 0px 0px;font-size:11px;color:#000000;">
			<img src="/images/user/game/member/blt01.gif"> Home &gt; ȸ������
		</div>
		<!-- //title -->

		<div style="margin-left:27px;text-align:left;">
			<img src="/images/user/game/member/join_i01.gif" align="left"><img src="/images/user/game/member/join_i02.gif"><br>
			�� �ҼӶ��� ���е��� ���������� ���� ü��� �������� <font color=#cc6925>�ش� ���л��� ���� �Ҽ��� ����</font><br>
			<font color=white></font>&nbsp;&nbsp;&nbsp;&nbsp;�Ͻñ� �ٶ��ϴ�.<br>
			�� �׿� ȸ���� "�Ϲ�ȸ��"���� ������ �ֽʽÿ�.<br>
			<br>


<form name="mform1" method="post" action="">
	<input type="hidden"	name="p_process"	value="">
	<input type="hidden"	name="p_resno"		value="">
	<input type="hidden"	name="p_handphone">
	<input type="hidden"	name="p_postgubun"	value="">
	<input type="hidden"	name="p_chk" >

			<img src="/images/user/game/member/join3_st01.gif" vspace="0"><br>
			<table cellpadding=0 cellspacing=0 width=720>
			<col width=65><col width=65><col width=175><col width=95><col width=290>
			<tr height=1><td class=lineColor colspan=5></td></tr>
			<tr height=26>

				<td style="padding-left:10;" colspan=2><img src="/images/user/game/member/blt02.gif" align=absmiddle> ���̵�</td>
				<td colspan=3 style="font-size:11px;color:#6d5952;">
					<input name="p_userid" type=text class=input2 style=width:175 value="">
					<a href="javascript:checkId()"><img src="/images/user/game/button/btn_chkid.gif" align=absmiddle></a>
					ID�� 4���̻� 12�� �̳��� �����ҹ��ڿ� ���ڸ� �����մϴ�.
				</td>

			</tr>
			<tr height=1><td class=lineColor colspan=5></td></tr>
			<tr height=26>
				<td style=padding-left:10; colspan=2><img src="/images/user/game/member/blt02.gif" align=absmiddle> ��й�ȣ</td>
				<td colspan=3 style=font-size:11px;color:#6d5952;>
					<input name="p_pwd" type=password class=input2 style=width:175 value="">
					��й�ȣ�� 4���̻� 12���̳��� ����� �ּ���.
				</td>
			</tr>
			<tr height=1><td class=lineColor colspan=5></td></tr>
			<tr height=26>
				<td style=padding-left:10; colspan=2><img src="/images/user/game/member/blt02.gif" align=absmiddle> ��й�ȣȮ��</td>
				<td colspan=3>
					<input name="p_pwd2" type=password class=input2 style=width:175 value="">
				</td>
			</tr>
			<tr height=1><td class=lineColor colspan=5></td></tr>
			<tr height=26>
				<td style=padding-left:10; colspan=2><img src="/images/user/game/member/blt02.gif" align=absmiddle> �̸�(�ѱ�)</td>
				<td style=font-size:11px>
					<input name="p_kor_name" type=text class=input2 style=width:175 value="<%=v_kor_name%>">
				</td>
				<td align=center>�̸�(����)</td>
				<td style=font-size:11px>
					<input name="p_eng_name" type=text class=input2 style=width:175 value="">
				</td>
			</tr>
			<tr height=1><td class=lineColor colspan=5></td></tr>
			<tr height=4><td colspan=5></td></tr>
			<tr height=26>
				<td style="padding-left:10;border-right:1px solid #dcd8d7" rowspan=4><img src="/images/user/game/member/blt02.gif" align=absmiddle> �ּ�</td>
				<td align=center>�����ȣ</td>
				<td style=font-size:11px;color:#6d5952; colspan=3>
					<input name="p_post1" type=text class=input2 style=width:80 readonly value="">
					-
					<input name="p_post2" type=text class=input2 style=width:80 readonly value="">
					<a href="javascript:searchPost(1)"><img src="/images/user/game/button/btn_zipcode.gif" align=absmiddle></a>
					�����ּ�/���ּ� �� �ϳ��� �� �Է��ϼž߸� �˴ϴ�.
				</td>
			</tr>
			<tr height=26>
				<td align=center>�����ּ�</td>
				<td colspan=3>
					<input name="p_home_addr1" type=text class=input2 style=width:265 readonly value=""> <input name="p_home_addr2" type=text class=input2 style=width:185 value="">
					<a href="javascript:delAddr(1)"><img src="/images/user/game/button/btn_deladd.gif"></a>
				</td>
			</tr>
			<tr height=26>
				<td align=center>�����ȣ</td>
				<td colspan=3>
					<input name="p_comp_post1" type=text class=input2 style=width:80 readonly value="">
					-
					<input name="p_comp_post2" type=text class=input2 style=width:80 readonly value="">
					<a href="javascript:searchPost(2)"><img src="/images/user/game/button/btn_zipcode.gif"></a>
				</td>
			</tr>
			<tr height=26>
				<td align=center>�����ּ�</td>
				<td colspan=3>
					<input name="p_comp_addr1" type=text class=input2 style=width:265 readonly value=""> <input name="p_comp_addr2" type=text class=input2 style=width:185 value="">
					<a href="javascript:delAddr(2)"><img src="/images/user/game/button/btn_deladd.gif"></a>
				</td>
			</tr>
			<tr height=4><td colspan=5></td></tr>
			<tr height=1><td class=lineColor colspan=5></td></tr>
			<tr height=26>
				<td style=padding-left:10; colspan=2><img src="/images/user/game/member/blt02.gif" align=absmiddle> E-Mail</td>
				<td colspan=3>
					<input name="p_email" type=text class=input2 style=width:175 value="">
				</td>
			</tr>
			<% if(v_comptext.equals("N000017")) {	//����ΰ���������� %>
			<tr height=1><td class=lineColor colspan=5></td></tr>
			<tr height=26>
				<td style=padding-left:10; colspan=2><img src="/images/user/game/member/blt02.gif" align=absmiddle> �ҼӼ���</td>
				<td colspan=3>
					<select name="p_comptext" style="width:80;" >
					<option value="�뱸����">�뱸</option>
					<option value="��������">����</option>
					<option value="�λ꼾��">�λ�</option>
					<option value="�ϻ꼾��">�ϻ�</option>
					<option value="��������">����</option>
					<option value="����">����</option>
					</select>
					&nbsp;
					<font color=red>���ѱ�����ΰ���������� �����ɷ°��߼��� �л��� �Ҽ� ���͸� �����Ͻñ� �ٶ��ϴ�.</font>
				</td>
			</tr>
			<% } else { %>
			<tr height=1><td class=lineColor colspan=5></td></tr>
			<tr height=26>
				<td style=padding-left:10; colspan=2><img src="/images/user/game/member/blt02.gif" align=absmiddle> �Ҽ�</td>
				<td colspan=3>
					<input name="p_comptext" type=text class=input2 style=width:150 value="">
					<font color=red>�� ���� �� Ưȭ�� ȸ���Ե��� �ݵ�� ��Ȯ�� �б����� �־��ֽñ� �ٶ��ϴ�.</font>
				</td>
			</tr>
			<% } %>
			<tr height=1><td class=lineColor colspan=5></td></tr>
			<tr height=26>
				<td style=padding-left:10; colspan=2><img src="/images/user/game/member/blt02.gif" align=absmiddle> �����з�</td>
				<td colspan=3 style="width:80;">
					<%= CodeConfigBean.getCodeGubunSelect("0069","",1,"p_degree",v_degree,"",3)%>
				</td>
			</tr>

			<tr height=1><td class=lineColor colspan=5></td></tr>
			<tr height=26>
				<td style=padding-left:10; colspan=2><img src="/images/user/game/member/blt02.gif" align=absmiddle> ����</td>
				<td colspan=3 style="width:100;">
					<%= CodeConfigBean.getCodeGubunSelect("0070","",1,"p_jikup",v_jikup,"",3)%>
				</td>
			</tr>
			<tr height=1><td class=lineColor colspan=5></td></tr>
			<tr height=26>
				<td style=padding-left:10; colspan=2><img src="/images/user/game/member/blt02.gif" align=absmiddle>�ڵ���</td>
				<td colspan=3>
					<select name="p_handphone1" style="width:80;" >
					<option value="">== ���� ==</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
					</select>
					-
					<input name="p_handphone2" type=text class=input2 style=width:100 value="">
					-
					<input name="p_handphone3"type=text class=input2 style=width:100 value="">
				</td>
			</tr>
			<tr height=1><td class=lineColor colspan=5></td></tr>
			<tr height=4><td colspan=5></td></tr>
			<tr height=26>
				<td style="padding-left:10;border-right:1px solid #dcd8d7" rowspan=2><img src="/images/user/game/member/blt02.gif" align=absmiddle> ��ȭ</td>
				<td align=center>����</td>
				<td colspan=2>
					<input name="p_hometel" type=text class=input2 style=width:175 value="">
				</td>
				<td style=font-size:11px;color:#6d5952; rowspan=2>
					2���� ����ó 1���� �ݵ�� ����ٶ��ϴ�.<br>
					��)02-540-0000<br>
				</td>
			</tr>
			<tr height=26>
				<td align=center>����</td>
				<td colspan=2>
					<input name="p_comptel" type=text class=input2 style=width:175 value="">
				</td>
			</tr>
			<tr height=4><td colspan=5></td></tr>
			<tr height=1><td class=lineColor colspan=5></td></tr>
			</table>

			<table width="720" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td>&nbsp;</td>
				</tr>
				<tr>
				  <td><img src="/images/user/game/member/box_t.gif" width="720" height="15"></td>
				</tr>
				<tr>
				  <td><table width="720" border="0" cellspacing="0" cellpadding="0">
					  <tr>
						<td width="100" height="28" style="padding-left:15;">���ϼ��ſ���</td>
						<td>
							<input name="p_ismailing" type=radio   value="Y"> ����
							<input name="p_ismailing" type=radio   checked value="N"> ���Űź�
						</td>
					  </tr>
					  <tr height=1><td class=lineColor colspan=5></td></tr>
					  <tr>
						<td height="28"  style=padding-left:15;>�������ͼ��ſ���</td>
						<td>
							<input name="p_islettering" type=radio   value="Y"> ����
							<input name="p_islettering" type=radio   checked value="N"> ���Űź�
						</td>
					  </tr>
					  <tr height=1><td class=lineColor colspan=5></td></tr>
					  <tr>
						<td height="28"  style=padding-left:15;>����ó��������</td>
						<td>
							<input name="p_isopening" type=radio   value="Y"> ����
							<input name="p_isopening" type=radio   checked value="N"> �����
						</td>
						<td width="387" style="font-size:11px;color:#6d5952;">(�н���
						  ��ȸ�� �����л��鿡�� ��ȭ��ȣ,email, �ּҸ� �����մϴ�.)
							 <input name="p_isevent" type=hidden value="N">
						</td>
					  </tr>
					  <tr height=1><td class=lineColor colspan=5></td></tr>
					  <tr>
						<td height="28"  style=padding-left:15;>������ȣ�Է�</td>
						<td>
						  <table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
							 <td><input name="p_iseventchk" type=password class=input2 style=width:90 value=""></td>
							 <td><a href="javascript:is_authcheck();"><img src="/images/user/game/button/btn_dcauth.jpg" border=0></a></td>
							 </tr>
						  </table>
						</td>
						<td width="440" style="font-size:11px;color:#6d5952;">(�ȳ� �ڷḦ ���� �߱� �� ������ȣ�� �Է��Ͻñ� �ٶ��ϴ�.)
						</td>
					  </tr>
					  <!--
					  <tr height=1><td class=lineColor colspan=5></td></tr>
					  <tr>
						<td height="28"  style=padding-left:15;>��õ���Է�</td>
						<td>
						  <table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
							 <td><input name="p_ruserid" type=text class=input2 style=width:90 value=""></td>
							 <td><a href="javascript:is_usrcheck();"><img src="/images/user/game/button/recom_btn.jpg" border=0></a></td>
							 </tr>
						  </table>
						</td>
						<td width="440" style="font-size:11px;color:#6d5952;">(��õ�Ͻ� ���� ���̵� �Է��Ͻñ� �ٶ��ϴ�)
						</td>
					  </tr>
					  -->
					</table></td>
				</tr>
				<tr>
				  <td><img src="/images/user/game/member/box_bo.gif" width="720" height="15"></td>
				</tr>
			  </table>
			  <table width="720" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td height="12"></td>
				</tr>
				<tr>
				  <td><div align="center">
					<a href="javascript:Submit_Check()"><img src="/images/user/game/button/btn_join.gif" border="0"></a>&nbsp;&nbsp;
					<a href="/servlet/controller.homepage.MainServlet"><img src="/images/user/game/button/btn_joincancel.gif" border="0"></a>
				  </div></td>
				</tr>
			  </table>
		  </div>
		<br>
		<br>
	</form>
	<iframe name="authifr" width=0 height=0 frameborder=0></iframe>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
