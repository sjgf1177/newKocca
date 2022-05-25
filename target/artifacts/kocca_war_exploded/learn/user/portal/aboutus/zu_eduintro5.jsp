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
          <td class="h_road">Home &gt; ��ī���� �Ұ� &gt; <strong>������� �ȳ�</strong></td>
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
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('5');" class="tab_online<%= box.get("tabid").equals("5") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_04_on.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('6');" class="tab_online<%= box.get("tabid").equals("6") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_05_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('7');" class="tab_online<%= box.get("tabid").equals("7") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_06_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('8');" class="tab_online<%= box.get("tabid").equals("8") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_07_off.gif" /></a></span>
				<span style="padding-right: 1px; float: left; margin: 0px;"><a href="javascript:selectArea('9');" class="tab_online<%= box.get("tabid").equals("9") ? " tab_online_on" : "" %>"><img src="/images/portal/homepage_renewal/academy/tab_08_off.gif" /></a></span>
			</td>
		  </tr>
		  <tr><td><img src="/images/portal/homepage_renewal/academy/line_tabunder.gif" /></td></tr>
		  <tr><td>
            <div id="tab4" style="padding-top: 20px;">
              <table width="671"  border="0" cellpadding="0" cellspacing="0">
                <p><img src="/images/portal/homepage_renewal/academy/cont_tit08.gif" alt="���� ��������" /></p>
                    <p class="mgt10"> <img src="/images/portal/homepage_renewal/academy/cont_stit.gif" alt="�ѱ�������������� �����ϴ� �η¾缺��� �ȳ��Դϴ�." /></p>
                    <Br>
                    <Br>
                <tr>
                  <td>�����ڰ��������ʹ� �̱��� Apple��, Avid��, Digidesign��, ���� Quantel �� �� �ؿ� ����������� ��Ʈ�ʽ��� �����Ͽ� ������ Video/Audio �о�, HD�Կ� �� 5�� �о��� ���� �ڰ��������͸� ��ϸ� ���� �԰ݰ� ���� ü�迡 �´� ������� ���� �۷ι� ������� ���� ������ ������� �η��� �缺�ϰ� �ֽ��ϴ�.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><table border="0" cellpadding="3" cellspacing="0"  id="tab_form2">
                      <colgroup>
                      <col width="15%" />
                      <col width="" />
                      <col width="35%" />
                      </colgroup>
                      <thead>
                        <tr>
                          <td class="tit_table">������������</td>
                          <td class="tit_table">���Ȳ</td>
                          <td class="tit_table">���</td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="data" rowspan="2">Avid Authorized Training<br />
                            Partner(AATP)</td>
                          <td class="ta_l fs_s lp_1">- Avid �������� ����, Instructor�� ���� ���� �԰��� <br />
                            &nbsp;            �������� ����<br />
                            - ���� ���� �� ����ڿ� ���� �׽�Ʈ�� ���� ���� <br />
                            &nbsp;            Cerificate ��� ����<br />
                            - �����: Media Composer 101, 201, 202, 203, 205, 220, 324</td>
                          <td rowspan="2" class="end"><strong>Avid(ڸ)</strong><br />
                            Avid ���� ������������ ����(2008��)<br />
                            Pro school ����(2003)</td>
                        </tr>
                        <tr>
                          <td class="ta_l fs_s lp_1">- Avid ������ ����, Instructor�� ���� ���� �԰��� <br />
                            &nbsp;            ����� ����<br />
                            - ���� ���� �׽�Ʈ�� ���� ���� Certificate��� ����<br />
                            - �����: Pro Tools 101, 110, 201, 210M, 210P</td>
                        </tr>
                        <tr>
                          <td class="data">Apple Authorized Training<br />
                            Center(AATC)</td>
                          <td class="ta_l fs_s lp_1">- Apple �������� ����, Instructor�� ���� ���� �԰��� <br />
                            &nbsp;            Final Cut Pro ����<br />
                            - ���� ���� �� ����ڿ� ���� �׽�Ʈ�� ���� ���� <br />
                            &nbsp;            Certificate��氡��<br />
                            - �����: Final Cut Pro Level��,��</td>
                          <td class="end"><strong>Apple(ڸ)</strong><br />
                            Apple���� ������������ ����(2007��)</td>
                        </tr>
                      </tbody>
                    </table>
                    <br /></td>
                </tr>
              </table>
              <br />
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
    
 <table width="690"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20">&nbsp;</td>
  </tr>
  <tr>
    <td>�����ڰ��������ʹ� �̱��� Apple��, Avid��, Digidesign��, ���� Quantel �� �� �ؿ� ����������� ��Ʈ�ʽ��� �����Ͽ� ������ Video/Audio �о�, HD�Կ� �� 5�� �о��� ���� �ڰ��������͸� ��ϸ� ���� �԰ݰ� ���� ü�迡 �´� ������� ���� �۷ι� ������� ���� ������ ������� �η��� �缺�ϰ� �ֽ��ϴ�.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30">&nbsp;</td>
  </tr>
  <tr>
    <td><table class="row_list">
      <colgroup>
        <col width="23%" />
        <col width="" />
        <col width="32%" />
        </colgroup>
      <thead>
        <tr>
          <th>������������</th>
          <th>���Ȳ</th>
          <th>���</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="data" rowspan="2">Avid Authorized Training<br />
            Partner(AATP)</td>
          <td class="ta_l fs_s lp_1">- Avid �������� ����, Instructor�� ���� ���� �԰��� <br />
&nbsp;            �������� ����<br />
            - ���� ���� �� ����ڿ� ���� �׽�Ʈ�� ���� ���� <br />
&nbsp;            Cerificate ��� ����<br />
            - �����: Media Composer 101, 201, 202, 203, 205, 220, 324</td>
          <td rowspan="2" class="end"><strong>Avid(ڸ)</strong><br />
            Avid ���� ������������ ����(2008��)<br />
            Pro school ����(2003)</td>
        </tr>
        <tr>
          <td class="ta_l fs_s lp_1">- Avid ������ ����, Instructor�� ���� ���� �԰��� <br />
  &nbsp;            ����� ����<br />
            - ���� ���� �׽�Ʈ�� ���� ���� Certificate��� ����<br />
            - �����: Pro Tools 101, 110, 201, 210M, 210P</td>
          </tr>
        <tr>
          <td class="data">Apple Authorized Training<br />
            Center(AATC)</td>
          <td class="ta_l fs_s lp_1">- Apple �������� ����, Instructor�� ���� ���� �԰��� <br />
&nbsp;            Final Cut Pro ����<br />
            - ���� ���� �� ����ڿ� ���� �׽�Ʈ�� ���� ���� <br />
&nbsp;            Certificate��氡��<br />
            - �����: Final Cut Pro Level��,��</td>
          <td class="end"><strong>Apple(ڸ)</strong><br />
            Apple���� ������������ ����(2007��)</td>
        </tr>
      </tbody>
    </table>      <br /></td>
  </tr>
  <tr>
    <td class="pd_l15">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<%} %>
</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->


