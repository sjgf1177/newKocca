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
    <td height="20">&nbsp;</td>
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
        <col width="12%" />
        <col width="12%" />
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
          <td class="ta_l">����</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">�����ȹ�� �ۼ���ɰ� �ؿ������� ���� �����</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">2</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">���ӻ��</td>
          <td class="ta_l">���Ӻм���2</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">3</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">���ӻ��</td>
          <td class="ta_l">���ӻ������</td>
          <td class="data">����</td>
          <td class="endend">2008</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">4</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">���ӱ�ȹ</td>
          <td class="ta_l">���� ��ȹ �� �׷��� �ǹ��ڸ� ���� ���ӱ�� ����</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">5</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">���ӱ�ȹ</td>
          <td class="ta_l">��ȹ�ڰ� �˾ƾ� �� 2D ���ӱ׷���</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">6</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">���ӱ�ȹ</td>
          <td class="ta_l">��ȹ�ڰ� �˾ƾ� �� 3D ���ӱ׷���</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">7</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">���ӱ�ȹ</td>
          <td class="ta_l">���丮����</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">8</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">â���Ϲ�</td>
          <td class="ta_l">���ӿ����</td>
          <td class="data">����</td>
          <td class="endend">2005</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">9</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">â���Ϲ�</td>
          <td class="ta_l">���� ���ӽó����� â�۽ǽ�</td>
          <td class="data">����</td>
          <td class="endend">2005</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">10</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">â���Ϲ�</td>
          <td class="ta_l">���̵��߻�</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">11</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">������</td>
          <td class="ta_l">-</td>
          <td class="ta_l">��ʸ� ���� ���Ӹ����� ����</td>
          <td class="data">15,000</td>
          <td class="endend">2003</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">12</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���/<br>����</td>
          <td class="ta_l">3D �׷���</td>
          <td class="ta_l">3D ���� �ؽ�ó</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">13</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���/<br>����</td>
          <td class="ta_l">3D �׷���</td>
          <td class="ta_l">3D �׷��� ���� �ǹ�</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">14</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���/<br>����</td>
          <td class="ta_l">����ĳ����</td>
          <td class="ta_l">����ĳ���͵�����1</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">15</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���/<br>����</td>
          <td class="ta_l">����ĳ����</td>
          <td class="ta_l">����ĳ���͵�����2</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">16</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���/<br>����</td>
          <td class="ta_l">�׷��� �Ϲ�</td>
          <td class="ta_l">���� �𵨸� ��ָ�</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">17</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���/<br>����</td>
          <td class="ta_l">�׷��� �Ϲ�</td>
          <td class="ta_l">�׷��Ƚ� �̷�</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">18</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���/<br>����</td>
          <td class="ta_l">�׷��� �Ϲ�</td>
          <td class="ta_l">���׷��� ����</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">19</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���/<br>����</td>
          <td class="ta_l">�׷��� �Ϲ�</td>
          <td class="ta_l">�ִϸ��̼ǰ���</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">20</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���/<br>����</td>
          <td class="ta_l">�׷��� �Ϲ�</td>
          <td class="ta_l">��Ʈ������ ������ ����</td>
          <td class="data">����</td>
          <td class="endend">2008</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">21</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӵ�����</td>
          <td class="ta_l">������ �Ϲ�</td>
          <td class="ta_l">���ӵ�����1</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">22</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӵ�����</td>
          <td class="ta_l">������ �Ϲ�</td>
          <td class="ta_l">���ӵ�����2</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">23</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӵ�����</td>
          <td class="ta_l">������ �Ϲ�</td>
          <td class="ta_l">����̷�</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">24</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӵ�����</td>
          <td class="ta_l">������ �Ϲ�</td>
          <td class="ta_l">MOD �������� �� Ȱ��</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">25</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">3D���α׷���</td>
          <td class="ta_l">3D �����������α׷���</td>
          <td class="data">����</td>
          <td class="endend">2005</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">26</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">3D���α׷���</td>
          <td class="ta_l">3D �������α׷���</td>
          <td class="data">����</td>
          <td class="endend">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">27</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">3D���α׷���</td>
          <td class="ta_l">3D ���α׷���1</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">28</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">3D���α׷���</td>
          <td class="ta_l">3D Data Exporting Techniques</td>
          <td class="data">����</td>
          <td class="endend">2005</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">29</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">��Ʈ��ũ</td>
          <td class="ta_l">��Ʈ��ũ �̷�</td>
          <td class="data">15,000</td>
          <td class="endend">2001</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">30</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� ���</td>
          <td class="ta_l">C#</td>
          <td class="data">����</td>
          <td class="endend">2008</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">31</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">������ �� �����е�� ���� ����(����)</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">32</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">������ �� �����е�� ���� ����(�ǹ�)</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">33</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">�ȵ���̵� ���� ����(����)</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">34</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">�ȵ���̵� ���� ����(�ǹ�)</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">35</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">UDK Ȱ�� ���(��ũ��Ʈ)</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">36</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">UDK Ȱ�� ���(��)</td>
          <td class="data">15,000</td>
          <td class="endend">2011</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">37</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">���Ӽ���</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">38</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">���������α׷��� ��������</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">39</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">���������α׷���1</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">40</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">�˰���</td>
          <td class="data">15,000</td>
          <td class="endend">2001</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">41</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">���¼ҽ����ӿ���-�׺�����̽�2</td>
          <td class="data">����</td>
          <td class="endend">2008</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">42</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">�ڷᱸ��</td>
          <td class="data">15,000</td>
          <td class="endend">2001</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">43</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">DirectX1</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">44</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">DirectX10</td>
          <td class="data">����</td>
          <td class="endend">2007</td>
        </tr>
		<tr>
          <td class="ta_l fs_s lp_1">45</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�������α׷���</td>
          <td class="ta_l">���α׷� �Ϲ�</td>
          <td class="ta_l">DirectX2</td>
          <td class="data">����</td>
          <td class="endend">2006</td>
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