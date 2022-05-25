<%@ page language = "java" contentType = "text/html; charset=euc-kr" pageEncoding = "euc-kr" %>
<%@ page errorPage = "/jsp/library/error.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link href="/css/m_style.css" rel="stylesheet">
	<!--
    <script src="/js/jquery/jquery-1.11.1.min.js"></script>
	<script src="/js/common.js"></script>
    //-->
    <script>
        function fnAndroidAppInstall() {
            window.open("https://play.google.com/store/apps/details?id=com.newin.kocca", "appWin", "");
        }
    </script>
</head>
<body>

<div class="app-guide">
	<div class="body">
		<div class="guide-download">
			<div class="app-icon">
				<div class="icon-wrap"><img src="/images/mobile/new_app_guide/app-icon.png" alt="kocca app icon"></div>
			</div>
			<div class="app-info">
				<div class="app-info-top">
					<span class="app-name">��������ī����</span>
					<span class="author">KOCCA</span>
				</div>
				<div class="app-info-bottom">
					<button class="app-link mb10" onclick="fnAndroidAppInstall();">Android ��ġ</button>
                    <!--
					<button class="app-link">iOS ��ġ</button>
                    //-->
				</div>
			</div>
		</div>

		<div class="guide-notice">
			<h1 class="text-type1"><span>��������ī���� ��</span>�� ���Ӱ� ������Ʈ �Ǿ����ϴ�.</h1>
		</div>

		<div class="guide-img">
			<img src="/images/mobile/new_app_guide/screenshot_01.png" alt="kocca app screenshot image">
			<!--
			<img src="/images/mobile/new_app_guide/screenshot_02.png" alt="kocca app screenshot image">
			<img src="/images/mobile/new_app_guide/screenshot_03.png" alt="kocca app screenshot image">
			-->
			<img src="/images/mobile/new_app_guide/screenshot_04.png" alt="kocca app screenshot image">
			<img src="/images/mobile/new_app_guide/screenshot_05.png" alt="kocca app screenshot image">
		</div>

		<div class="guide-info">
		<ul>
			<li>
				<h2>�� �ٿ�ε�</h2>
			</li>
			<li>
				- ���۽���� ���� &gt; ����������ī���̡� �˻� &gt; ��ġ
			</li>
            <!--
			<li>
				- �۽���� ���� &gt; ����������ī���̡� �˻� &gt; ��ġ
			</li>
            //-->
		</ul>
		<p>�� ���� app�� ���񽺴� �ߴܵ˴ϴ�.</p>
		</div>
	</div>
</div>
<form id="oInstallForm" name="installForm">
</form>
</body>
</html>