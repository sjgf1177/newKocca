<%
//**********************************************************
//  1. ��      ��: ID ã�� ���
//  2. ���α׷��� : zu_FindId_R.jsp
//  3. ��      ��: ID ã�� ���
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.*" %>


<%@page import="java.util.List"%><jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String v_name   = box.getString("p_name");
    List<DataBox> useridlist = (List<DataBox>)request.getAttribute("userid");
    int listsize = useridlist.size();
    String v_userid = "";
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
        <td><img src="/images/portal/homepage_renewal/member/stitle_02.gif" alt="���̵�/�н����� ã��" /></td>
        <td class="h_road">Home &gt; �̿�ȳ�  &gt; <strong>���̵�/�н����� ã��</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->

      <table width="672" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="15"></td>
        </tr>
        <tr>
          <td>
                 
          </td>
        </tr>
      </table>
      
     
      <table width="100%" border="0" cellspacing="0" cellpadding="0" id="results_id">
        <tr>
          <td align="right" valign="bottom"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" align="left"><span class="blue_txt"><b><%=v_name %></b></span> ȸ������ ���̵�� <span class="blue_txt">
              <%for(int i = 0 ; i < listsize ; i ++){
            	  DataBox dbox = (DataBox)useridlist.get(i);
              	v_userid = dbox.getString("d_userid");
              %>              
              [<b><%=v_userid %></b>]
              <%} %>
              </span>�Դϴ�.<br />
                ��й�ȣ�� �𸣽� ��� ��й�ȣ ã�⸦ �̿��Ͽ� �ֽñ� �ٶ��ϴ�.</td>
            </tr>
          </table></td>
        </tr>
      </table>
      <br /><div id="btn"><a href="javascript:mainmenu('990');"><img src="/images/portal/homepage_renewal/member/btn_login01.gif" alt="�α���" /></a></div></td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
	      	
	      	<%}else{ %>

    <h2><img src="/images/portal/member/membership/h3_tit.gif" alt="���̵�/�н����� ã��" class="fl_l" /><p class="category">Home &gt; �̿�ȳ� &gt; <strong>���̵�/�н����� ã��</strong></p></h2>

    <p><img src="/images/portal/member/membership/stit_m6.gif"  width="101" height="13" alt="���̵� ã�� ���" /></p>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mg_t18 ">
            <tr>
             <td height="129" align="left" valign="top" background="/images/portal/member/membership/box_img_7.gif" style="padding-top:35px;padding-left:270px;background-repeat:no-repeat">
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <% if (v_userid.equals("")) {  %>
                       <tr>
                         <td height="45" valign="top" class="lh_17"><strong>�Է��Ͻ� ������ ��ġ�ϴ� ���̵� �����ϴ�.</strong><br />
                         <strong>�̸��̳� �ֹε�Ϲ�ȣ�� Ȯ���Ͽ� �ֽʽÿ�.</strong></td>
                       </tr>
                   <% } else {  %>
                        <tr>
                         <td height="45" valign="top" class="lh_17"><strong><%=v_name %></strong> ȸ������ ���̵��  <strong><%=v_userid %></strong> �Դϴ�.<br />
                           ��й�ȣ�� �𸣽� ��� &quot;��й�ȣ ã��&quot;�� �̿��Ͽ� �ֽñ� �ٶ��ϴ�.</td>
                       </tr>
                   <% } %>
                       <tr>
                         <td align="left"><a href="javascript:mainmenu('990');"><img src="/images/portal/member/membership/btn_login2.gif" width="85" height="29" alt="�α���"/></a></td>
                      </tr>                   
             </table></td>
           </tr>
     </table>
		<%} %>
</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->