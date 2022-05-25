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
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('6');" class="tab_online<%= box.get("tabid").equals("6") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_05_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('7');" class="tab_online<%= box.get("tabid").equals("7") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_06_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('8');" class="tab_online<%= box.get("tabid").equals("8") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_07_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('9');" class="tab_online<%= box.get("tabid").equals("9") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_08_on.gif" /></a></span>
			</td>
		  </tr>
		  <tr><td><img src="/images/portal/homepage_renewal/academy/line_tabunder.gif" /></td></tr>
		  <tr><td>
            <div id="tab8" style="padding-top: 20px;">
              <table width="671"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><p><img src="/images/portal/homepage_renewal/academy/cont_tit07.gif" alt="���ӱ�������ڰݰ���" /></p>
                    <p class="mgt10"><img src="/images/portal/homepage_renewal/academy/cont_stit.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
                    <Br>
                    <Br>
                    <p>���ӻ�������� ���� ȯ�溯ȭ�� ������� �η¼��信 �����ϴ� ����� �����η��� �����ϰ��� ���ӱ�ȹ������, ���ӱ׷���������, �������α׷��������� ��������ڰݰ����� �ǽ��ϰ� �ֽ��ϴ�.</p>
                    <br>
                    <br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle13.gif" alt="�ڰ� ���� ���� ����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;���ӱ�ȹ������, ���ӱ׷���������, �������α׷���������</p>
                    <br>
                    <br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle14.gif" alt="�ڰ� ���� ����" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;���� 7�� ���� �����忡�� �� 4ȸ(�ʱ� 2ȸ, �Ǳ� 2ȸ) ���� ����</p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� �������� : ����, ���, ����, �뱸, �λ�, ����, ����<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(������ �����ο��� ���� ����, ��� ����)</p>
                    <table width="100%" cellspacing="0" id="tab_form" summary="���ӱ������ �ڰ� ���� ���� �����Դϴ�.">
                      <thead>
                        <tr>
                          <td class="tit_table" scope="col">ȸ��</td>
                          <td class="tit_table" scope="col">�ʱ����<br/>��������</td>
                          <td class="tit_table" scope="col">�ʱ����</td>
                          <td class="tit_table" scope="col">�ʱ����<br/>�հݹ�ǥ</td>
						  <td class="tit_table" scope="col">�Ǳ����<br/>��������</td>
						  <td class="tit_table" scope="col">�Ǳ����</td>
						  <td class="tit_table" scope="col">�Ǳ����<br/>�հݹ�ǥ</td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1ȸ</td>
                          <td>4. 16<br />
                            ~ 4. 20</td>
                          <td>5. 13</td>
                          <td>6. 4</td>
                          <td>6. 4<br />
                            ~ 6. 8</td>
                          <td>7. 1</td>
                          <td>8. 6</td>
                        </tr>
                        <tr>
                          <td>2ȸ</td>
                          <td>8. 6<br />
                            ~ 8. 10</td>
                          <td>9. 2</td>
                          <td>9. 24</td>
                          <td>9. 24<br />
                            ~ 9. 28</td>
                          <td>10.28</td>
                          <td>11.26</td>
                        </tr>
                      </tbody>
                    </table>
                    <Br>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle15.gif" alt="��������������" /></p>
                    <p>
                    <table width="100%" cellspacing="0" id="tab_form" summary="���ӱ�������ڰݰ��� ���� ���� ������ �����Դϴ�.">
                      <colgroup>
                      <col width="20%" />
                      <col width="" />
                      <col width="" />
                      </colgroup>
                      <thead>
                       	<tr>
                          <td class="tit_table" scope="col" class="first" width="14%">����</td>
                          <td class="tit_table" scope="col">�ʱ����</td>
                          <td class="tit_table" scope="col">�Ǳ����</td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="first">����</td>
                          <td>�鼮���б�(1ȸ), �Ѿ����(1, 2ȸ),<br/>��������ΰ�(2ȸ)</td>
                          <td>�ѳ����������б�, ȣ�������б�</td>
                        </tr>
                        <tr>
                          <td class="first">���</td>
                          <td>���Ѵ���(��õ)</td>
                          <td>���Ѵ���(��õ)</td>
                        </tr>
                        <tr>
                          <td class="first">����</td>
                          <td>��۴��б�</td>
                          <td>��۴��б�</td>
                        </tr>
                        <tr>
                          <td class="first">�뱸</td>
                          <td>�뱸�����л�������</td>
                          <td>�뱸�����л�������</td>
                        </tr>
                        <tr>
                          <td class="first">�λ�</td>
                          <td>�λ�������������</td>
                          <td>�λ�������������</td>
                        </tr>
                        <tr>
                          <td class="first">����</td>
                          <td>���ϰ��Ӿ�ī����</td>
                          <td>���ϰ��Ӿ�ī����</td>
                        </tr>
                        <tr>
                          <td class="first">����</td>
                          <td>���ְ�������</td>
                          <td>���ְ�������</td>
                        </tr>
                      </tbody>
                    </table>
                    <br/>
                    <p>&nbsp;&nbsp;&nbsp;<b>�� ���� ���� ��Ȳ(2011�� ����)</b></p>
                    <p align="right">(����: ��)</p>
                    <table width="100%" border="0" cellpadding="3" cellspacing="0" id="tab_form" summary=" ���� ���� ��Ȳ " >
                      <colgroup>                      
                      <col width="7%" />
                      <col width="7%" />
                      <col width="7%" />
                      <col width="7%" />
                      <col width="7%" />
                      <col width="7%" />
                      <col width="7%" />
                      <col width="7%" />
                      <col width="7%" />
                      <col width="7%" />
                      <col width="7%" />
                      <col width="7%" />
                      <col width="7%" />
                      <col width="7%" />
                      </colgroup>
                      <thead>
                        <tr>
                          <td class="tit_table" colspan="2" rowspan="2">�� ��</td>
                          <td class="tit_table" colspan="3">���ӱ�ȹ</td>
                          <td class="tit_table" colspan="3">���ӱ׷���</td>
                          <td class="tit_table" colspan="3">�������α׷���</td>
                          <td class="tit_table" colspan="3">�հ�</td>
                        </tr>
                        <tr>
                        	<td>����</td>
                        	<td>�հ�</td>
                        	<td>�հݷ�</td>
                        	<td>����</td>
                        	<td>�հ�</td>
                        	<td>�հݷ�</td>
                        	<td>����</td>
                        	<td>�հ�</td>
                        	<td>�հݷ�</td>
                        	<td>����</td>
                        	<td>�հ�</td>
                        	<td>�հݷ�</td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row" rowspan="2">�ʱ�</th>
                          <td>1ȸ</td>
                          <td>477</td>
                          <td>366</td>
                          <td>76.7%</td>
                          <td>263</td>
                          <td>125</td>
                          <td>47.5%</td>
                          <td>169</td>
                          <td>51</td>
                          <td>30.2%</td>
                          <td>909</td>
                          <td>542</td>
                          <td>59.6%</td>                          
                        </tr>   
                        <tr>
                          <td>2ȸ</td>
                          <td>167</td>
                          <td>115</td>
                          <td>68.9%</td>
                          <td>239</td>
                          <td>72</td>
                          <td>30.1%</td>
                          <td>121</td>
                          <td>19</td>
                          <td>15.7%</td>
                          <td>527</td>
                          <td>206</td>
                          <td>39.1%</td>                          
                        </tr> 
                        <tr>
                          <th scope="row" rowspan="2">�Ǳ�</th>
                          <td>1ȸ</td>
                          <td>272</td>
                          <td>76</td>
                          <td>27.9%</td>
                          <td>174</td>
                          <td>60</td>
                          <td>34.5%</td>
                          <td>58</td>
                          <td>15</td>
                          <td>25.9%</td>
                          <td>504</td>
                          <td>151</td>
                          <td>30.0%</td>                         
                        </tr> 
                        <tr>
                          <td>2ȸ</td>
                          <td>196</td>
                          <td>58</td>
                          <td>29.6%</td>
                          <td>145</td>
                          <td>40</td>
                          <td>27.4%</td>
                          <td>32</td>
                          <td>7</td>
                          <td>21.9%</td>
                          <td>373</td>
                          <td>105</td>
                          <td>28.1%</td>                          
                        </tr>            
                      </tbody>
                    </table>
                    </p>                    
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle16.gif" alt="�����û" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp;�¶��� : <a href="http://www.kgq.or.kr" target="_blank">http://www.kgq.or.kr</a></p>
                    <Br>
                    <p id="s_stit"><img src="/images/portal/homepage_renewal/academy/s_stitle07.gif" alt="���ù���" /></p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp; ������ ���� (02-3219-6536, <a href="mailto:inami@kocca.kr">inami@kocca.kr</a>)</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp; �ּ�ȣ ���� (02-3219-6534, <a href="mailto:thinkju@kocca.kr">thinkju@kocca.kr</a>)</p>
                    <p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/homepage_renewal/academy/s_bul.gif" align="absmiddle" />&nbsp; ������ ��� (02-3219-6542, <a href="mailto:ejred49@kocca.kr">ejred49@kocca.kr</a>)</p>
                    </td>
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
	<p><img src="/images/portal/common/h4_44.gif" alt="���ӱ�������ڰݰ���" /></p>
	<p><img src="/images/portal/common/txt_8_4.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
	<Br>
	<Br>
	<p>���ӻ�������� ���� ȯ�溯ȭ�� ������� �η¼��信 �����ϴ� ����� �����η��� �����ϰ��� ���ӱ�ȹ������, ���ӱ׷���������,<br>
	�������α׷��������� ����ڰݰ����� �ǽ��ϰ� �ֽ��ϴ�.</p>
	<br>
	<br>

	<p><img src="/images/portal/common/stit_14.gif" alt="�ڰ� ���� ���� ����" /></p>
		<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;���ӱ�ȹ������, ���ӱ׷���������, �������α׷���������</p>
	<br>
	<br>

	<p><img src="/images/portal/common/stit_15.gif" alt="�ڰ� ���� ����" /></p>
		<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;���� 6�� ���� �����忡�� �� 4ȸ(�ʱ� 2ȸ, �Ǳ� 2ȸ) ���� ����</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� �������� : ����, ���, ����, �뱸, �λ�, ����</p>

	<table cellspacing="0" summary="���ӱ������ �ڰ� ���� ���� �����Դϴ�." class="basicTable tableTh01 ">
		<caption>���ӱ������ �ڰ� ���� ����</caption>
		<thead>
			<tr>
				<th rowspan="3" class="first" scope="col" width="6%">ȸ��</th>
				<th scope="col" colspan="3">�� ��</th>
				<th scope="col" colspan="4" width="52%">�� ��</th>
			</tr>
			<tr class="depth01">
				<th rowspan="2" scope="col">����</th>
				<th rowspan="2" scope="col">����</th>
				<th rowspan="2" scope="col">�հ�<br />��ǥ</th>
				<th colspan="2" scope="col">�� ��</th>
				<th rowspan="2" scope="col">����</th>
				<th rowspan="2" scope="col">�հ�<br />��ǥ</th>
			</tr>
			<tr class="depth01">
				<th scope="col">���� �ʱ� <br />�հ���</th>
				<th scope="col">��ȸ �հ���</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="first">1ȸ</td>
				<td>4. 18(��)<br />~ 4. 22(��)</td>
				<td>5.15(��)</td>
				<td> 6. 6(��)</td>
				<td>3. 7(��)<br />~ 11(��)</td>
				<td>6. 6(��)<br />~ 10(��)</td>
				<td>7.3(��)<br />~ 7.10(��)</td>
				<td>8.1(��)</td>
			</tr>
			<tr>
				<td class="first">2ȸ</td>
				<td>8. 1(��)<br />~ 8. 5(��)</td>
				<td>8.28(��)</td>
				<td>9. 19(��)</td>
				<td>8. 8(��)<br />~ 8. 12(��)</td>
				<td>9. 19(��)<br />~ 23(��)</td>
				<td>10.16(��)<br />~ 10.23(��)</td>
				<td>11.14(��)</td>
			</tr>
		</tbody>
	</table>

	<Br>
	<Br>
	<p><img src="/images/portal/common/stit_16.gif" alt="��������������" /></p>
	<p><table cellspacing="0" summary="���ӱ�������ڰݰ��� ���� ���� ������ �����Դϴ�." class="basicTable tableTh01" >
		<caption>���ӱ�������ڰݰ��� ���� ���� ������</caption>
		<thead>
			<tr>
			  	<th scope="col" class="first" width="14%">����</th>
				<th scope="col">�ʱ����</th>
				<th scope="col">�Ǳ����</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="first">����</td>
				<td>�������ͳݰ�(1,2ȸ), �Ѿ����б�(1ȸ),<br />����������б�(2ȸ)</td>
				<td>�ѱ�IT���������б�, ȣ�������б�</td>
			</tr>
			<tr>
				<td class="first">�λ�</td>
				<td>�λ�������������</td>
				<td>�λ�������������</td>
			</tr>
			<tr>
				<td class="first">����</td>
				<td>��۴��б�</td>
				<td>��۴��б�</td>
			</tr>
			<tr>
				<td class="first">�뱸</td>
				<td>�뱸�����л�������</td>
				<td>�뱸�����л�������</td>
			</tr>
			<tr>
				<td class="first">����</td>
				<td>���ϰ��Ӿ�ī����</td>
				<td>���ϰ��Ӿ�ī����</td>
			</tr>
			<tr>
				<td class="first">���</td>
				<td>���Ѵ���</td>
				<td>���Ѵ���</td>
			</tr>									
		</tbody>
	</table></p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_17.gif" alt="�����û" /></p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;�¶��� / <a href="http://www.kgq.or.kr" target="_blank">http://www.kgq.or.kr</a></p>
	<Br>
	<Br>

	<p><img src="/images/portal/common/stit_18.gif" alt="���ù���" /></p>
	test
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;â���η¾缺�� ������ ���� (02-3219-6536, <a href="mailto:inami@kocca.kr">inami@kocca.kr</a>)</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;â���η¾缺�� �ּ�ȣ ���� (02-3219-6534, <a href="mailto:thinkju@kocca.kr">thinkju@kocca.kr</a>)</p>
	<p>&nbsp;&nbsp;&nbsp;<img src="/images/portal/common/bul_dot01.gif" align="absmiddle" />&nbsp;â���η¾缺�� ������ ��� (02-3219-6542, <a href="mailto:ejred49@kocca.kr">ejred49@kocca.kr</a>)</p>
	</td>
  </tr>
</table>
<%} %>
</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->


