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
		document.form1.p_process.value = "subjectallinformation";
		document.form1.action = "/servlet/controller.course.EduScheduleHomePageServlet";
		document.form1.submit();
	}

</script>

<form name="form1" method="post" id="toptop">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "gubun" value = "1">
    <input type = "hidden" name = "menuid">
    <input type = "hidden" name = "tabid" value="<%= box.get("tabid") %>">

    <ul class="tabwrap">
		<li><a href="javascript:selectArea('3');" class="tab_online<%= box.get("tabid").equals("3") || box.get("tabid").equals("") ? " tab_online_on" : "" %>"><span>�����ȳ�</span></a></li>
		<li><a href="javascript:selectArea('1');" class="tab_online<%= box.get("tabid").equals("1") ? " tab_online_on" : "" %>"><span>��ȭ������</span></a></li>
		<li><a href="javascript:selectArea('2');" class="tab_online<%= box.get("tabid").equals("2") ? " tab_online_on" : "" %>"><span>����������</span></a></li>
		<li><a href="javascript:selectArea('4');" class="tab_online<%= box.get("tabid").equals("4") ? " tab_online_on" : "" %>"><span>���������</span></a></li>
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
      <td height="20px"></td>
  </tr>
  <tr>
    <td >�¶��α��������� ����������Ǳ��� ����� ���� �� �������� ���� �پ��� ������ȸ ������ �������� ��ۿ���/����/��ȭ������ ��ȹ, ����, �濵, ����Ͻ� �о� ���� ���� �������� �����Ͽ� �¶� �����ý����� Ȱ���� ��Ǵ� �������α׷��Դϴ�.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><img src="/images/portal/common/stit_01.gif" alt="����" class="tit" /></td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong> �����</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- ������ ���� ����� �� â�� ������ ����  ���, ����, ��ȭ������ â������ �缺<br />
    - ��ȭ�������� ���� �پ��� ���� ��ȸ�� ���� �� ���� Ȯ��</td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong>�������</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- ���� ��ۻ�, ���� �ι�, ���̺�TV, ��� ������� �� ��ۿ����� �о� ������   ��ۿ����η�, �����õ�����û �Ҽ� ��,<br />
&nbsp; �ߵ� ���� �� �Ϲ��� �� <br />
      - ��ȭ������ ����� �����ִ� �����η� �� ������, �Ϲ���, ���л�<br />
    - �Ϲ��� �� ��������� ���û�� �о� ������</td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="middle" /> <strong>�����</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- ������ �ſ� ���� 1��~ ���ϱ��� <br />
    - (4��-12��) ���ݱ��������� ����/ �ڰ���������/���п��� �������°���/��å���Ͱ��� ��        �پ��� ������ �������� <br />
&nbsp;&nbsp;    ������ ���� ���� ��ȸ Ȯ��</td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" /> <strong>��������</strong></td>
  </tr>
  <tr>
    <td class="pd_l25"> - ���� ������ ������� �� �̵����о��� ���ܱ��������� ��� ���� ������� ��������
�������� � <br />
&nbsp;&nbsp; (�������б���� �ΰ���ȣ �� 04-02ȣ)<br />
- ���п��� ���� ���� �������� �� �����ڷ� ���񽺵� �а���������<br />
- �̵�����ȸ ���� �̵�������缺���� �<br />
- �����, CEO, �ùδ�ü ȸ����� ��å���Ͱ��� �<br />
- �����信 ������ ������ ��Ź���� �<br />
- ���γ��� : ��ȹâ�۰���, ���۽ǹ�����, 1�����۰���, ������Ư������, ��������������,
<br />
&nbsp; �̵��濵������ ����Ͻ� ����, �̵������� ��<br />
- ��ȭ������ �Ϲ� ,��ȭ������ ��� �帣(��ȭ,��ȭ,ĳ����,�ִϸ��̼� ��)       ��ȭ������ ����â�� (���丮�ڸ�, <br />
&nbsp;&nbsp; ��ʿ��� ��), ��ȭ������ �濵���� �� <br />
- 3D ��� ������ ��ũ��, ���� �𵨸� ��ָ�(new), ��ʸ� ���� ������ ����(New) <br />
&nbsp;&nbsp;���������α׷���1(new), 3D���α׷���1(new), 3D�׷��� ���� �ǹ�(new) �� </td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><img src="/images/portal/common/stit_02.gif" alt="����" class="tit" /></td>
  </tr>
  <tr>
    <td class="pd_l15">-  ����, ����, �ð��� ���־��� ������ ����������� �¶��� ������ ���� ������ȸ Ȯ�� <br />
      - ����� �ý��ۿ� �´� ����� �������� ����� �� ����â�� �� ����ȿ�� �ش�ȭ<br />
      - �ҿܰ����� ����δ������ ��������� ������μ� ���ͼ� Ȯ�� <br />
      - �оߺ� �����䱸�� ����, �̵�� Ʈ���� �м��� ���� ���� ���� �߽��� �������� � <br />
      - ǳ���� ���� ����� ���� ������ ������ �������� ���� �������� Ȱ�� ���� ���� ����<br />
      - ������� �¶���Ʃ�͸� Ȱ���� 1:1 ����� �н����� �<br />
      - ö���� ���� ������ ���� ���� ȿ�� �� ���� ������ ���� <br />
      - ���ᱳ������ ��� ���� ���� �¶��� ��������� ��������� ������� ��ȭ �� �Ϻ� ��������
����ȭ�� ���� <br />
&nbsp; ����ȿ�� ���� </td>
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
    <td class="pd_l25"> - ��û��� : �¶��� ��û / http://edu.kocca.or.kr<br />
- ���߱��� : ������û ������ ����</td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong>�������� � </strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- ������� : ���ͳ��� ���� ������ ���� �� �̷� ���� �� ������ Ŀ��ŧ���� ���� ���� �߽���     ���� � <br />
      - �������� : ������ ��� �о� ������, �а������� <br />
      - �����ý��� �� ��� : �н��ں� ���� PC���� �¶��� �н� <br />
&nbsp;&nbsp;��, �̵�������缺������ ���� ������ ���� �������� �ǽ� ���� <br />
- ������� : ��������� ���� ���� <br />
&nbsp;&nbsp;��, �̵�������缺������ ���� ��������ī���� ��Ƽ�̵�� ���ǽ� </td>
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
    <td class="pd_l25">ī����� �� ������� : ��������ī���� Ȩ������(http://edu.kocca.or.kr)���� ����</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong> ������� �� ������ ȯ��</strong></td>
  </tr>
  <tr>
    <td class="pd_l25"> - ������� ������ ���αⰣ ���� �ϳ��Ͽ��� �ϸ�, ���� ��û �� ��û ������ ���� ���Ա��� ���� ���ó���� <br />
- ������û �Ⱓ�� ����� ��� 100% ȯ��<br />
- �н��Ϸκ��� 7�� �̳��� ����� ��� 50% ȯ��<br />
- �н��Ϸκ��� 7�� ����� ��� �Ұ�(ȯ�� �Ұ�)</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><img src="/images/portal/common/stit_05.gif" alt="�������� ����" class="tit" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&bull; ���̹���������ī���� �� 02-2161-0077 / e-mail : academy@kocca.or.kr / Fax : 02-2161-0078</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><strong>&lt;���� Ʃ���� 1:1 ����� �н�����&gt;</strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/ico/ico_comment_arrow.gif" width="3" height="5" /> ������ Ʃ�͵��� ö���� �н������� �ż��� �亯 ó��, ������ �ڷ����� ��
�н��� �߽��� �����н����� ����<br />
<img src="/images/portal/ico/ico_comment_arrow.gif" width="3" height="5" /> ���� �󿡼� �н��ڿ� Ʃ�� ��ȣ���� ������ ��� �� �پ��� ��ȣ�ۿ��� ����
1:1 ���� ����<br />
<img src="/images/portal/ico/ico_comment_arrow.gif" width="3" height="5" /> ������ ���� ����<br />
&nbsp;&nbsp;- �������� ����ȭ�� ���� ������ ���� ���� ����<br />
&nbsp;&nbsp;- ������ �н����¿� ���� ��������, ����Ʈ �� �򰡿� ���� �ȳ����� ����<br />
<img src="/images/portal/ico/ico_comment_arrow.gif" width="3" height="5" /> ���κ� sms ����<br />
&nbsp;&nbsp;- ���� sms�� ���� �����ȳ� �� �н�����<br />
&nbsp;&nbsp;- �������� sms�� ���÷� ����<br />
<img src="/images/portal/ico/ico_comment_arrow.gif" width="3" height="5" /> �ݺ� �н� ����<br />
&nbsp;&nbsp;- ���� ���� �� �����Ⱓ ����(�������:2��, �������:4��) �н������� ���� �ݺ��н� ����<br />
<img src="/images/portal/ico/ico_comment_arrow.gif" width="3" height="5" /> Ŀ�´�Ƽ ����<br />
&nbsp;&nbsp;- �н��� ���̿� ���ɺо߸� �����ϰ� ��Ȱ�� Ŀ�´����̼��� �����ϱ�
���� Ŀ�´�Ƽ Ȱ�� ����</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
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