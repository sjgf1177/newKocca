<?
	ini_set("display_errors", "0"); 
	$wfcontextRoot = "";
	$wfServerAddress="xxx.xxx.xxx.xxx";  // �ش� ������ ���� �����ǳ� ���������� ����
	$fp = fsockopen ($wfServerAddress, 80, $errno, $errstr, 3);	
	if (!$fp) {
		echo "<iframe id='webfilterSmsFrame' name='webfilterSmsFrame' width='0' src='".$wfcontextRoot."/webfilter/html/webfilterBypass.html' height='0' frameborder='0' scrolling='no' noresize></iframe>";
	}else{
		echo "<script type='text/javascript' src='".$wfcontextRoot."/webfilter/js/webfilter.js' defer='defer'></script>";
		echo "<iframe id='webfilterTargetFrame' name='webfilterTargetFrame' width='0' height='0' frameborder='0' scrolling='no' noresize></iframe>";
	}
	fclose ($fp);
?>