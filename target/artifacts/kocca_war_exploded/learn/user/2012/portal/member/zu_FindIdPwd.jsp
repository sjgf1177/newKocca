<%
//**********************************************************
//  1. ��      ��: �н����� ã��
//  2. ���α׷��� : zu_FindIdPwd.jsp
//  3. ��      ��: �н����� ã��
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    
    box.put("submenu","3");

    String s_userid  = box.getSession("userid");

    //===================================================================
    // ��������(�޴�������) ���� �׸�
    //===================================================================
    String sUserid = box.getString("sUserid");
    String sJuminid1 = box.getString("sJuminid1");
    String sJuminid2 = box.getString("sJuminid2");
    String sName = box.getString("sName");
    String sEncData = box.getString("sEncData");
    String sMessage = box.getString("sMessage");
    String sIsOk = box.getString("sIsOk");

    box.setSession("sUserid", sUserid);
    box.setSession("sJuminid1", sJuminid1);
    box.setSession("sJuminid2", sJuminid2);
    box.setSession("sName", sName);
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--//

// ID ã��
function searchId() {
	
	if(document.form1.p_agree1.checked == false ){
		alert('�ֹε�Ϲ�ȣ ó���� ���Ǹ� ���ּ���');
		return;	
	}

    if(document.form1.p_name.value == ""){
        alert("�̸��� �Է��ϼ���!");
        form1.p_name.focus();
        return;
    }

    if (document.form1.p_resno1.value=="") {
        alert("�ֹε�Ϲ�ȣ�� ��Ȯ�� �Է��ϼ���.");
        form1.p_resno1.focus();
        return;
    }

    if (document.form1.p_resno2.value=="") {
        alert("�ֹε�Ϲ�ȣ�� ��Ȯ�� �Է��ϼ���.");
        form1.p_resno2.focus();
        return;
    }

    document.form1.p_process.value = "FindIdResult";
    document.form1.action = "/servlet/controller.homepage.MainMemberJoinServlet";
    document.form1.submit();

}

// �н����� ã��
 function searchPwd() {

    if(document.form1.p_userid_2.value == ""){
        alert("���̵� �Է��ϼ���!");
        form1.p_userid_2.focus();
        return;
    }

    if(document.form1.p_name_2.value == ""){
        alert("�̸��� �Է��ϼ���!");
        form1.p_name_2.focus();
        return;
    }
    if (document.form1.gubun.value == "1") {

	    if (document.form1.p_email_2.value=="") {
	        alert("�̸����� ��Ȯ�� �Է��ϼ���.");
	        form1.p_email_2.focus();
	        return;
	    }
    } else if(document.form1.gubun.value == "2") {
    	if (document.form1.p_resno_2_1.value=="") {
            alert("�ֹε�Ϲ�ȣ�� ��Ȯ�� �Է��ϼ���.");
            form1.p_resno_2_1.focus();
            return;
        }

        if (document.form1.p_resno_2_2.value=="") {
            alert("�ֹε�Ϲ�ȣ�� ��Ȯ�� �Է��ϼ���");
            form1.p_resno_2_2.focus();
            return;
        }
       
    }
    

   /*  if (document.form1.p_resno2_2.value=="") {
        alert("�ֹε�Ϲ�ȣ�� ��Ȯ�� �Է��ϼ���.");
        form1.p_resno2_2.focus();
        return;
    } */
    if (document.form1.gubun.value == "1") {
    	 document.form1.p_process.value = "SendMail";
    } else {
    	document.form1.p_process.value = "CheckCerti";
    }
    
    //document.form1.p_process.value = "CheckCerti";
    document.form1.action = "/servlet/controller.homepage.MainMemberJoinServlet";
    document.form1.submit();
}


// ������������
function indexList() {
    document.form1.p_process.value = "";
    document.form1.action = "/servlet/controller.homepage.MainServlet";
    document.form1.submit();
}

//�ڵ��̵�
function moveFocus(num,fromform,toform)
    {
        var str = fromform.value.length;
        if(str == num)
       toform.focus();
    }

// ���ڸ� ���� �����.
function onlyNumber()
{
    if(((event.keyCode<48)||(event.keyCode>57)))
    event.returnValue=false;
}

   // SMS ����
    function whenSMS() {

      ff =document.form1;

      ff.p_msubjnm.value=ff.s_subjcourse.options[ff.s_subjcourse.selectedIndex].text;
      ff.p_mseqgrnm.value=ff.s_subjseq.options[ff.s_subjseq.selectedIndex].text;
      ff.p_msubj.value=ff.s_subjcourse.value;
      ff.p_myear.value=ff.s_gyear.value;
      ff.p_msubjseq.value=ff.s_subjseq.value;
      ff.p_touch.value = "09";

      window.self.name = "StudentMemberList";
      open_window("openSMS","","100","100","620","354");
      document.form1.target = "openSMS";
      document.form1.action='/servlet/controller.study.StudentStatusAdminServlet';
      document.form1.p_process.value = 'SendSMS';
      document.form1.submit();
    }
//-->
</script>
<!-- ��ũ��Ʈ�������� -->



<!-- form ���� -->
 <form name="form1" method="post" action="javascript:return;">
 <input type='hidden' name='p_process'>
 <input type='hidden' name='gubun' value="1">  
      
	<div class="content">
		<table class="rootinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�Դϴ�">
			<tr>
				<td class="pagetitle"><img src="/images/2012/sub/page0/title/member_idpass.gif" alt="ȸ����������"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > <u>���̵�/��й�ȣ ã��</u></td>
			</tr>
		</table>
		<div class="idpass">
			<ul class="searchbox">
				<li class="idspace">
					<div class="idbox">
						<b>���̵� ã��</b>
						<p>���Խ� �Է��� ����� �ֹε�Ϲ�ȣ�� ���̵� ã�� �� �ֽ��ϴ�.</p>
						<table class="membercheck" cellpadding="0" cellspacing="0">
							<colgroup><col width="100"><col width="*"></colgroup>
							<tr>
								<th>����(�ѱ�)</td>
								<td><input type="text" tabindex="171" name="p_name" class="txt" style="width:184px;" title="�Ǹ��� �ѱ۷� �Է����ּ���."></td>
							</tr>
							<tr>
								<th>�ֹε�Ϲ�ȣ</td>
								<td>
									<dl class="aligns">
										<dd><input type="text" tabindex="172" name="p_resno1" class="txt" style="width:80px;" maxlength="6" title="�ֹι�ȣ ���ڸ� 6�ڸ��� �Է����ּ���."></dd>
										<dd class="hyphen">-</dd>
										<dd><input type="password" tabindex="173" name="p_resno2" class="txt" style="width:80px;" maxlength="7" title="�ֺ��ȣ ���� 7�ڸ��� �Է����ּ���."></dd>
									</dl>
								</td>
							</tr>
						</table>
						<p>
							�ֹε�Ϲ�ȣ�� <u>�ѱ���������ī���̿� ���� ������� ������</u>, �ſ��򰡱���� ���� ����Ȯ�ο����θ� �̿�˴ϴ�.
							<br><br>* ����������ȣ���� ���� �̿뵿�Ǹ� �޽��ϴ�.
						</p>
						<table class="usecheck" cellpadding="0" cellspacing="0">
							<tr>
								<td><input type="checkbox" tabindex="174" class="checkbox" id="regagreen" name="p_agree1" title="����������ȣ���� ���� �̿뿡 �����մϴ�."><label for="regagreen" class="label">�ֹε�Ϲ�ȣ ó���� �����մϴ�.</label></td>
							</tr>
						</table>
						<div class="idfooter"><a href="javascript:searchId()" tabindex="175" title="�� ������ ȸ������ ���̵� �˻��մϴ�"><img src="/images/2012/sub/page0/btn_confirm.gif" alt="Ȯ��" title="���̵� ã�⸦ �����մϴ�"></a></div>
					</div>
				</li>
				<li class="passwordspace">
					<div class="passwordbox">
						<b>��й�ȣ ã��</b>
						<p>ȸ������ �� ����� ������ �Ʒ��� �Է��� �ּ���.</p>
						<table class="membercheck topline" cellpadding="0" cellspacing="0">
							<colgroup><col width="100"><col width="*"></colgroup>
							<tr>
								<th colspan="2" class="typeselect">
									<input type="radio" tabindex="181" name="checktype" id="email" onclick="passwordchecktype('1')" checked><label for="email" class="label">�̸��Ϸ� ã��</label>
									&nbsp; <input type="radio" tabindex="181" onclick="passwordchecktype('2')" name="checktype" id="mobile"><label for="mobile" class="label">����Ϸ� ã��</label>
								</th>
							</tr>
							<tr>
								<th>���̵�</td>
								<td><input type="text" tabindex="182" name="p_userid_2" class="txt" style="width:184px;" title="���̵� �Է����ּ���."></td>
							</tr>
							<tr>
								<th>����(�ѱ�)</td>
								<td><input type="text" tabindex="183" name="p_name_2" class="txt" style="width:184px;" title="�Ǹ��� �ѱ۷� �Է����ּ���."></td>
							</tr>
						</table>
						<table class="membercheck underline" cellpadding="0" cellspacing="0" id="certtype1">
							<colgroup><col width="100"><col width="*"></colgroup>
							<tr>
								<th>�����ּ�</td>
								<td><input type="text" tabindex="184" class="txt" name="p_email_2" style="width:184px;" title="�Ǹ��� �ѱ۷� �Է����ּ���."></td>
							</tr>
						</table>
						<table class="membercheck underline" cellpadding="0" cellspacing="0" id="certtype2" style="display:none;">
							<colgroup><col width="100"><col width="*"></colgroup>
							<tr>
								<th>�ֹε�Ϲ�ȣ</td>
								<td>									
									<input type="text" tabindex="184" class="txt" name ="p_resno_2_1" style="width:50px;" maxlength="6" title="�ֹι�ȣ�� �Է����ּ���.">
									- <input type="text" tabindex="185" class="txt" name ="p_resno_2_2" style="width:50px;" maxlength="7" title="�ֹι�ȣ�� �Է����ּ���.">
								</td>
							</tr>
						</table>
						<p>
							�Է��Ͻ� ������ �ùٸ� ���,<br>
							<span id="certmsg1">�ӽ� ��й�ȣ��  �߱޵˴ϴ�.</span>
							<span id="certmsg2" style="display:none;">�ӽ� ��й�ȣ�� ȸ������ �ڵ������� ���ڰ� �߼۵˴ϴ�.</span>
						</p>
						<div class="passwordfooter"><a href="javascript:searchPwd()" tabindex="186" title="�� ������ ��ġ�� ��� �ӽú�й�ȣ�� e���� �Ǵ� SMS�� �߱��մϴ�"><img src="/images/2012/sub/page0/btn_confirm.gif" alt="Ȯ��" title="���̵� ã�⸦ �����մϴ�"></a></div>
					</div>
				</li>
			</ul>
			<div class="clearL"></div>
		</div>
	</div>

</form>
<%
    if (!sMessage.equals("")) {
        out.println("<script language='javascript'> alert('"+ sMessage +"'); </script>");
    }

    if (sIsOk.equals("0")) {
       out.println("<script language='javascript'> window.open('http://check.namecheck.co.kr/checkplus_new_model/checkplus.cb?m=checkplusSerivce&EncodeData="+ sEncData + "','', 'width=425, height=535');</script>");
    }
%>	

<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
