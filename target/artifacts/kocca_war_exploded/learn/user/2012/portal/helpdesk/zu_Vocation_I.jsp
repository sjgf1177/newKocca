<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<html lang="ko">
<head>
<title>�ѱ���������ī���� ����������� ������û</title>
<style type="text/css" media="screen">@import "http://edu.kocca.or.kr/css/2012/common.css";</style>
<script type="text/javascript" src="/js/jquery/1.8.2/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Content-Language" content="euc-kr">
<meta http-equiv="imagetoolbar" content="false">
<meta name="robots" content="all">
<meta name="MSSmartTagsPreventParsing" content="true">
<meta name="description" content="">
<style type="text/css">
body { 
	background-color:#31a5be; 
}

table.doclayout {
	width:100%;
	height:100%;
}

table.doclayout td.layout {
	text-align:center;
	vertical-align:middle;
}

img.logo {
	margin-bottom:5px;
}

div.boxline {
	width:400px;
	border:5px dotted white;
	margin:0 auto;
	text-align:left;
}

table.request {
	margin:20px;
}

table.request td {
	font-family:"malgun gothic","gulim","dotum","sans-serif";
	font-size:14px;
	font-weight:bold;
	color:white;
	padding-top:6px;
	padding-bottom:6px;
	padding-left:10px;
}

table.request td input {
	font-family:"gulim","dotum","sans-serif";
	font-size:12px;
	color:black;
	padding:2px;
}

/*---*/
table.request td select {
	font-family:"gulim","dotum","sans-serif";
	font-size:12px;
	color:black;
	padding:1px;
}
/*---*/

.formsend {
	margin-top:10px;
	font-family:"malgun gothic","gulim","dotum","sans-serif";
	font-size:14px;
	font-weight:bold;
	color:#1b8bea;
	line-height:24px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#requestinsert').submit(function(){
			var returnmsg = $.makeArray($(this).find('input:text').map(function() {
				return $(this);
			}));
			var intxtmax = $(returnmsg).length-1;
			for (i=0; i<=intxtmax; i++) {
				if($(returnmsg)[i].val() == "") {
					alert($(returnmsg)[i].attr('title'));
					$(returnmsg)[i].focus();
					return false;
				}
			}
		});
	});
</script>
</head>
<body>
<table class="doclayout" cellpadding="0" cellspacing="0">
	<tr>
		<td class="layout">
			<a href="http://edu.kocca.or.kr" tabindex="1" target="_blank" title="�ѱ���������ī���� Ȩ�������� �̵��մϴ�"><img src="/images/2012/sub/logo.png" class="logo"></a>
			<form id="requestinsert" method="post" enctype="multipart/form-data" action="/servlet/controller.homepage.HomePageContactServlet">
   			<input type = "hidden" name="p_process"    value = "insertVocation">
			<div class="boxline">
				<table class="request" cellpadding="0" cellspacing="0">
					<colgroup><col width="100"><col width="*"></colgroup>
					<tr>
						<td>ȸ���</td>
						<td><input name="company" type="text" tabindex="1" style="width:220px;" title="�Ҽ��Ͻ� ȸ����� �Է����ּ���"></td>
					</tr>
					<tr>
						<td>ȸ�����</td>
						<td>
							<select id="selecttype" name="category" tabindex="2" title="�Ҽ��Ͻ� ȸ���� ����(�о�)�� �������ּ���">
								<option>�о� ����</option>
								<option value="���">���</option>
								<option value="����">����</option>
								<option value="��ȭ">��ȭ</option>
								<option value="��Ÿ">��Ÿ</option>
							</select>
							</td>
					</tr>
				</table>
				<table class="request" cellpadding="0" cellspacing="0">
					<colgroup><col width="100"><col width="*"></colgroup>
					<tr>
						<td>����ڸ�</td>
						<td><input type="text" name="user_name" tabindex="3" style="width:100px;" title="����Ͻô� ���� �Ǹ��� �Է����ּ���"></td>
					</tr>
					<tr>
						<td>����� ��å</td>
						<td><input type="text" name="job" tabindex="4" style="width:150px;" title="����Ͻô� ���� ��å�� �Է����ּ���"></td>
					</tr>
					<tr>
						<td>����� ����ó</td>
						<td>
							<input type="text" name="tel1" maxlength="4" tabindex="5" style="width:35px; text-align:center;" title="������ȣ �Ǵ� �̵���ȣ�� �Է����ּ���"> -
							<input type="text" name="tel2" maxlength="4" tabindex="6" style="width:35px; text-align:center;" title="����ó�� �߰���ȣ 3~4�ڸ��� �Է����ּ���"> -
							<input type="text"  name="tel3"maxlength="4" tabindex="7" style="width:35px; text-align:center;" title="����ó�� �� 4�ڸ��� �Է����ּ���">
						</td>
					</tr>
				</table>
			</div>
			<input type="submit" tabindex="8" class="formsend" value="�� �������� ��û�մϴ�">
			</form>
		</td>
	</tr>
</table>
</body>
</html>