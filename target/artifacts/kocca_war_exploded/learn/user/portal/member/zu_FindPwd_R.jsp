<%
//**********************************************************
//  1. ��      ��: �н����� ã�� ���
//  2. ���α׷��� : zu_FindPwd_R.jsp
//  3. ��      ��: �н����� ã�� ���
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

    String v_name = box.getString("p_name_2");
   // String v_pwd  = (String)request.getAttribute("pwd");
    String v_tmp_pwd  =  box.getString("tmp_pwd");
    String v_email  = box.getString("v_toEmail");
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--//

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- form ���� -->
<form name="form1"  action="" method="post" >
	<input type="hidden"	name="p_process"	value="" />

    <h2><img src="/images/portal/member/membership/h3_tit.gif" alt="���̵�/�н����� ã��" class="fl_l" /><p class="category">Home &gt; �̿�ȳ� &gt; <strong>���̵�/�н����� ã��</strong></p></h2>

    <p><img src="/images/portal/member/membership/stit_m7.gif"  width="101" height="13" alt="�н����� ã�� ���" /></p>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18 ">
            <tr>
             <td height="129" align="left" valign="top" background="/images/portal/member/membership/box_img_9.gif" style="padding-top:30px;padding-left:270px;background-repeat:no-repeat">
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <% if (v_tmp_pwd.equals("")) {  %>
                       <tr>
                         <td height="45" valign="top" class="lh_17"><strong>�Է��Ͻ� ������ ��ġ�ϴ� �����Ͱ� �����ϴ�.</strong><br />
                         </td>
                       </tr>
                   <% } else {  %>
                       <tr>
                         <td height="60" valign="top" class="lh_17"><strong><%=v_name %></strong> ȸ������ �ӽ� ��й�ȣ�� <strong><%=v_tmp_pwd %></strong> �Դϴ�.<br />
                           �ȳ��� �帰 ��й�ȣ�� &quot;������������&quot; ������ �����Ͽ� �ֽñ� �ٶ��ϴ�.</td>
                       </tr>
                   <% } %>
                       <tr>
                         <td align="left"><a href="javascript:mainmenu('990');"><img src="/images/portal/member/membership/btn_login2.gif" width="85" height="29" alt="�α���"/></a></td>
                      </tr>
             </table></td>
           </tr>
     </table>

</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->