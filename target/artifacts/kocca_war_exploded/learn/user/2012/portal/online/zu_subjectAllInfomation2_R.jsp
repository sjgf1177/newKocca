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
    <td height="20px">&nbsp;</td>
  </tr>
  <tr>
    <td height="25">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <strong>&lt;2011�� ����� ��ȹ �� Ŀ��ŧ��&gt;</strong>
                </td>
            </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td><table class="row_list">
      <tbody>
        <tr></tr>
      </tbody>
      <colgroup>
        <col width="5%" />
        <col width="7%" />
        <col width="11%" />
        <col width="13%" />
        <col width="14%" />
        <col width="" />
        <col width="8%" />
        <col width="8%" />
        </colgroup>
      <thead>
        <tr>
          <th>No </th>
          <th>����</th>
          <th>��з�</th>
          <th>�ߺз�</th>
          <th>�Һз�</th>
          <th>������</th>
          <th>������</th>
          <th style="display:none">����<br />
            ����</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="ta_l fs_s lp_1">1</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">[�Թ�] ��ȭ������ ����Ͻ� â����</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">2</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">��ȭ������ ������ �� ����</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">3</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">��ȭ������ ����Ͻ� â����</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">4</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">������ȹ�� ȫ�������� �ǹ�</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">5</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">�����濵�� �ǹ�</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">6</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">���߹�ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">-</td>
          <td class="ta_l">���߹�ȭ�������� ����</td>
          <td class="data">����</td>
          <td class="endend">2010</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">7</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">-</td>
          <td class="ta_l">�����ϰ� ���� ��ȭ������ ����</td>
          <td class="data">15,000</td>
          <td class="endend">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">8</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">-</td>
          <td class="ta_l">�����ΰ� ��ǥ(���۱ǽ�ȭ)</td>
          <td class="data">15,000</td>
          <td class="endend">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">9</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">-</td>
          <td class="ta_l">���۱�(���۱Ǳ⺻)</td>
          <td class="data">15,000</td>
          <td class="endend">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">10</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���߹�ȭ�����ΰ� �α�</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">11</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���߹�ȭ�������� �����Ǹ�</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">12</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��ȭ���������</td>
          <td class="ta_l">���߹�ȭ�м�</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">13</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��ȭ���������</td>
          <td class="ta_l">��ȭ��������</td>
          <td class="data">15,000</td>
          <td class="endend">2004</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">14</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��ȭ���������</td>
          <td class="ta_l">��ȭ�����������</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">15</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ���� ������</td>
          <td class="ta_l">��ȭ�������� ���̵��</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">16</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ���� ������</td>
          <td class="ta_l">������ �ִϸ��̼� ����� ���</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">17</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ���� ������</td>
          <td class="ta_l">�ð� ���� ��ȭ�� ĳ����</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">18</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ���� ������</td>
          <td class="ta_l">����ִ� ���� �б�</td>
          <td class="data">����</td>
          <td class="endend">20</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">19</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ���� ������</td>
          <td class="ta_l">����ִ� ������ �б�</td>
          <td class="data">����</td>
          <td class="endend">2009</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">20</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ���� ������</td>
          <td class="ta_l">����ִ� ��ȭ �б�</td>
          <td class="data">����</td>
          <td class="endend">209</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">21</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ���� ������</td>
          <td class="ta_l">����ִ� TV �б�</td>
          <td class="data">����</td>
          <td class="endend">2009</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">22</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">������ �Թ�</td>
          <td class="ta_l">[�Թ�] ����� ������ ����</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">23</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">������ �Թ�</td>
          <td class="ta_l">[�Թ�] ��ȭ������ �ؿܸ�����</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">24</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">������ �Թ�</td>
          <td class="ta_l">[�Թ�] ��ȭ�������� ���丮������</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">25</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">������ �Թ�</td>
          <td class="ta_l">[�Թ�] �������ͽ���ȸ�� ��ȭ������</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">26</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">����Ʈ���� ��ȭ</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">27</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">������ ��ȹ</td>
          <td class="ta_l">���� ���� ���ñ�ȹ</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">28</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">������ ��ȹ</td>
          <td class="ta_l">����������������ȹ�� �ؿ�����</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">29</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">������ ��ȹ</td>
          <td class="ta_l">������ȹ�� ��ȭ������</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">30</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">������ ��ȹ</td>
          <td class="ta_l">���������񽺿����</td>
          <td class="data">����</td>
          <td class="endend">2008</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">31</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">������ ��ȹ</td>
          <td class="ta_l">OSMU�� ���� â���� �߻�</td>
          <td class="data">15,000</td>
          <td class="endend">2004</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">32</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">������ ��ȹ</td>
          <td class="ta_l">��ȭ������ ���ͷ�</td>
          <td class="data">��ȭ</td>
          <td class="endend">2008</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">33</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">������ ��ȹ</td>
          <td class="ta_l">��ȭ������ ��ǰ��ȹ</td>
          <td class="data">15,000</td>
          <td class="endend">2004</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">34</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">������ ��ȹ</td>
          <td class="ta_l">��ȭ������ ũ��������</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">35</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">������ ��ȹ</td>
          <td class="ta_l">��ȭ������ ���ε��</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">36</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">������ ��ȹ</td>
          <td class="ta_l">��ȭ�������� ���ڰ�������</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">37</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ��������ʿ���</td>
          <td class="ta_l">��ȭ������ �������</td>
          <td class="data">����</td>
          <td class="endend">2008</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">38</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ��������ʿ���</td>
          <td class="ta_l">�ؿܻ�ʷ� �� ��ȭ�� ĳ����</td>
          <td class="data">����</td>
          <td class="endend">2009</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">39</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ��������ʿ���</td>
          <td class="ta_l">������ ��찡 �̾߱��ϴ� ���� ��ȭ�λ�</td>
          <td class="data">����</td>
          <td class="endend">-</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">40</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ��������ʿ���</td>
          <td class="ta_l">��ȭ�� ������� �λ� �̾߱�</td>
          <td class="data">����</td>
          <td class="endend">-</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">41</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ��������ʿ���</td>
          <td class="ta_l">�̱� ��ȭ</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">42</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ��������ʿ���</td>
          <td class="ta_l">�̵��� ��������Ͻ�</td>
          <td class="data">����</td>
          <td class="endend">2009</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">43</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ��������ʿ���</td>
          <td class="ta_l">�ƽþ� ��ȭ</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">44</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ��������ʿ���</td>
          <td class="ta_l">�������θ�Ʈ ���</td>
          <td class="data">����</td>
          <td class="endend">2009</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">45</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ��������ʿ���</td>
          <td class="ta_l">��ȭ����� ��ʿ���</td>
          <td class="data">����</td>
          <td class="endend">2008</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">46</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ��������ʿ���</td>
          <td class="ta_l">���ǻ���� ��ʿ���</td>
          <td class="data">����</td>
          <td class="endend">2005</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">47</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ��������ʿ���</td>
          <td class="ta_l">���������� ���Ư��</td>
          <td class="data">����</td>
          <td class="endend">-</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">48</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ��������ʿ���</td>
          <td class="ta_l">���ε༭�� �̾߱��ϴ�<br/>�츮 ���α׷� �̷��� �������</td>
          <td class="data">����</td>
          <td class="endend">-</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">49</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">���丮�ڸ�</td>
          <td class="ta_l">11���� ��Ģ���� ������ ���丮�ڸ�</td>
          <td class="data">����</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">50</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">���丮�ڸ�</td>
          <td class="ta_l">�����н��丮�ڸ�</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">51</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">���丮�ڸ�</td>
          <td class="ta_l">��ȭ������ ���丮�ڸ� ���</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">52</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">���丮�ڸ�</td>
          <td class="ta_l">���丮�ڸ� ����</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">53</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">���丮�ڸ�</td>
          <td class="ta_l">���丮�ڸ��� ����</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">54</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">���丮�ڸ�</td>
          <td class="ta_l">�渮��� �ִϸ��̼� ���丮�ڸ� ����</td>
          <td class="data">����</td>
          <td class="endend">2009</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">55</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">����� �� ����� ������</td>
          <td class="data">����</td>
          <td class="endend">2009</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">56</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">��ȭ������ �����</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">57</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">��ʷ� �˾ƺ��� CT</td>
          <td class="data">15,000</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">58</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">�̸�¡��ũ�������� ��ȭ������</td>
          <td class="data">����</td>
          <td class="endend">2009</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">59</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">������ ��� CT����</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">60</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">������ ������ CT����Ͻ� ����</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">61</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">÷�ܱ�� �ִϸ��̼�</td>
          <td class="data">����</td>
          <td class="endend">2008</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">62</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">-</td>
          <td class="ta_l">�ؿ���������</td>
          <td class="data">����</td>
          <td class="endend">2008</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">63</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�۷ι� ����Ͻ�</td>
          <td class="ta_l">�۷ι� ����Ͻ�</td>
          <td class="ta_l">�۷��ù�ȭ�������� ���ؿ� ���</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">64</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">������</td>
          <td class="ta_l">-</td>
          <td class="ta_l">��ȭ��ȣ�а� ������</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">65</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">������</td>
          <td class="ta_l">������</td>
          <td class="ta_l">�оߺ��� ���� ������ ������</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">66</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ʷ� �˾ƺ��� �Ҽȳ�Ʈ��ũ</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">67</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ۿ�ũ��</td>
          <td class="ta_l">��ȭ������ ����</td>
          <td class="ta_l">�������ۿ�ũ��</td>
          <td class="data">����</td>
          <td class="endend">2008</td>
        </tr>
      </tbody>
      <tbody>
      </tbody>
    </table></td>
  </tr>
</table>

</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->