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

    String grcode=box.getSession("tem_grcode");
	upperMap   = ClassifySubjectBean.getMenuId(box);
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>

<% if(grcode.equals("N000001")) {%>
<form name="form1" method="post">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "gubun" value = "1">
    <input type = "hidden" name = "menuid">
    <input type="hidden" name="p_topuserid"	value=""/>
    <input type="hidden" name="p_toppwd"	value=""/>
    
    <!--Ÿ��Ʋ�κ�-->
    <table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal//online/stitle_06.gif" alt="��ü��������" /></td>
        <td class="h_road">Home &gt; �¶��� ����  &gt; <strong>������û �ȳ�</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
	  <tr>
        <td height="10" colspan="2"></td>
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
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//online/info_01.jpg" /> </td>
					</tr>
					<tr>
				        <td height="15"></td>
				    </tr>

					<tr>
						<td><strong>2. �¶��� ����</strong></td>
					</tr>
					<tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//online/info_02.jpg" /></td>
					</tr>
					<tr>
						<td>- ������û�� ���� �¶��� ���� > ����Ʈ �������� �̵��մϴ�.<br>
						- �������� Ŭ���ϸ� ���� �ȳ� �������� �̵��մϴ�.</td>
					<tr>
				        <td height="15"></td>
				    </tr>

					<tr>
						<td><strong>3. �¶��� ���� > �󼼺���</strong></td>
					</tr>
					<tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//online/info_03.jpg" /></td>
					</tr>
					<tr>
				        <td>- �¶��� ������ ���� �ȳ� �������Դϴ�.<br>
						- ������û�� �ϱ� ���ؼ� [������û]��ư�� Ŭ���մϴ�.</td>
				    </tr>
					<tr>
				        <td height="15"></td>
				    </tr>

					<!--<tr>
						<td><strong>4. �¶��� ���� > ������û</strong></td>
					</tr>
					<tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//online/info_04.jpg" /></td>
					</tr>
					<tr>
						<td>- ������û ȭ���Դϴ�.<br>
						- ������ �� ������ Ȯ�� �Ͻ� �� [��ٱ��� ���] ��ư�� Ŭ���ϸ� ���� ������ ��ٱ��Ͽ� �߰��˴ϴ�.<br>
						* <u>��������� ��� [��û�ϱ�] ��ư�� Ŭ���Ͻø� ���� ���� ���� ������û�� �Ϸ�˴ϴ�.</u></td>
					</tr>
					<tr>
				        <td height="15"></td>
				    </tr>

					<tr>
						<td><strong>5. ���� ���ǽ� > ��ٱ��� > ��û��� Ȯ��</strong></td>
					</tr>
					<tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//online/info_05.jpg" /></td>
					</tr>
					<tr>
						<td>- ��û���� ���� �� �����ݾ��� Ȯ�� �� [�����ϱ�] ��ư�� Ŭ���Ͻø� �������� Ȯ�� ȭ������ �̵��˴ϴ�.</td>
					</tr>
					<tr>
				        <td height="15"></td>
				    </tr>

					<tr>
						<td><strong>6. ���� ���ǽ� > ��ٱ��� > �������� Ȯ��</strong></td>
					</tr>
					<tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//online/info_06.jpg" /></td>
					</tr>
					<tr>
						<td>- ������ ���� ȭ���Դϴ�.<br>
						- ���������� �ſ�ī��� �ǽð�������ü�� �����ϰ� �ֽ��ϴ�.<br>
						- ���������� �����Ͻ� �� [�����ϱ�] ��ư�� Ŭ���ϸ� �̴Ͻý� ���� ȭ�� â�� ǥ�õ˴ϴ�.</td>
					</tr>
					<tr>
						<td align="center"><img src="/images/portal/homepage_renewal//online/info_07.jpg" /></td>
					</tr>
					<tr>
				        <td height="15"></td>
				    </tr>

					<tr>
						<td><strong>7. ���� ���ǽ� > ��ٱ��� > �����Ϸ�</strong></td>
					</tr>
					<tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//online/info_08.jpg" /></td>
					</tr>
					<tr>
						<td>- �����Ϸ� ȭ���Դϴ�.<br>
						- [������ ���] ��ư�� Ŭ���ϸ� �������� ��� �˾�â�� ǥ�õ˴ϴ�.<br>
						- [������û Ȯ��/���] ��ư�� Ŭ���ϸ� �ش� �޴��� �̵��մϴ�.</td>
					</tr>
					<tr>
				        <td height="15"></td>
				    </tr>

					--><tr>
						<td><strong>4. ���� ���ǽ� > ������û Ȯ��/���</strong></td>
					</tr>
					<tr>
						<td class="jin_table_Tright"><img src="/images/portal/homepage_renewal//online/info_09.jpg" /></td>
					</tr>
					<tr>
						<td>- ���� ���ǽ� - ������û Ȯ��/��� ȭ���Դϴ�.<br><!--
						- ���� ������û ���λ��� �� �������¸� Ȯ���� �� �ֽ��ϴ�.<br>
						- ��û �� ������ �Ϸ�� ��쿡�� '���δ��'�� ǥ�õ˴ϴ�.<br>
						- ��û �� ����, ����� ���α��� �Ϸ�� ��쿡�� '����'���� ǥ�õ˴ϴ�.<br>
						&nbsp;&nbsp;&nbsp;&nbsp;(����ó�� �� ��츸 �������� ������ ��û������ ǥ�õ˴ϴ�.)<br>
						- --><u>���������� �Ϸ�� ��쿡 ���� ���ǽ� - �������� ������ ���ε� ������ ��Ͽ� �߰��˴ϴ�.</u><br>
						&nbsp;&nbsp;&nbsp;&nbsp;(<u>��, �н��� ���������� ���Ŀ��� �����մϴ�.</u>)</td>
					</tr>
					<tr>
				        <td height="15"></td>
				    </tr>


				</table>
			</td>
		</tr>

    </table>
    </td>
    <td width="20">&nbsp;</td>
    <td valign="top">
    <!--Ÿ��Ʋ�κ�//-->
    
    <!-- 
    
  <table width="690"  border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    <td height="30"><strong>1. ȸ�� ����: ȸ������ �����Ͻ� �� �α����մϴ�.</strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/online/sub_lecapp_online_img01.png" width="540" height="498" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>2. �¶��� ����</strong><br /></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/online/sub_lecapp_online_img02.png" width="540" height="302" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15">- ������û�� ���� �¶��� ���� &gt; ����Ʈ �������� �̵��մϴ�.<br />
    - �������� Ŭ���ϸ� ���� �ȳ� �������� �̵��մϴ�.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>3. �¶��� ���� &gt; �󼼺���</strong><br /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/online/sub_lecapp_online_img03.png" width="540" height="322" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15">- �¶��� ������ ���� �ȳ� �������Դϴ�.<br />
    - ������û�� �ϱ� ���ؼ� [������û] ��ư�� Ŭ���մϴ�.</td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>4. �¶��� ���� &gt; ������û</strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/online/sub_lecapp_online_img04.png" width="540" height="525" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15">- ������û ȭ���Դϴ�.<br />
      - �޴���ȭ �� �̸����� �Է��� �� [��û�ϱ�] ��ư�� Ŭ���ϸ� ������û�� �Ϸ�˴ϴ�. <br />
&nbsp;���� ��û�� ���������� ��ٱ��Ͽ� �߰��˴ϴ�.<br />
&nbsp;��������� ��� ���ٸ� ���� ���� ����������û�� �Ϸ�˴ϴ�.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>5. (��������ϰ��) �¶��� ���� &gt; ��ٱ���</strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/online/sub_lecapp_online_img05.png" width="540" height="273" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15">- ��������� ��쿡�� ���ٸ� ���� ���� ����������û�� �Ϸ�˴ϴ�.<br />
    - �¶��� &gt; ���ǰ��ǽ� Ȩ���� ������ Ȯ�� �Ͻ� �� �ֽ��ϴ�.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>6. (��������� ���) �¶��� ���� &gt; ��ٱ���</strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/online/sub_lecapp_online_img06.png" width="540" height="399" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15">- �ϴܿ��� �������� ����� ���� �����ݾ��� ǥ�õ˴ϴ�.<br />
- [�����ϱ�] ��ư�� Ŭ���Ͻø� �������� Ȯ�� ȭ������ �̵��˴ϴ�.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>7. �¶��� ���� &gt; ���� Ȯ��
      <br />
    </strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/online/sub_lecapp_online_img071.png" width="540" height="597" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15">- ������ ���� ȭ���Դϴ�.<br />
      - ���������� �ſ�ī��� ������ü�� �����ϰ� �ֽ��ϴ�.<br />
    - ���������� ������ �� [�����ϱ�] ��ư�� Ŭ���ϸ� �̴Ͻý� ���� ȭ�� â�� ǥ�õ˴ϴ�.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/offline/sub_lecapp_online_img072.gif" width="364" height="350" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>8. �¶��� ���� &gt; �����Ϸ�<br />
    </strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/offline/sub_lecapp_online_img08.gif" width="551" height="332" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15"> - ���� �Ϸ� ȭ���Դϴ�.<br />
      - [������ ���] ��ư�� Ŭ���ϸ� �������� ��� �˾�â�� ǥ�õ˴ϴ�.<br />
    - [������ûȮ��/���] ��ư�� Ŭ���ϸ� �ش� �޴��� �̵��մϴ�.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>9. ���� ���ǽ� &gt; ������ûȮ��/���<br />
    </strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/offline/sub_lecapp_online_img09.gif" width="551" height="364" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15">- ���ǰ��ǽ� &gt; ������ûȮ��/��� ȭ���Դϴ�.<br />
      - ���� ������û ���λ��� �� �������¸� Ȯ���� �� �ֽ��ϴ�.<br />
      - ��û �� ������ �Ϸ�� ��쿡�� &lsquo;���δ��&rsquo;�� ǥ�õ˴ϴ�.<br />
      - ��û �� ����, �������� ���α��� �Ϸ�� ��쿡�� &lsquo;����&rsquo;���� ǥ�õ˴ϴ�.<br />
    &nbsp;&nbsp;(����ó�� �� ��쿡�� �������ΰ����� ��û������ ǥ�õ˴ϴ�.)</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>10. ������ &gt; ���ǰ��ǽ� &gt; �������ΰ���
      <br />
    </strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/offline/sub_lecapp_online_img10.gif" width="543" height="363" /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td class="pd_l15">- ���������� �Ϸ�� ��쿡 ���ǰ��ǽ� &gt; �������� ������ ���ε� ������ ��Ͽ� �߰��˴ϴ�.<br />
    &nbsp;&nbsp;(��, �н��� ���������� ���Ŀ��� �����մϴ�.)</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
 -->

</form>
<!-- form �� -->
<%} else {%>


<form name="form1" method="post">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "gubun" value = "1">
    <input type = "hidden" name = "menuid">

<table width="690"  border="0" cellpadding="0" cellspacing="0">

  <tr>
    <td height="30"><strong>1. �α�����, ������û �޴��� �̵� �մϴ�.<br>&nbsp;&nbsp;&nbsp;�������� Ŭ���ϸ� �����ȳ� �������� �̵��� �˴ϴ�.</strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/online/sub_lecapp_online_img01.png" width="540" height="498"  /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>2. ������ ���� �� �ȳ� ������ �Դϴ�.<br>&nbsp;&nbsp;&nbsp;[������û] ��ư�� Ŭ���Ͽ� ������û�� �մϴ�.</strong><br /></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/online/sub_lecapp_online_img101.gif"  /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>3. ������û ȭ�� �Դϴ�.<br>&nbsp;&nbsp;&nbsp;�޴���ȭ �� �̸��� �ּҸ� Ȯ����,[������û] ��ư�� Ŭ���ϸ� ������û�� �Ϸ� �˴ϴ�.</strong><br /></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/online/sub_lecapp_online_img103.gif" width="551"  /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>4. ������ûȮ��/��� ȭ�� �Դϴ�.<br>&nbsp;&nbsp;&nbsp;���� ������û ���� ������ Ȯ���� �� ������, ��û�Ⱓ �� ������Ҹ� �� �� �ֽ��ϴ�.</strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/online/sub_lecapp_online_img104.gif"  /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><strong>5. �н��Ⱓ�� ���۵Ǹ� [���� ���ǽ�] &gt; [�������ΰ���]���� ������û �Ͻ� ������ �� �� �ֽ��ϴ�.<br>&nbsp;&nbsp;&nbsp;[�н��ϱ�]�� Ŭ���Ͽ� �н��� �����Ͻ� �� �ֽ��ϴ�.(��, �н��� �н������� ���Ŀ��� �����մϴ�.)</strong></td>
  </tr>
  <tr>
    <td class="pd_l15"><img src="/images/portal/online/sub_lecapp_online_img105.gif"  /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

</form>


<%}%>
<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->


