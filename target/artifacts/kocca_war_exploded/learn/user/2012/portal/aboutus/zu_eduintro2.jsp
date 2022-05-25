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
           		<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('2');" class="tab_online<%= box.get("tabid").equals("2") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_02_on.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('3');" class="tab_online<%= box.get("tabid").equals("3") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_03_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('5');" class="tab_online<%= box.get("tabid").equals("5") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_04_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('6');" class="tab_online<%= box.get("tabid").equals("6") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_05_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('7');" class="tab_online<%= box.get("tabid").equals("7") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_06_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('8');" class="tab_online<%= box.get("tabid").equals("8") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_07_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('9');" class="tab_online<%= box.get("tabid").equals("9") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_08_off.gif" /></a></span>
			</td>
		  </tr>
		  <tr><td><img src="/images/portal/homepage_renewal/academy/line_tabunder.gif" /></td></tr>
		  <tr><td>
            <div id="tab2" style="padding-top: 20px;">
              <table width="671"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><p><img src="/images/portal/homepage_renewal/academy/cont_tit02.gif" alt="����������米������" /></p>
                    <p class="mgt10"> <img src="/images/portal/homepage_renewal/academy/cont_stit.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
                    <Br>
                    <Br>
                    <p>����� ���� �米�������� ������ ����� �����ڸ� ������� �̵�� ȯ�� ��ȭ�� �´� ���������� â�� ���� �� �۷ι� ����� ��ȭ�� �������� â�۱�� ������ �缺�� ���� ��Ǵ� �������α׷��Դϴ�.</p>
                    <Br>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle04.gif" alt="����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;����� : ������ ����� ���� ����� ���� ���� ���������� ���� ����� â�� ������ ���� ������ ����</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;������� : ������ ����� ������ �о� ������</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;����� : 1-10�� / �ܱ� ���� �</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;��������</p>
                    <table border="0" cellpadding="3" cellspacing="0" id="tab_form2" summary="����� ���� �米�� ���� �� �Ⱓ �� �����Դϴ�.">
                      <colgroup>
                      <col width="15%" />
                      <col width="" />
                      <col width="20%" />
                      <col width="10%" />
                      </colgroup>
                      <thead>
                        <tr>
                          <td class="tit_table">�о�</td>
                          <td class="tit_table">������</td>
                          <td class="tit_table">�����Ⱓ</td>
                          <td class="tit_table">�����ο�</td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th rowspan="12" scope="row">��������<br/>
                          	�ڿ�����<br/>			                         
				                        �߼ұ��<br/>
				                        ���ҽþ�<br/>
				                        ��������<br/>
							(�뵿��)
							</th>
                          <td>Final Cut Pro����</td>
                          <td align="center">'12.01.09~01.13</td>
                          <td align="center">5</td>
                        </tr>
                        <tr>
                          <td>iPhone ���۰���</td>
                          <td align="center">'12.01.09~01.13</td>
                          <td align="center">15</td>
                        </tr>
                        <tr>
                          <td>������ ��ȹ�� �ۼ� ����  ����</td>
                          <td align="center">'12.02.20~2.21</td>
                          <td align="center">15</td>
                        </tr>
                        <tr>
                          <td>����Ͻ� ��ų�� ����</td>
                          <td align="center">'12.02.1~2.2</td>
                          <td align="center">5</td>
                        </tr>
                        <tr>
                          <td>Protools �������</td>
                          <td align="center">'12.02.13~02.17</td>
                          <td align="center">5</td>
                        </tr>
                        <tr>
                          <td>�����й̵�� ��ũ�÷ο� ����</td>
                          <td align="center">'12.03.12~03.14</td>
                          <td align="center">5</td>
                        </tr>
                        <tr>
                          <td>���� ������ ����� ����</td>
                          <td align="center">'12.04.4~04.6</td>
                          <td align="center">10</td>
                        </tr>
                        <tr>
                          <td>��������ȹ(��ȭ,���,����,�ִ�,����)����</td>
                          <td align="center">'12.05.8~05.10</td>
                          <td align="center">10</td>
                        </tr>
                        <tr>
                          <td>Avid MC 101����</td>
                          <td align="center">'12.02.6~2.10</td>
                          <td align="center">5</td>
                        </tr>
                        <tr>
                          <td>Final Cut Pro����</td>
                          <td align="center">'12.02.20~2.24</td>
                          <td align="center">5</td>
                        </tr>
                        <tr>
                          <td>��ǥ��, ���۱�, ���̼���  ��� ��� ����</td>
                          <td align="center">'12.06.11~06.15</td>
                          <td align="center">10</td>
                        </tr>
                        <tr>
                          <td colspan="2" align="center">�� ��</td>
                          <td align="center">90</td>
                        </tr>
                        
                        <tr>
                          <th rowspan="10" scope="row">��ȭ������<br>
                            ��������</th>
                          <td>â���� ������ ����߰��� ���� ���̳�</td>
                          <td align="center">��12.05.16~05.17</td>
                          <td align="center">15</td>
                        </tr>
                        <tr>
                          <td>�ٹ�ȭ ������ ������ ����</td>
                          <td align="center">5�� ��</td>
                          <td align="center">15</td>
                        </tr>
                        <tr>
                          <td>������ť���͸� �������� ���̵�</td>
                          <td align="center">��12.06.19~06.20</td>
                          <td align="center">20</td>
                        </tr>
                        <tr>
                          <td>OSMU�� ���� �� â�۰���</td>
                          <td align="center">��12.09.3~10.12</td>
                          <td align="center">10</td>
                        </tr>
                        <tr>
                          <td>��������, ��ȹ���� �������</td>
                          <td align="center">��12.10.16.~10.17</td>
                          <td align="center">20</td>
                        </tr>
                        <tr>
                          <td>û�ҳ��� ���� â�ǰ��� ���ǹ̵�� ����</td>
                          <td align="center">10�� ��</td>
                          <td align="center">15</td>
                        </tr>
                        <tr>
                          <td colspan="2" align="center">�� ��</td>                          
                          <td align="center">95</td>
                        </tr>                        
                      </tbody>
                    </table>
                    <p class="mgt10">�� �������� ������ �� ������ ��������� �������� ���� �ѱ���������ī����(<a href="http://edu.kocca.or.kr" target="_blank">http://edu.kocca.or.kr</a>)�� �����Ͻñ� �ٶ��ϴ�.</p>
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
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;<b>���� ��û/����</b></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ��û��� : �¶��� ��û / <a href="http://edu.kocca.or.kr">http://edu.kocca.or.kr</a></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ���߱��� : �� ������ �����ڰ� ���� ���ռ� ����, ������û ������, �Ҽӱ���� �ο� �ȹ� ��</p>
                    <Br>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;<b>�������� �</b></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : ���� �� �ǽ�����, �������� �ǽ����� �� ������ Ŀ��ŧ���� ���� ���� ���� �߽��� ���� �</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �������� : ���� �ǹ�������, �а� ������ ��</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �����ý��� �� ��� : ���� �ְ��� ���� ��� Ȱ���� ������ ���� �ǹ� �߽��� ���� �</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : �ѱ���������ī���� ���ǽ�(�� ���ȸ�� ����)</p>
                    <Br>
                    <Br>
                    <p  id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle07.gif" alt="�������� ����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;��ۿ���о� : Ȳ���� �븮 (02-3219-6540,<a href="mailto:dew1777@kocca.kr">dew1777@kocca.kr</a>)</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;�������ۺо� : �ڽ��� ���� (02-3219-6527,<a href="mailto:jun@kocca.kr">jun@kocca.kr</a>)</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;��ȹâ�ۺо� : ���� ���� (02-3219-6532,<a href="mailto:kkarisw@kocca.kr">kkarisw@kocca.kr</a>)<br />
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
    
<table width="690"  border="0" cellpadding="0" cellspacing="0">
  <tr>
	<td>

	<p><img src="/images/portal/common/h4_46.gif" alt="����������米������" /></p>
	<p><img src="/images/portal/common/txt_8_6.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
	<Br>
	<Br>

	<p>����� ���� �米�������� ������ ����� �����ڸ� ������� �̵�� ȯ�� ��ȭ�� �´� ���������� â�� ���� �� �۷ι� ����� ��ȭ��
	�������� 3D��ü, CG, ����, HD ���� �о� ���� â�۱�� ������ �缺�� ���� ��Ǵ� �������α׷��Դϴ�.</p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_01.gif" alt="����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;����� : ������ ����� ���� ����� ���� ���� ���������� ���� ����� â�� ������ ���� ������ ����</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;������� : ������ ����� ������ �о� ������</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;����� : 1-10�� / �ܱ� ���� �</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;��������</p>


	<table cellspacing="0" summary="����� ���� �米�� ���� �� �Ⱓ �� �����Դϴ�." class="basicTable tableTh01">
		<caption>����� ���� �米�� ���� �� �Ⱓ</caption>
		<thead>
			<tr>
				<th>�о�</th>
				<th width="40%">������</th>
				<th>�����Ⱓ</th>
				<th>�����ο�</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th scope="row" >�հ�</th>
				<td>30�� ����</td>
				<td>&nbsp;</td>
				<td>500��</td>
			</tr>
		</tfoot>
		<tbody>
			<tr>
				<th scope="row" rowspan="23">�߼ұ��<br>���ҽþ�<br>��������</th>
				<td class="alignL">iPhone ���� ����</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">�ȵ���̵� ���� ����</td>
				<td>3��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">UDK ��ũ��Ʈ ����</td>
				<td>2��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">SNG���ۻ�� ��ũ��</td>
				<td>1��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">����Ʈ�� ������� ���̳�</td>
				<td>1��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">�̵����(GFX)��ȭ ��ũ��</td>
				<td>1��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">������ �о� ���� ����(PD) ������ ����</td>
				<td>2��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">���� ���� Risk Mangement ����</td>
				<td>3��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">��ȹ�ڸ� ���� Lua ����</td>
				<td>2��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">���� ������ ����� ����</td>
				<td>3��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">��ǥ��, ���۱�, ���̼��� ��� ��� ����</td>
				<td>2��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">��������ȹ(��ȭ,���,����,�ִ�,����) ����</td>
				<td>3��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">���丮�ڸ� ����߱��� ���� ����</td>
				<td>2��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">������ ��ȹ�� �ۼ� ���� ����</td>
				<td>2��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">�ؿܸ����� ��ʺм� ����</td>
				<td>3��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">����Ͻ� ��ų�� ����</td>
				<td>2��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">HD Ư���Կ� ����</td>
				<td>3��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">�����й���������÷��ʰ���</td>
				<td>3��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">�����й̵�� ��ũ�÷ο� ����</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">Avid MC 101����</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">Avid MC 201����</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">Final Cut Pro����</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">Protools ���� ����</td>
				<td>5��</td>
				<td>5��</td>
			</tr>
			<tr>
				<th scope="row" rowspan="10">��ȭ������<br>��������</th>
				<td class="alignL">��ȭ�������������(OSMU) ����</td>
				<td>3��</td>
			    <td>30��</td>
			</tr>
			<tr>
				<td class="alignL">��ۺо� �������� ����</td>
				<td>2��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">â�������(����,��ȭ,����,����) ����</td>
				<td>2��</td>
				<td>30��</td>
			</tr>
			<tr>
				<td class="alignL">SNS - �̵��, ������ ���⼺ ���� ����</td>
				<td>2��</td>
				<td>20��</td>
			</tr>
			<tr>
				<td class="alignL">���Ӻо� ������ ���� ����</td>
				<td>3��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">���ƿ� ���� ������ ��ȹ ����</td>
				<td>2��</td>
				<td>20��</td>
			</tr>
			<tr>
				<td class="alignL">(���ڴ��)��ȭ������ ���� ����</td>
				<td>3��</td>
				<td>20��</td>
			</tr>
			<tr>
				<td class="alignL">���� �Ŵ�����Ʈ ����</td>
				<td>2��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">��ȭ�������о� ������ ���� ����</td>
				<td>3��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">���Ӻо� �������� ����</td>
				<td>2��</td>
				<td>20��</td>
			</tr>
		</tbody>
	</table>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� �������� ������ �� ������ ��������� �������� ���� �ѱ���������ī����(<a href="http://edu.kocca.or.kr" target="_blank">edu.kocca.or.kr</a>)�� �����Ͻñ� �ٶ��ϴ�.</p>

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

	<p><img src="/images/portal/common/stit_03.gif" alt="����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;<b>���� ��û/����</b></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ��û��� : �¶��� ��û / <a href="http://edu.kocca.or.kr">http://edu.kocca.or.kr</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ���߱��� : �� ������ �����ڰ� ���� ���ռ� ����, ������û ������, �Ҽӱ���� �ο� �ȹ� ��</p>
	<Br>

	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;<b>�������� �</b></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : ���� �� �ǽ�����, �������� �ǽ����� �� ������ Ŀ��ŧ���� ���� ���� ���� �߽��� ���� �</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �������� : ���� �ǹ�������, �а� ������ ��</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �����ý��� �� ��� : ���� �ְ��� ���� ��� Ȱ���� ������ ���� �ǹ� �߽��� ���� �</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : �ѱ���������ī���� ���ǽ�(�� ���ȸ�� ����)</p>
	<Br>
	<Br>


	<p><img src="/images/portal/common/stit_05.gif" alt="�������� ����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;��ۿ���о� : �����η¾缺�� Ȳ���� �븮 (02-3219-6540, <a href="mailto:dew1777@kocca.kr">dew1777@kocca.kr</a>)</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�������ۺо� : �����η¾缺�� ����� ���� (02-3219-6532, <a href="mailto:newtype@kocca.kr">newtype@kocca.kr</a>)</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;��ȹâ�ۺо� : �����η¾缺�� ��ȭ�� ���� (02-3219-6531, <a href="mailto:hbshin@kocca.kr">hbshin@kocca.kr</a>)</p>

		
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


