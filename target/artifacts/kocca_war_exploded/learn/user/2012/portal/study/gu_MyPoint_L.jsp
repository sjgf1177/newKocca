<%
//**********************************************************
//  1. ��      ��: ���� ����Ʈ
//  2. ���α׷���: gu_MyPoint_L.jsp
//  3. ��      ��: ����Ʈ
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.01
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if (box == null) box = RequestManager.getBox(request);

	NumberFormat s_fmt = NumberFormat.getInstance();				//��ȭ���� ,ǥ��

    int		v_totgetpoint	= box.getInt("p_getpoint");       
    int		v_totusepoint	= box.getInt("p_usepoint");       
    int		v_totwaitpoint	= box.getInt("p_waitpoint");       
	int		v_availablepoint = v_totgetpoint - v_totusepoint - v_totwaitpoint;
	String	v_availablepoint_text = s_fmt.format(v_availablepoint); 
	
    ArrayList list1     = null;
    ArrayList list2     = null;
    ArrayList list3     = null;    

    list1 = (ArrayList)request.getAttribute("selectHavePointList");		//��������Ʈ
    list2 = (ArrayList)request.getAttribute("selectStoldPointList");	//��������Ʈ
    list3 = (ArrayList)request.getAttribute("selectUsePointList");		//�������Ʈ
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
// Tab ���ý� ����
function showTab(clickTab)
{
	g_showTab(clickTab, 4);
}

function g_showTab(tabNo, count)
{

	var clickTabNo = new Number(tabNo);
	var tabCount   = new Number(count);

	if( clickTabNo == 0 || tabCount == 0 ) return;

	for(i=1; i<=tabCount; i++)
    {
		div = document.all["tab_"+i];

		if(!div) return;

		if( clickTabNo == i ) {
			// Ȱ��ȭ�� tab Ŭ���� return
			if(div.style.display == "") return;
			div.style.display = ""
		}
		else {
			// ���õ��� �ʴ� �ǵ��� ������ ����.
			if(div.style.display != "none") {
				div.style.display = "none";
			}
		}
	}
}
//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
			<h2><img src="/images/portal/myclass/h2_tit6.gif" alt="��������Ʈ" class="fl_l" /><p class="category">Home > ���ǰ��ǽ� > <strong>��������Ʈ</strong></p></h2>
 
			<dl class="mypoint_info">
				<dt><img src="/images/portal/myclass/mypoint_img1.gif" alt="" /></dt>
				<dd>
					<p>���� ����Ʈ : <strong><%= v_availablepoint_text %></strong> Point</p>
					<ul>
						<li>���� ��������Ʈ, ����Ʈ ��������, ����Ʈ ��볻���� Ȯ���Ͻ� �� �ֽ��ϴ�.</li>
						<li>����Ʈ�� ��ȿ�Ⱓ�� �����Ϸκ��� 1���Դϴ�</li>
					</ul>
				
				</dd>
			</dl>

            <div id="tab_1" >

			<ul class="tabwrap mg_t35">
				<li><a href="javascript:showTab(1)" class="tab_myclass tab_myclass_on"><span>��������Ʈ</span></a></li>
				<li><a href="javascript:showTab(2)" class="tab_myclass"><span>��������Ʈ</span></a></li>
				<li><a href="javascript:showTab(3)" class="tab_myclass"><span>�������Ʈ</span></a></li>
			</ul>

			<table class="board_list">
			<colgroup><col width="240px" /><col width="150px" /><col width="150px" /><col width="150px" /></colgroup>
			<thead>
			<tr class="myclass">
				<th><p>���泯��</p></th>
				<th><p>��������Ʈ</p></th>
				<th><p>�������Ʈ</p></th>
				<th class="end"><p>��������Ʈ</p></th>
			</tr>
			</thead>
			<tbody>
<%
	for(int i = 0; i < list1.size(); i++) {

		DataBox dbox1 = (DataBox)list1.get(i);

		String	v_tid			=  dbox1.getString("d_tid");
		String	v_getdate		=  dbox1.getString("d_getdate");
		String	v_getpoint		=  s_fmt.format(dbox1.getInt("d_getpoint"));
		String	v_usepoint		=  s_fmt.format(dbox1.getInt("d_usepoint"));
		String	v_usepoint_text	=  dbox1.getString("d_usepoint");
		String	v_lefrpoint		=  s_fmt.format(dbox1.getInt("d_lefrpoint"));
		String	v_expiredate	=  dbox1.getString("d_expiredate");

		v_getdate      = FormatDate.getFormatDate(v_getdate,"yyyy.MM.dd");
%>                 
			<tr onmouseover="className='over'" onmouseout="className=' '">
				<td class="num"><%= v_getdate %></td>
				<td class="num ta_r"><%= v_getpoint %></td>
				<td class="num ta_r"><%= "0".equals(v_usepoint) ? v_usepoint_text : v_usepoint %></td>
				<td class="num ta_r"><strong><%= v_lefrpoint %></strong></td>
			</tr>
<%
	}
%>
<%	if(list1.size() == 0 ){%>
       	    <tr>
		    	<td height="3" colspan="4" align="center">����Ʈ ������ �����ϴ�.</td>
		    </tr>
<%	}%>
			</tbody>
			</table>

            </div>
		    <div id="tab_2" STYLE="display:none">                        

			<ul class="tabwrap mg_t35">
				<li><a href="javascript:showTab(1)" class="tab_myclass"><span>��������Ʈ</span></a></li>
				<li><a href="javascript:showTab(2)" class="tab_myclass tab_myclass_on"><span>��������Ʈ</span></a></li>
				<li><a href="javascript:showTab(3)" class="tab_myclass"><span>�������Ʈ</span></a></li>
			</ul>

			<table class="board_list">
			<colgroup><col width="110px" /><col width="190px" /><col width="130px" /><col width="130px" /><col width="130px" /></colgroup>
			<thead>
			<tr class="myclass">
				<th><p>��������</p></th>
				<th><p>��������Ʈ</p></th>
				<th><p>��������</p></th>
				<th><p>������</p></th>
				<th class="end"><p>�����ݾ�</p></th>
			</tr>
			</thead>
			<tbody>
<%
	for(int i = 0; i < list2.size(); i++) {
		DataBox dbox2 = (DataBox)list2.get(i);

		String	v_tid			=  dbox2.getString("d_tid");
		String	v_getdate		=  dbox2.getString("d_getdate");
		String	v_title			=  dbox2.getString("d_title");
		String	v_getpoint		=  s_fmt.format(dbox2.getInt("d_getpoint"));
		String	v_subjprice		=  s_fmt.format(dbox2.getInt("d_subjprice"));
		String	v_price			=  s_fmt.format(dbox2.getInt("d_price"));
	
		v_getdate      = FormatDate.getFormatDate(v_getdate,"yyyy.MM.dd");
%>                 
			<tr onmouseover="className='over'" onmouseout="className=' '">
				<td class="num"><%= v_getdate %></td>
				<td class="num ta_r"><%= v_getpoint %></td>
				<td><%= v_title %></td>
				<td class="num ta_r"><%= v_subjprice %></td>
				<td class="num ta_r"><strong><%= v_price %></strong></td>
			</tr>
<%
	}
%>
<%	if(list1.size() == 0 ){%>
       	    <tr>
		    	<td height="20" colspan="5" align="center">����Ʈ ������ �����ϴ�.</td>
		    </tr>
<%	}%>
			</tbody>
			</table>

            </div>
            <div id="tab_3" STYLE="display:none">                        

			<ul class="tabwrap mg_t35">
				<li><a href="javascript:showTab(1)" class="tab_myclass"><span>��������Ʈ</span></a></li>
				<li><a href="javascript:showTab(2)" class="tab_myclass"><span>��������Ʈ</span></a></li>
				<li><a href="javascript:showTab(3)" class="tab_myclass tab_myclass_on"><span>�������Ʈ</span></a></li>
			</ul>

			<table class="board_list">
			<colgroup><col width="110px" /><col width="305px" /><col width="95px" /><col width="90px" /><col width="90px" /></colgroup>
			<thead>
			<tr class="myclass">
				<th><p>�������</p></th>
				<th><p>������</p></th>
				<th><p>�������Ʈ</p></th>
				<th><p>������</p></th>
				<th class="end"><p>�����ݾ�</p></th>
			</tr>
			</thead>
			<tbody>
<%
	for(int i = 0; i < list3.size(); i++) {
		
		DataBox dbox3 = (DataBox)list3.get(i);
	
		String	v_tid			=  dbox3.getString("d_tid");
		String	v_usedate		=  dbox3.getString("d_usedate");
		String	v_title			=  dbox3.getString("d_title");
		String	v_usepoint		=  s_fmt.format(dbox3.getInt("d_usepoint"));
		String	v_subjprice		=  s_fmt.format(dbox3.getInt("d_subjprice"));
		String	v_price			=  s_fmt.format(dbox3.getInt("d_price"));
	
		v_usedate      = FormatDate.getFormatDate(v_usedate,"yyyy.MM.dd");
%>                 
			<tr onmouseover="className='over'" onmouseout="className=' '">
				<td class="num"><%= v_usedate %></td>
				<td class="ta_l"><%= v_title %></td>
				<td class="num ta_r"><%= v_usepoint %></td>
				<td class="num ta_r"><%= v_subjprice %></td>
				<td class="num ta_r"><strong><%= v_price %></strong></td>
			</tr>
<%
	}
%>
<%	if(list1.size() == 0 ){%>
       	    <tr>
		    	<td height="20" colspan="5" align="center">����Ʈ ������ �����ϴ�.</td>
		    </tr>
<%	}%>
			</tbody>
			</table>

            </div>
	<!-- 		
			<div class="explan_info mg_t45">
				<div class="explan_info_in">
					<dl>
						<dt><img src="/images/portal/myclass/point_t1.gif" alt="����Ʈ �ȳ�" /></dt>
						<dd><img src="/images/portal/myclass/point_info1.gif" alt="�ѱ���������ī������ ����Ʈ�� �⺻����Ʈ, Ư������Ʈ�� �����Ǹ�, ����Ʈ�� ��ȿ�Ⱓ�� �����Ϸκ��� 1���Դϴ�." /></dd>
					</dl>
					<dl>
						<dt><img src="/images/portal/myclass/point_t2.gif" alt="�⺻ ����Ʈ" /></dt>
						<dd><img src="/images/portal/myclass/point_info2.gif" alt="ȸ�����Խ� �⺻���� 5,000���� �ο��Ͽ�, KOCCA ��ۿ��������� �¶��� ���� �� ��������� �����Ͻø� ������ �����ݾ��� 10% �� ���� �������ΰ� ���ÿ� �����ص帳�ϴ�. (����Ʈ�� ������ �ݾ��� �������� �ʽ��ϴ�.)" /></dd>
					</dl>
					<dl>
						<dt><img src="/images/portal/myclass/point_t3.gif" alt="Ư�� ����Ʈ" /></dt>
						<dd><img src="/images/portal/myclass/point_info3.gif" alt="���� ����Ǵ� �̺�Ʈ �� �����ı⿡ ä�õǽ� �п��� Ư������Ʈ�� ������ �帳�ϴ�." /></dd>
					</dl>
					<dl>
						<dt><img src="/images/portal/myclass/point_t4.gif" alt="����Ʈ ���" /></dt>
						<dd><img src="/images/portal/myclass/point_info4.gif" alt="�¶��� ������� ������û ��, ��������Ʈ 1,000�� �������� ��� �����ϸ�, ���� ������ ����Ʈ���� ���˴ϴ�. (����Ʈ�� ������ �������θ� ���Ǹ�, �������� ������ ������� �ʽ��ϴ�.)" /></dd>
					</dl>
				</div>
			</div>
	 -->
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->