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


<form name="form1" method="post" action="">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "gubun" value = "1">
    <input type = "hidden" name = "menuid">
    <br/>
    <br/>
    <!--Ÿ��Ʋ�κ�-->
    <table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/offline/stitle_08.gif" alt="�������� ����" /></td>
        <td class="h_road">Home &gt; �������� ����  &gt; <strong>������û �ȳ�</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
	<tr>
			<td colspan="2">
				<table>
					<tr>
						<td height="15"></td>
					</tr>
					<tr>
						<td><strong>1. ȸ�� ���� : ȸ������ �����Ͻ� �� �α����մϴ�.</strong></td>
					</tr>
					<Tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//offline/info_01.jpg" /> </td>
					</tr>
					<tr>
				        <td height="15"></td>
				    </tr>

					<tr>
						<td><strong>2. �������� ����</strong></td>
					</tr>
					<tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//offline/info_02.jpg" /></td>
					</tr>
					<tr>
						<td>- ������û�� ���� �������� ���� > ����Ʈ �������� �̵��մϴ�.<br>
						- �������� Ŭ���ϸ� ���� �ȳ� �������� �̵��մϴ�.</td>
					<tr>
				        <td height="15"></td>
				    </tr>

					<tr>
						<td><strong>3. �������� ���� > �󼼺���</strong></td>
					</tr>
					<tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//offline/info_03.jpg" /></td>
					</tr>
					<tr>
				        <td>- �������� ������ ���� �ȳ� �������Դϴ�.<br>
						- ������û�� �ϱ� ���ؼ� [������û]��ư�� Ŭ���ϸ� ������û �˾�â�� ǥ�õ˴ϴ�.</td>
				    </tr>
					<tr>
				        <td height="15"></td>
				    </tr>

					<tr>
						<td><strong>4. �������� ���� > ������û</strong></td>
					</tr>
					<tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//offline/info_04.jpg" /></td>
					</tr>
					<tr>
						<td>- ������û ȭ���Դϴ�.<br>
						- �⺻ ���� �� �ڱ�Ұ��� �κ��� �ۼ��� �� [��û�ϱ�] ��ư�� Ŭ���ϸ� ��û�� ����˴ϴ�.</td>
					</tr>
					<tr>
				        <td height="15"></td>
				    </tr>

					<tr>
						<td><strong>5. ���� ���ǽ� > ������û Ȯ��/��� > �������ΰ���</strong></td>
					</tr>
					<tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//offline/info_05.jpg" /></td>
					</tr>
					<tr>
						<td>- ��ڰ� [1�� ����] ó���� �� ��쿡 ���λ��°� '1�� ����'���� �ٲ� ���� Ȯ���� �� �ֽ��ϴ�.<br>
						- [�����ϱ�] ��ư�� Ŭ���ϸ�, ���� ȭ���� ǥ�õ˴ϴ�.</td>
					</tr>
					<tr>
				        <td height="15"></td>
				    </tr>
					<tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//offline/info_06.jpg" /></td>
					</tr>
					<tr>
						<td>- [�����ϱ�] ��ư�� Ŭ���ϸ�, �̴Ͻý� ���� �˾�â�� ��Ÿ���ϴ�.</td>
					</tr>
					<tr>
				        <td height="15"></td>
				    </tr>
					<tr>
						<td align="center"><img src="/images/portal/homepage_renewal//offline/info_07.jpg" /></td>
					</tr>
					<tr>
						<td>- ������ �Ϸ�Ǹ� ������û�� �Ϸ�˴ϴ�.</td>
					</tr>
				</table>
			</td>
		</tr>



    </table>
    <!--Ÿ��Ʋ�κ�//-->
  <!--   
  <table width="690"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><strong>1. ȸ�� ����: ȸ������ �����Ͻ� �� �α����մϴ�.</strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/offline/sub_lecapp_img01.png" width="540" height="498" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>2. �������� ���� </strong><br /></td>
  </tr>
  <tr>
    <td class="pd_l15">- ������û�� ���� ������ �������� �������ΰ������� �̵��մϴ�.<br />
- �������� Ŭ���ϸ� ������ �������� �̵��մϴ�.<br />
- ����Ʈ���� [��û] ��ư�� Ŭ���ϸ� ������û ������ �˾��� ǥ�õ˴ϴ�.<br />
&nbsp;&nbsp;(��, �α��� �� ���¿����� ������û�� �����մϴ�.)</td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/offline/sub_lecapp_img02.png" width="540" height="393" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>3. ���� �󼼺��� / ������û</strong><br /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/offline/sub_lecapp_img03.png" width="540" height="429" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15">- [������û] ��ư�� Ŭ���ϸ� �Ʒ��� ���� ������û �˾�â�� ǥ�õȴ�.</td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/offline/sub_lecapp_img04.png" width="540" height="535" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
	<td class="pd_115">- �⺻���� �� �ڱ�Ұ��� �κ��� �ۼ��� �� [��û�ϱ�] ��ư�� Ŭ���ϸ� ��û�� �Ϸ�˴ϴ�.<br />
	&nbsp;&nbsp;&nbsp;(��, ȭ�鿡 ǥ�õǴ� �׸��� �������� ��� �� üũ�� ������ ���ʷ� ǥ�õ˴ϴ�.)</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>4. ���ǰ��ǽ� &gt; ������ûȮ��/��� &gt; �������� ����</strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/offline/sub_lecapp_img05.png" width="540" height="246" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15">- �����ڰ� [1������] ó���� �� ��쿡 ���ǰ��ǽ� &gt; ������ûȮ��/��� ȭ���� ���λ��°� &lsquo;1������&rsquo;���� <br />
&nbsp;&nbsp;�ٲ� ���� Ȯ���� �� ������, [�����ϱ�] ��ư�� ȭ�鿡 ǥ�õ˴ϴ�.<br />
- [�����ϱ�] ��ư�� Ŭ���ϸ�, �̴Ͻý� ���� ȭ���� ǥ�õ˴ϴ�.</td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/offline/sub_lecapp_img06.png" width="540" height="580" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/offline/sub_lecapp_img07.png" width="274" height="260" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
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
 -->
</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->