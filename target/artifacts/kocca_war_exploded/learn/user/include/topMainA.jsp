<%
    String topmenu  = "0";
    String complogo        = box.getSession("complogo");

%>

<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/css/user_style1.css" rel="stylesheet" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}


    // �α� �ƿ� ó��
    function goLoginout() {
        if (confirm("�α׾ƿ� �Ͻðڽ��ϱ�?")) {
            document.frmLogin.p_process.value   = "logout";
            document.frmLogin.action            = "/servlet/controller.homepage.LoginServlet";
            document.frmLogin.submit();
        } else {
            return;
        }
    }

    // ������ �ʱ�ȭ
    function winonload() {
    <% if (!bLoginCheck) {%>
        document.frmLogin.p_userid.focus();
    <% } else { %>
        return;
    <% } %>
    }

// ���� ����Ʈ ��ũ ���
function goSiteBanner(grcode,seq,loginCheck) {
	if(loginCheck == "Y"){
	<% if(box.getSession("userid").equals("")) {%>
		alert("�α��� �� �̿����ּ���");
		return;
	<%}%>
	}
	window.open("/learn/user/homepage/zu_LinkSite_Action.jsp?p_grcode="+grcode+"&p_seq="+seq, "SiteLink", "toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=700,height=480,left=80,top=100");
}

// ���� ����Ʈ ��ũ ����Ʈ�ڽ�
function goSiteSelect() {
	var link1 = document.linkform.link.value;
	var arr = link1.split(':');

	if(arr[2] == "Y"){
	<% if(box.getSession("userid").equals("")) {%>
		alert("�α��� �� �̿����ּ���");
		return;
	<%}%>
	}
	window.open("/learn/user/homepage/zu_LinkSite_Action.jsp?p_grcode="+arr[0]+"&p_seq="+arr[1], "SiteLink", "toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=700,height=480,left=80,top=100");
}

//-->
</script>
</head>

<body leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" <%=onLoad%>>

<!----------------- ������ / ���뽺ũ��Ʈ ���� ----------------->
<%@ include file="/learn/user/include/common.jsp"%>
<!----------------- ������ / ���뽺ũ��Ʈ �� ------------------>

<table width="100%" border="0" cellspacing="0" cellpadding="0" background="/images/user/homepage/type1/<%=tem_topbg%>">
  <tr>
    <td>
      <table width="900" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="250">&nbsp;</td>
          <td width="650" align="right">

            <!----------------- global menu ���� ----------------->
            <%@ include file="/learn/user/include/globalmenuA.jsp"%>
            <!-----------------  global menu �� ------------------>

          </td>
        </tr>
        <tr>
          <td width="250" rowspan="2" align="center" bgcolor="#FFFFFF"><a href="/">
		  <% if(complogo.equals("")){%>
			<img src="<%=tem_imgpath%><%=tem_toplogo%>" width="160" height="30">
		  <%}else{%>
			<img src="<%=complogo%>" width="160" height="30">
		  <%}%>
		  </a></td>
          <td height="34" align="right" valign="top">

            <!----------------- top menu ���� ----------------->
            <%@ include file="/learn/user/include/topmenuA.jsp"%>
            <!-----------------  top menu �� ------------------>

          </td>
        </tr>
        <tr>
          <td height="21" valign="top"><img src="/images/user/homepage/type1/m_head.gif"></td>
        </tr>
      </table>
     </td>
  </tr>
</table>
<!-- center -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table width="900" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="18" height="30" class="mlcolor1">&nbsp;</td>
          <td width="232" rowspan="2" valign="bottom" >
		    <!--img src="/images/user/homepage/type1/mainimg.jpg"-->
			<!--�÷��� left ����-->
			<script language = "javascript" src = "/script/user_patch.js"></script>
			<script language='javascript'>
					setParam1('<%=tem_imgpath+""+tem_mainflash%>');
					//alert("1111");
					object_patch('leftmenuA');
					setParam1('');
				</script>
			<!--object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="232" height="450">
			  <param name="movie" value="<%//=tem_imgpath+""+tem_mainflash%>">
			  <param name="quality" value="high">
			  <embed src="/image/common/flash/menu_sub5.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="232" height="450">
			  </embed> </object-->
			<!--�÷��� left ����-->
		  </td>
          <td rowspan="2" valign="top" background="/images/user/homepage/type1/bg_center.gif">