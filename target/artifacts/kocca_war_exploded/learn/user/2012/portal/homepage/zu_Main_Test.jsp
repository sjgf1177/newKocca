<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType = "text/html;charset=euc-kr" %>
<html lang="ko">
<head>
<title>�ѱ������������ ��ī����</title>
<style type="text/css" media="screen">@import "/css/2012/test/common.css";</style>
<style type="text/css" media="screen">@import "/css/2012/test/main.css";</style>
<script type="text/javascript" src="/js/jquery/1.4/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="/js/2012/test/lib.js"></script>
<script language="javascript" type="text/javascript" src="/js/2012/test/jquery.banner.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Content-Language" content="euc-kr">
<meta http-equiv="imagetoolbar" content="false">
<meta name="robots" content="all">
<meta name="MSSmartTagsPreventParsing" content="true">
<meta name="description" content="">
</head>
<body>
<div id="header">
	<div class="topheader">
		<div class="logo"><img src="/images/2012/common/logo.png" alt="�ѱ���������ī����"></div>
		<ul class="navi">
			<li><a href="#" title="���ǰ��ǽǷ� �̵��մϴ�. �̿��Ͻñ� ���� �α����� ���ּ���."><img src="/images/2012/common/menu/menu1.png" onmouseover="slideCateScroll('on','1');" id="navi1" alt="���ǰ��ǽ�"></a></li>
			<li><a href="#" title="�¶��� ���������� Ȯ�� �� ��û�� �� �ֽ��ϴ�."><img src="/images/2012/common/menu/menu2.png" onmouseover="slideCateScroll('on','2');" id="navi2" alt="�¶��ΰ���"></a></li>
			<li><a href="#" title="�������� ���������� Ȯ�� �� ��û�� �� �ֽ��ϴ�."><img src="/images/2012/common/menu/menu3.png" onmouseover="slideCateScroll('on','3');" id="navi3" alt="�������ΰ���"></a></li>
			<li><a href="#" title="�н� ��/��/�� �ʿ��� ������ �ڷḦ �����մϴ�."><img src="/images/2012/common/menu/menu4.png" onmouseover="slideCateScroll('on','4');" id="navi4" alt="�н�����"></a></li>
			<li><a href="#" title="�����λ���� �������Ǹ� ������ �� �ֽ��ϴ�."><img src="/images/2012/common/menu/menu5.png" onmouseover="slideCateScroll('on','5');" id="navi5" alt="��������"></a></li>
			<li><a href="#" title="���� �� �ñ��� ���� �ִٸ� �����̵� �������. �̿��Ͻñ� ���� �α����� ���ּ���."><img src="/images/2012/common/menu/menu6.png" onmouseover="slideCateScroll('on','6');" id="navi6" alt="�������丮"></a></li>
			<li><a href="#" title="�ѱ������������ ��ī���̸� �Ұ��մϴ�."><img src="/images/2012/common/menu/menu7.png" onmouseover="slideCateScroll('on','7');" id="navi7" alt="��ī���̼Ұ�"></a></li>
		</ul>
		<div class="optionbox">
			<form method="post" action="">
			<ul class="search">
				<li class="intext"><input type="text" onfocus="this.style.background='#000000';" title="�˻�� �Է����ּ���."></li>
				<li class="outsearch"><input type="image" src="/images/2012/common/btn_search.png" alt="�˻�" title="�˻��� �����մϴ�."></li>
			</ul>
			</form>
			<a href="javascript:zoomIn();" title="ȭ���� Ȯ���մϴ�."><img src="/images/2012/common/btn_big.png" class="plus" alt="ȭ��Ȯ��"></a>
			<a href="javascript:zoomOut();" title="ȭ���� ����մϴ�."><img src="/images/2012/common/btn_small.png" class="minus" alt="ȭ�����"></a>
		</div>
	</div>
</div>
<div id="submenuline" class="submenubox">
	<table id="submenu1" class="subnavi smenu1">
		<tr>
			<td><a onmouseover="slideCateScroll('on','1');" title="���� �н����� ������ Ȯ�� �Ǵ� �н��� �� �ֽ��ϴ�.">�������� ����</a></td>
			<td><a onmouseover="slideCateScroll('on','1');" title="ȸ������ �� ������� �н��� �̷��� Ȯ���� �� �ֽ��ϴ�.">���Ǳ����̷�</a></td>
			<td><a onmouseover="slideCateScroll('on','1');" title="��û�� ������ Ȯ���ϰų� ����� �� �ֽ��ϴ�.">������û Ȯ��/���</a></td>
			<td><a onmouseover="slideCateScroll('on','1');" title="���� ��ȸ �Ǵ� ��Ҹ� �� �� �ֽ��ϴ�.">������ ��������</a></td>
			<td><a onmouseover="slideCateScroll('on','1');" title="����Ͻ� ������ Ȯ���� �� �ֽ��ϴ�.">���� ��㳻��</a></td>
			<td><a onmouseover="slideCateScroll('on','1');" title="ȸ������ �����Ͻ� ������ Ȯ���� �� �ֽ��ϴ�.">���� ����</a></td>
			<td><a onmouseover="slideCateScroll('on','1');" title="ȸ������ ������ ������ �����Ͽ� �˸��� ������ ������ �� �ֽ��ϴ�.">�ڱ⿪�� ����</a></td>
			<td><a onmouseover="slideCateScroll('on','1');" title="������ �����Ͻ� ��� �������� ����� �� �ֽ��ϴ�.">������ ���</a></td>
		</tr>
	</table>
	<table id="submenu2" class="subnavi smenu2">
		<tr>
			<td><a href="#" title="��ۿ��� �о� �¶��ΰ����� �ȳ��մϴ�.">��ۿ���</a></td>
			<td><a href="#" title="���Ӱ��� �о� �¶��ΰ����� �ȳ��մϴ�.">���Ӱ���</a></td>
			<td><a href="#" title="��ȭ������ �о� �¶��ΰ����� �ȳ��մϴ�.">��ȭ������</a></td>
		</tr>
	</table>
	<table id="submenu3" class="subnavi smenu3">
		<tr>
			<td><a href="#" title="��ۿ��� �о� �������ΰ����� �ȳ��մϴ�.">��ۿ���</a></td>
			<td><a href="#" title="���Ӱ��� �о� �������ΰ����� �ȳ��մϴ�.">���Ӱ���</a></td>
			<td><a href="#" title="��ȹâ�� �о� �������ΰ����� �ȳ��մϴ�.">��ȹâ��</a></td>
			<td><a href="#" title="�н� �� �ʿ��� �ڷḦ �����մϴ�.">�����ڷ��</a></td>
			<td><a href="#" title="�������� ������ ���� �� ���� ���������� Ȯ���� �� �ֽ��ϴ�.">��������</a></td>
			<td><a href="#" title="������, �������, �޽İ��� �� �н�ȯ���� �Ұ��մϴ�.">����ȯ��Ұ�</a></td>
		</tr>
	</table>
	<table id="submenu4" class="subnavi smenu4">
		<tr>
			<td><a href="#" title="�ѱ������������ ��ī������ ���ҽ��� �˷��帳�ϴ�.">��������</a></td>
			<td><a href="#" title="���� ���� ������ ��Ƶξ����ϴ�.">FAQ</a></td>
			<td><a href="#" title="�ñ��� ���� �ִٸ� �������.">������ϱ�</a></td>
			<td><a href="#" title="�¶��� �н� �� �������� �н��� ���� �н�ȯ���� �����մϴ�.">�н�ȯ�浵���</a></td>
			<td><a href="#" title="����� ������ ���ϽŴٸ� �̰� 1:1���Ǹ� �̿����ּ���.">1:1����</a></td>
			<td><a href="#" title="�������� ���� �� ���Ǵ� ���縦 �Ұ��մϴ�.">����Ұ�</a></td>
			<td><a href="#" title="��ī���̿��� �����ϴ� �پ��� �̺�Ʈ�� Ȯ���� �� �ֽ��ϴ�.">�̺�Ʈ</a></td>
			<td><a href="#" title="������û�� ������ ��� ���̵带 ���� �����غ�����.">������û���</a></td>
			<td><a href="#" title="�¶���/�������� ���� ���� �� �ñ��� ���� �ִٸ� �ȳ��� �޾ƺ�����.">�������̵�</a></td>
			<td><a href="#" title="���������� ��ƴٸ�? ���������� ���� �˸´� ������ �����غ�����.">�ڱ⿪������?</a></td>
		</tr>
	</table>
	<table id="submenu5" class="subnavi smenu5">
		<tr>
			<td><a href="#" title="��ۿ��� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ۿ���</a></td>
			<td><a href="#" title="��ȭ ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ȭ</a></td>
			<td><a href="#" title="��ť���͸� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ť���͸�</a></td>
			<td><a href="#" title="��ȭ���� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ȭ����</a></td>
			<td><a href="#" title="���� ���� �������Ǹ� ������ �� �ֽ��ϴ�.">����</a></td>
			<td><a href="#" title="��ȹ ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��ȹ</a></td>
			<td><a href="#" title="��Ÿ ���� �������Ǹ� ������ �� �ֽ��ϴ�.">��Ÿ</a></td>
		</tr>
	</table>
	<table id="submenu6" class="subnavi smenu6">
		<tr>
			<td><a href="#" title="�������丮�� ��ü ������ �����غ��ҽ��ϴ�.">����</a></td>
			<td><a href="#" title="��ۿ��� �о� ���� �����Դϴ�.">��ۿ���</a></td>
			<td><a href="#" title="��ۿ��� �о� ���� �����Դϴ�.">���Ӱ���</a></td>
			<td><a href="#" title="��ۿ��� �о� ���� �����Դϴ�.">��ȭ������</a></td>
			<td><a href="#" title="ȸ���Բ��� �����Ͻ� ������ �̿��� �� �ֽ��ϴ�.">���� �ۼ��� ��</a></td>
		</tr>
	</table>
	<table id="submenu7" class="subnavi smenu7">
		<tr>
			<td><a href="#" title="�ѱ��������������Բ��� ȸ���Ե鲲 �帮�� �λ縻�Դϴ�.">������� �λ縻</a></td>
			<td><a href="#" title="��ī������ ���������� ������ ���� �Ұ��մϴ�.">�������� �� ����</a></td>
			<td><a href="#" title="��ī���� ��������� �ȳ��մϴ�.">�������</a></td>
			<td><a href="#" title="��ī���� �����ü��� �ȳ��մϴ�.">�����ü�</a></td>
			<td><a href="#" title="��ī���̿� ���°����� ����� �Ұ��մϴ�.">�������±��</a></td>
			<td><a href="#" title="�ѱ������������ ��ī���̿� ���ô±��� �ȳ��մϴ�.">���ô±�</a></td>
		</tr>
	</table>
	<div onmouseover="slideCateScroll('off','0');" style="margin-top:7px; height:10px; background:#dddddd;"></div>
</div>
<div id="container">
	<div class="topcontent">
		<ul class="contentA">
			<li class="leftspace">
				<div class="loginput">
					<form method="post" action="">
						<input type="text" class="id" onfocus="this.style.background='#ffffff';" title="���̵� �Է����ּ���.">
						<input type="password" class="pass" onfocus="this.style.background='#ffffff';" title="��й�ȣ�� �Է����ּ���.">
						<input type="image" src="/images/2012/main/btn_login.png" class="login" alt="�α���" title="ȸ�� �α����� �����մϴ�.">
					</form>
				</div>
				<a href="#" title="���̵� �Ǵ� ��й�ȣ�� �ؾ��� �� Ŭ���ϼ���."><img src="/images/2012/main/btn_idpass.png" class="idpass" alt="���̵�/��й�ȣ ã��"></a>
				<a href="#" title="�ű�ȸ�������� �����մϴ�."><img src="/images/2012/main/btn_join.png" class="join" alt="ȸ������"></a>
				<dl class="titlenewspost">
					<dt><img src="/images/2012/main/subject_news.png" alt="��ī���� ���ҽ�"></dt>
					<dt class="more"><a href="#" title="������������ �̵��մϴ�."><img src="/images/2012/main/btn_more.png" alt="��ü����"></a></dt>
				</dl>
				<table class="newspost" cellpadding="0" cellspacing="0" summary="��ī���� ���ҽ�">
					<colgroup><col width="8"><col width="*"></colgroup>
					<tbody>
						<tr>
							<td><img src="/images/2012/main/icon_dot.png" alt="������"></td>
							<td><a href="#" title="[08-13] ��� �ѷ� ������ ���� �۰����̳�">��� �ѷ� ������ ���� �۰����̳�</a></td>
							<td class="date">08-13</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon_dot.png" alt="������"></td>
							<td><a href="#" title="[08-13] 2012�� 6�� 1�� �¶��ΰ��� ����ó�� �� ������ ����...">2012�� 6�� 1�� �¶��ΰ��� ����ó�� �� ������ ����...</a></td>
							<td class="date">08-13</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon_dot.png" alt="������"></td>
							<td><a href="#" title="[08-13] ���Ŭ���� (Ư�� ����) 18�� �߰� ���� ����">���Ŭ���� (Ư�� ����) 18�� �߰� ���� ����</a></td>
							<td class="date">08-13</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon_dot.png" alt="������"></td>
							<td><a href="#" title="[08-13] ��ȭ���� (�¡��������� �н�) ������û �ȳ�">��ȭ���� (�¡��������� �н�) ������û �ȳ�</a></td>
							<td class="date">08-13</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon_dot.png" alt="������"></td>
							<td><a href="#" title="[08-13] ���� ����ä�� �������丮 ����">���� ����ä�� "�������丮" ����</a></td>
							<td class="date">08-13</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon_dot.png" alt="������"></td>
							<td><a href="#" title="[08-13] ��� �ѷ� ������ ���� �۰����̳�">��� �ѷ� ������ ���� �۰����̳�</a></td>
							<td class="date">08-13</td>
						</tr>
					</tbody>
				</table>
			</li>
			<li class="rightspace">
				<!-- ��� ���� -->
				<script type="text/javascript">
				<!--
				$(function() {
					$("#cyberbanner").jQBanner({nWidth:589,nHeight:245,nCount:5,isActType:"left",nOrderNo:1,isStartAct:"N",isStartDelay:"Y",nDelay:4000,isBtnType:"img"});
				});
				//-->
				</script>
				<div id="cyberbanner">
					<div class="clsBannerScreen">
						<div class="images" style="display:block"><a href="#" title="2012�� �ؿ������� ���� ������Ʈ �������"><img src="/images/2012/main/sample_banner.png" alt="2012�� �ؿ� ������ ���� ������Ʈ"></a></div>
						<div class="images"><img src="/images/2012/main/sample_banner.png" alt="���ù��"></div>
						<div class="images"><img src="/images/2012/main/sample_banner.png" alt="���ù��"></div>
						<div class="images"><img src="/images/2012/main/sample_banner.png" alt="���ù��"></div>
						<div class="images"><img src="/images/2012/main/sample_banner.png" alt="���ù��"></div>
					</div>
					<ul class="clsBannerButton" id="label_3">
						<li><img src="/images/2012/main/banner/number/num01on.png" oversrc="/images/2012/main/banner/number/num01on.png" outsrc="/images/2012/main/banner/number/num01.png" alt="1"></li>
						<li><img src="/images/2012/main/banner/number/num02.png" oversrc="/images/2012/main/banner/number/num02on.png" outsrc="/images/2012/main/banner/number/num02.png" alt="2"></li>
						<li><img src="/images/2012/main/banner/number/num03.png" oversrc="/images/2012/main/banner/number/num03on.png" outsrc="/images/2012/main/banner/number/num03.png" alt="3"></li>
						<li><img src="/images/2012/main/banner/number/num04.png" oversrc="/images/2012/main/banner/number/num04on.png" outsrc="/images/2012/main/banner/number/num04.png" alt="4"></li>
						<li><img src="/images/2012/main/banner/number/num05.png" oversrc="/images/2012/main/banner/number/num05on.png" outsrc="/images/2012/main/banner/number/num05.png" alt="5"></li>
					</ul>
				</div>
				<!-- ��� ���� �� -->
			</li>
		</ul>
		<ul class="contentB">
			<li class="online">
				<dl class="titleonline">
					<dd><img src="/images/2012/main/subject_onlinecourse.png" alt="�¶��� ����"></dd>
					<dd class="more"><a href="#" title="��ü����"><img src="/images/2012/main/btn_more.png" alt="�¶��� ���� ��ü����"></a></dd>
				</dl>
				<dl class="onlinetab">
					<dd><button type="button" onmouseover="onlinetab('1')" onclick="document.location='#'" class="over" id="online1" title="�¶��� ��õ����">�¶��� ��õ����</button></dd>
					<dd><button type="button" onmouseover="onlinetab('2')" onclick="document.location='#'" class="out" id="online2" title="��������">��������</button></dd>
					<dd><button type="button" onmouseover="onlinetab('3')" onclick="document.location='#'" class="out" id="online3" title="��ۿ���">��ۿ���</button></dd>
					<dd><button type="button" onmouseover="onlinetab('4')" onclick="document.location='#'" class="out" id="online4" title="��ȭ������">��ȭ������</button></dd>
				</dl>
				<table id="onlinelist1" class="courselist" cellpadding="0" cellspacing="0" summary="�¶��� ��õ���� ����Ʈ">
					<colgroup><col width="60"><col width="*"></colgroup>
					<tbody>
						<tr>
							<td><img src="/images/2012/main/icon/icon_bl.gif" alt="BL��ȭ����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 11���� ��Ģ���� ������ ���丮�ڸ�">11���� ��Ģ���� ������ ���丮�ڸ�</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D Data Exporting Techniques">3D Data Exporting Techniques</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D ���� �ؽ�ó ����">3D ���� �ؽ�ó ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_open.gif" alt="����Ư��"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D �����������α׷���">3D �����������α׷���</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D �������α׷���">3D �������α׷���</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D �������۰���">3D �������۰���</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
					</tbody>
				</table>
				<table id="onlinelist2" class="courselist" style="display:none;" cellpadding="0" cellspacing="0" summary="�������ۺо� ���� ����Ʈ">
					<colgroup><col width="60"><col width="*"></colgroup>
					<tbody>
						<tr>
							<td><img src="/images/2012/main/icon/icon_bl.gif" alt="BL��ȭ����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 11���� ��Ģ���� ������ ���丮�ڸ�">11���� ��Ģ���� ������ ���丮�ڸ�</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D Data Exporting Techniques">3D Data Exporting Techniques</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D ���� �ؽ�ó ����">3D ���� �ؽ�ó ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
					</tbody>
				</table>
				<table id="onlinelist3" class="courselist" style="display:none;" cellpadding="0" cellspacing="0" summary="��ۿ���о� ���� ����Ʈ">
					<colgroup><col width="60"><col width="*"></colgroup>
					<tbody>
						<tr>
							<td><img src="/images/2012/main/icon/icon_open.gif" alt="����Ư��"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D �����������α׷���">3D �����������α׷���</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_bl.gif" alt="BL��ȭ����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 11���� ��Ģ���� ������ ���丮�ڸ�">11���� ��Ģ���� ������ ���丮�ڸ�</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D Data Exporting Techniques">3D Data Exporting Techniques</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D ���� �ؽ�ó ����">3D ���� �ؽ�ó ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D �������α׷���">3D �������α׷���</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
					</tbody>
				</table>
				<table id="onlinelist4" class="courselist" style="display:none;" cellpadding="0" cellspacing="0" summary="��ȭ�������о� ���� ����Ʈ">
					<colgroup><col width="60"><col width="*"></colgroup>
					<tbody>
						<tr>
							<td><img src="/images/2012/main/icon/icon_online.gif" alt="�¶���"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3D Data Exporting Techniques">3D Data Exporting Techniques</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_bl.gif" alt="BL��ȭ����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 11���� ��Ģ���� ������ ���丮�ڸ�">11���� ��Ģ���� ������ ���丮�ڸ�</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
					</tbody>
				</table>
			</li>
			<li class="offline">
				<dl class="titleonline">
					<dd><img src="/images/2012/main/subject_offlinecourse.png" alt="�������� ����"></dd>
					<dd class="more"><a href="#" title="��ü����"><img src="/images/2012/main/btn_more.png" alt="�������� ���� ��ü����"></a></dd>
				</dl>
				<dl class="onlinetab">
					<dd><button type="button" onmouseover="offlinetab('1')" onclick="document.location='#'" class="over" id="offline1" title="3D ��ü������">3D ��ü������</button></dd>
					<dd><button type="button" onmouseover="offlinetab('2')" onclick="document.location='#'" class="out" id="offline2" title="����� �����米��">����� �����米��</button></dd>
					<dd><button type="button" onmouseover="offlinetab('3')" onclick="document.location='#'" class="out" id="offline3" title="������ ����缺">������ ����缺</button></dd>
					<dd><button type="button" onmouseover="offlinetab('4')" onclick="document.location='#'" class="out" id="offline4" title="��Ź����">��Ź����</button></dd>
				</dl>
				<table id="offlinelist1" class="courselist" cellpadding="0" cellspacing="0" summary="�¶��ΰ��� ����Ʈ">
					<colgroup><col width="50"><col width="*"></colgroup>
					<tbody>
						<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Smoke�� Ȱ���� 3D��ü ���� ����">Smoke�� Ȱ���� 3D��ü ���� ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Avid MC6�� Ȱ���� 3D��ü">Avid MC6�� Ȱ���� 3D��ü</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_close.gif" alt="����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Avid MC6�� Ȱ���� 3D��ü">1Avid MC6�� Ȱ���� 3D��ü</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] ������ �������� ����">������ �������� ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_close.gif" alt="����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Smoke�� Ȱ���� 3D��ü ���� ����">Smoke�� Ȱ���� 3D��ü ���� ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3ALITY���� ��ũ�ϼ� ����">3ALITY���� ��ũ�ϼ� ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
					</tbody>
				</table>
				<table id="offlinelist2" class="courselist" style="display:none;" cellpadding="0" cellspacing="0" summary="�¶��ΰ��� ����Ʈ">
					<colgroup><col width="50"><col width="*"></colgroup>
					<tbody>
						<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Avid MC6�� Ȱ���� 3D��ü">Avid MC6�� Ȱ���� 3D��ü</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_close.gif" alt="����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Avid MC6�� Ȱ���� 3D��ü">1Avid MC6�� Ȱ���� 3D��ü</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3ALITY���� ��ũ�ϼ� ����">3ALITY���� ��ũ�ϼ� ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
					</tbody>
				</table>
				<table id="offlinelist3" class="courselist" style="display:none;" cellpadding="0" cellspacing="0" summary="�¶��ΰ��� ����Ʈ">
					<colgroup><col width="50"><col width="*"></colgroup>
					<tbody>
						<tr>
							<td><img src="/images/2012/main/icon/icon_close.gif" alt="����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Avid MC6�� Ȱ���� 3D��ü">1Avid MC6�� Ȱ���� 3D��ü</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] ������ �������� ����">������ �������� ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
					</tbody>
				</table>
				<table id="offlinelist4" class="courselist" style="display:none;" cellpadding="0" cellspacing="0" summary="�¶��ΰ��� ����Ʈ">
					<colgroup><col width="50"><col width="*"></colgroup>
					<tbody>
						<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Avid MC6�� Ȱ���� 3D��ü">Avid MC6�� Ȱ���� 3D��ü</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_close.gif" alt="����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Avid MC6�� Ȱ���� 3D��ü">1Avid MC6�� Ȱ���� 3D��ü</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_close.gif" alt="����"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] Smoke�� Ȱ���� 3D��ü ���� ����">Smoke�� Ȱ���� 3D��ü ���� ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
						<tr>
							<td><img src="/images/2012/main/icon/icon_recruitment.gif" alt="������"></td>
							<td><a href="#" title="[2012.09.01 ~ 2012.09.30] 3ALITY���� ��ũ�ϼ� ����">3ALITY���� ��ũ�ϼ� ����</a></td>
							<td class="date">2012.09.01 ~ 2012.09.30</td>
						</tr>
					</tbody>
				</table>
			</li>
		</ul>
		<div style="clear:left;"></div>
	</div>
	<div class="bottomcontent">
		<div class="contentbox">
			<ul class="content">
				<li class="leftspace">
					<div class="detail">
						<a href="#" title="������ ���ϴ�! <��������> �ٷΰ���"><img src="/images/2012/main/subject_opencast.png" alt="������ ���ϴ�! ��������"></a>
						<div class="opencastment">���, ����, ��ȭ, ��ť���͸�, ��ȭ, ����, ����, ���� �� �پ��� �о��� �����λ���� ���ڸ��� �� ���ϴ�.</div>
						<div class="banner"><a href="#" title="�¶��ΰ��� ���� �� ����ȯ�� �����Ϸ� �ٷΰ���"><img src="/images/2012/main/banner_config.gif" alt="�¶��ΰ��� ���� �� ����ȯ�� �����ϱ�"></a></div>
						<div class="talent"><img src="/images/2012/main/subject_talent.png" alt="������ ���縦 ���� ����ȭ�� �����ü�"></div>
						<script type="text/javascript">
						<!--
						$(function() {
							$("#learningroom").jQBanner({	nWidth:370, nHeight:76, nCount:5,	isActType:"up", nOrderNo:1, nDelay:5000 });
						});
						//-->
						</script>
						<div id="learningroom">
							<div class="clsBannerScreen">
								<div class="images" style="display:block"><img src="/images/2012/main/sample_learningroom.png" alt="���ñ�����"></div>
								<div class="images"><img src="/images/2012/main/sample_learningroom.png" alt="���ñ�����"></div>
								<div class="images"><img src="/images/2012/main/sample_learningroom.png" alt="���ñ�����"></div>
								<div class="images"><img src="/images/2012/main/sample_learningroom.png" alt="���ñ�����"></div>
								<div class="images"><img src="/images/2012/main/sample_learningroom.png" alt="���ñ�����"></div>
							</div>
						</div>
					</div>
				</li>
				<li class="rightspace">
					<dl class="steprable">
						<dd class="msg"><img src="/images/2012/main/step_msg.png" alt="�ѱ���������ī������ ó�����̳���? ���������� ����� �޾ƺ�����."></dd>
						<dd class="step1"><a href="#" title="ȸ������ �ٷΰ���"><img src="/images/2012/main/step1.png" alt="1�ܰ� ȸ������"></a></dd>
						<dd class="step2"><a href="#" title="�α��� �ٷΰ���"><img src="/images/2012/main/step2.png" alt="2�ܰ� �α���"></a></dd>
						<dd class="step3"><a href="#" title="�������� �ٷΰ���"><img src="/images/2012/main/step3.png" alt="3�ܰ� ��������"></a></dd>
						<dd class="step4"><a href="#" title="������û �ٷΰ���"><img src="/images/2012/main/step4.png" alt="4�ܰ� ������û"></a></dd>
					</dl>
					<dl class="support">
						<dd><a href="#" title="�������� ���񽺷� �̵��մϴ�."><img src="/images/2012/main/banner_support.gif" alt="�н� �� PC������ �߻��ϼ̳���? ������������ �̿��ϱ�"></a></dd>
						<dd><a href="#" title="������ϱ� �Խ������� �̵��մϴ�."><img src="/images/2012/main/banner_sms.gif" alt="������ϱ� �亯 �˸� SMS : ���� �� �亯 �ȳ� ���ڰ� �߼۵˴ϴ�."></a></dd>
					</dl>
					<dl class="business">
						<dd class="learning">
							<table class="businessfield" cellpadding="0" cellspacing="0" summary="�ѱ���������ī���� ������� �о� �ȳ�">
								<thead>
									<tr>
										<th colspan="2"><img src="/images/2012/main/subject_business.png" alt="�ѱ���������ī���� �������"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="#" title="������ ���� �缺������� �ȳ��� �̵��մϴ�.">������ ���� �缺����</a></td>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="#" title="3D��ü ������ �����η� �缺��� �ȳ��� �̵��մϴ�.">3D��ü ������ �����η� �缺</a></td>
									</tr>
									<tr>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="#" title="����� ���� �米����� �ȳ��� �̵��մϴ�.">����� ���� �米��</a></td>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="#" title="â������ �缺��� �ȳ��� �̵��մϴ�.">â������ �缺���</a></td>
									</tr>
									<tr>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="#" title="�¶��� ������� �ȳ��� �̵��մϴ�.">�¶��� ����</a></td>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="#" title="��� ���ε༭ ������ �ȳ��� �̵��մϴ�.">��� ���ε༭ ����</a></td>
									</tr>
									<tr>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="#" title="���� ����������� �ȳ��� �̵��մϴ�.">���� ��������</a></td>
										<td><img src="/images/2012/main/icon_dot.png" alt="������"> <a href="#" title="���� ������� �ڰ� ������� �ȳ��� �̵��մϴ�.">���� ������� �ڰ� ����</a></td>
									</tr>
								</tbody>
							</table>
						</dd>
						<dd class="another">
							<a href="#" title="�帲���� â������ ���ݻ�� �ٷΰ���"><img src="/images/2012/main/sample_banner1.gif" alt="�帲���� â������ ���ݻ��"></a><br>
							<a href="#" title="���������� ��ȹ ���̵�� ���� �ٷΰ���"><img src="/images/2012/main/sample_banner2.gif" alt="�帲���� â������ ���ݻ��"></a>
						</dd>
					</dl>
				</li>
			</ul>
			<div class="clearscript"></div>
		</div>
		<div class="smarticon">
			<table class="icon" cellspacing="0" cellpadding="0" summary="�����̿��ϴ� ��ɵ��� ��ҽ��ϴ�.">
				<tbody>
					<tr>
						<td class="icon1"><a href="#" title="�¶���/�������� ���� ���� �� �ñ��� ���� �ִٸ� �ȳ��� �޾ƺ�����."><img src="/images/2012/common/smarticon/icon_guide.png" alt="�������̵�"></a></td>
						<td class="icon2"><a href="#" title="�����Ͻ� ������ ������ �ʿ��Ͻ� ��� ������ ������ �� �ֽ��ϴ�."><img src="/images/2012/common/smarticon/icon_payment.png" alt="�����ϱ�"></a></td>
						<td class="icon3"><a href="#" title="���������� ��ƴٸ�? ���������� ���� �˸´� ������ �����غ�����."><img src="/images/2012/common/smarticon/icon_level.png" alt="�ڱ⿪������"></a></td>
						<td class="icon4"><a href="#" title="�¶��� �н� �� �������� �н��� ���� �н�ȯ���� �����մϴ�."><img src="/images/2012/common/smarticon/icon_config.png" alt="�н�ȯ�浵���"></a></td>
						<td class="icon5"><a href="#" title="����� ������ ���ϽŴٸ� �̰� 1:1���Ǹ� �̿����ּ���."><img src="/images/2012/common/smarticon/icon_1n1.png" alt="1:1����"></a></td>
						<td class="icon6"><a href="#" title="������ �����Ͻ� ��� �������� ����� �� �ֽ��ϴ�."><img src="/images/2012/common/smarticon/icon_cert.png" alt="������ ���"></a></td>
						<td class="icon7"><a href="#" title="�������� ���� �� ���Ǵ� ���縦 �Ұ��մϴ�."><img src="/images/2012/common/smarticon/icon_book.png" alt="����ȳ�"></a></td>
						<td class="icon8"><a href="#" title="���� ���� ������ ��Ƶξ����ϴ�."><img src="/images/2012/common/smarticon/icon_faq.png" alt="FAQ"></a></td>
						<td class="icon9"><a href="#" title="�ñ��� ���� �ִٸ� �������."><img src="/images/2012/common/smarticon/icon_qna.png" alt="������ϱ�"></a></td>
						<td class="icon10"><a href="#" title="�ѱ������������ ��ī���̿� ���ô±��� �ȳ��մϴ�."><img src="/images/2012/common/smarticon/icon_location.png" alt="ã�ƿ��ô±�"></a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div id="footer">
	<div class="supportbox">
		<div class="support">
			<div class="supportcontent">
				<ul class="supportmenu">
					<li class="startline"><a href="#" title="��������ó����ħ���� �̵��մϴ�."><img src="/images/2012/common/btn_member_terms.png" alt="��������ó����ħ"></a></li>
					<li><a href="#" title="�̿������� �̵��մϴ�."><img src="/images/2012/common/btn_use_terms.png" alt="�̿���"></a></li>
					<li><a href="#" title="�̸��Ϲ��ܼ����źη� �̵��մϴ�."><img src="/images/2012/common/btn_email_denial.png" alt="�̸��Ϻδܼ����ź�"></a></li>
					<li><a href="#" title="����Ʈ������ �̵��մϴ�."><img src="/images/2012/common/btn_sitemap.png" alt="����Ʈ��"></a></li>
				</ul>
				<ul class="certification">
					<li><a href="#" title="Ŭ���Ͻø� �̴Ͻý��� ��ȿ���� Ȯ���Ͻ� �� �ֽ��ϴ�."><img src="/images/2012/common/icon_inicis.png" alt="�̴Ͻý� ���� �ý���"></a></li>
					<li><a href="#" title="�������������� ǰ���������� Ȯ���մϴ�."><img src="/images/2012/common/icon_goodcontent.png" alt="�������������� ǰ������"></a></li>
					<li><a href="#" title="����������ȣ��� �������� Ȯ���մϴ�."><img src="/images/2012/common/icon_eprivacy.png" alt="����������ȣ�������Ʈ ����"></a></li>
					<li><a href="#" title="����������ȣ ���� �������� Ȯ���մϴ�."><img src="/images/2012/common/icon_isafe.png" alt="����������ȣ���� ����"></a></li>
				</ul>
			</div>
		</div>
		<div class="about">
			<ul class="information">
				<li><img src="/images/2012/common/bottom_logo.png" alt="�ѱ������������ ��ī����"></li>
				<li class="copy">
					<dl class="copyright">
						<dd class="address">����Ư���� ��õ�� �񵿵��� 203-1 ���ȸ�� 8��<br>����ڵ�Ϲ�ȣ : 117-82-04412      ����Ǹž��Ű��ȣ : ��õ 00471</dd>
						<dd class="corp">�ѱ������������(��) ���� ȫ��ǥ</dd>
						<dd class="maker">COPYRIGHT�� 2012 KOCCA ALL RIGHTS RESERVED.</dd>
					</dl>
				</li>
				<li class="servicecenter">
					<img src="/images/2012/common/bottom_servicecenter.png" alt="�¶��� �������� 02-2161-0077��, �������� �������� 02-2161-0072">
					<select class="familysite">
						<option>��ȭü��������</option>
						<option>�ѱ������������</option>
						<option>������������</option>
						<option>�۷ι�������꼾��</option>
						<option>��ȭ����������</option>
						<option>�������̿뺸ȣ����</option>
						<option>���۱���Ź�����ý���</option>
						<option>�������ĺ�ü��(UCI)</option>
						<option>���ӱ����ڰݱ������</option>
						<option>�����η������ý���</option>
						<option>���Ǿ�ī�̺�</option>
						<option>���������ī������ý���</option>
					</select>
				</li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>