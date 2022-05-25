<%@ page import="com.credu.library.RequestBox" %>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
%>
<script type="text/javascript">
    var idExists=false;
    var emailExists=false;
    function nextOk()
    {
    	var r0=$("[name='p_kor_name']").val();
    	if(r0=="")
    	{
			alert("�̸��� �Է��Ͽ� �ֽʽÿ�.");
			$("[name='p_name']").focus();
			return;
    	}    	

    	var b1=$("[name='p_birth_year']").val();    	        
    	var b2=$("[name='p_birth_month']").val();
    	var b3=$("[name='p_birth_day']").val();
    	if(b1=="" || b1.length < 4 || b2=="" || b2.length < 2 || b3=="" || b3.length < 2)
    	{
			alert("��������� �Է����ֽʽÿ�.");
			return;
    	}

    	var s=$('input[name="p_sex"]:checked').val();
    	if(!$("[name]='p_sex'").is(':checked')) {
    		alert("������ �����Ͻʽÿ�.");
    		return;
    	}
    	
        if(!idExists)
        {
            alert("���̵� �ߺ�Ȯ���� �Ͻñ� �ٶ��ϴ�.");
            return;
        }

        var r=$("[name='p_pw1']").val();
        if(r=="")
        {
            alert("��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
            $("[name='p_pw1']").focus();
            return;
        }

        if(r.length<8)
        {
            alert("��ȣ�� 8�ڸ� �̻��̾�� �մϴ�.");
            $("[name='p_pw1']").focus();
            return;
        }

        var r1=$("[name='p_pw2']").val();
        if(r1=="")
        {
            alert("��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
            $("[name='p_pw2']").focus();
            return;
        }

        if(r1.length<8)
        {
            alert("��ȣ�� 8�ڸ� �̻��̾�� �մϴ�.");
            $("[name='p_pw2']").focus();
            return;
        }

        if(r!=r1)
        {
            alert("��ȣ�� ��ġ ���� �ʽ��ϴ�.");
            return;
        }

        var r2=$("[name='p_tel1']").val();
        if(r2=="")
        {
            alert("��ȭ��ȣ�� ������ �Է��Ͽ� �ֽʽÿ�.");
            $("[name='p_tel1']").focus();
            return;
        }

        var r3=$("[name='p_tel2']").val();
        if(r3=="")
        {
            alert("��ȭ��ȣ�� ��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
            $("[name='p_tel2']").focus();
            return;
        }

        var r4=$("[name='p_mobil1']").val();
        if(r4=="")
        {
            alert("�޴����� ������ �Է��Ͽ� �ֽʽÿ�.");
            $("[name='p_mobil1']").focus();
            return;
        }

        var r5=$("[name='p_mobil2']").val();
        if(r5=="")
        {
            alert("�޴����� ��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
            $("[name='p_mobil2']").focus();
            return;
        }        

        var r6=$("[name='p_email1']").val();
        if(r6=="")
        {
            alert("�̸����� �Է��Ͽ� �ֽʽÿ�.");
            $("[name='p_email1']").focus();
            return;
        }

        var r7=$("[name='p_email2']").val();
        if(r7=="")
        {
            alert("�̸����� �Է��Ͽ� �ֽʽÿ�.");
            $("[name='p_email2']").focus();
            return;
        }

        if(!emailExists)
        {
            alert("�̸��� �ߺ�Ȯ���� �Ͻñ� �ٶ��ϴ�.");
            return;
        }
        /*
        var r8=$("[name='p_organization']").val();
        if(r8=="")
        {
            alert("�Ҽӱ���� �Է��Ͽ� �ֽʽÿ�.");
            $("[name='p_organization']").focus();
            return;
        }

        
        var r9=$("[name='p_deptnm']").val();
        if(r9=="")
        {
            alert("�Ҽ� �μ��� �Է��Ͽ� �ֽʽÿ�.");
            $("[name='p_deptnm']").focus();
            return;
        }
        */
        document.form1.p_process.value = "ASP_Login_Insert";
        document.form1.menuid.value = "0";
        document.form1.gubun.value = "4";
        document.form1.action = "/servlet/controller.homepage.MainServlet";
        document.form1.submit();
    }
    
    function email2change()
    {
        var r=$("[name='p_email20']").val();
        $("[name='p_email2']").val(r);
    }

    function existsId()
    {
        var r=$.trim($("[name='p_id']").val());
        if(r=="")
        {
            alert("���̵� �Է��Ͽ� �ֽʽÿ�.");
            return;
        }

        if(r.length<6 || r.length>16)
        {
            alert("���̵�� �� 6~16�ڷθ� ������ �Ǿ�� �մϴ�.");
            return;
        }

        var fm=document.form1;
    	var chk_num = fm.p_id.value.search(/[0-9]/g);
        var chk_lower = fm.p_id.value.search(/[a-z]/ig);
        if (!/^[a-z0-9]{6,16}$/.test(fm.p_id.value) ||  (chk_num < 0 || chk_lower< 0) ){
            alert("���̵�� ���� �ҹ���, ���ڸ� ȥ���Ͽ� 6-16�ڸ��� �Է��� �ּ���.");
            fm.p_id.value;
            fm.p_id.focus();
            return;
        }

        document.form1.p_process.value = "ASP_Login";
        document.form1.menuid.value = "0";
        document.form1.gubun.value = "20";

        $("[name='form1']").ajaxSubmit({
            url:'/servlet/controller.homepage.MainServlet',
           type:'post',
            data:{userId:r},
           success: function(data){
               var r1=$.trim(data);
               $("#div_Area").text("");
               idExists=false;
               if(r1=="0")
               {
                   $("#div_Area").css("color","#FF0000");      //   ID �� ����
                   $("#div_Area").text("����Ҽ� ���� ���̵� �Դϴ�.");
               }
               else
               {
                   idExists=true;
                   $("#div_Area").css("color","#0000FF");      //   ID ����
                   $("#div_Area").text("����Ҽ� �ִ� ���̵� �Դϴ�.");
               }
            }
        });
    }

    function existsEmail()
    {
        var r=$.trim($("[name='p_email1']").val());
        var r2=$.trim($("[name='p_email2']").val());
        var r3= r+"@"+r2;
        if(r=="" || r2=="")
        {
            alert("�̸����� �Է��Ͽ� �ֽʽÿ�.");
            return;
        }        

        document.form1.p_process.value = "ASP_Login";
        document.form1.menuid.value = "0";
        document.form1.gubun.value = "25";

        $("[name='form1']").ajaxSubmit({
            url:'/servlet/controller.homepage.MainServlet',
           type:'post',
            data:{userEmail:r3},
           success: function(data){
               var r1=$.trim(data);
               $("#div_Area").text("");
               emailExists=false;
               if(r1=="0")
               {
                   $("#div_Area2").css("color","#FF0000");      //   ID �� ����
                   $("#div_Area2").text("����Ҽ� ���� �̸��� �Դϴ�.");
               }
               else
               {
                   emailExists=true;
                   $("#div_Area2").css("color","#0000FF");      //   ID ����
                   $("#div_Area2").text("����Ҽ� �ִ� �̸��� �Դϴ�.");
               }
            }
        });
    }

    function chkYN()
    {
        var r=$("[name='p_agreed']").val();
        if(r=="Y")
            $("[name='p_agreed']").val("N");
        else
            $("[name='p_agreed']").val("Y");
    }

    function onlyHangul()
    {
        if(((event.keyCode<12592)||(event.keyCode>12687))) {
            alert("�ѱ۸� �Է°����մϴ�");            
            event.returnValue=false;
        }else{
			event.returnValue=true;
        }
    }

    function onlyNumber()
    {
    	if((event.keyCode<48)||(event.keyCode>57))
 		{
			alert("���ڸ� �Է� �����մϴ�.");
			event.returnValue=false;	
        }else{
        	event.returnValue=true;
        }
    }
</script>
<table width="690px" border="0" cellspacing="0" cellpadding="0">
        <tr>
        <td>
        	<!--ž�̹������� ����--->
			<%@ include file="/learn/user/portal/include/topMembership.jsp" %>  
       
        </td>
        </tr>
        <tr>
        <td>
        <!--���ο���--->
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr><td width="20">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="230" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="/images/asp/membership/left_title.gif" width="230" height="38" /></td>
              </tr>
              <tr>
                <td><img src="/images/asp/membership/leftm1_o.gif" width="230" height="41" /></td>
              </tr>
              <tr>
                <td><a href="javascript:menuForwardLoginAndPwFind('10')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image25','','/images/asp/membership/leftm2_o.gif',1)"><img src="/images/asp/membership/leftm2_a.gif" name="Image25" width="230" border="0" id="Image25" /></a></td>
              </tr>
            </table></td>
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="38" align="left" valign="top"><img src="/images/asp/membership/title_1.gif" width="84" height="31" /></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <!--<td><img src="/images/asp/membership/join1_a.gif" width="178" height="91" /></td>-->
                    <td><img src="/images/asp/membership/join2_a.gif" width="245" height="91" /></td>
                    <td><img src="/images/asp/membership/join3_o.gif" width="245" height="91" /></td>
                    <td><img src="/images/asp/membership/join4_a.gif" width="199" height="91" /></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td><img src="/images/asp/membership/stitle_4.gif" width="690" height="24" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>

             <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="2" bgcolor="#487bb0"></td>
                    <td bgcolor="#487bb0"></td>
                  </tr>
                  <tr>
                    <td width="130" height="33" align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b"><span class="fc_red1">* </span>����(�ѱ�)</td>
                    <td align="left" style="border-bottom:1px solid #c6cfd9;padding-left:10px">
                    	<input type="text" class="inp_txt_01" name="p_kor_name" onkeypress="onlyHangul();"/>
                    	<!--
                    	<%=box.getSession("name")%>
                        <input type="hidden" name="p_name" value="<%=box.getSession("name")%>">
                        <input type="hidden" name="p_resno" value="<%=box.getSession("resno")%>">
                        -->
                    </td>
                  </tr>
                  <tr>
                    <td width="130" height="33" align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b"><span class="fc_red1">* </span>�������</td>
                    <td align="left" style="border-bottom:1px solid #c6cfd9;padding-left:10px">
                    	<input type="text" class="inp_txt_01" name="p_birth_year" size="5" maxlength="4" onkeypress="onlyNumber();" style="IME-MODE: disabled"/>��                    	
                    	<input type="text" class="inp_txt_01" name="p_birth_month" size="2" maxlength="2" onkeypress="onlyNumber();" style="IME-MODE: disabled"/>��
                    	<input type="text" class="inp_txt_01" name="p_birth_day" size="2" maxlength="2" onkeypress="onlyNumber();" style="IME-MODE: disabled"/>��
                    	 &nbsp;�� (1972�� 01��01��)
                    </td>
                  </tr>
                  <tr>
                    <td width="130" height="33" align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b"><span class="fc_red1">* </span>����</td>
                    <td align="left" style="border-bottom:1px solid #c6cfd9;padding-left:10px">
                    	<input name="p_sex" type="radio" value="1" id="p_sex"  />���� 
					 	<input name="p_sex" type="radio" value="2" id="p_sex"  />����
                    </td>
                  </tr>
                  <tr>
                    <td height="33" align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b"><span class="fc_red1">* </span>���̵�</td>
                    <td height="45" align="left" style="border-bottom:1px solid #c6cfd9;padding-left:10px"><p>
                      <input name="p_id" type="text" class="inp_txt_01" maxlength="16" size="40" onkeypress="idExists=false;"/>
                      <a href="javascript:existsId();"><img src="/images/asp/membership/btn_idcheck.gif" alt="�ߺ�Ȯ��" width="49" height="17" align="absmiddle" /></a><span id="div_Area" style="width:200px;margin-left:10px"></span></p>
                      <p class="lh_20 fs_11 ls">* ���̵�� 6~16���� ����, ������ �������� ���� �� �ֽ��ϴ�.</p></td>
                  </tr>
                   <tr>
                    <td height="33" align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b"><span class="fc_red1">* </span>��й�ȣ</td>
                    <td height="45" align="left" style="border-bottom:1px solid #c6cfd9;padding-left:10px"><input name="p_pw1" type="password" class="inp_txt_01"  size="40"/>
                      <br />
                      <span class="lh_20 fs_11 ls">* 8�� �̻��� ���� Ȥ�� �������� �Է����ּ���. ���ӵ� ����, ����, �ֹι�ȣ �� �˱⽬�� ���ڴ� �����ּ���.</span></td>
                  </tr>
                  <tr>
                    <td height="33" align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b"><span class="fc_red1">* </span>��й�ȣ Ȯ��</td>
                    <td align="left" style="border-bottom:1px solid #c6cfd9;padding-left:10px"><input name="p_pw2" type="password" class="inp_txt_01" size="40" /></td>
                  </tr>
                  <tr>
                    <td height="33" align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b"><span class="fc_red1">* </span>��ȭ��ȣ</td>
                    <td align="left" style="border-bottom:1px solid #c6cfd9;padding-left:10px">
                    	<select name="p_tel0" >
	                      <option value="02">02</option>
		                  <option value="031">031</option>
		                  <option value="032">032</option>
		                  <option value="033">033</option>
		                  <option value="041">041</option>
		                  <option value="042">042</option>
		                  <option value="043">043</option>
		                  <option value="044">044</option>
		                  <option value="051">051</option>
		                  <option value="052">052</option>
		                  <option value="053">053</option>  
		                  <option value="054">054</option>
		                  <option value="055">055</option>  
		                  <option value="061">061</option>  
		                  <option value="062">062</option>
		                  <option value="063">063</option>  
		                  <option value="064">064</option>
		                  <option value="070">070</option>  
                        </select>
                    -
                      <input name="p_tel1" type="text" maxlength="4" class="inp_txt_01"  size="15" onkeypress="onlyNumber();" style="IME-MODE: disabled"/>
                      -
                      <input name="p_tel2" type="text" maxlength="4"class="inp_txt_01"  size="15" onkeypress="onlyNumber();" style="IME-MODE: disabled"/></td>
                  </tr>
                    <tr>
                    <td height="33" align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b"><span class="fc_red1">* </span>�޴���</td>
                    <td align="left" style="border-bottom:1px solid #c6cfd9;padding-left:10px"> <select name="p_mobil0" >
                      <option>010</option>
                      <option>011</option>
                      <option>016</option>
                      <option>018</option>
                      <option>017</option>
                      <option>019</option>
                          </select>
                    -
                      <input name="p_mobil1" type="text" maxlength="4" class="inp_txt_01"  size="15" onkeypress="onlyNumber();" style="IME-MODE: disabled"/>
                      -
                      <input name="p_mobil2" type="text" maxlength="4" class="inp_txt_01"  size="15" onkeypress="onlyNumber();" style="IME-MODE: disabled"/></td>
                  </tr>
                  <tr>
                    <td height="33" align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b"><span class="fc_red1">* </span>�̸���</td>
                    <td height="65" align="left" style="border-bottom:1px solid #c6cfd9;padding-left:10px"><input name="p_email1" type="text" class="inp_txt_01" size="30" onkeypress="emailExists=false;"/>
                      @
                      <input name="p_email2" type="text" class="inp_txt_01" id="textfield4" size="30" />
                      <select name="p_email20"  onchange="email2change();">
                          <option value="">�����Է�</option>
                          <option value="naver.com" >naver.com</option>
                          <option value="chol.com" >chol.com</option>
                          <option value="dreamwiz.com" >dreamwiz.com</option>
                          <option value="empal.com" >empal.com</option>
                          <option value="freechal.com" >freechal.com</option>
                          <option value="gmail.com" >gmail.com</option>
                          <option value="hanafos.com" >hanafos.com</option>
                          <option value="hanmail.net" >hanmail.net</option>
                          <option value="hanmir.com" >hanmir.com</option>
                          <option value="hitel.net" >hitel.net</option>
                          <option value="hotmail.com" >hotmail.com</option>
                          <option value="korea.com" >korea.com</option>
                          <option value="lycos.co.kr" >lycos.co.kr</option>
                          <option value="nate.com" >nate.com</option>
                          <option value="netian.com" >netian.com</option>
                          <option value="paran.com" >paran.com</option>
                          <option value="yahoo.com" >yahoo.com</option>
                          <option value="yahoo.co.kr" >yahoo.co.kr</option>
                      	</select>
                      <br />
                      <span class="lh_20 fs_11 ls"><a href="javascript:existsEmail();"><img src="/images/asp/membership/btn_idcheck.gif" alt="�ߺ�Ȯ��" width="49" height="17" align="absmiddle" /></a><span id="div_Area2" style="width:200px;margin-left:10px"></span><br/>
                      * �ѱ���������������� �����ϴ� ������ ��� ȸ������ �������� �ʿ��� ������ <br />
                      �ַ� ����Ͻô� �̸��� �ּҸ� �Է��� �ּ���.</span></td>
                  </tr>
                    <tr>
                    <td height="33" align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b">�������� ����</td>
                    <td align="left" style="border-bottom:1px solid #c6cfd9;padding-left:10px">
                        <input type="checkbox" name="p_agreed"  value="N" onclick="chkYN();" /> ���� �� �̺�Ʈ �ҽ��� E-Mail Ȥ�� SMS���� ���� �ϰڽ��ϴ�.
                      </td>
                    </tr>
                    <!--
                    <tr>
                      <td height="33" align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b"><span class="fc_red1">* </span>�Ҽӱ��</td>
                      <td align="left" style="border-bottom:1px solid #c6cfd9;padding-left:10px"><input name="p_organization" type="text" class="inp_txt_01" size="40" /></td>
                    </tr>
                    -->
                    <tr>
                      <td height="33" align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b">�ҼӺμ�</td>
                      <td align="left" style="border-bottom:1px solid #c6cfd9;padding-left:10px"><input name="p_deptnm" type="text" class="inp_txt_01" size="40" /></td>
                    </tr>
                      <tr style="display: none;">
                    <td align="left" bgcolor="#f5f5f5" style="border-bottom:1px solid #c6cfd9;border-right:1px solid #c6cfd9;padding-left:10px" class="b">���ɺо�</td>
                    <td align="left" style="border-bottom:1px solid #c6cfd9;padding:10px">
                    <table width="100%" border="0" cellspacing="3" cellpadding="0">
                      <tr>
                        <td width="25%"><input type="checkbox" name=""  /> �ִϸ��̼�</td>
                        <td width="25%"><input type="checkbox" name="" /> �Ϲ�</td>
                        <td width="25%"><input type="checkbox" name=""  /> ���� �� ����</td>
                        <td width="25%"><input type="checkbox" name=""  /> ��������</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="" /> ��ȭ</td>
                        <td><input type="checkbox" name="" /> ��Ƽ�̵��</td>
                        <td><input type="checkbox" name="" /> ����/����</td>
                        <td><input type="checkbox" name="" /> â������</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="" /> ����</td>
                        <td><input type="checkbox" name="" /> �������θ�Ʈ</td>
                        <td><input type="checkbox" name="" /> ���� �� ����</td>
                        <td><input type="checkbox" name="" /> ���</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="" /> ĳ����</td>
                        <td><input type="checkbox" name="" /> ���ͳ�/�����</td>
                        <td><input type="checkbox" name="" /> ����/�η¾缺</td>
                        <td><input type="checkbox" name="" /> �濵����</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="" /> ��ȭ</td>
                        <td><input type="checkbox" name=""  /> ��ȭ����</td>
                        <td><input type="checkbox" name=""  /> ������ ������</td>
                        <td><input type="checkbox" name=""  /> ��Ÿ</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="" /> ���</td>
                        <td><input type="checkbox" name="" /> ��ȭ����</td>
                        <td><input type="checkbox" name="" /> �������</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="" /> ����/����</td>
                        <td><input type="checkbox" name=""  /> ��ȭ����</td>
                        <td><input type="checkbox" name="" /> ��ȹ �� �ó�����</td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                    </td>
                    </tr>
                  </table>
                  </td>
             </tr>
              <tr>
                <td height="50" align="right"><a href="javascript:nextOk()"><img src="/images/asp/membership/btn_ok2.gif" alt="Ȯ��" width="72" height="35" /></a>&nbsp;<a href="javascript:history.go(-1);"><img src="/images/asp/membership/btn_cancel.gif" alt="���" width="72" height="35" /></a></td>
              </tr>
            
              <tr>
                <td height="50">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="20">&nbsp;</td>
          </tr></table>
       
        </td>
        </tr>
    </table>
