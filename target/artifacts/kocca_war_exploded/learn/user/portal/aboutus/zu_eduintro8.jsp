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

<form name="form1" method="post">
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
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('7');" class="tab_online<%= box.get("tabid").equals("7") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_06_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('8');" class="tab_online<%= box.get("tabid").equals("8") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_07_on.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('9');" class="tab_online<%= box.get("tabid").equals("9") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_08_off.gif" /></a></span>
			</td>
		  </tr>
		  <tr><td><img src="/images/portal/homepage_renewal/academy/line_tabunder.gif" /></td></tr>
		  <tr><td>
            <div id="tab7" style="padding-top: 20px;">
              <table width="671"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><p><img src="/images/portal/homepage_renewal/academy/cont_tit06.gif" alt="������ε༭����" /></p>
                    <p class="mgt10"><img src="/images/portal/homepage_renewal/academy/cont_stit.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
                    <Br>
                    <Br>
                    <p> ������ε༭������ ����������� �ٽ��帣�� ����� �۷ι� ����� ��ȭ�� ���� â���� ��� ���ε༭ �缺�� ���� ������ۻ���ȸ�� �����Ͽ� ��ϴ� �������α׷��Դϴ�.</p>
                    <br>
                    <br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle04.gif" alt="����" /></p>                    
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;����� : ����� �۷ι� ����� ��ȭ�� ���� â���� ���  ���ε༭ �缺</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;������� : ������ε༭ �о߿� ��ɰ� ���� �ִ� ��, �����а� ����(����)��</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;����� : ������ε༭���� 2�� �� �(���� 20��)</p>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle05.gif" alt="�����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;�۷ι� ���� ����� ��ȭ�� ��ۿ������� �䱸�� �ݿ��� â���� ������� ���ε༭ �缺, ����</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;��������� ��ȹ, ���۰���, ������ �� ������� ȯ�� ��ȭ�� ���� ������  �۷ι� ������ ���� ������ε༭<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����η� �缺</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;��󸶺оߺ� �������� ����Ͽ� �ǹ������� �����ġ �� �ܰ躰 ���Ӱ��� ��</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;������ ��������� ���� ������ۻ� ��Ʈ��ũ �</p>
                    <br>
                    <br>                    
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle06.gif" alt="����" /></p>                    
                    <Br>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;<b>���� ��û/����</b></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ��û��� : �¶��� ��û(<a href="www.dramapd.kr">www.dramapd.kr</a>)</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ���߱��� : �����ɻ� �� �����ɻ縦 ���� ������ �ڰݱ��ؿ� ������ ������ ����</p>
                    <Br>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;<b>�������� �</b></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : ���� �� �ǽ�����, �������� �ǽ����� �� ������ Ŀ��ŧ���� ���� ���� ���� �߽��� ���� �</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �������� : ���� �ǹ�������, �а� ������ ��</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : �ѱ�������ε༭���� ���ǽ�(������ ���̵� KGIT 4��)</p>
                    <Br>
                    <Br>
                    <p  id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle07.gif" alt="�������� ����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;����� : ����� ����(02-2161-0072, <a href="mailto:hskim@kocca.kr">hskim@kocca.kr</a>)<br />
                      <br />
                    </p></td>
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
	<p><img src="/images/portal/common/h4_43.gif" alt="������ε༭����" /></p>
	<p><img src="/images/portal/common/txt_8_3.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_12.gif" alt="�������" /></p>
		<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;����������� �ٽ��帣�� ����� �۷ι� ����� ��ȭ�� ���� â���� ��� ���ε༭ �缺</p>
	<br>
	<br>

	<p><img src="/images/portal/common/stit_13.gif" alt="�������" /></p>
		<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;������� : ������ε༭ �о߿� ��ɰ� ���� �ִ� ��, �����а� ����(����)��</p>
		<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;����� : 10����/��ⱳ�� �</p>

	<table cellspacing="0" summary="��� ���ε༭ ���� ����� ���� �Դϴ�." class="basicTable tableTh01">
		<caption>��� ���ε༭ ���� �����</caption>
		<thead>
			<tr>
				<th class="first" scope="col" width="30%">������</th>
				<th scope="col" >��������</th>
				<th scope="col">�����Ⱓ</th>
				<th scope="col">�����ο�</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row"class="first">��ȹ���ε༭ �缺����</th>
				<td>'11.03~'11.12</td>
				<td>10����</td>
				<td>20��</td>
			</tr>
			<tr>
				<th scope="row" class="first">�������ε༭ �缺����</th>
				<td>'11.03~'11.12</td>
				<td>10����</td>
				<td>20��</td>
			</tr>
		</tbody>
	</table> 

	<Br>
	<Br>
	<p><img src="/images/portal/common/stit_02.gif" alt="�����" /></p>
		<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;��ȹ���ε༭�� �������ε༭�� �и�, �����߽��� ������ ����缺�� ��ǥ�� �</p>
		<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;���� �ǹ� �߽��� ����, ���۽ǽ�, ���Ͻ� ���α׷� �</p>
		<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;������ۻ���ȸ ȸ�������� ��Ʈ���� Ȱ��, �������� ���ε༭���� ���佱�� ���Ͽ� ����</p>
		<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;ǳ���� ���� ����� ���� ������ ������ �������� ���� �������� Ȱ�� ���� ���� ����</p>
		<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;ö���� ���� ������ ���� ���� ȿ�� �� ���� ������ ����</p>
		<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�������� ��������� ��Ʈ�� ������ ���� ��ǰ�� �������� ����</p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_03.gif" alt="����" /></p>
	&nbsp;
		<img src="/images/portal/common/20110727add/b_01_process_01_1.gif" alt="���������䱸����" />
		<img src="/images/portal/common/20110727add/b_01_process_01_2.gif" alt="������������" />
		<img src="/images/portal/common/20110727add/b_01_process_01_3.gif" alt="������û/����(1~2��)" />
		<img src="/images/portal/common/20110727add/b_01_process_01_4.gif" alt="��������(3~11��)" />
		<img src="/images/portal/common/20110727add/b_01_process_01_5.gif" alt="����������(12��)" />
		<img src="/images/portal/common/20110727add/b_01_process_01_6.gif" alt="��� ����" />
	<p>&nbsp;&nbsp;&nbsp;�� ���������� ������ ������ �Ϻ� ���̰� ����</p>
	<Br>

	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;<b>���� ��û/����</b></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ��û��� : �¶��� ��û(<a href="www.dramapd.kr">www.dramapd.kr</a>)</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ���߱��� : �����ɻ� �� �����ɻ縦 ���� ������ �ڰݱ��ؿ� ������ ������ ����</p>
	<Br>

	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;<b>�������� �</b></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : ���� �� �ǽ�����, �������� �ǽ����� �� ������ Ŀ��ŧ���� ���� ���� ���� �߽��� ���� �</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �������� : ���� �ǹ�������, �а� ������ ��</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : �ѱ�������ε༭���� ���ǽ�(������ ��ϵ� KGIT 7��)</p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_05.gif" alt="�������� ����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;����� : �����η¾缺�� �����(02-2161-0072, <a href="mailto:hskim@kocca.kr">hskim@kocca.kr</a>)</p>
	</td>
  </tr>
</table>

<%} %>

</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->


