<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	
	String  v_process  = box.getString("p_process");
	
	String s_userid   = box.getSession("userid");
	String s_username = box.getSession("name");
	
	HashMap<String, String> upperMap = null;    // ��з� �� �޴�ID ���� �� HashMap<upperlcass, menuid>
	
	upperMap   = ClassifySubjectBean.getMenuId(box);
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>

<script language="javascript">

	function selectArea( val ) {
		document.form1.tabid.value = val;
		document.form1.p_process.value = "edu";
		document.form1.action = "/servlet/controller.homepage.HomePageAboutUsServlet";
		document.form1.submit();
	}

</script>

<form name="form1" method="post" action="/" >
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "gubun" value = "7">
    <input type = "hidden" name = "menuid">
    <input type = "hidden" name = "tabid" value="<%= box.get("tabid") %>">
    
            	<%if( box.getSession("tem_grcode").equals("N000001")) { %>
	
	<table>
		<tr>
			<td>
			<table width="672" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" colspan="2" class="h_road">&nbsp;</td>
        </tr>
        <tr>
          <td><img src="/images/portal/homepage_renewal//academy/stitle_03.gif" alt="������� �ȳ�" /></td>
          <td class="h_road">Home &gt; ��ī���� �Ұ�  &gt; <strong>������� �ȳ�</strong></td>
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
          <td height="15">
          		<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('1');" class="tab_online<%= box.get("tabid").equals("1") || box.get("tabid").equals("") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_01_off.gif" /></a></span>              	
           		<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('2');" class="tab_online<%= box.get("tabid").equals("2") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_02_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('3');" class="tab_online<%= box.get("tabid").equals("3") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_03_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('5');" class="tab_online<%= box.get("tabid").equals("5") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_04_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('6');" class="tab_online<%= box.get("tabid").equals("6") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_05_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('7');" class="tab_online<%= box.get("tabid").equals("7") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_06_on.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('8');" class="tab_online<%= box.get("tabid").equals("8") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_07_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('9');" class="tab_online<%= box.get("tabid").equals("9") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_08_off.gif" /></a></span>
			</td>
		  </tr>
		  <tr><td><img src="/images/portal/homepage_renewal/academy/line_tabunder.gif" /></td></tr>
		  <tr><td>
            <div id="tab6" style="padding-top: 20px;">
              <table width="671"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><p><img src="/images/portal/homepage_renewal/academy/cont_tit05.gif" alt="��������� ��������" /></p>
                    <p class="mgt10"><img src="/images/portal/homepage_renewal/academy/cont_stit.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
                    <Br>
                    <Br>
                    <p>â������缺����� ��ȭ��������� ������ ���������� ������Ʈ�� �Բ� �����ϸ鼭 ���� �߽��� �ǹ������� ���� ���Ͽ츦 ���� �޵��� ���Ͻ��� �����ϴ� ���α׷�����, ������ â���о߿� Ưȭ�� ����� â������ �� â�Ǽ����� ���� ������ ���ð����� ���� û�����ڸ��� â���ϴ� ����Դϴ�.</p>
                    <Br>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle04.gif" alt="����" /></p>                    
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;��� �� ���� ��� : â���� ������ �Ҿ��� ���� ��������� �� ������ ���� ���</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;������� : �������</p>
                    <Br>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle05.gif" alt="�����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;â�Ǽ�������</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �������о� â�Ǽ������� ��� ������ �б��� ��������÷������������ �����Ͽ� �</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ���� ��� 10�� �̻��� �������� â�Ǽ������� �����䡯�� �߱��� ���� ���� �ǽ�</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �÷������ ���� �� ���� Ȯ�� �� ������ ���� �� ���� �� ������Ʈ ���� ���� (10���� ����)</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� ������ ������ �÷�������� ���� �̷������, ���������� ����� Ȩ�������� ��ī���� Ȩ������ ���� ���� (3~4��)</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ���� ������ ������� ������Ʈ �Ⱓ �� ���Ͻ� ��� ����</p>
                    <br/>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;�¶���Ŀ�´�Ƽ������Ʈ���塯���� �� �����</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- â�Ǽ��������� �����ϴ� ���� �� ������ DB���� �� Ŀ�´�Ƽ ���� ����</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ��������� �̷�,��Ʈ������,������� ȿ���� ���� �� ���� ���� �ǽ� ���� ������� �ý��� ����</p>
                    <Br>
                    <Br>
                    <p  id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle07.gif" alt="�������� ����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;�����η¾缺�� ������ �븮 (02-3219-6537, <a href="mailto:hsji@kocca.kr">hsji@kocca.kr</a>)</p></td>
                </tr>
              </table>
            </div>
            </td>
        </tr>
      </table></td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
			
			<%}else{ %>
    
<% if      ("1".equals(box.get("tabid")) || "".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�"     class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>����������缺����</strong></p></h2><% }
   else if ("2".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�"     class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>����������米��</strong></p></h2><% }
   else if ("3".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�"     class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>�¶��α���</strong></p></h2><% }
   else if ("4".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�" 	  class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>��Ź����</strong></p></h2><% }
   else if ("5".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�"     class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>������������</strong></p></h2><% } 
   else if ("6".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�"     class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>3D��ü�����������η¾缺</strong></p></h2><% }
   else if ("7".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�"     class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>�������������</strong></p></h2><% }
   else if ("8".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�" 	  class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>������ε༭����</strong></p></h2><% }
   else if ("9".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�"     class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>���ӱ�������ڰݰ���</strong></p></h2><% } 
%>
    
    <ul class="tabwrap">
		<li><a href="javascript:selectArea('1');" class="tab_online<%= box.get("tabid").equals("1") || box.get("tabid").equals("") ? " tab_online_on" : "" %>"><span>����������缺����</span></a></li>
		<li><a href="javascript:selectArea('2');" class="tab_online<%= box.get("tabid").equals("2") ? " tab_online_on" : "" %>"><span>����������米��</span></a></li>
		<li><a href="javascript:selectArea('3');" class="tab_online<%= box.get("tabid").equals("3") ? " tab_online_on" : "" %>"><span>�¶��α���</span></a></li>
		<li><a href="javascript:selectArea('4');" class="tab_online<%= box.get("tabid").equals("4") ? " tab_online_on" : "" %>"><span>��Ź����</span></a></li>
		<li><a href="javascript:selectArea('5');" class="tab_online<%= box.get("tabid").equals("5") ? " tab_online_on" : "" %>"><span>������������</span></a></li>
		<li><a href="javascript:selectArea('6');" class="tab_online<%= box.get("tabid").equals("6") ? " tab_online_on" : "" %>"><span>3D��ü�����������η¾缺</span></a></li>
		<li><a href="javascript:selectArea('7');" class="tab_online<%= box.get("tabid").equals("7") ? " tab_online_on" : "" %>"><span>�������������</span></a></li>
		<li><a href="javascript:selectArea('8');" class="tab_online<%= box.get("tabid").equals("8") ? " tab_online_on" : "" %>"><span>������ε༭����</span></a></li>
		<li><a href="javascript:selectArea('9');" class="tab_online<%= box.get("tabid").equals("9") ? " tab_online_on" : "" %>"><span>���ӱ�������ڰݰ���</span></a></li>
	</ul>
	
	<table class="row_list">
        <tbody>
          <tr></tr>
        </tbody>
        <colgroup>
        <col width="100%" />
        </colgroup>
      </table>
<link rel="stylesheet" href="/css/20110727.css" type="text/css">    
<table width="690"  border="0" cellpadding="0" cellspacing="0">
  <tr>
	<td>
		<p><img src="/images/portal/common/h4_42.gif" alt="3D ��ü������ �����η¾缺" /></p>
	<p><img src="/images/portal/common/txt_8_2.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
	<Br>
	<Br>

	<p>��������� ���������� ��ȭ��������� ������ ���������� ������Ʈ�� �Բ� �����ϸ鼭 ���� �߽��� �ǹ������� ���� ���Ͽ츦<br />
	���� �޵��� ���� �޵��� ���Ͻ��� �����ϴ� ���α׷��� ������ ��ȭ��� ������ ���� ��ī���� ������ �ǽ���� �����ϴ�<br />
	���α׷����� ��˴ϴ�.</p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_01.gif" alt="����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;������� : ���ε༭,����,�۰� �� ������ �������� Ȱ��, �ǹ����� �� ������Ʈ ��� ���� �۷ι� ������� ���� �ٽ����縦 �缺��</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;��� �� ������� : ��ȭ��������� ������ �� ���� ��ü</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;������� : �������</p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_10.gif" alt="�������" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;���� ������ ���� ������Ʈ ������ ���� ���� ���Ͻ� ����</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �������� ���� �о� �� ������ ����</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �������� ���� ������ ���� �� ������Ʈ�� ���� ����(10���� ����)</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� ������ ������ �������� ��ü �������� �̷������, �Ϻ� ���� ���� ������ ������ ���� �� ����</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ���� ������ ������� ���Ͻ� ��� ����</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;������ī���� ���� ���� ���� ������ �����η¾缺</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : ���� ��ī����</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : ���� ��ϴ� ���Ӿ�ī���� �� �� ���� ���� �� ���� ���� �ǽ�</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� ���� ������ ������ ���� �� ������ī���̿��� ��ü �ǽ���</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�ؿ������� ��û ��ũ�� �� ���̳� ����</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������ ��� �ؿ� �������� ��û�Ͽ� �۷ι� ���Ͽ� ������ ��ȸ�� ���� ��������� �����ڿ��� ������</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� ���丮, 3D �� ���� ��� �о� �� �ֽ� Ʈ���� ����Ͽ� ��û���� ����</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �������� : ��ũ�� �� ���̳�, ���丵 ���� (1�� �̳�, �� 1~2ȸ)</p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_11.gif" alt="�����������" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;��������� ���� : 4�� ~ 12��</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;������ī���� � : 5�� ~ 12��</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�ؿ������� ��û ��ũ�� �� ���̳� : 9�� ~ 12��</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� ������ ������ �� ����</p>
	<Br>
	<Br>


	<p><img src="/images/portal/common/stit_05.gif" alt="�������� ����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�����η¾缺�� ������ �븮 (02-3219-6537, <a href="mailto:hsji@kocca.kr">hsji@kocca.kr</a>)</p>
	</td>
  </tr>
</table>

<%} %>
<input type="submit" class="close" title="����">
</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->


