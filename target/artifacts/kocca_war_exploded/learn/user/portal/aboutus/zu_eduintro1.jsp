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
<html>
<head>

<link rel="stylesheet" href="/css/admin_style_eudintro.css" type="text/css">
<script language="javascript">

	function selectArea( val ) {
		document.form1.tabid.value = val;
		document.form1.p_process.value = "edu";
		document.form1.action = "/servlet/controller.homepage.HomePageAboutUsServlet";
		document.form1.submit();
	}

</script>
</head>
<body>
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
          <table width="672" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td>
          		<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('1');" class="tab_online<%= box.get("tabid").equals("1") || box.get("tabid").equals("") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_01_on.gif" /></a></span>              	
           		<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('2');" class="tab_online<%= box.get("tabid").equals("2") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_02_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('3');" class="tab_online<%= box.get("tabid").equals("3") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_03_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('5');" class="tab_online<%= box.get("tabid").equals("5") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_04_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('6');" class="tab_online<%= box.get("tabid").equals("6") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_05_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('7');" class="tab_online<%= box.get("tabid").equals("7") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_06_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('8');" class="tab_online<%= box.get("tabid").equals("8") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_07_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('9');" class="tab_online<%= box.get("tabid").equals("9") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_08_off.gif" /></a></span>
			</td>
		  </tr>
          <tr><td><img src="/images/portal/homepage_renewal/academy/line_tabunder.gif" /></td></tr>
              <tr>
              <td>
              <div id="tab1" style="padding-top: 20px;">
              <table width="671"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><p><img src="/images/portal/homepage_renewal/academy/cont_tit01.gif" alt="�������ٽ��η¾缺" /></p>
                    <p class="mgt10"><img src="/images/portal/homepage_renewal/academy/cont_stit.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
                    <Br>
                    <Br>
                    <p>������ �ٽ� �η¾缺 ���������� ��������� ������� �̵�� ȯ�� ��ȭ�� �´� ���������� â�� ������ �۷ι� ����� ��ȭ�� �������� ��ۿ���, ����, ��ȹâ�� ���� â�۱�� ������ �缺�� ���� ��Ǵ� �������α׷��Դϴ�.</p>
                    <Br>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle04.gif" alt="����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;����� : ������ ����� ���� ����� ���� ���� ���������� ���� ����� �� â�� ������ ���� ������ ����</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;������� : ������ �о߿� ��ɰ� ���� �ִ� ��, �����а� ����(����)��, ���úо� �����</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;����� : 6~10���� / ��ⱳ�� �</p>
                    <table width="100%" border="0" cellpadding="3" cellspacing="0" id="tab_form" summary="������ �ٽ� �η¾缺 ����� �������� �� �Ⱓ �� �����Դϴ�." >
                      <colgroup>
                      <col width="20%" />
                      <col width="" />
                      <col width="25%" />
                      <col width="10%" />
                      <col width="10%" />
                      </colgroup>
                      <thead>
                        <tr>
                          <td class="tit_table">�о�</td>
                          <td class="tit_table">������</td>
                          <td class="tit_table">��������</td>
                          <td class="tit_table">�����Ⱓ</td>
                          <td class="tit_table">�����ο�</td>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr>
                          <th scope="row" >�� �� ��</th>
                          <td colspan="3">&nbsp;</td>
                          <td>170</td>
                        </tr>
                      </tfoot>
                      <tbody>
                        <tr>
                          <th scope="row" rowspan="5">���.����</th>
                          <td>VFX (Ư������)</td>
                          <td>''12.3~11</td>
                          <td>9����</td>
                          <td>15</td>
                        </tr>
                        <tr>
                          <td>��� �׷���</td>
                          <td>''12.3~11</td>
                          <td>9����</td>
                          <td>15</td>
                        </tr>
                        <tr>
                          <td>������ ��������</td>
                          <td>''12.3~9/9~12</td>
                          <td>6/4����</td>
                          <td>30</td>
                        </tr>
                        <tr>
                          <td>������ ��������</td>
                          <td>''12.3~9</td>
                          <td>6����</td>
                          <td>10</td>
                        </tr>
                        <tr>
                          <td colspan="3">�� ��</td>
                          <td>70</td>
                        </tr>
                        <tr>
                          <th scope="row"  rowspan="5">����</th>
                          <td>���ӵ�����(��ȹ)</td>
                          <td>''12.3~12</td>
                          <td>10����</td>
                          <td>15</td>
                        </tr>
                        <tr>
                          <td>�������α׷�</td>
                          <td>''12.3~12</td>
                          <td>10����</td>
                          <td>13</td>
                        </tr>
                        <tr>
                          <td>���ӱ׷���</td>
                          <td>''12.3~12</td>
                          <td>10����</td>
                          <td>18</td>
                        </tr>
						<tr>
                          <td>���� ������Ʈ</td>
                          <td>''12.3~12</td>
                          <td>10����</td>
                          <td>19</td>
                        </tr>
                        <tr>
                          <td colspan="3">�� ��</td>
                          <td>65</td>
                        </tr>   
                        <tr>
                          <th scope="row"  rowspan="1">��ȹ.â��</th>
                          <td>������ ��ȹâ��</td>
                          <td>''12.3~12</td>
                          <td>10����</td>
                          <td>20</td>
                        </tr>
                        <tr>
                          <th scope="row"  rowspan="1">����Ͻ�</th>
                          <td>���������� ����Ͻ�</td>
                          <td>''12.3~11</td>
                          <td>9����</td>
                          <td>15</td>
                        </tr>                          
                        <tr>
                          <th scope="row"  rowspan="1">&nbsp;</th>
                          <td colspan="3">�� ��</td>
                          <td>35</td>
                        </tr>                   
                      </tbody>
                    </table>
                    <Br>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle05.gif" alt="�����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;���� �ְ��� ���������� Ȱ���� ������ ���� ���� ���� ���� ����</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;�оߺ� �����䱸�� ����, Ʈ���� �м��� ���� ������ ���� ���� �߽��� �������� �</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;�������� ��������� ��Ʈ�� ������ ���� ��ǰ�� �������� ����</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;ǳ���� ���� ����� ���� ������ ������ �������� ���� �������� Ȱ�� ���� ���� ����</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;ö���� ���� ������ ���� ���� ȿ�� �� ���� ������ ����</p>
                    <Br>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle06.gif" alt="����" /></p>
                    <img src="/images/portal/homepage_renewal/academy/b_01_process_01_1.gif" alt="���������䱸����" /><img src="/images/portal/homepage_renewal/academy/b_01_process_01_2.gif" alt="������������" /> <img src="/images/portal/homepage_renewal/academy/b_01_process_01_3.gif" alt="������û/����(1~2��)" /> <img src="/images/portal/homepage_renewal/academy/b_01_process_01_4.gif" alt="��������(3~11��)" /> <img src="/images/portal/homepage_renewal/academy/b_01_process_01_5.gif" alt="����������(12��)" /> <img src="/images/portal/homepage_renewal/academy/b_01_process_01_6.gif" alt="��� ����" />
                    <p>&nbsp;&nbsp;&nbsp;�� ���������� ������ ������ �Ϻ� ���̰� �ֽ��ϴ�.</p>
                    <Br>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;<b>���� ��û/����</b></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ��û��� : �¶��� ��û / <a href="http://edu.kocca.or.kr">http://edu.kocca.or.kr</a></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ���߱��� : �����ɻ� �� �����ɻ縦 ���� ������ �ڰݱ��ؿ� ������ ������ ����</p>
                    <Br>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;<b>�������� �</b></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : ���� �� �ǽ�����, �������� �ǽ����� �� ������ Ŀ��ŧ���� ���� ���� ���� �߽��� ���� �</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �������� : ���� �ǹ�������, �а� ������ ��</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �����ý��� �� ��� : ���� �ְ��� ���� ��� Ȱ���� ������ ���� �ǹ� �߽��� ���� �</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : �ѱ���������ī���� ���ǽ�(�� ���ȸ�� ����)</p>
                    <Br>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;<b>���� Ư��</b></p>
                    <table width="100%" border="0" cellpadding="3" cellspacing="0" id="tab_form2" summary="������ �ٽ� �η¾缺 ���� Ư�� �����Դϴ�." >
                      <colgroup>
                      <col width="20%" />
                      <col width="" />
                      </colgroup>
                      <tr>
                        <th>������</th>
                        <th>����</th>
                      </tr>
                      <tr>
                        <td>����</td>
                        <td><p>&nbsp;- �� 316,000�� ���б� ����(����Ͻ� ���� ����)</p>
                          <p>&nbsp;- �ѱ������������ �������α׷� �켱 ���� ��ȸ ����</p>
                          <p>&nbsp;&nbsp;&nbsp;&nbsp;�� ���̹���������ī����, �������� �������� ��</p>
                          <p>&nbsp;- ���� ���۷��� �� ����ȸ ���� ����</p></td>
                      </tr>
                      <tr>
                        <td>��ȹ��â��</td>
                        <td><p>&nbsp;- ������Ʈ �ϼ�ȭ�� ���� ���� ����, ������Ȱ�� ��ȸ Ȯ�� ����</p></td>
                      </tr>
                      <tr>
                        <td>���������� ����Ͻ�</td>
                        <td><p>&nbsp;- ���� �� ����ڿ��� ���úо� ����, ���Ͻ� ��ȸ ����</p></td>
                      </tr>
                    </table>
                    <Br>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle07.gif" alt="�������� ����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;��ۿ���о� : ����� ���� (02-2161-0072, <a href="mailto:hskim@kocca.kr">hskim@kocca.kr</a>)</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;�������ۺо� : �ּ�ȣ ���� (02-3219-6534, <a href="mailto:thinkju@kocca.kr">thinkju@kocca.kr</a>)</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;��ȹâ�ۺо� : ������ ���� (02-3219-6536, <a href="mailto:inami@kocca.kr">inami@kocca.kr</a>)<br />
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;����Ͻ��о� : �ڰ��� ���� (02-3219-6541, <a href="mailto:pke329@kocca.kr">pke329@kocca.kr</a>)<br />
                      <br />
                    </p></td>
                </tr>
              </table>
            </div></td></table>
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
		<li><a href="javascript:selectArea('5');" class="tab_online<%= box.get("tabid").equals("5") ? " tab_online_on" : "" %>"><span>������������</span></a></li><br>
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
    
<table width="690"  border="0" cellpadding="0" cellspacing="0">
  <tr>
	<td>
		<p><img src="/images/portal/common/h4_45.gif" alt="�������ٽ��η¾缺" /></p>
	<p><img src="/images/portal/common/txt_8_5.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
	<Br>
	<Br>

	<p>������ �ٽ� �η¾缺 ���������� ��������� ������� �̵�� ȯ�� ��ȭ�� �´� ���������� â�� ������ �۷ι� ����� ��ȭ�� ��������
	��ۿ���, ����, ��ȹâ�� ���� â�۱�� ������ �缺�� ���� ��Ǵ� �������α׷��Դϴ�.</p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_01.gif" alt="����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;����� : ������ ����� ���� ����� ���� ���� ���������� ���� ����� �� â�� ������ ���� ������ ����</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;������� : ������ �о߿� ��ɰ� ���� �ִ� ��, �����а� ����(����)��, ���úо� �����</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;����� : 5~11���� / ��ⱳ�� �</p>


	<table cellspacing="0" summary="������ �ٽ� �η¾缺 ����� �������� �� �Ⱓ �� �����Դϴ�." class="basicTable tableTh01">
		<caption>������ �ٽ� �η¾缺 ����� �������� �� �Ⱓ</caption>
		<thead>
			<tr>
				<th>�о�</th>
				<th width="30%">������</th>
				<th>��������</th>
				<th>�����Ⱓ</th>
				<th>�����ο�</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th scope="row" >�հ�</th>
				<td>13�� ����</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>195��</td>
			</tr>
		</tfoot>
		<tbody>
			<tr>
				<th scope="row" rowspan="5">��ۡ�����</th>
				<td class="alignL">VFX �𵨸����ִϸ��̼�</td>
				<td>'11.03~'11.12</td>
				<td>10����</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">VFX �ռ� ������</td>
				<td>'11.03~'11.12</td>
				<td>10����</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">��� �׷���</td>
				<td>'11.03~'11.11</td>
				<td>9����</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">������ ��������</td>
				<td>'11.05~'11.09</td>
				<td>5����</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">C4D for Motiongrapher </td>
				<td>'11.05~'11.09</td>
				<td>5����</td>
				<td>15��</td>
			</tr>	
			<tr>
				<th scope="row"  rowspan="5">��������</th>
				<td class="alignL">����  ������(��ȹ)</td>
				<td>'11.03~'12.01</td>
				<td>11����</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">���� ���α׷�</td>
				<td>'11.03~'12.01</td>
				<td>11����</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">���� �׷���</td>
				<td>'11.03~'12.01</td>
				<td>11����</td>
				<td>10��</td>
			</tr>
            <tr>
				<td class="alignL">����Ʈ�� ����</td>
				<td>'11.03~'12.01</td>
				<td>11����</td>
				<td>10��</td>
			</tr>
            <tr>
				<td class="alignL">���� ������Ʈ</td>
				<td>'11.03~'12.01</td>
				<td>11����</td>
				<td>40��</td>
			</tr>
			<tr>
				<th scope="row"  rowspan="3">��ȹâ��/����Ͻ�</th>
				<td class="alignL">������  ��ȹâ��</td>
				<td>'11.03~'12.01</td>
				<td>11����</td>
				<td>20��</td>
			</tr>
            <tr>
				<td class="alignL">������ ������Ʈ</td>
				<td>'11.03~'11.09</td>
				<td>6����</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">���� ������ ����Ͻ�</td>
				<td>'11.03~'11.09</td>
				<td>6����</td>
				<td>15��</td>
			</tr>
		</tbody>
	</table>

	<Br>
	<Br>
	<p><img src="/images/portal/common/stit_02.gif" alt="�����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;���� �ְ��� ���������� Ȱ���� ������ ���� ���� ���� ���� ����</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�оߺ� �����䱸�� ����, Ʈ���� �м��� ���� ������ ���� ���� �߽��� �������� �</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�������� ��������� ��Ʈ�� ������ ���� ��ǰ�� �������� ����</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;ǳ���� ���� ����� ���� ������ ������ �������� ���� �������� Ȱ�� ���� ���� ����</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;ö���� ���� ������ ���� ���� ȿ�� �� ���� ������ ����</p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_03.gif" alt="�����" /></p>
	&nbsp;
		<img src="/images/portal/common/20110727add/b_01_process_01_1.gif" alt="���������䱸����" />
		<img src="/images/portal/common/20110727add/b_01_process_01_2.gif" alt="������������" />
		<img src="/images/portal/common/20110727add/b_01_process_01_3.gif" alt="������û/����(1~2��)" />
		<img src="/images/portal/common/20110727add/b_01_process_01_4.gif" alt="��������(3~11��)" />
		<img src="/images/portal/common/20110727add/b_01_process_01_5.gif" alt="����������(12��)" />
		<img src="/images/portal/common/20110727add/b_01_process_01_6.gif" alt="��� ����" />
	<p>&nbsp;&nbsp;&nbsp;�� ���������� ������ ������ �Ϻ� ���̰� �ֽ��ϴ�.</p>
	<Br>

	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;<b>���� ��û/����</b></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ��û��� : �¶��� ��û / <a href="http://edu.kocca.or.kr">http://edu.kocca.or.kr</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ���߱��� : �����ɻ� �� �����ɻ縦 ���� ������ �ڰݱ��ؿ� ������ ������ ����</p>
	<Br>

	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;<b>�������� �</b></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : ���� �� �ǽ�����, �������� �ǽ����� �� ������ Ŀ��ŧ���� ���� ���� ���� �߽��� ���� �</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �������� : ���� �ǹ�������, �а� ������ ��</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �����ý��� �� ��� : ���� �ְ��� ���� ��� Ȱ���� ������ ���� �ǹ� �߽��� ���� �</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : �ѱ���������ī���� ���ǽ�(�� ���ȸ�� ����)</p>
	<Br>

	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;<b>���� Ư��</b></p>
	<table cellspacing="0" summary="������ �ٽ� �η¾缺 ���� Ư�� �����Դϴ�." class="basicTable tableTh01" >
		<caption>������ �ٽ� �η¾缺 ���� Ư��</caption>
		<thead>
			<tr>
				<th width="25%">������</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>����</td>
				<td class="alignL">
					<p>&nbsp;- �� 316,000�� ���б� ����</p>
					<p>&nbsp;- �ѱ������������ �������α׷� �켱 ���� ��ȸ ����</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;�� ���̹���������ī����, �������� �������� ��</p>
					<p>&nbsp;- ���� ���۷��� �� ����ȸ ���� ����</p>
				</td>
			</tr>
			<tr>
				<td>��ȹ��â��</td>
				<td class="alignL">
					<p>&nbsp;- ������Ʈ �ϼ�ȭ�� ���� ���� ����, ������Ȱ�� ��ȸ Ȯ�� ����</p>
				</td>
			</tr>
			<tr>
				<td>���������� ����Ͻ�</td>
				<td class="alignL">
					<p>&nbsp;- ���� �� ����ڿ��� ���úо� ����, ���Ͻ�, ��ȯ�л� ��ȸ ����</p>
				</td>
			</tr>
		</tbody>
	</table>
	<Br>
	<Br>


	<p><img src="/images/portal/common/stit_05.gif" alt="�������� ����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;��ۿ���о� : �����η¾缺�� ����� ���� (02-2161-0072, <a href="mailto:hskim@kocca.kr">hskim@kocca.kr</a>)</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�������ۺо� : �����η¾缺�� �ּ�ȣ ���� (02-2161-0078, <a href="mailto:thinkju@kocca.kr">thinkju@kocca.kr</a>)</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;��ȹâ��/�����Ͻ��о� : �����η¾缺�� ������ ���� (02-3219-6536, <a href="mailto:inami@kocca.kr">inami@kocca.kr</a>)</p>
	</td>
  </tr>
</table>

<%} %>

</form>
</body>
</html>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->


