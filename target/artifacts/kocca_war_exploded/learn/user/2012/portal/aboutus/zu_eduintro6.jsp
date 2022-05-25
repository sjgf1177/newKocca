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
           		<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('2');" class="tab_online<%= box.get("tabid").equals("2") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_02_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('3');" class="tab_online<%= box.get("tabid").equals("3") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_03_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('5');" class="tab_online<%= box.get("tabid").equals("5") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_04_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('6');" class="tab_online<%= box.get("tabid").equals("6") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_05_on.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('7');" class="tab_online<%= box.get("tabid").equals("7") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_06_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('8');" class="tab_online<%= box.get("tabid").equals("8") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_07_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('9');" class="tab_online<%= box.get("tabid").equals("9") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_08_off.gif" /></a></span>
			</td>
		  </tr>
		  <tr><td><img src="/images/portal/homepage_renewal/academy/line_tabunder.gif" /></td></tr>
		  <tr><td>
            <div id="tab5" style="padding-top: 20px;">
              <table width="671"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><p><img src="/images/portal/homepage_renewal/academy/cont_tit04.gif" alt="3D ��ü������ �����η¾缺" /></p>
                    <p class="mgt10"> <img src="/images/portal/homepage_renewal/academy/cont_stit.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
                    <Br>
                    <Br>
                    <p>3D ��ü������ �����η¾缺 ������ 3D ��ü������ ���� ���۱���� ���� ������ ���� �ؿ� ���� ������ ������ ������ ���� �ٽ����縦 �缺�ϱ� ���� �������α׷��Դϴ�.</p>
                    <Br>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle04.gif" alt="����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;����� : 3D ��ü���� ���� �оߺ� ���� �η� �缺�� ���� ���� 3D ������ ����� ���� ���� ����</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;�������</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- S3D ���α׷� ���۰��� : ������ ��� ������</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- S3D ��ü ���۱�� ����缺 : ������ ��� ������</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- S3D ����Ʈ ����缺���� : �����η�(����������, �������, �������� ��)</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;�����</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- S3D ���α׷� ���۰��� : 3D��ü��ǰ�������������� ���� �� �ǽ�</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- S3D ��ü ���۱�� ����缺 : 3D��ȹ/�Կ�/����/�׷���/���׷����׷���</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- S3D ����Ʈ ����缺���� : �� ���̽��� ������Ʈ ������ ���� ���� ���� �ǽ��� ���ڸ� â���� ���� Job-matching</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;��������</p>
                    <table cellspacing="0" id="tab_form" summary="3D ��ü������ �����η¾缺 �������� �� �Ⱓ �� �����Դϴ�.">
                      <colgroup>
                      <col width="13%" />
                      <col width="" />
                      <col width="16%" />
                      <col width="10%"/>
                      <col width="10%" />
                      </colgroup>
                      <thead>
                        <tr>
                          <td class="tit_table">�о�</td>
                          <td class="tit_table" width="30%">������</td>
                          <td class="tit_table">����</td>
                          <td class="tit_table">�Ⱓ</td>
                          <td class="tit_table">�ο�</td>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr>
                          <td colspan="4">�� ��</td>
                          <td>1,025��</td>
                        </tr>
                      </tfoot>
                      <tbody>
                      	<tr>
                          <td rowspan="1" bgcolor="#f6f6f6">S3D ���α׷�<br/>
								���۰���<br />
								(10�� ����)</td>
                          <td>S3D ���α׷� ���۰���</td>
                          <td>12�� 03�� ~ 13�� 02��</td>
                          <td>-</td>
                          <td>100��</td>
                        </tr>
                        
                        <tr>
                          <td bgcolor="#f6f6f6" scope="row" rowspan="38">3D ��ü<br/>
                          		���۱��<br/>
                            	����缺 ����<br/>
                            	(38����)</td>
                          <td>3ALITY  ���� ��ũ�ϼ� ���� 1��</td>
                          <td>04.04  ~ 04.06</td>
                          <td>3��</td>
                          <td>10��</td>
                        </tr>
                      <tr>
                      	<td>Smoke�� Ȱ���� 3D��ü ���� ���� 1��</td>
                        <td>04.16  ~ 04.20</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Avid�� Ȱ���� 3D��ü ���� ���� 1��</td>
                        <td>04.23  ~ 04.27</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>���׷����׷��� ���� 1��</td>
                        <td>04.23  ~ 04.27</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>3D��ü Ư���Կ� ����</td>
                        <td>05.14  ~ 05.18</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Avid�� Ȱ���� 3D��ü ���� ���� 2��</td>
                        <td>05.21  ~ 05.25</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>P+S Technik ���� ��ũ�ϼ� ���� 1��</td>
                        <td>05.21  ~ 05.25</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>3D��ü Quasar ���� ��ũ�ϼ� 1��</td>
                        <td>05.29  ~ 05.31</td>
                        <td>3��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Cinema4D�� Ȱ���� 3D��ü ���� ���� 1��</td>
                        <td>06.11  ~ 06.15</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>3D��ü �����Կ� ����</td>
                        <td>06.18  ~ 06.22</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Avid�� Ȱ���� 3D��ü ���� ���� 3��</td>
                        <td>06.25  ~ 06.29</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>3D��ü ������ũ��</td>
                        <td>06.28  ~ 07.06</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>3ALITY ���� ��ũ�ϼ� ���� 2��</td>
                        <td>07.04  ~ 07.06</td>
                        <td>3��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Smoke�� Ȱ���� 3D��ü ���� ���� 2��</td>
                        <td>07.09  ~ 07.13</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>3D��ü Quasar ���� ��ũ�ϼ� 2��</td>
                        <td>07.16  ~ 07.20</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Nuke�� Ȱ���� 3D��ü �������� ���� 1��</td>
                        <td>07.16  ~ 07.20</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Avid�� Ȱ���� 3D��ü ���� ���� 4��</td>
                        <td>07.23  ~ 07.27</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Nuke�� Ȱ���� 3D��ü �������� ���� 2��</td>
                        <td>07.30  ~ 08.03</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>DSLR�� Ȱ���� 3D��ü �Կ� ����</td>
                        <td>08.06  ~ 08.10</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Avid�� Ȱ���� 3D��ü ���� ���� 5��</td>
                        <td>08.20  ~ 08.24</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>After Effect�� Ȱ���� 3D��ü ��Ǳ׷��� 1��</td>
                        <td>08.27  ~ 08.31</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Nuke�� Ȱ���� 3D��ü �������� ���� 3��</td>
                        <td>09.03  ~ 09.07</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>���׷����׷��� ���� 2��</td>
                        <td>09.10  ~ 09.14</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>���׵�ķ �Կ� ����</td>
                        <td>09.17  ~ 09.21</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>3D��ü ��� ���� ����</td>
                        <td>09.24  ~ 09.28</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>3D��ü ��ȭ ���� ���� 3��</td>
                        <td>09.26  ~ 09.28</td>
                        <td>3��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>3D��ü ��ť���͸� ���� ����</td>
                        <td>10.08  ~ 10.12</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Nuke�� Ȱ���� 3D��ü �������� ���� 4��</td>
                        <td>10.08  ~ 10.12</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>�ؿ� ��ũ�� - �������� WETA(����������3D)</td>
                        <td>10.07  ~ 10.14</td>
                        <td>8��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Smoke�� Ȱ���� 3D��ü ���� ���� 3��</td>
                        <td>10.15  ~ 10.19</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>3D��ü �װ� �Կ� ����</td>
                        <td>10.22  ~ 10.26</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>P+S Technik���� ��ũ�ϼ� 2��</td>
                        <td>10.29  ~ 10.31</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>After Effect�� Ȱ���� 3D��ü ��Ǳ׷��� 2��</td>
                        <td>10.29  ~ 10.31</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>3D��ü �Կ� ����</td>
                        <td>11.07  ~ 11.9</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Nuke�� Ȱ���� 3D��ü �������� ���� 5��</td>
                        <td>11.12  ~ 11.16</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Avid�� Ȱ���� 3D��ü ���� ���� 6��</td>
                        <td>11.19  ~ 11.23</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Frame Forge�� Ȱ���� 3D��ü ���� ����</td>
                        <td>12.03  ~ 12.07</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>Avid�� Ȱ���� 3D��ü ���� ���� 7��</td>
                        <td>12.17  ~ 12.21</td>
                        <td>5��</td>
                        <td>10��</td>
                      </tr>                      
                      
                      <tr>
                        <th scope="row" rowspan="3">S3D ����Ʈ<br />
                          	����缺 ����<br />
                          	(3�� ����)</th>
                        <td>S3D Pre-Production ����</td>
                        <td>03�� ~ 12��</td>
                        <td>10����</td>
                        <td>10��</td>
                      </tr>
                      <tr>
                        <td>S3D Production ����</td>
                        <td>03�� ~ 12��</td>
                        <td>10����</td>
                        <td>15��</td>
                      </tr> 
                      <tr>
                        <td>S3D Post-Production ����</td>
                        <td>03�� ~ 12��</td>
                        <td>10����</td>
                        <td>20��</td>
                      </tr>
                      
                      <tr>
                        <th scope="row" rowspan="3">�ؿ���û ��ũ��<br />
                          	(3ȸ)</th>
                        <td>���ﱹ��3D�����ü���̵���μ��̳�/�����Ī</td>
                        <td>05.15  ~ 05.18</td>
                        <td>4��</td>
                        <td>100��</td>
                      </tr>
                      <tr>
                        <td>VFX���۹�������û��ũ��</td>
                        <td>09.10  ~ 09.14</td>
                        <td>5��</td>
                        <td>100��</td>
                      </tr> 
                      <tr>
                        <td>3D DIRECTOR��ũ��</td>
                        <td>11.05  ~ 11.09</td>
                        <td>5��</td>
                        <td>100��</td>
                      </tr>
                      
                      <tr>
                        <th scope="row" rowspan="1">�������� ��������<br />
                          	(10ȸ)</th>
                        <td>���� ���� �� ����� ���� ����(10ȸ)</td>
                        <td>12�� 07�� ~ 12�� 09��<br/>
							12�� 12�� ~ 13�� 02��</td>
                        <td>-</td>
                        <td>200��</td>
                      </tr>
                      </tbody>
                      
                    </table>
                    <Br>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle05.gif" alt="�����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;3D ��ü���� ���� �оߺ� �ܱ� �ǹ� �ǽ� ���� �</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;���� 3D ������Ʈ �߽����� ���������������� ���� ��������</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;ǳ���� ���� ����� ���� ������ ������ �������� ���� �������� Ȱ�� ���� ���� ����</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;ö���� ���� ������ ���� ���� ȿ�� �� ���� ������ ����</p>
                    <Br>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle06.gif" alt="����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;<b>���� ��û/����</b></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ��û��� : �¶��� ��û / <a href="http://edu.kocca.or.kr">http://edu.kocca.or.kr</a></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ���߱��� : �� ������ �����ڰ� ���� ���ռ� ����, ������û ������, �Ҽӱ���� �ο� �ȹ� ��</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� �߱ⱳ�������� ���÷� ������ �������� ���� ���� ��û/���߱��� ����</p>
                    <Br>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;<b>�������� �</b></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : ���� �� �ǽ�����, �������� �ǽ� ���� �� ������ Ŀ��ŧ���� ���� ���� ���� �߽��� ���� �</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �������� : �� ���� ����ǹ�������, �а������� ��</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �����ý��� �� ��� : ���� �ְ��� ���� ��� Ȱ���� ������ ���� �ǹ� �߽��� ���� �</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : �ѱ���������ī���� ���ǽ�(�� ���ȸ�� ����)</p>
                    <Br>
                    <Br>
                    <p  id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle07.gif" alt="�������� ����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;�ֺ��� ���� (02-3219-6528, <a href="mailto:bhjoo@kocca.kr">bhjoo@kocca.kr</a>)</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;�ӱԺ� ���� (02-3219-6530, <a href="mailto:bok@kocca.kr">bok@kocca.kr</a>)<br />
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;������ ���� (02-3219-6531, <a href="mailto:shurike@kocca.kr">shurike@kocca.kr</a>)<br />
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
 <link rel="stylesheet" href="/css/20110727.css" type="text/css">   
 <table width="690"  border="0" cellpadding="0" cellspacing="0">
  <tr>
	<td>
		<p><img src="/images/portal/common/h4_40.gif" alt="3D ��ü������ �����η¾缺" /></p>
	<p><img src="/images/portal/common/txt_8.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
	<Br>
	<Br>

	<p>3D ��ü������ �����η¾缺 ������ 3D ��ü������ ���� ���۱���� ���� ������ ���� �ؿ� ���� ������ ������ ������ ����<br />
	 �ٽ����縦 �缺�ϱ� ���� �������α׷��Դϴ�.</p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_01.gif" alt="����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;����� : 3D ��ü���� ���� �оߺ� ���� �η� �缺�� ���� ���� 3D ������ ����� ���� ���� ����</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�������</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 3D ��ü ���۱�� ����缺 : ���� �о� ���� ������</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������Ʈ ���� 3D ��ü ���� ����缺 : 3D ��ü ��ǰ ���� ���� �η�</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�����</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 3D ��ü ���۱�� ����缺 : 3D��ȹ/�Կ�/����/�׷���/���׷����׷���</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������Ʈ ���� 3D ��ü ���� ����缺 : ��ǰ �������� ���� '������' ���� ����</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;��������</p>


	<table cellspacing="0" summary="3D ��ü������ �����η¾缺 �������� �� �Ⱓ �� �����Դϴ�." class="basicTable tableTh01">
		<caption>3D ��ü������ �����η¾缺 �������� �� �Ⱓ</caption>
		<thead>
			<tr>
				<th>�о�</th>
				<th width="30%">������</th>
				<th>����</th>
				<th>�Ⱓ</th>
				<th>�ο�</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th scope="row" >�հ�</th>
				<td>31�� ����</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>350��</td>
			</tr>
		</tfoot>
		<tbody>
			<tr>
				<th scope="row" rowspan="27">3D ��ü<br />
				���۱��<br />
				����缺<br />
				(27����)</th>
				<td class="alignL">3D��ü�����������-1��</td>
				<td>3.21~4.25</td>
				<td>5��</td>
				<td>12��</td>
			</tr>
			<td class="alignL">3D��ü�����������-2��</td>
				<td>10.10~10.14</td>
				<td>3��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü�����������-3��</td>
				<td>12.5~12.9</td>
				<td>5��</td>
				<td>12��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü�Կ�����-1��</td>
				<td>3.28~4.1</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü�Կ�����-2��</td>
				<td>4.25~4.29</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü�Կ�����-3��</td>
				<td>5.23~5.27</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü�Կ�����-4��</td>
				<td>9.19~9.23</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü�Կ�����-5��</td>
				<td>&nbsp;</td>
				<td>3��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü�Կ�����-6��</td>
				<td>10.31~11.4</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü�Կ�����-7��</td>
				<td>11.14~11.18</td>
				<td>5��</td>
				<td>10��</td>
			</tr>                                   
			<tr>
				<td class="alignL">3D��ü�Կ�����-8��</td>
				<td>12.12~12.16</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü��������-1��</td>
				<td>4.4~4.8</td>
				<td>5��</td>
				<td>11��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü��������-2��</td>
				<td>5.16~5.20</td>
				<td>5��</td>
				<td>11��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü��������-3��</td>
				<td>5.30~6.3</td>
				<td>5��</td>
				<td>11��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü��������-4��</td>
				<td>6.20~6.24</td>
				<td>5��</td>
				<td>11��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü��������-5��</td>
				<td>7.4~7.8</td>
				<td>5��</td>
				<td>11��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü��������-6��</td>
				<td>9.26~9.30</td>
				<td>5��</td>
				<td>11��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü��������-7��</td>
				<td>11.7~11.11</td>
				<td>5��</td>
				<td>11��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü��������-8��</td>
				<td>11.28~12.2</td>
				<td>5��</td>
				<td>11��</td>
			</tr>
			<tr>
				<td class="alignL">3D��üVFX����-1��</td>
				<td>4.11~4.15</td>
				<td>5��</td>
				<td>12��</td>
			</tr>
			<tr>
				<td class="alignL">3D��üVFX����-2��</td>
				<td>10.24~10.28</td>
				<td>5��</td>
				<td>12��</td>
			</tr>
			<tr>
				<td class="alignL">3D��üVFX����-3��</td>
				<td>11.21~11.25</td>
				<td>5��</td>
				<td>12��</td>
			</tr>
			<tr>
				<td class="alignL">���׷����׷��۰���-1��</td>
				<td>4.18~4.22</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">���׷����׷��۰���-2��</td>
				<td>6.27~7.1</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">���׷����׷��۰���-3��</td>
				<td>10.17~10.21</td>
				<td>5��</td>
				<td>10��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü���Ӱ���-1��</td>
				<td>&nbsp;</td>
				<td>5��</td>
				<td>15��</td>
			</tr>
			<tr>
				<td class="alignL">3D��ü���Ӱ���-2��</td>
				<td>&nbsp;</td>
				<td>3��</td>
				<td>15��</td>
			</tr>
			<tr>
				<th scope="row">������Ʈ ����<br />
				3D ��ü ����<br />
				����缺(4����)</th>
				<td class="alignL">������Ʈ ���̽�<br />
				���豳��(5ȸ)</td>
				<td>��ⱳ��<br />(3��~12��)</td>
				<td>&nbsp;</td>
				<td>50��</td>
			</tr>
		</tbody>
	</table>

	<Br>
	<Br>
	<p><img src="/images/portal/common/stit_02.gif" alt="�����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;3D ��ü���� ���� �оߺ� �ܱ� �ǹ� �ǽ� ���� �</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;���� 3D ������Ʈ �߽����� ���������������� ���� ��������</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;ǳ���� ���� ����� ���� ������ ������ �������� ���� �������� Ȱ�� ���� ���� ����</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;ö���� ���� ������ ���� ���� ȿ�� �� ���� ������ ����</p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_03.gif" alt="�����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;<b>���� ��û/����</b></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ��û��� : �¶��� ��û / <a href="http://edu.kocca.or.kr">http://edu.kocca.or.kr</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ���߱��� : �� ������ �����ڰ� ���� ���ռ� ����, ������û ������, �Ҽӱ���� �ο� �ȹ� ��</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� �߱ⱳ�������� ���÷� ������ �������� ���� ���� ��û/���߱��� ����</p>
	<Br>

	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;<b>�������� �</b></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : ���� �� �ǽ�����, �������� �ǽ� ���� �� ������ Ŀ��ŧ���� ���� ���� ���� �߽��� ���� �</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �������� : �� ���� ����ǹ�������, �а������� ��</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- �����ý��� �� ��� : ���� �ְ��� ���� ��� Ȱ���� ������ ���� �ǹ� �߽��� ���� �</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ������� : �ѱ���������ī���� ���ǽ�(�� ���ȸ�� ����)</p>
	<Br>
	<Br>


	<p><img src="/images/portal/common/stit_05.gif" alt="�������� ����" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�����η¾缺�� �ֺ��� ���� (02-3219-6528, <a href="mailto:bhjoo@kocca.kr">bhjoo@kocca.kr</a>)</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�����η¾缺�� �ӱԺ� ���� (02-3219-6530, <a href="mailto:bok@kocca.kr">bok@kocca.kr</a>)</p>
	</td>
  </tr>
</table>
<%} %>
</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->


