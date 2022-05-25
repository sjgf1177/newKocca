<%@ page language = "java" contentType = "text/html; charset=euc-kr" pageEncoding = "euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<% 
	RequestBox box = (RequestBox)request.getAttribute("requestbox");

	//������ Ư�� Ŭ����
	DataBox dbox = (DataBox) request.getAttribute("_VIEW_");
	List<DataBox> mobileList = (List<DataBox>) request.getAttribute("_MOBILELIST_");
	if(dbox == null) dbox = new DataBox("request");
	
	String v_gugun = box.getStringDefault("p_gubun", "nowMonth");
	String v_genre = box.getString("p_genre");
	int v_point = dbox.getInt("d_checkpoin");
%>
<%@ include file="/learn/mobile/include/common.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta name="format-detection" content="telephone=no"/>
<title><%=v_title.toString()%></title>
<link rel="stylesheet" type="text/css" href="/css/m_common.css" />
<script type="text/javascript" language="javascript" src="/js/common.js"></script>
<script type="text/javascript" language="javascript">

	//Tab�̵� 
	function goTabMovePage(v_genre)
	{
		var obj = document.listForm;

		obj.p_genre.value = v_genre;
		obj.p_process.value = "goldClassListPage";
		obj.action = "/servlet/controller.mobile.info.InfoServlet";
		obj.submit();
	}
	
	//��������� �̵�
	function golistPage()
	{
		var obj = document.listForm;
		
		obj.p_process.value = "goldClassListPage";
		obj.action = "/servlet/controller.mobile.info.InfoServlet";
		obj.submit();
	}

	//�̸�����
	function download(url)
	{
		if(f_is_trim(url) == "") 
		{
			alert("�غ����Դϴ�."); 
		}
		else
		{
			if(confirm("3G�� �̿�� ��Ż��� ������� ���� �̿����� �߻��� �� �ֽ��ϴ�. ��� �����Ͻðڽ��ϱ�?")){
				location.href=url;
			}
		}
	}
</script>
</head>
<body class="other_sub">
<div id="sub_header">	
	<%@ include file="/learn/mobile/include/header.jsp" %>
</div>
<div id="kocca_subContent">	

	
	<!--�Ǹ޴�-->
	<form name="listForm" action="/servlet/controller.mobile.info.InfoServlet" method="post">
		<input type="hidden" name="p_process" value="goldClassListPage" />
		<input type="hidden" name="p_menuid" value="<%=v_menuid%>" />
		<input type="hidden" name="p_gubun" value="<%=v_gugun%>" />
		<input type="hidden" name="p_genre" value="<%=v_genre%>" />
		<input type="hidden" name="p_seq" value="" />
	<nav class="onoff_tab_area">
		<div class="onoff_tab">
			<ul>
				<li class="<%="".equals(v_genre)? "tabmenu_on":"tabmenu_l"%>" style="width:16%;">
					<a onclick="goTabMovePage('');" title="��ü" href="#none">��ü</a>
				</li>
				<li class="<%="G01".equals(v_genre)? "tabmenu_on":"tabmenu_l"%>" style="width:16%;">
					<a onclick="goTabMovePage('G01');" title="��ۿ���" href="#none">���</a>
				</li>
				<li class="<%="G02".equals(v_genre)? "tabmenu_on":"tabmenu_l"%>" style="width:16%;">
					<a onclick="goTabMovePage('G02');" title="��ȭ" href="#none">��ȭ</a>
				</li>
				<li class="<%="G03".equals(v_genre)? "tabmenu_on":"tabmenu_l"%>" style="width:16%;">
					<a onclick="goTabMovePage('G03');" title="��ȭ" href="#none">��ť</a>
				</li>
				<li class="<%="G04".equals(v_genre)? "tabmenu_on":"tabmenu_l"%>" style="width:16%;">
					<a onclick="goTabMovePage('G04');" title="��ȭ����" href="#none">��ȭ</a>
				</li>
				<li class="<%="G05".equals(v_genre)? "tabmenu_on":"tabmenu_l"%>" style="width:16%;">
					<a onclick="goTabMovePage('G05');" title="��Ÿ" href="#none">��Ÿ</a>
				</li>			
			</ul>
		</div>
	</nav>
	</form>
		<div class="category_two">
	</div>
	<div class="field_m">			
		<ul id="" class="gold_btn">		
			
			<%-- <li class="field_li field">
				<button id="add_Submit" onclick="return download('<%=dbox.getString("d_mobile_url")%>');">
					<span>���º���</span>
				</button>
			</li> --%>
			
			<li class="field_li field">
				<button id="test_Submit" onclick="golistPage();">
					<span>���</span>
				</button>
			</li>
		</ul>
	</div>
	
	<div class="h_area_gold">
		<h3 class="t"><%=dbox.getString("d_lecnm")%></h3>
		
	</div>

	

	<!--��������Ʈ-->
	<div id="sub_tab_area">
			<div class="room_cont">
				<ul>
					<li class="img"><a href="#"><img class="img" src="http://edu.kocca.co.kr/servlet/controller.library.DownloadServlet?p_savefile=<%=dbox.getString("d_tutorimg")%>" width="85" height="66" alt="" /></a></li>
					<li class="last">
						<span class="g">��&nbsp;��&nbsp;��&nbsp;</span><span class="g_line"> | </span><%=dbox.getString("d_tutornm")%><br>
						<span class="g">���ǽð�</span><span class="g_t "><span class="g_line"> | </span><%=dbox.getString("d_lectime")%></span><br>
						<span class="g">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</span><span class="g_line"> | </span>37:18<br>
						<span class="g">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</span><span class="g_line"> | </span>						
						<div class="li_star">
<% 
	for(int i = 0; i < v_point; i++)
	{
%>					
						<span class="star_on"></span>
<% 
	}
	for(int i = v_point; i < 5; i++)
	{
%>
						<span class="star_off"></span>
<% 
	}
%>
						</div>
					</li>
				</ul>

				<ul>
					<li class="last g">����</li>
					<li class="last_01">
						<%=dbox.getString("d_intro")%>
					</li>
					
				</ul>
			</div>

	</div>
	<style>
		table.learnlist { width:100%; border:0px; }
		table.learnlist td { font-family:"gulim","dotum","sans-serif"; font-size:12px; padding:5px 0px 5px 0px; }
		table.learnlist td.numbers { text-align:center; background-color:#bbbbbb; }
		table.learnlist td.subjects { text-align:left; padding-left:5px; background-color:#bbbbbb; }
		table.learnlist td.buttons { text-align:center; background-color:#bbbbbb; }
	</style>
	<table class="learnlist" cellpadding="0" cellspacing="1">
	<%	for (DataBox lessonListDataBox : mobileList) {	%>	
	<colgroup><col width="40"><col width="*"><col width="80"></colgroup>		
		<tr>
			<td class="numbers"><%= lessonListDataBox.get("d_num")  %></td>
			<td class="subjects"><%= lessonListDataBox.get("d_content")  %></td>
			<td class="buttons">
				<%-- <button id="add_Submit" onclick="return download('<%=lessonListDataBox.get("d_mobileurl")  %>');"> --%>
				<a href="<%=lessonListDataBox.get("d_mobileurl")%>" target="_blank">���º���</a>
			</td>
		</tr>								      
	<%	} %> 
	</table>
					
					
	
	<!--footer-->
	<jsp:include page="/learn/mobile/include/footer.jsp" flush="true" />
	<!--footer-->
	
</div>
</body>
</html>