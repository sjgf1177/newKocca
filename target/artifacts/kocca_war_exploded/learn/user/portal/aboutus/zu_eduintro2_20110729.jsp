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
    <td>����� ���� �米�������� ������ ����� �����ڸ� ������� �̵�� ȯ�� ��ȭ�� �´� ���������� â�� ���� �� �۷ι� ����� ��ȭ�� �������� 3D��ü, CG, ����, HD ���� �о� ���� â�۱�� ������ �缺�� ���� ��Ǵ� �������α׷��Դϴ�.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><img src="/images/portal/common/stit_01.gif" alt="����" class="tit" /></td>
  </tr>
  <tr>
    <td class="pd_l15">- ����� : ������ ����� ���� ����� ���� ���� ���������� ���� ����� �� â�� ������&nbsp;���� ������ ���� <br />
      - ������� : ������ ����� ������ �о� ������ <br />
      - ����� : 1-10�� / �ܱ� ���� � <br />
- �������� : 
����, ����, CGI, HD����, 3D��ü, ����, �濵 �� ����Ͻ�, ������å ���� �� </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><img src="/images/portal/common/stit_02.gif" alt="����" class="tit" /></td>
  </tr>
  <tr>
    <td class="pd_l15">- ���� �ְ��� ���������� Ȱ���� ������ ���� ���� ���� ���� ����&nbsp; <br />
      - �оߺ� �����䱸�� ����, Ʈ���� �м��� ���� ������ ���� ���� �߽��� �������� � <br />
      - �������� ��������� ��Ʈ�� ������ ���� ��ǰ�� �������� ���� <br />
      - ǳ���� ���� ����� ���� ������ ������ �������� ���� �������� Ȱ�� ���� ���� ���� <br />
    - ö���� ���� ������ ���� ���� ȿ�� �� ���� ������ ����&nbsp;&nbsp; <br /></td>
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
    - ���߱��� : �� ������ �����ڰ� ���� ���ռ� ����, ������û ������, �Ҽӱ���� �ο� �ȹ� �� </td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong>�������� � </strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- ������� : ���� �� �ǽ�����, �������� �ǽ� ���� �� ������ Ŀ��ŧ���� ���� ���� ���� �߽��� ���� � <br />
      - �������� : ����ǹ�������, �а������� �� <br />
      - �����ý��� �� ��� : ���� �ְ��� ������ ���� �ý��� �� ��� Ȱ���� ������ ���� �ǹ� �߽��� ���� � <br />
    - ������� : �ѱ���������ī���� ���ǽ�(�� ���ȸ�� ����) <br /></td>
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
    <td class="pd_l25">-������ü : �츮���� 1005-500-541698 / ������ : �ѱ������������ <br />      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(�Ա�Ȯ�� �� ���� ����� ��꼭 �߱�) <br />
    - ī����� : �ѱ������� ��ī���� Ȩ������(http://edu.kocca.or.kr)���� �¶��� ���� <br /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong> ��뵿�� ������ ȯ��</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- �뵿�� �����ɷ°��� �Ʒð������� ������ ���������� ���� ��뺸�� �����ڰ� ������ �������� 20��30% ȯ��(�뵿��) <br />
      - ���� ���� �� �ش����� �뵿�繫�ҿ� ������ ȯ�޽�û���� ���� <br /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong> ������� �� ������ ȯ��</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- ������� ������ ���αⰣ ���� �ϳ��Ͽ��� �ϸ�, ������ ���� ���������� �������� 7�� ������ �뺸�� ���� ȯ��, <br />
      &nbsp;�� ������ ������� �뺸���� ȯ�� �Ұ� <br />
&nbsp;      (������ �������� ������ ���� ��� ���ݵǾ� ����������� ���� Ȯ���� �ʼ������� �����)&nbsp;<br /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong> ��</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- �����ο��� ���������� 50% ������ ��쿡�� ������ ��ҵ� �� ������ �� ���, ������ ������� ���� ȯ���� �帳�ϴ�.<br /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong>�������</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- ������ �Ϻδ� ������ �����Ǹ� ������������ ���, ���ĺ�� �Ҽӻ� �δ���<br /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><img src="/images/portal/common/stit_05.gif" alt="�������� ����" class="tit" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&bull; ��ۿ���о� : �� 02-2161-0072 / e-mail : offline@kocca.kr / Fax : 02-2161-0078 <br />      &bull; �������ۺо� : �� 02-3219-6541 / e-mail : offline@kocca.krr / Fax : 02-2161-0078
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


