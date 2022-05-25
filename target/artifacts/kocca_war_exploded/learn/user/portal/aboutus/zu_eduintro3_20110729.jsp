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
    
<% if      ("1".equals(box.get("tabid")) || "".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�"     class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>����������缺����</strong></p></h2><% }
   else if ("2".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�"     class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>����������米��</strong></p></h2><% }
   else if ("3".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�"     class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>�¶��α���</strong></p></h2><% }
   else if ("4".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�" 	  class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>��Ź����</strong></p></h2><% }
   else if ("5".equals(box.get("tabid"))) { %> <h2><img src="/images/portal/online/h2_tit7.gif" alt="��������ȳ�"     class="fl_l" /><p class="category">Home &gt; ��ī���̼Ұ� &gt; <strong>������������</strong></p></h2><% } 
%>
    
    <ul class="tabwrap">
		<li><a href="javascript:selectArea('1');" class="tab_online<%= box.get("tabid").equals("1") || box.get("tabid").equals("") ? " tab_online_on" : "" %>"><span>����������缺����</span></a></li>
		<li><a href="javascript:selectArea('2');" class="tab_online<%= box.get("tabid").equals("2") ? " tab_online_on" : "" %>"><span>����������米��</span></a></li>
		<li><a href="javascript:selectArea('3');" class="tab_online<%= box.get("tabid").equals("3") ? " tab_online_on" : "" %>"><span>�¶��α���</span></a></li>
		<li><a href="javascript:selectArea('4');" class="tab_online<%= box.get("tabid").equals("4") ? " tab_online_on" : "" %>"><span>��Ź����</span></a></li>
		<li><a href="javascript:selectArea('5');" class="tab_online<%= box.get("tabid").equals("5") ? " tab_online_on" : "" %>"><span>������������</span></a></li>
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
    <td height="20">&nbsp;</td>
  </tr>
  <tr>
    <td>�¶��α��������� ����������Ǳ��� ����� ���� �� �������� ���� �پ��� ������ȸ ������ �������� ��ۿ���/����/��ȭ������ ��ȹ, ����, �濵, ����Ͻ� �о� ���� ���� �������� �����Ͽ� ���̹���������ī���̸� ���� ��Ǵ� �������α׷��Դϴ�.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><img src="/images/portal/common/stit_01.gif" alt="����" class="tit" /></td>
  </tr>
  <tr>
    <td class="pd_l15">- ����� <br />
      &nbsp;&nbsp;&bull; ������ ����� ���� ����� ���� ���� ���, ���� â������ �缺 <br />
      &nbsp;&nbsp;&bull; �������� ���� �پ��� ���� ��ȸ�� ���� �� ���� Ȯ�� <br /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15">- ������� <br />
&nbsp;&nbsp;&bull;  ������ ��� ������, �����������а� �л�, �����õ�����û �Ҽ� ��,�ߵ� ���� �� �Ϲ��� �� </td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15">- ����� <br />
&nbsp;&nbsp;&bull;  ������ �ſ� <br />
&nbsp;&nbsp;&bull; ���ݱ��������� ����/ �ڰ���������/���п��� �������°���/��å���Ͱ��� �� �پ��� ������ �������� ������ ���� <br />
&nbsp;&nbsp;&nbsp;      ���� ��ȸ Ȯ�� <br />
&nbsp;&nbsp;&bull; ���� ������ ������� �� �̵����о��� ���ܱ��������� ��� ���� ������� �������� �������� � <br />
&nbsp;&nbsp;&nbsp;      (�������б���� �ΰ���ȣ �� 04-02ȣ) <br />
&nbsp;&nbsp;&bull; ���п��� ���� ���� �������� �� �����ڷ� ���񽺵� �а��������� <br />
&nbsp;&nbsp;&bull; �̵�����ȸ ���� �̵�������缺���� � <br />
&nbsp;&nbsp;&bull; �����, CEO, �ùδ�ü ȸ����� ��å���Ͱ��� � <br />
&nbsp;&nbsp;&bull; �����信 ������ ������ ��Ź���� �</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><img src="/images/portal/common/stit_02.gif" alt="����" class="tit" /></td>
  </tr>
  <tr>
    <td class="pd_l15">- ����, ����, �ð��� ���־��� ������ ����������� �¶��� ������ ���� ������ȸ Ȯ�� <br />
      - ���� �ǹ��߽��� ����� �������� ����� �� ����â�� �� ����ȿ�� �ش�ȭ <br />
      - �ҿܰ����� ����δ������ ��������� ������μ� ���ͼ� Ȯ�� <br />
      - �оߺ� �����䱸�� ����, �̵�� Ʈ���� �м��� ���� ���� ���� �߽��� �������� � <br />
      - ǳ���� ���� ����� ���� ������ ������ �������� ���� �������� Ȱ�� ���� ���� ���� <br />
      - ���� �¶���Ʃ�͸� Ȱ���� 1:1 ����� �н����� � <br />
    - ö���� ���� ������ ���� ���� ȿ�� �� ���� ������ ����&nbsp;&nbsp;<br /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><img src="/images/portal/common/stit_03.gif" alt="����" class="tit" /></td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong>���� ��û/����</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- ��û��� : �¶��� ��û / http://edu.kocca.or.kr <br />
    - ���߱��� : ������û ������ </td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong>�������� � </strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- ������� : ���ͳ��� ���� ������ ���� �� �̷� ���� �� ������ Ŀ��ŧ���� ���� ���� �߽��� ���� �&nbsp; <br />
      - �������� : ������ ��� �о� ������, �а�������&nbsp; <br />
      - �����ý��� �� ��� : �н��ں� ���� PC���� �¶��� �н� <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��, �̵�������缺������ ���� ������ ���� �������� �ǽ� ���� <br /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><img src="/images/portal/common/stit_04.gif" alt="������ �ȳ�" class="tit" /></td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong> ������ü �� ī�����</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- ī����� �� ������� : ��������ī���� Ȩ������(<a href="http://edu.kocca.or.kr" target="_blank">http://edu.kocca.or.kr</a>)���� �¶��� ����</td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong> ������� �� ������ ȯ��</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- ������� ������ ���αⰣ ���� �ϳ��Ͽ��� �ϸ�, ���� ��û �� ��û ������ ���� ���Ա��� ���� ���ó���� <br />
      - ������û �Ⱓ�� ����� ��� 100% ȯ�� <br />
      - �н��Ϸκ��� 7�� �̳��� ����� ��� 50% ȯ�� <br />
    - �н��Ϸκ��� 7�� ����� ����� ��� ȯ�� �Ұ� <br /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><img src="/images/portal/common/stit_05.gif" alt="�������� ����" class="tit" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&bull; ���̹���������ī���� �� 02-2161-0077 / e-mail : academy@kocca.or.kr / Fax : 02-2161-0078 
<p></p></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->


