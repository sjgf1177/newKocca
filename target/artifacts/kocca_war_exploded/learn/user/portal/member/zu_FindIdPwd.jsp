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

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--//

// ID ã��
function searchId() {

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

    if (document.form1.p_resno1_2.value=="") {
        alert("�ֹε�Ϲ�ȣ�� ��Ȯ�� �Է��ϼ���.");
        form1.p_resno1_2.focus();
        return;
    }

    if (document.form1.p_resno2_2.value=="") {
        alert("�ֹε�Ϲ�ȣ�� ��Ȯ�� �Է��ϼ���.");
        form1.p_resno2_2.focus();
        return;
    }
     // document.form1.p_process.value = "SendMail";
    document.form1.p_process.value = "CheckCerti";
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
  
            <%if( box.getSession("tem_grcode").equals("N000001")) { %>
      
      <table>   
	      <tr>
	      	<td>
	      	
	      	<!--Ÿ��Ʋ�κ�-->
    <table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/member/stitle_02.gif" alt="ȸ������" /></td>
        <td class="h_road">Home &gt; �̿�ȳ�  &gt; <strong>���̵�/�н�����ã��</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
      <tr>
        <td height="40" colspan="2"><img src="/images/portal/homepage_renewal/member/ico_blue.gif" align="absmiddle" /> ���̵� �Ǵ� �н����带 �н��Ͻ� ���� �������� ������ ���� ���̵� Ȯ���Ͻ� �� �ֽ��ϴ�.</td>
      </tr>
      <tr>
        <td height="15" colspan="2">&nbsp;</td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->

      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td id="s_stit"><img src="/images/portal/homepage_renewal/member/s_stitle_06.gif" /></td>
          <td width="324" id="s_stit"><img src="/images/portal/homepage_renewal/member/s_stitle_07.gif" /></td>
        </tr>
        <tr>
          <td height="15"><table width="324" border="0" cellpadding="10" cellspacing="1" bgcolor="ADBBD8" id="search_form">
            <tr>
              <td height="170" bgcolor="F0F0F0"><table width="293" border="0" align="center" cellpadding="2" cellspacing="0">
                  <tr>
                    <td height="15"></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>�̸�</td>
                    <td><input type="text" name="p_name" id="p_name" style="width:202px; height:26px;" /></td>
                    </tr>
                  <tr>
                    <td width="90">�ֹε�Ϲ�ȣ</td>
                    <td><input type="text" name="p_resno1" id="p_resno1" style="width:93px; height:26px;" />
                      - 
                        <input type="password" name="p_resno2" id="p_resno2" style="width:93px; height:26px;" /></td>
                  </tr>
                  <tr>
                    <td height="15"></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td height="25" colspan="2" align="center"><img src="/images/portal/homepage_renewal/member/line_blue.gif" /></td>
                    </tr>
                  <tr>
                    <td height="30" colspan="2" align="center"><a href="javascript:searchId()"><img src="/images/portal/homepage_renewal/member/btn_confirm02.gif" /></a></td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
          <td><table width="324" border="0" cellpadding="10" cellspacing="1" bgcolor="ADBBD8" id="search_form">
            <tr>
              <td height="170" bgcolor="F0F0F0"><table width="293" border="0" align="center" cellpadding="2" cellspacing="0">
                <tr>
                  <td>���̵�</td>
                  <td><input type="text" name="p_userid_2" id="p_userid_2" style="width:202px; height:26px;" /></td>
                </tr>

                  <tr>
                    <td>�̸�</td>
                    <td><input type="text" name="p_name_2" id="p_name_2" style="width:202px; height:26px;" /></td>
                  </tr>
                  <tr>
                    <td width="90">�ֹε�Ϲ�ȣ</td>
                    <td><input type="text" name="p_resno1_2" id="p_resno1_2" style="width:93px; height:26px;" />
                      -
                      <input type="password" name="p_resno2_2" id="p_resno2_2" style="width:93px; height:26px;" /></td>
                  </tr>
                  <tr>
                    <td height="25" colspan="2" align="center"><img src="/images/portal/homepage_renewal/member/line_blue.gif" /></td>
                  </tr>
                  <tr>
                    <td height="30" colspan="2" align="center"><a href="javascript:searchPwd()"><img src="/images/portal/homepage_renewal/member/btn_confirm02.gif" /></a></td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td colspan="2">          </td>
        </tr>
      </table>
      
     
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
	      	
	      	<%}else{ %>
	      	
	      	<h2><img src="/images/portal/member/membership/h3_tit.gif" alt="���̵�/�н����� ã��" class="fl_l" /><p class="category">Home &gt; �̿�ȳ� &gt; <strong>���̵�/�н����� ã��</strong></p></h2>

           <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
              <tr>
                 <td align="left" class="lh_17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���̵� �Ǵ� �н����带 �н��Ͻ� ���� �������� ������ ���� ���̵� Ȯ���Ͻ� �� �ֽ��ϴ�.</td>
               </tr>
               <tr>
                 <td>&nbsp;</td>
               </tr>
               <tr>
                 <td><table border="0" cellspacing="0" cellpadding="0">
                   <tr>
                     <td width="330"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                         <td height="30" align="left" valign="top"><img src="/images/portal/member/membership/stit_m5.gif" width="74" height="13" alt="���̵� ã��"/></td>
                       </tr>
                       <tr>
                         <td height="172" valign="top" background="/images/portal/member/membership/box_img_6.gif" style="padding-left:30px;padding-right:30px">
                             <table width="100%" border="0" cellspacing="0" cellpadding="0" title="���̵� ã��">
                               <tr>
                                 <td height="45">&nbsp;</td>
                                 <td>&nbsp;</td>
                               </tr>
                               <tr>
                                 <td height="30" align="left">�̸�</td>
                                 <td align="left">
                                   <input name="p_name" type="text" class="inp_txt_01" id="p_name" size="20" title="�̸�"/></td>
                               </tr>
                               <tr>
                                 <td height="30" align="left">�ֹε�Ϲ�ȣ</td>
                                 <td align="left">
                                   <input name="p_resno1" type="text" class="inp_txt_01" id="p_resno1" title="�ֹε�Ϲ�ȣ���ڸ�" size="13" maxlength="6" onkeyup="moveFocus(6,this,this.form.p_resno2);" onKeypress="onlyNumber();" />
                                 -
                                   <input name="p_resno2" type="password" class="inp_txt_01" id="p_resno2" title="�ֹε�Ϲ�ȣ���ڸ�" size="13" maxlength="7" onKeypress="onlyNumber();" /></td>
                               </tr>
                               <tr>
                                 <td height="60" colspan="2" align="center" ><a href="javascript:searchId()"><img src="/images/portal/member/membership/btn_ok2.gif" width="85" height="30" alt="Ȯ��"/></a></td>
                               </tr>
                             </table></td>
                       </tr>
                     </table></td>
                     <td width="30">&nbsp;</td>
                     <td width="330"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                         <td height="30" align="left" valign="top"><img src="/images/portal/member/membership/stit_m8.gif" width="86" height="13" alt="�н����� ã��"/></td>
                       </tr>
                       <tr>
                         <td height="172" valign="top" background="/images/portal/member/membership/box_img_6.gif" style="padding-left:30px;padding-right:30px">
                             <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="�н����� ã��">
                             <tr>
                               <td height="35">&nbsp;</td>
                               <td>&nbsp;</td>
                             </tr>
                             <tr>
                               <td height="25" align="left">���̵�</td>
                               <td align="left"><input name="p_userid_2" type="text" class="inp_txt_01" id="p_userid_2" title="���̵�" size="20" value="<%=sUserid %>" />
                               </td>
                             </tr>
                              <tr>
                               <td height="25" align="left">�̸�</td>
                               <td align="left"><input name="p_name_2" type="text" class="inp_txt_01" id="p_name_2" title="�̸�" size="20" value="<%=sName %>" />
                               </td>
                             </tr>
                             <tr>
                               <td height="25" align="left">�ֹε�Ϲ�ȣ</td>
                               <td align="left"><input name="p_resno1_2" type="text" class="inp_txt_01" id="p_resno1_2" title="�ֹε�Ϲ�ȣ���ڸ�" size="13" maxlength="6" onkeyup="moveFocus(6,this,this.form.p_resno2_2);" onKeypress="onlyNumber();" value="<%=sJuminid1 %>" />
                                 -
                                 <input name="p_resno2_2" type="password" class="inp_txt_01" id="p_resno2_2" title="�ֹε�Ϲ�ȣ���ڸ�" size="13" maxlength="7" onKeypress="onlyNumber();" value="<%=sJuminid2 %>"/></td>
                             </tr>
                             <tr>
                               <td height="50" colspan="2" align="center"><a href="javascript:searchPwd()"><img src="/images/portal/member/membership/btn_ok2.gif" width="85" height="30" alt="Ȯ��"/></a></td>
                             </tr>
                         </table></td>
                       </tr>
                     </table></td>
                   </tr>
                 </table></td>
               </tr>
            </table>
            
            <%} %>

</form>
<!-- form �� -->

<%
    if (!sMessage.equals("")) {
        out.println("<script language='javascript'> alert('"+ sMessage +"'); </script>");
    }

    if (sIsOk.equals("0")) {
       out.println("<script language='javascript'> window.open('http://check.namecheck.co.kr/checkplus_new_model/checkplus.cb?m=checkplusSerivce&EncodeData="+ sEncData + "','', 'width=425, height=535');</script>");
    }
%>

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->