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


<form name="form1" method="post">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "gubun" value = "1">
    <input type = "hidden" name = "menuid">
    
<table width="690"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25"><strong>&lt;�¶��� ����/��ۺо� - 2010�� ����� ��ȹ �� Ŀ��ŧ��&gt;</strong></td>
  </tr>
  <tr>
    <td><table class="row_list">
      <tbody>
        </tbody>
    </table>
      <table class="row_list">
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
            <th>����<br />
            ����</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="ta_l fs_s lp_1">1</td>
            <td class="ta_l">���</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">â��</td>
            <td class="ta_l">â���Ϲ�</td>
            <td class="ta_l">��α� ���ڵǱ�<br /></td>
            <td class="data">15,000</td>
            <td class="end">2008</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">2</td>
            <td class="ta_l">���</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">â��</td>
            <td class="ta_l">â���Ϲ�</td>
            <td class="ta_l">â���� ���� ���ϴ� �۾���</td>
            <td class="data">����</td>
            <td class="end">2006</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">3</td>
            <td class="ta_l">���</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">â��</td>
            <td class="ta_l">â���Ϲ�</td>
            <td class="ta_l">TV��ť���͸� �۾���</td>
            <td class="data">15,000</td>
            <td class="end">2007</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">4</td>
            <td class="ta_l">���</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l"><span class="data">��ۿ����ȹ</span></td>
            <td class="ta_l">�������</td>
            <td class="data">����</td>
            <td class="end">2005</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">5</td>
            <td class="ta_l">���</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l"><span class="data">��ۿ����ȹ</span></td>
            <td class="ta_l">��ȭ�� ���� �������</td>
            <td class="data">15,000</td>
            <td class="end">2007</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">6</td>
            <td class="ta_l">���</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l"><span class="data">��ۿ����ȹ</span></td>
            <td class="ta_l">��ۿ�����������ȹ</td>
            <td class="data">30,000</td>
            <td class="end">2010</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">7</td>
            <td class="ta_l">���</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l"><span class="data">��ۿ����ȹ</span></td>
            <td class="ta_l">��������� ���丮�ڸ� </td>
            <td class="data">30,000</td>
            <td class="end">2010</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">8</td>
            <td class="ta_l">���</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">��������ȹ</td>
            <td class="ta_l">��ť���͸�Ʈ���Ϸ� ������ ��Ī����</td>
            <td class="data">30,000</td>
            <td class="end">2010</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">9</td>
            <td class="ta_l">���</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">��������ȹ</td>
            <td class="ta_l">���־� ���丮�ڸ�</td>
            <td class="data">����</td>
            <td class="end">2002</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">10</td>
            <td class="ta_l">���</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">��ȹ</td>
            <td class="ta_l">��������ȹ</td>
            <td class="ta_l">�����й̵�� ���丮�ڸ�</td>
            <td class="data">����</td>
            <td class="end">2006</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">11</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">�����Ϲ�</td>
            <td class="ta_l">�����Կ� �⺻<br /></td>
            <td class="data">����</td>
            <td class="end">2002</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">12</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">1������</td>
            <td class="ta_l">VJ���α׷�����</td>
            <td class="data">����</td>
            <td class="end">2002</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">13</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">1������</td>
            <td class="ta_l">1�� ��������</td>
            <td class="data">����</td>
            <td class="end">2005</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">14</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">������ ����</td>
            <td class="ta_l">��� �����̾� ���� CS4</td>
            <td class="data">30,000</td>
            <td class="end">2010</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">15</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">������ ����</td>
            <td class="ta_l">�ƺ�� �̵�������� ���꽺</td>
            <td class="data">30,000</td>
            <td class="end">2010</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">16</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">������ ����</td>
            <td class="ta_l">������ ����Ʈ CS4</td>
            <td class="data">30,000</td>
            <td class="end">2010</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">17</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">1������</td>
            <td class="ta_l">���з�����, UCC</td>
            <td class="data">����</td>
            <td class="end">2007 </td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">18</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">�����Ϲ�</td>
            <td class="ta_l">��Ʃ������α׷�����</td>
            <td class="data">����</td>
            <td class="end">2002</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">19</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">�����Ϲ�</td>
            <td class="ta_l">HDTV ����</td>
            <td class="data">����</td>
            <td class="end">2005</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">20</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">�����Ϲ�</td>
            <td class="ta_l">�������������Ư��_�����</td>
            <td class="data">����</td>
            <td class="end">2003</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">21</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">�����Ϲ�</td>
            <td class="ta_l">�������������Ư��_�����<br /></td>
            <td class="data">����</td>
            <td class="end">2003</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">22</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">�����Ϲ�</td>
            <td class="ta_l">������۽ǹ�</td>
            <td class="data">����</td>
            <td class="end">2002</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">23</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">�����Ϲ�</td>
            <td class="ta_l">���ǿ���, �������</td>
            <td class="data">15,000</td>
            <td class="end">2007 </td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">24</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">�����Ϲ�</td>
            <td class="ta_l">�����Կ��� ����</td>
            <td class="data">15,000</td>
            <td class="end">2008</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">25</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">�����Ϲ�</td>
            <td class="ta_l">TV��ť���͸��� �̷а� ����</td>
            <td class="data">15,000</td>
            <td class="end">2007</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">26</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">�����Ϲ�</td>
            <td class="ta_l">��۾Ƴ����</td>
            <td class="data">15,000</td>
            <td class="end">2008</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">27</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������</td>
            <td class="ta_l">�����Ϲ�</td>
            <td class="ta_l">����������</td>
            <td class="data">30,000</td>
            <td class="end">2010</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">28</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">����</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�ƺ�� �̵���������� </td>
            <td class="data">����</td>
            <td class="end">2006</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">29</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">����</td>
            <td class="ta_l">����</td>
            <td class="ta_l">�������� ��������</td>
            <td class="data">15,000</td>
            <td class="end">2007</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">30</td>
            <td class="ta_l">���</td>
            <td class="ta_l">����</td>
            <td class="ta_l">����</td>
            <td class="ta_l">����</td>
            <td class="ta_l">���̳�������</td>
            <td class="data">15,000</td>
            <td class="end">2008</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">31</td>
            <td class="ta_l">���</td>
            <td class="ta_l">�濵����</td>
            <td class="ta_l">�濵�Ϲ�</td>
            <td class="ta_l">&nbsp;</td>
            <td class="ta_l">�����������CEO<br /></td>
            <td class="data">����</td>
            <td class="end">2007</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">32</td>
            <td class="ta_l">���</td>
            <td class="ta_l">�濵����</td>
            <td class="ta_l">�̵�� �濵</td>
            <td class="ta_l">-</td>
            <td class="ta_l">�����й̵��� �������� ����</td>
            <td class="data">����</td>
            <td class="end">2006</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">33</td>
            <td class="ta_l">���</td>
            <td class="ta_l">�濵����</td>
            <td class="ta_l">�̵�� �濵</td>
            <td class="ta_l">-</td>
            <td class="ta_l">�̵�� ����ȯ���� ����</td>
            <td class="data">����</td>
            <td class="end">2007</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">34</td>
            <td class="ta_l">���</td>
            <td class="ta_l">�濵����</td>
            <td class="ta_l">�̵�� �濵</td>
            <td class="ta_l">-</td>
            <td class="ta_l">��������� ����&middot;������</td>
            <td class="data">����</td>
            <td class="end">2006</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">35</td>
            <td class="ta_l">���</td>
            <td class="ta_l">�濵����</td>
            <td class="ta_l">�̵�� �濵</td>
            <td class="ta_l">-</td>
            <td class="ta_l">������ ����Ͻ��� ���������� �̷а� ����</td>
            <td class="data">����</td>
            <td class="end">2006</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">36</td>
            <td class="ta_l">���</td>
            <td class="ta_l">�濵����</td>
            <td class="ta_l">�̵�� ����</td>
            <td class="ta_l">-</td>
            <td class="ta_l">�̵����� ����</td>
            <td class="data">����</td>
            <td class="end">2003</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">37</td>
            <td class="ta_l">���</td>
            <td class="ta_l">�濵����</td>
            <td class="ta_l">�̵�� ����</td>
            <td class="ta_l">-</td>
            <td class="ta_l">�̵���ü�����ͷ��å�</td>
            <td class="data">����</td>
            <td class="end">2004</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">38</td>
            <td class="ta_l">���</td>
            <td class="ta_l">�濵����</td>
            <td class="ta_l">�̵�� ����</td>
            <td class="ta_l">-</td>
            <td class="ta_l">�̵���ü�����ͷ��å�</td>
            <td class="data">����</td>
            <td class="end">2005</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">39</td>
            <td class="ta_l">���</td>
            <td class="ta_l">�濵����</td>
            <td class="ta_l">�̵�� ����</td>
            <td class="ta_l">-</td>
            <td class="ta_l">�̵����� �缺���</td>
            <td class="data">����</td>
            <td class="end">2006</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">40</td>
            <td class="ta_l">���</td>
            <td class="ta_l">�濵����</td>
            <td class="ta_l">����</td>
            <td class="ta_l">-</td>
            <td class="ta_l">������۱� �ǹ���</td>
            <td class="data">����</td>
            <td class="end">2006</td>
          </tr>
          <tr>
            <td class="ta_l fs_s lp_1">41</td>
            <td class="ta_l">���</td>
            <td class="ta_l">�濵����</td>
            <td class="ta_l">����</td>
            <td class="ta_l">-</td>
            <td class="ta_l">������۱� �ǹ���</td>
            <td class="data">����</td>
            <td class="end">2007</td>
          </tr>
        </tbody>
        <tbody>
        </tbody>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="25"><strong>&lt;�¶��� ����/���Ӻо� - 2010�� ����� ��ȹ �� Ŀ��ŧ��&gt;</strong></td>
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
          <th>����<br />
            ����</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="ta_l fs_s lp_1">1</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">���ӱ�ȹ</td>
          <td class="ta_l">��ȹ�ڰ� �˾ƾ��� 3D ���ӱ׷���(new)<br /></td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">2</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">���ӻ��</td>
          <td class="ta_l">���ӻ������</td>
          <td class="data">15,000</td>
          <td class="end">2008</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">3</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">���ӱ�ȹ</td>
          <td class="ta_l">���丮����(new)</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">4</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">���ӱ�ȹ</td>
          <td class="ta_l">��ȹ�ڰ� �˾ƾ��� 2D ���ӱ׷���(new)</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">5</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">���ӻ��</td>
          <td class="ta_l">���Ӻм���2(new)</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">6</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">â���Ϲ�</td>
          <td class="ta_l">���� ���ӽó����� â�۽ǽ�</td>
          <td class="data">30,000</td>
          <td class="end">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">7</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">â���Ϲ�</td>
          <td class="ta_l">���̵��߻�(New)</td>
          <td class="data">����</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">8</td>
          <td class="ta_l">����</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">â���Ϲ�</td>
          <td class="ta_l">���ӿ����</td>
          <td class="data">15,000</td>
          <td class="end">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">9</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
            /����</td>
          <td class="ta_l">�׷���<br />
            �Ϲ�</td>
          <td class="ta_l">���� UCC ���۹�(new)</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">10</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">�׷���<br />
�Ϲ�</td>
          <td class="ta_l">���� �𵨸� ��ָ�(new)</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">11</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����<br />
            ���α׷���</td>
          <td class="ta_l">3D<br />
            ���α׷���</td>
          <td class="ta_l">3D�������α׷���<br /></td>
          <td class="data">15,000</td>
          <td class="end">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">12</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����<br />
���α׷���</td>
          <td class="ta_l">3D<br />
���α׷���</td>
          <td class="ta_l">3D�����������α׷���</td>
          <td class="data">15,000</td>
          <td class="end">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">13</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����<br />
���α׷���</td>
          <td class="ta_l">3D<br />
���α׷���</td>
          <td class="ta_l">3D Data Exporting Techniques</td>
          <td class="data">15,000</td>
          <td class="end">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">14</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����<br />
���α׷���</td>
          <td class="ta_l">3D<br />
���α׷���</td>
          <td class="ta_l">3D ���α׷���2</td>
          <td class="data">15,000</td>
          <td class="end">2004</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">15</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����<br />
���α׷���</td>
          <td class="ta_l">3D<br />
���α׷���</td>
          <td class="ta_l">3D ��� ������ ��ũ��</td>
          <td class="data">15,000</td>
          <td class="end">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">16</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӵ�����</td>
          <td class="ta_l">�������Ϲ�</td>
          <td class="ta_l">MOD �������� �� Ȱ��(new)</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">17</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӵ�����</td>
          <td class="ta_l">�������Ϲ�</td>
          <td class="ta_l">����̷�(new)</td>
          <td class="data">����</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">18</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӵ�����</td>
          <td class="ta_l">�������Ϲ�</td>
          <td class="ta_l">���ӵ�����2(new)</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">19</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">3D�׷���</td>
          <td class="ta_l">3D���� �ؽ�ó(new)</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">20</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">3D�׷���</td>
          <td class="ta_l">3D�׷��� ���� �ǹ�(new)</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">21</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">3D�׷���</td>
          <td class="ta_l">3DMax �����ϱ�(new)<br /></td>
          <td class="data">����</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">22</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">����ĳ����</td>
          <td class="ta_l">����ĳ���͵�����1(new)</td>
          <td class="data">����</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">23</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">����ĳ����</td>
          <td class="ta_l">����ĳ���͵�����2(new)</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">24</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">�׷����Ϲ�</td>
          <td class="ta_l">��Ʈ������ ������ ����</td>
          <td class="data">15,000</td>
          <td class="end">2008</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">25</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">�������Ϲ�</td>
          <td class="ta_l">���ӵ�����1(New)</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">26</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">�׷����Ϲ�</td>
          <td class="ta_l">�׷��Ƚ� �̷�(new)</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">27</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">�׷����Ϲ�</td>
          <td class="ta_l">������ �����1(new)</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">28</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">�׷����Ϲ�</td>
          <td class="ta_l">������ �����2(new)</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">29</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">�׷����Ϲ�</td>
          <td class="ta_l">���׷��� ����(new)</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">30</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ӱ׷���<br />
/����</td>
          <td class="ta_l">�׷����Ϲ�</td>
          <td class="ta_l">�ִϸ��̼ǰ���(New)</td>
          <td class="data">����</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">31</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
���α׷���</td>
          <td class="ta_l">OS</td>
          <td class="ta_l">�ü��</td>
          <td class="data">15,000</td>
          <td class="end">2001</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">32</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
���α׷���</td>
          <td class="ta_l">��Ʈ��ũ</td>
          <td class="ta_l">��Ʈ��ũ �̷�</td>
          <td class="data">15,000</td>
          <td class="end">2001</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">33</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">���α׷� <br />
            �Ϲ�</td>
          <td class="ta_l">C#</td>
          <td class="data">15,000</td>
          <td class="end">2008</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">34</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">���α׷� <br />
            �Ϲ�</td>
          <td class="ta_l">��ü���� ���α׷���1</td>
          <td class="data">15,000</td>
          <td class="end">2002</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">35</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">���α׷� <br />
            �Ϲ�</td>
          <td class="ta_l">��ü���� ���α׷���2</td>
          <td class="data">15,000</td>
          <td class="end">2003</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">36</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">���α׷� <br />
            �Ϲ�</td>
          <td class="ta_l">������ ���α׷��� ��������(new)</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">37</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">���α׷� <br />
            �Ϲ�</td>
          <td class="ta_l">���������α׷���1(new)<br /></td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">38</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">���α׷� <br />
            �Ϲ�</td>
          <td class="ta_l">�˰���<br /></td>
          <td class="data">15,000</td>
          <td class="end">2001</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">39</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">���α׷� <br />
            �Ϲ�</td>
          <td class="ta_l">���¼ҽ����ӿ���-�׺�����̽�2</td>
          <td class="data">15,000</td>
          <td class="end">2008</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">40</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">���α׷� <br />
            �Ϲ�</td>
          <td class="ta_l">�ڷᱸ��</td>
          <td class="data">15,000</td>
          <td class="end">2001</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">41</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">���α׷� <br />
            �Ϲ�</td>
          <td class="ta_l">DirectX1(new)</td>
          <td class="data">����</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">42</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">���α׷� <br />
            �Ϲ�</td>
          <td class="ta_l">DirectX10(new)</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">43</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">���α׷� <br />
            �Ϲ�</td>
          <td class="ta_l">DirectX2(new)</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">44</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">���α׷� <br />
            �Ϲ�</td>
          <td class="ta_l">���Ӽ���(new)</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">45</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���� <br />
            ���α׷���</td>
          <td class="ta_l">3D<br />
            ���α׷���</td>
          <td class="ta_l">3D���α׷���1(new)</td>
          <td class="data">����</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">46</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">������</td>
          <td class="ta_l">-</td>
          <td class="ta_l">���Ӹ����ÿ���</td>
          <td class="data">15,000</td>
          <td class="end">2003</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">47</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">�����ȹ�� �ۼ���ɰ� �ؿ������� ���� �����(new)</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
      </tbody>
      <tbody>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="25"><strong>&lt;�¶��� ����/������ ��ȹâ�ۺо� - 2010�� ����� ��ȹ �� Ŀ��ŧ��&gt;</strong></td>
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
          <th>����<br />
            ����</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="ta_l fs_s lp_1">1</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��ȭ������<br />
            ���</td>
          <td class="ta_l">��ȭ������ ����Ͻ�<br /></td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">2</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��ȭ������<br />
            ���</td>
          <td class="ta_l">���蹮ȭ������ ����</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">3</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��ȭ������<br />
            ���</td>
          <td class="ta_l">�������ͽ� ��ȸ�� ��ȭ������</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">4</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ����<br />
            ������</td>
          <td class="ta_l">��ȭ�������� ���̵��</td>
          <td class="data">����</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">5</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ����<br />
            ������</td>
          <td class="ta_l">������ �ִϸ��̼� ����� ���</td>
          <td class="data">����</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">6</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��ȭ������<br />
            ���</td>
          <td class="ta_l">���߹�ȭ�м�</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">7</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ����<br />
            ������</td>
          <td class="ta_l">����ִ� �����б�</td>
          <td class="data">15,000</td>
          <td class="end">2009</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">8</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ����<br />
            ������</td>
          <td class="ta_l">����ִ� ������ �б�</td>
          <td class="data">15,000</td>
          <td class="end">2009</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">9</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��ȭ������<br />
            ���</td>
          <td class="ta_l">21���� ��ȭ������ ������</td>
          <td class="data">����</td>
          <td class="end">2008</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">10</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">�������Թ�</td>
          <td class="ta_l">[�Թ�] ����� ������ ���� </td>
          <td class="data">����</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">11</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">�������Թ�</td>
          <td class="ta_l">[�Թ�] ��ȭ������ �ؿ� ������</td>
          <td class="data">����</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">12</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">�������Թ�</td>
          <td class="ta_l">[�Թ�] ��ȭ�������� ���丮������</td>
          <td class="data">����</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">13</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">�������Թ�</td>
          <td class="ta_l">[�Թ�] �������ͽ� ��ȸ�� ��ȭ������</td>
          <td class="data">����</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">14</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ����<br />
            ������</td>
          <td class="ta_l">�ð����� ��ȭ�� ĳ����</td>
          <td class="data">����</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">15</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ����<br />
            ������</td>
          <td class="ta_l">����ִ� ��ȭ�б�</td>
          <td class="data">����</td>
          <td class="end">2009</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">16</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">�����̷�</td>
          <td class="ta_l">��Ȱ����<br />
            ������</td>
          <td class="ta_l">����ִ� TV�б�</td>
          <td class="data">����</td>
          <td class="end">2009</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">17</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��������ȹ</td>
          <td class="ta_l">���������񽺿����</td>
          <td class="data">15,000</td>
          <td class="end">2008</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">18</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��������ȹ</td>
          <td class="ta_l">�ִϸ��̼� ��ȹ</td>
          <td class="data">����</td>
          <td class="end">2004</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">19</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��������ȹ</td>
          <td class="ta_l">��ȭ������ ���ͷ�</td>
          <td class="data">15,000</td>
          <td class="end">2008</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">20</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��������ȹ</td>
          <td class="ta_l">��ȭ������ ũ��������</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">21</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��������ȹ</td>
          <td class="ta_l">��ȭ������ ������Ʈ �����ǹ��� <br /></td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">22</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��������ȹ</td>
          <td class="ta_l">��ȭ�������� ���ڰ�������</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">23</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��������ȹ</td>
          <td class="ta_l">��ȭ������ ���ε�� </td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">24</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ������<br />
            ��ʿ���</td>
          <td class="ta_l">new ��ȭ����� ��ʿ���</td>
          <td class="data">����</td>
          <td class="end">2008</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">25</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ������<br />
            ��ʿ���</td>
          <td class="ta_l">�̵��� ��������Ͻ�</td>
          <td class="data">����</td>
          <td class="end">2009</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">26</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ������<br />
            ��ʿ���</td>
          <td class="ta_l">�������θ�Ʈ ���</td>
          <td class="data">����</td>
          <td class="end">2009</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">27</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ������<br />
            ��ʿ���</td>
          <td class="ta_l">���ǻ���� ��ʿ���</td>
          <td class="data">����</td>
          <td class="end">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">28</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ������<br />
            ��ʿ���</td>
          <td class="ta_l">�ؿܱ���� �������_ĳ����/���Ǹ�ȭ/����/�����/����</td>
          <td class="data">����</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">29</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��������ȹ</td>
          <td class="ta_l">�������� ��ȹ</td>
          <td class="data">����</td>
          <td class="end">2004</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">30</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ������<br />
            ��ʿ���</td>
          <td class="ta_l">�ؿܻ�ʷ� �� ��ȭ�� ĳ����</td>
          <td class="data">����</td>
          <td class="end">2009</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">31</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ������<br />
            ��ʿ���</td>
          <td class="ta_l">����� ������<br /></td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">32</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ������<br />
            ��ʿ���</td>
          <td class="ta_l">��ȭ������ �������</td>
          <td class="data">15,000</td>
          <td class="end">2008</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">33</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ������<br />
            ��ʿ���</td>
          <td class="ta_l">�̱���ȭ</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">34</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ������<br />
            ��ʿ���</td>
          <td class="ta_l">�ƽþƿ�ȭ</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">35</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">���丮�ڸ�</td>
          <td class="ta_l">���丮�ڸ��� ����</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">36</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">���丮�ڸ�</td>
          <td class="ta_l">�渮��� �ִϸ��̼� ���丮�ڸ� ����</td>
          <td class="data">����</td>
          <td class="end">2009</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">37</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">���丮�ڸ�</td>
          <td class="ta_l">��ȭ�������� ���丮 ������</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">38</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">���丮�ڸ�</td>
          <td class="ta_l">������ ���丮�ڸ�</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">39</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">���丮�ڸ�</td>
          <td class="ta_l">��ȭ������ ���丮�ڸ� ���</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">40</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">��ʿ���</td>
          <td class="ta_l">��ȭ������<br />
��ʿ���</td>
          <td class="ta_l">���̵��_����</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">41</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">÷�ܱ�� �ִϸ��̼�<br /></td>
          <td class="data">10,000</td>
          <td class="end">2008</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">42</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">�������� CT����</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">43</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">������ ������ CT����Ͻ�����</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">44</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">��ʷ� �˾ƺ��� CT </td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">45</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">��ȭ������ �����</td>
          <td class="data">15,000</td>
          <td class="end">2006</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">46</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">�̸�¡��ũ�������� ��ȭ������</td>
          <td class="data">����</td>
          <td class="end">2009</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">47</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">��ȹ</td>
          <td class="ta_l">â��</td>
          <td class="ta_l">÷�ܱ��</td>
          <td class="ta_l">����� �� ����� ������ </td>
          <td class="data">����</td>
          <td class="end">2009</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">48</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ۿ�ũ��</td>
          <td class="ta_l">��ȭ������<br />
            ����</td>
          <td class="ta_l">���������۵�����</td>
          <td class="data">����</td>
          <td class="end">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">49</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">���ۿ�ũ��</td>
          <td class="ta_l">��ȭ������<br />
            ����</td>
          <td class="ta_l">�������ۿ�ũ��</td>
          <td class="data">����</td>
          <td class="end">2008</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">50</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">����</td>
          <td class="ta_l">-</td>
          <td class="ta_l">�ؿ���������</td>
          <td class="data">15,000</td>
          <td class="end">2008</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">51</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�۷ι�<br />
            ����Ͻ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">��ȭ������ �ؿ� ������<br /></td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">52</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�۷ι�<br />
����Ͻ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">�Ϻ� ��ȭ ������ ����� ����</td>
          <td class="data">15,000</td>
          <td class="end">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">53</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">�۷ι�<br />
����Ͻ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">�߱� ��ȭ ������ ����� ����</td>
          <td class="data">15,000</td>
          <td class="end">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">54</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">������</td>
          <td class="ta_l">-</td>
          <td class="ta_l">�ִϸ��̼� ������</td>
          <td class="data">����</td>
          <td class="end">2004</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">55</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">������</td>
          <td class="ta_l">-</td>
          <td class="ta_l">���������̼ǹ���� </td>
          <td class="data">����</td>
          <td class="end">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">56</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">������</td>
          <td class="ta_l">-</td>
          <td class="ta_l">�۷ι�������</td>
          <td class="data">15,000</td>
          <td class="end">2005</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">57</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">����</td>
          <td class="ta_l">������</td>
          <td class="ta_l">-</td>
          <td class="ta_l">��ȭ��ȣ�а� ������</td>
          <td class="data">15,000</td>
          <td class="end">2006        </td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">58</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">[�Թ�] ��ȭ������ ����Ͻ� â����</td>
          <td class="data">����</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">59</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">��ȭ������ �濵����</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">60</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">��ȭ������ ������ �� ����</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">61</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">��ȭ������ ����Ͻ� â����</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">62</td>
          <td class="ta_l">��ȭ</td>
          <td class="ta_l">�濵����</td>
          <td class="ta_l">�濵�Ϲ�</td>
          <td class="ta_l">-</td>
          <td class="ta_l">��ȭ������ CEO �濵���</td>
          <td class="data">15,000</td>
          <td class="end">2007</td>
        </tr>
      </tbody>
      <tbody>
      </tbody>
    </table></td>
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
    <td height="50">&nbsp;</td>
  </tr>
  <tr>
    <td>�¶��α��������� ����������Ǳ��� ����� ���� �� �������� ���� �پ��� ������ȸ ������ �������� ��ۿ���/����/��ȭ������ ��ȹ, ����, �濵, ����Ͻ� �о� ���� ���� �������� �����Ͽ� �¶� �����ý����� Ȱ���� ��Ǵ� �������α׷��Դϴ�.</td>
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


