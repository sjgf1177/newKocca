<%
//**********************************************************
//  1. ��      ��: ȸ��Ż��
//  2. ���α׷��� :zu_MemberWithdraw.jsp
//  3. ��      ��: ȸ��Ż��
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
   
	String v_userid   = box.getSession("userid");
%>


<%@ include file="/learn/user/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--//

//Ż���û
function doWithdraw(){
    var fm=document.form1;

    if( (fm.p_pwd.value) == ""){
        alert("��й�ȣ�� �Է��ϼ���");
        fm.p_pwd.focus();return;
    }

    //document.form1.target="_self";
    document.form1.p_process.value="MemberWithdrawOk";
    document.form1.action="/servlet/controller.homepage.MainMemberJoinServlet";
    document.form1.submit()
}
//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- form ���� -->
<form name="form1"  action="" method="post">
	<input type="hidden"	name="p_process"	value="" />
    <input type="hidden"	name="p_userid"	value="<%=v_userid %>" />
    
    	<%if( box.getSession("tem_grcode").equals("N000001")) { %>
	
	<table>
		<tr>
			<td>
			
			<!--Ÿ��Ʋ�κ�//-->
	  <table width="672" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" colspan="2" class="h_road">&nbsp;</td>
        </tr>
        <tr>
          <td><img src="/images/portal/homepage_renewal//member/stitle_06.gif" alt="��й�ȣ����" /></td>
          <td class="h_road">Home &gt; �̿�ȳ�  &gt; <strong>ȸ��Ż��
          </strong></td>
        </tr>
        <tr>
          <td height="12" colspan="2"></td>
        </tr>
        <tr>
          <td height="1" colspan="2" bgcolor="E5E5E5"></td>
        </tr>
      </table>
      <table width="672" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="15"></td>
        </tr>
        <tr>
          <td id="s_stit"><img src="/images/portal/homepage_renewal/member/s_stitle_09.gif" alt="ȸ������" /></td>
        </tr>
        <tr>
          <td>          </td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" id="join_form">
            <tr>
              <th class="tit_table01">���̵�</th>
              <td class="tit_table02"><b><%=v_userid %></b></td>
            </tr>
            <tr>
              <th>��й�ȣ *</th>
              <td class="table_right"><input name="p_pwd" type="password" class="inp_txt_01" id="p_pwd" size="20"  maxlength="20" style="width:130px; height:20px;" /></td>
            </tr>
            <tr>
              <th>Ż�����</th>
              <td height="110" class="table_right"><textarea name="p_leave_reason" cols="70" rows="10" class="bodyform" id="p_leave_reason" maxlength="100" style="width:505px; height:100px;"></textarea></td>
            </tr>

          </table></td>
        </tr>
        <tr>
          <td height="10">&nbsp;</td>
        </tr>
        <tr>
          <td height="30"><b>&middot; ȸ��Ż�� ��û�Ͻø� �ش� ���̵�� ����� �����ǹǷ� �ش� ���̵�δ� �簡���� �Ұ����մϴ�.</b><br />
            &middot; ȸ��Ż���� ȸ�������� �����Ǹ�, ���� ������ ID�� �ű԰��� ID���� ID �ߺ������� �Խñ� ������ ���Ͽ� �����<br />
&nbsp;&nbsp;ID�� �����ϴ�.<br />
&middot; Ż�� �� �簡���� �����ϸ�, Ż�� �� ���� �� �ı�˴ϴ�.<br />
* ���� : �ѱ���������ī���� ��� TEL. 02-2161-0077</td>
        </tr>
        <tr>
        	<td height="30"></td>
        </tr>
        <tr>
        	<td id="btn"><a href="javascript:doWithdraw();"><img src="/images/portal/homepage_renewal/member/btn_leave.gif" alt="Ż���û" /></a></td>
        </tr>
    </table></td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
			
			<%}else{ %>


        <h2><img src="/images/portal/member/membership/h4_tit.gif" alt="ȸ��Ż��" class="fl_l" /><p class="category">Home &gt; �̿�ȳ� &gt; <strong>ȸ��Ż��</strong></p></h2>

        <p><img src="/images/portal/member/membership/stit_m10.gif"  alt="ȸ��Ż��" /></p>
        <p class="mg_t15"></p>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
           <tr>
             <td bgcolor="#d4d9ee" style="border-top:1px solid #96a5e1;"><table width="100%" border="0" cellspacing="1" cellpadding="0">
               <tr>
                 <td width="125" class="chart001">���̵�</td>
                 <td class="chart002"><strong><%=v_userid %></strong></td>
               </tr>
               <tr>
                 <td width="125" class="chart001">��й�ȣ *</td>
                 <td class="chart002"><input name="p_pwd" type="password" class="inp_txt_01" id="p_pwd" size="20"  maxlength="20"/></td>
               </tr>
               <tr>
                 <td width="125" class="chart001">Ż�����</td>
                 <td class="chart002"><textarea name="p_leave_reason" cols="70" rows="10" class="bodyform" id="p_leave_reason" maxlength="100"></textarea>
                 </td>
               </tr>

             </table></td>
            </tr>
        </table>

         <p class="mg_t15 mg_l15 lh_17">�� <strong>ȸ��Ż�� ��û�Ͻø� �ش� ���̵�� ����� �����ǹǷ� �ش� ���̵�δ� �簡���� �Ұ����մϴ�.</strong><br />
          �� ȸ��Ż���� ȸ�������� �����Ǹ�, ���� ������ ID�� �ű԰��� ID���� ID �ߺ������� �Խñ� ������ ���Ͽ� ����� ID�� �����ϴ�. <br />
          �� Ż���� �簡���� �����ϸ�, Ż�� �� ���� �� �ı�˴ϴ�.<br />
          �� ���� : �ѱ���������ī���� ��� Tel. 02-2161-0077 <br />
         </p>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
            <tr>
             <td height="50" align="center"><a href="javascript:doWithdraw();"><img src="/images/portal/member/membership/btn_out.gif" width="84" height="30" alt="Ż���û"/></a></td>
           </tr>
        </table>
        
        <%} %>
</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->