<%
//**********************************************************
//  1. ��      ��: ���ְ��� �ý��� �α���ȭ��
//  2. ���α׷���: zu_CpLogin.jsp
//  3. ��      ��: ���ְ��� �ý��� �α���ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̿��� 2005. 07. 18
//  7. ��      ��: �̿��� 2005. 07. 18
//***********************************************************
%>
<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>       
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.common.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../../../css/cp_style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--

function password_enter(e) { 
    if (e.keyCode =='13'){  login();  }
}

function login() {
	if (document.form1.p_userid.value=="") {
		alert("����� �Է��ϼ���");
		document.form1.p_userid.focus();
		return;
	}

	if (document.form1.p_pwd.value=="") {
		alert("��й�ȣ�� �Է��ϼ���");
		document.form1.p_pwd.focus();
		return;
	}

    document.form1.p_process.value   = "login";
    document.form1.action            = "/servlet/controller.cp.CpLoginServlet";
    document.form1.submit();
}

function winonload() {
<% if (session.getAttribute("userid")==null) {%>     
  if( getCookie( "userid_cp" ) == "" ) {
    document.form1.p_userid.focus();
  } else {
    document.form1.p_userid.value = getCookie( "userid_cp" );
    document.form1.rememberId.checked = true;
    document.form1.p_pwd.focus();
  }
<% } else { %>
	return;
<% } %>
}


function getCookie( name ) {
    var nameOfCookie = name + "=";
    var x = 0;
    while ( x <= document.cookie.length )
    {
        var y = (x+nameOfCookie.length);
        if ( document.cookie.substring( x, y ) == nameOfCookie ) {
            if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
                endOfCookie = document.cookie.length;
            return unescape( document.cookie.substring( y, endOfCookie ) );
        }
        x = document.cookie.indexOf( " ", x ) + 1;
        if ( x == 0 )
            break;
    }
    return "";
}

function pwSearch() {
   document.form1.p_process.value   = "pass";
   document.form1.action            = "/servlet/controller.cp.CpPassServlet";
   document.form1.submit();
}



function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
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
//-->
</script>
</head>

<body leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('../../../images/cp/m_board_on.gif','../../../images/cp/m_company_on.gif','../../../images/cp/m_sdata_on.gif','../../../images/cp/m_swdata_on.gif','../../../images/user/button/btn_idpw_on.gif','../../../images/user/button/btn_login_on.gif','../../../images/cp/m_data_on.gif','../../../images/user/button/btn_login-1_on.gif','../../../images/user/button/btn_pwsearch_on.gif')">
<%@include file="zu_Include.jsp"%>


<table width="100%" border="0" cellpadding="0" cellspacing="0" background="../../../images/cp/bg_subtotal.gif">
  <tr> 
    <td valign="top">
	<!-- topimg -->
	<table width="900" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="12" valign="top"><img src="../../../images/cp/img_sub_head.gif"></td>
          <td width="888" valign="top"><img src="../../../images/cp/noticeimg.jpg"></td>
        </tr>
        <tr valign="top"> 
          <td colspan="2">
		
		  <table width="900" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="20" align="center" valign="top"></td>
              </tr>
              <tr> 
                <td align="center" valign="top">
				<table width="835" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="../../../images/cp/tit_login.gif"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

				<form name = "form1" method = "post">
				<input type="hidden" name="p_systemgubun" value="">
				<input type='hidden' name='p_process'	value=''>
				<input type='hidden' name='p_frmURL'	value=''>
                  <table width="800" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="center" valign="top"> 
                        <!-- �α��ιڽ� -->
                        <table width="428" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="135" valign="top"><img src="../../../images/cp/log_img.jpg" ></td>
                            <td width="293" valign="top"> 
						  <table width="292" height="131" border="0" cellpadding="0" cellspacing="0" background="../../../images/cp/log_bg.gif">
                                <tr> 
                                  <td height="18" valign="top"><img src="../../../images/cp/log_top.gif" width="292" height="18"></td>
                                </tr>
                                <tr> 
                                  <td height="96" align="center">
								    <table width="230" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td width="18"><img src="../../../images/user/homepage/id.gif"></td>
                                        <td width="108">
										<input name="p_userid" type="text" class="input_login" tabindex="1" value="" size="17">
										</td>
                                        <td width="50" rowspan="2">
										<a href="javascript:login()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image23','','../../../images/cp/btn_login-1_on.gif',1)"><img src="../../../images/cp/btn_login-1.gif" name="Image23"  border="0"></a></td>
                                        <td width="54" rowspan="2">
										<a href="javascript:pwSearch()" target="_self" onfocus=this.blur() onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image24','','../../../images/cp/btn_pwsearch_on.gif',1)"><img src="../../../images/cp/btn_pwsearch.gif" name="Image24" border="0"></a></td>
                                      </tr>
                                      <tr> 
                                        <td><img src="../../../images/user/homepage/pw.gif" ></td>
                                        <td><input name="p_pwd" type="password" class="input_login" onkeypress="password_enter(event)" value="" size="17">
										</td>
                                      </tr>
                                    </table></td>
                                </tr>
                                <tr> 
                                  <td height="17" valign="top"><img src="../../../images/cp/log_bo.gif" width="292" height="17"></td>
                                </tr>
                              </table>
							</td>
                          </tr>
                          <tr> 
                            <td height="10" colspan="2"></td>
                          </tr>
                          <tr> 
                            <td colspan="2" class="font_ex">
							  <table width="428" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="26">&nbsp;</td>
                                  <td width="402" class="font_ex">- ȸ������ ���Ͻô� ������ ��� ���ؼ��� �α����� 
                                    �ؾ� �մϴ�.<br>
                                    - ���̵�� ��й�ȣ�� �Է��Ͻ� �� �α��� ��ư�� ���� �ֽñ� �ٶ��ϴ�.<br>
                                    - ȸ���� �ƴϽ� ���� ȸ�������� �� �ֽñ� �ٶ��ϴ�.</td>
                                </tr>
                              </table></td>
                          </tr>
                        </table>
					  </td>
                    </tr>
                    <tr> 
                      <td height="35" align="center" valign="top">&nbsp;</td>
                    </tr>
                  </table>
				</form>

                </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>



<!-- footer -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td background="../../../images/cp/bg_footer.gif"><table width="900" height="64" border="0" cellpadding="0" cellspacing="0">
        <tr valign="top"> 
          <td colspan="2"></td>
        </tr>
        <tr> 
          <td width="131" rowspan="2" align="right" valign="top">&nbsp;</td>
          <td width="634" height="17" align="center" class="bottom_menu"><a href="#">����Ʒ����ǻ���</a> 
            �� <a href="#">����������ȣ��å</a> <strong>��������: TEL</strong> 080-224-9697~7 
            <strong>E-MAIL</strong> <a href="mailto:elearning@autoeversystems.com">elearning@autoeversystems.com</a> 
          </td>
        </tr>
        <tr> 
          <td height="35" align="center" valign="top"><img src="../../../images/user/homepage/type1/footer_copy.gif" ></td>
        </tr>
      </table></td>
  </tr>
</table>


</body>
</html>
