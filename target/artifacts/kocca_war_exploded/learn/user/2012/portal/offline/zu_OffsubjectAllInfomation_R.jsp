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
    
<table width="690"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center"><font size="4"><strong>2010 �ѱ���������ī���� ���� ��������ǥ(������)</strong></font></td>
  </tr>
  <tr>
    <td><table class="row_list">
      <colgroup>
        <col width="12%" />
        <col width="5%" />
        <col width="" />
        <col width="15%" />
        <col width="10%" />
        <col width="10%" />
        <col width="10%" />
        </colgroup>
      <thead>
        <tr>
          <th>���� </th>
          <th>No </th>
          <th>������</th>
          <th>��������</th>
          <th>�Ⱓ</th>
          <th>�ο�</th>
          <th>������</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td rowspan="7" class="ta_l fs_s lp_1">���� (7)</td>
          <td class="ta_l fs_s lp_1">1</td>
          <td class="ta_l">Avid  MCA Version4 101���� 1��<br /></td>
          <td class="data">4.12~4.16<br /></td>
          <td class="data">5��</td>
          <td class="data">10</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">2</td>
          <td class="ta_l">Avid  MCA Version4 101���� 2��</td>
          <td class="data">6. 7~6.11</td>
          <td class="data">5��</td>
          <td class="data">10</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">3</td>
          <td class="ta_l">Avid  MCA Version4 101���� 3��</td>
          <td class="data">9. 6~9.10</td>
          <td class="data">5��</td>
          <td class="data">10</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">4</td>
          <td class="ta_l">AvidMCAVersion4 201���� </td>
          <td class="data">11. 1~11. 5</td>
          <td class="data">5��</td>
          <td class="data">10</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">5</td>
          <td class="ta_l">Edius  Version5 Editing����</td>
          <td class="data">4. 5~ 4. 9</td>
          <td class="data">5��</td>
          <td class="data">13</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">6</td>
          <td class="ta_l">Final Cut Pro Version7 Level 1���� 1�� </td>
          <td class="data">4.26~ 4.30</td>
          <td class="data">5��</td>
          <td class="data">14</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">7</td>
          <td class="ta_l">Final Cut Pro Version7 Level 1���� 2��</td>
          <td class="data">9.27~ 10. 1</td>
          <td class="data">5��</td>
          <td class="data">14</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td rowspan="4" class="ta_l fs_s lp_1">���� (4)</td>
          <td class="ta_l fs_s lp_1">8</td>
          <td class="ta_l">Pro Tools Version8 110 ���� 1��<br /></td>
          <td class="data">10. 4~10. 8<br /></td>
          <td class="data">5��</td>
          <td class="data">5</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">9</td>
          <td class="ta_l">Pro Tools Version8 110 ���� 2��</td>
          <td class="data">10.25~10.29</td>
          <td class="data">5��</td>
          <td class="data">5</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">10</td>
          <td class="ta_l">ProToolsVersion8  201����</td>
          <td class="data">11. 8~11.12</td>
          <td class="data">5��</td>
          <td class="data">5</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">11</td>
          <td class="ta_l">ProTools Version8 210M����</td>
          <td class="data">11.22~11.26</td>
          <td class="data">5��</td>
          <td class="data">5</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td rowspan="5" class="ta_l fs_s lp_1">CGI (5)</td>
          <td class="ta_l fs_s lp_1">12</td>
          <td class="ta_l">Color/Motion level 1���� 1��</td>
          <td class="data">5.10~5.14</td>
          <td class="data">5��</td>
          <td class="data">14</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">13</td>
          <td class="ta_l">Color/Motion  level 1���� 2��</td>
          <td class="data">11.15~11.19</td>
          <td class="data">5��</td>
          <td class="data">14</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">14</td>
          <td class="ta_l">Motion Graphic ���� 1��</td>
          <td class="data">4.19~4.23</td>
          <td class="data">5��</td>
          <td class="data">14</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">15</td>
          <td class="ta_l">Motion Graphic ���� 2��</td>
          <td class="data">10.18~10.22</td>
          <td class="data">5��</td>
          <td class="data">14</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">16</td>
          <td class="ta_l">Ư��ȿ�� ���� ����������(�̱�)</td>
          <td class="data">8����</td>
          <td class="data">2��</td>
          <td class="data">20</td>
          <td class="end">����</td>
        </tr>
        <tr>
          <td rowspan="7" class="ta_l fs_s lp_1">HD���� (7)</td>
          <td class="ta_l fs_s lp_1">17</td>
          <td class="ta_l">HD �Կ� Set-up ����</td>
          <td class="data">5.26~5.28<br /></td>
          <td class="data">3��</td>
          <td class="data">12</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">18</td>
          <td class="ta_l">HDV ���۰���</td>
          <td class="data">6.14~6.18</td>
          <td class="data">5��</td>
          <td class="data">14</td>
          <td class="end">300,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">19</td>
          <td class="ta_l">Red one �ǹ����� ��ũ�� 1��</td>
          <td class="data">4.27~4.30</td>
          <td class="data">4��</td>
          <td class="data">12</td>
          <td class="end">300,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">20</td>
          <td class="ta_l">Red one �ǹ����� ��ũ�� 2��</td>
          <td class="data">10.12~10.15</td>
          <td class="data">4��</td>
          <td class="data">12</td>
          <td class="end">300,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">21</td>
          <td class="ta_l">������ �̵�� ��ũ�÷ο� ����</td>
          <td class="data">6.23~ 6.25</td>
          <td class="data">3��</td>
          <td class="data">14</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">22</td>
          <td class="ta_l">��� '�߳�' ���ۻ�� ��ũ��</td>
          <td class="data">4.27</td>
          <td class="data">1��</td>
          <td class="data">60</td>
          <td class="end">����</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">23</td>
          <td class="ta_l">HDƯ���Կ� ����</td>
          <td class="data">9. 8~9.10</td>
          <td class="data">3��</td>
          <td class="data">14</td>
          <td class="end">200,000</td>
        </tr>
        <tr>
          <td rowspan="6" class="ta_l fs_s lp_1">3D ��ü (6)</td>
          <td class="ta_l fs_s lp_1">24</td>
          <td class="ta_l">3D�������� ��ũ��<br /></td>
          <td class="data">3.3</td>
          <td class="data">1��</td>
          <td class="data">50</td>
          <td class="end">����</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">25</td>
          <td class="ta_l">3D��ü �Կ� �ǹ� ���� ��ũ�� 1��</td>
          <td class="data">10.5~10.8</td>
          <td class="data">4��</td>
          <td class="data">12</td>
          <td class="end">300,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">26</td>
          <td class="ta_l">3D��ü �Կ� �ǹ� ���� ��ũ�� 2��</td>
          <td class="data">10.26~10.29</td>
          <td class="data">4��</td>
          <td class="data">12</td>
          <td class="end">300,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">27</td>
          <td class="ta_l">3D��ü ���� �ǹ� ���� ��ũ�� 1��</td>
          <td class="data">8.31~9.3</td>
          <td class="data">4��</td>
          <td class="data">12</td>
          <td class="end">300,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">28</td>
          <td class="ta_l">3D��ü ���� �ǹ� ���� ��ũ�� 2��</td>
          <td class="data">11.9~11.12</td>
          <td class="data">4��</td>
          <td class="data">12</td>
          <td class="end">300,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">29</td>
          <td class="ta_l">3D â�۱�� ����(�Ϻ�)</td>
          <td class="data">10����</td>
          <td class="data">1����</td>
          <td class="data">15</td>
          <td class="end">����</td>
        </tr>
        <tr>
          <td rowspan="13" class="ta_l fs_s lp_1">���� ����(13)</td>
          <td class="ta_l fs_s lp_1">30</td>
          <td class="ta_l">iPhone  ���۰���<br /></td>
          <td class="data">9��</td>
          <td class="data">5��</td>
          <td class="data">15</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">31</td>
          <td class="ta_l">�ȵ���̵�  ���۰���</td>
          <td class="data">10��</td>
          <td class="data">5��</td>
          <td class="data">15</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">32</td>
          <td class="ta_l">�� ���� ���� ����</td>
          <td class="data">7��</td>
          <td class="data">5��</td>
          <td class="data">15</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">33</td>
          <td class="ta_l">�� 2.0 �ô��� ���� Ʈ���� ����</td>
          <td class="data">4��</td>
          <td class="data">2��</td>
          <td class="data">15</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">34</td>
          <td class="ta_l">SNS ���� ������ ���� �۷ι� �̽�</td>
          <td class="data">6��</td>
          <td class="data">1��</td>
          <td class="data">15</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">35</td>
          <td class="ta_l">�̵���������̳�(UDK)����</td>
          <td class="data">6.21~6.22</td>
          <td class="data">2��</td>
          <td class="data">20</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">36</td>
          <td class="ta_l">�̵���������̳�(GFX)���� 1��</td>
          <td class="data">5.13~5.14</td>
          <td class="data">2��</td>
          <td class="data">20</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">37</td>
          <td class="ta_l">�̵���������̳�(GFX)���� 2��</td>
          <td class="data">6.9~6.10</td>
          <td class="data">2��</td>
          <td class="data">20</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">38</td>
          <td class="ta_l">�̵���������̳�(GFX)���� 3��</td>
          <td class="data">6.29~6.30</td>
          <td class="data">2��</td>
          <td class="data">20</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">39</td>
          <td class="ta_l">����  �뷱�� �����ΰ���</td>
          <td class="data">6��</td>
          <td class="data">4��</td>
          <td class="data">15</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">40</td>
          <td class="ta_l">MMORPG�� ���������ΰ� ���������� ���</td>
          <td class="data">6.25</td>
          <td class="data">1��</td>
          <td class="data">20</td>
          <td class="end">����</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">41</td>
          <td class="ta_l">�������ۻ�ʿ�ũ�� 1�� -FPS-</td>
          <td class="data">6.15</td>
          <td class="data">1��</td>
          <td class="data">50</td>
          <td class="end">����</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">42</td>
          <td class="ta_l">�������ۻ�ʿ�ũ�� 2��</td>
          <td class="data">9��</td>
          <td class="data">1��</td>
          <td class="data">45</td>
          <td class="end">����</td>
        </tr>
        <tr>
          <td rowspan="5" class="ta_l fs_s lp_1"> �濵 ��<br />
            ����Ͻ�<br />
            (5)</td>
          <td class="ta_l fs_s lp_1">43</td>
          <td class="ta_l">ĳ���� ����Ͻ�<br /></td>
          <td class="data">7.6~7.7</td>
          <td class="data">2��</td>
          <td class="data">20</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">44</td>
          <td class="ta_l">���� �о� ���� ����(PD) ������</td>
          <td class="data">11��</td>
          <td class="data">3��</td>
          <td class="data">15</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">45</td>
          <td class="ta_l">���� ���� Risk Mangement</td>
          <td class="data">8����</td>
          <td class="data">3��</td>
          <td class="data">15</td>
          <td class="end">50,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">46</td>
          <td class="ta_l">�߱� ����������Ͻ� ����������</td>
          <td class="data">6.24~7.8</td>
          <td class="data">12</td>
          <td class="data">20</td>
          <td class="end">700,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">47</td>
          <td class="ta_l">�߱� ���������� ��û����(2ȸ)</td>
          <td class="data">����</td>
          <td class="data">1����</td>
          <td class="data">20</td>
          <td class="end">&nbsp;</td>
        </tr>
        <tr>
          <td rowspan="5" class="ta_l fs_s lp_1">���� ��å
            (5)</td>
          <td class="ta_l fs_s lp_1">48</td>
          <td class="ta_l">���Ӻо� ������������<br /></td>
          <td class="data">8����</td>
          <td class="data">2��</td>
          <td class="data">20</td>
          <td class="end">����</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">49</td>
          <td class="ta_l">���Ӻо� ������ ����</td>
          <td class="data">10����</td>
          <td class="data">4��</td>
          <td class="data">15</td>
          <td class="end">����</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">50</td>
          <td class="ta_l">�̵������а�  �������� ��ũ��</td>
          <td class="data">8.16~8.20</td>
          <td class="data">5��</td>
          <td class="data">20</td>
          <td class="end">100,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">51</td>
          <td class="ta_l">����� �̵�� ���� ����</td>
          <td class="data">6.3~11</td>
          <td class="data">7��</td>
          <td class="data">9</td>
          <td class="end">����</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">52</td>
          <td class="ta_l">���ҳ� �����й̵�� ��ũ��</td>
          <td class="data">7.28~30</td>
          <td class="data">3��</td>
          <td class="data">37</td>
          <td class="end">����</td>
        </tr>
        <tr>
          <td rowspan="5" class="ta_l fs_s lp_1">��Ź(4)</td>
          <td class="ta_l fs_s lp_1">53</td>
          <td class="ta_l">�Ǳ��� HD���۽ǹ�����</td>
          <td class="data">1.11~1.15</td>
          <td class="data">5��</td>
          <td class="data">13</td>
          <td class="end">&nbsp;</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">54</td>
          <td class="ta_l">���������� �������۰���</td>
          <td class="data">1.18~1.22</td>
          <td class="data">5��</td>
          <td class="data">13</td>
          <td class="end">&nbsp;</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">55</td>
          <td class="ta_l">KBS 3D��ü���۽ǹ�</td>
          <td class="data">2.23~2.26</td>
          <td class="data">4��</td>
          <td class="data">8</td>
          <td class="end">&nbsp;</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">56</td>
          <td class="ta_l">������ ������</td>
          <td class="data">3.8~3.12</td>
          <td class="data">5��</td>
          <td class="data">4</td>
          <td class="end">&nbsp;</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td height="25"></td>
  </tr>
  <tr>
    <td height="25" align="center"><font size="4"><strong>2010 �ѱ���������ī���� ������ ����缺 ��������ǥ</strong></font></td>
  </tr>
  <tr>
    <td><table class="row_list">
      <colgroup>
        <col width="12%" />
        <col width="5%" />
        <col width="" />
        <col width="15%" />
        <col width="10%" />
        <col width="10%" />
        <col width="10%" />
        </colgroup>
      <thead>
        <tr>
          <th>���� </th>
          <th>No </th>
          <th>������</th>
          <th>��������</th>
          <th>�Ⱓ</th>
          <th>�ο�</th>
          <th>������</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td rowspan="7" class="ta_l fs_s lp_1">���?����<br>(7)</td>
          <td class="ta_l fs_s lp_1">1</td>
          <td class="ta_l">3D��ü�����ȹ</td>
          <td class="data">10.3~10.8</td>
          <td class="data">5����</td>
          <td class="data">10</td>
          <td class="end">500,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">2</td>
          <td class="ta_l">3D��ü�Կ�</td>
          <td class="data">10.3~10.8</td>
          <td class="data">5����</td>
          <td class="data">10</td>
          <td class="end">500,000</td>
        </tr>
       <tr>
          <td class="ta_l fs_s lp_1">3</td>
          <td class="ta_l">3D��ü��������</td>
          <td class="data">10.3~10.8</td>
          <td class="data">5����</td>
          <td class="data">10</td>
          <td class="end">500,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">4</td>
          <td class="ta_l">3D��ü �׷��� </td>
          <td class="data">10.3~10.8</td>
          <td class="data">5����</td>
          <td class="data">10</td>
          <td class="end">500,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">5</td>
          <td class="ta_l">CG (VFX)</td>
          <td class="data">10.3~10.10</td>
          <td class="data">8����</td>
          <td class="data">12</td>
          <td class="end">800,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">6</td>
          <td class="ta_l">���� ������</td>
          <td class="data">10.3~10.10</td>
          <td class="data">10����</td>
          <td class="data">10</td>
          <td class="end">500,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">7</td>
          <td class="ta_l">CG ��� �׷���</td>
          <td class="data">10.3~10.8</td>
          <td class="data">5����</td>
          <td class="data">14</td>
          <td class="end">500,000</td>
        </tr>
        <tr>
          <td rowspan="4" class="ta_l fs_s lp_1">���� ����<br>(4)</td>
          <td class="ta_l fs_s lp_1">8</td>
          <td class="ta_l">���ӵ�����(��ȹ)</td>
          <td class="data">10.3~10.12</td>
          <td class="data">10����</td>
          <td class="data">12</td>
          <td class="end">1,000,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">9</td>
          <td class="ta_l">�������α׷�</td>
          <td class="data">10.3~10.12</td>
          <td class="data">10����</td>
          <td class="data">15</td>
          <td class="end">1,000,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">10</td>
          <td class="ta_l">���ӱ׷���</td>
          <td class="data">10.3~10.12</td>
          <td class="data">10����</td>
          <td class="data">15</td>
          <td class="end">1,000,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">11</td>
          <td class="ta_l">������ ����</td>
          <td class="data">10.3~10.12</td>
          <td class="data">10����</td>
          <td class="data">12</td>
          <td class="end">1,000,000</td>
        </tr>
        <tr>
          <td rowspan="5" class="ta_l fs_s lp_1">��ȹ?â��<br>(2)</td>
          <td class="ta_l fs_s lp_1">12</td>
          <td class="ta_l">������ ��ȹâ��</td>
          <td class="data">10.3~10.12</td>
          <td class="data">10����</td>
          <td class="data">20</td>
          <td class="end">1,000,000</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">13</td>
          <td class="ta_l">������ ����Ͻ�</td>
          <td class="data">10.3~10.8</td>
          <td class="data">6����</td>
          <td class="data">30</td>
          <td class="end">600,000</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td height="50">&nbsp;</td>
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
    <td class="pd_l15">- ����� : ������ ����� ���� ����� ���� ���� ���������� ���� ����� �� â�� ������                  ���� ������ ����<br />
- ������� : ������ ����� ������ �о� ������<br />
- ����� : 1-10�� / �ܱ� ���� � <br />
- �������� : ����, ����, CGI, HD����, 3D��ü, ����, �濵 �� ����Ͻ�, ������å, ��Ź�������� �� </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><img src="/images/portal/common/stit_02.gif" alt="����" class="tit" /></td>
  </tr>
  <tr>
    <td class="pd_l15">- ���� �ְ��� ���������� Ȱ���� ������ ���� ���� ���� ���� ���� <br />
      - �оߺ� �����䱸�� ����, Ʈ���� �м��� ���� ������ ���� ���� �߽��� �������� � <br />
      - �������� ��������� ��Ʈ�� ������ ���� ��ǰ�� �������� ����<br />
      - ǳ���� ���� ����� ���� ������ ������ �������� ���� �������� Ȱ�� ���� ���� ����<br />
    - ö���� ���� ������ ���� ���� ȿ�� �� ���� ������ ���� </td>
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
- ���߱��� : �� ������ �����ڰ� ���� ���ռ� ����, ������û ������, �Ҽӱ���� �ο� �ȹ� ��</td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong>�������� � </strong></td>
  </tr>
  <tr>
    <td class="pd_l25"> - ������� : ���� �� �ǽ�����, �������� �ǽ� ���� �� ������ Ŀ��ŧ���� ���� ���� ���� �߽���                ���� �<br />
- �������� : ����ǹ�������, �а������� �� <br />
- �����ý��� �� ��� : ���� �ְ��� ���� ��� Ȱ���� ������ ���� �ǹ� �߽��� ���� �<br />
- ������� : �ѱ���������ī���� ���ǽ�(�� ���ȸ�� ����)</td>
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
    <td class="pd_l25">- ������ü : �ѱ���Ƽ���� 124-50434-242 / ������ : �ѱ������������ 
(�Ա�Ȯ�� �� ���� ����� ��꼭 �߱�)<br />
- ī����� : �ѱ������� ��ī���� Ȩ������(<a href="http://edu.kocca.or.kr" target="_blank">http://edu.kocca.or.kr</a>)���� �¶��� ���� </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong> �뵿�� ������ ȯ��</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">- �뵿�� �����ɷ°��� �Ʒð������� ������ ���������� ���� ��뺸�� �����ڰ� ������ �������� 20��30%�� <br />
&nbsp;&nbsp;�뵿�ηκ��� ȯ�� ����<br />
- �뵿�� ȯ�� ������ ���, ���� ���� �� �ش����� �뵿�繫�ҿ� ������ ȯ�޽�û���� ����</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong> ������� �� ������ ȯ��</strong></td>
  </tr>
  <tr>
    <td class="pd_l25"> - ������� ������ ���αⰣ ���� �ϳ��Ͽ��� �ϸ�, ������ ���� ���������� �������� 7�� ������ �뺸�� ���� ȯ��, <br />
&nbsp;      �� ������ ������� �뺸���� ȯ�� �Ұ�<br />
&nbsp;&nbsp;(������ �������� ������ ���� ��� ���ݵǾ� ����������� ���� Ȯ���� �ʼ������� �����) </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong> ��</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">  �����ο��� ���������� 50% ������ ��쿡�� ������ ��ҵ� �� ������ �� ���, ������ ������� ���� ȯ���� �帳�ϴ�.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" class="pd_l15"><img src="/images/portal/ico/ico_bul_gcircle.gif" width="13" height="13" align="absmiddle" /> <strong> �������</strong></td>
  </tr>
  <tr>
    <td class="pd_l25">   ������ �Ϻδ� ������ �����Ǹ� ������������ ���, ���ĺ�� �Ҽӻ� �δ���</td>
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
    <td class="pd_l15">&bull; ��ۿ���о� : �� 02-2161-0072 / e-mail : offline@kocca.kr / Fax : 02-2161-0078<br />
&bull; �������ۺо� : �� 02-3219-6541 / e-mail : offline@kocca.kr / Fax : 02-2161-0078</td>
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


