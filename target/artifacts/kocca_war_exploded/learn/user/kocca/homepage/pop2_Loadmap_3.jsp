<%
//**********************************************************
//  1. ��      ��: Loadmap
//  2. ���α׷��� : pop_Loadmap.jsp
//  3. ��      ��: Loadmap 
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: 06.01.16
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<html>
<head>
<title> ::: �����ε�� ::: </title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/css/user_style_k1.css" rel="stylesheet" type="text/css">

<script language="JavaScript" type="text/JavaScript">
<!--
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
<SCRIPT LANGUAGE="JavaScript">
<!--

function move(tab){
	document.form1.p_process.value= "select2";
	document.form1.p_tab.value = tab;
	document.form1.action = "/servlet/controller.course.SubjLoadMapServlet";
	document.form1.submit();
}

//-->
</SCRIPT>

</head>

<body bgcolor="F6F6F6" onLoad="MM_preloadImages('/images/user/kocca/course/tab2_02on.gif','/images/user/kocca/course/tab2_03on.gif','/images/user/kocca/course/tab2_04on.gif','/images/user/kocca/course/tab2_05on.gif','/images/user/kocca/course/tab2_06on.gif','/images/user/kocca/course/tab11_01on.gif','/images/user/kocca/course/tab11_02on.gif')">
<form name = "form1" method="post">
	<input type="hidden" name ="p_process">
	<input type="hidden" name ="p_tab">
</form>

<table width="746" border="0" cellpadding="0" cellspacing="0" bgcolor="F6F6F6">
  <tr>
    <td><img src="/images/user/kocca/course/pop_tit_roadmap.gif" width="679" height="49"></td>
  </tr>
  <tr>
    <td><table width="745" border="0" cellspacing="0" cellpadding="0">
        <tr background="/images/user/game/apply/pop_box_topbg.gif">
          <td width="23" height="10" valign="top" background="/images/user/game/apply/pop_box_topbg.gif"><img src="/images/user/game/apply/pop_box_toph.gif" width="22" height="10"></td>
          <td width="701" height="10" background="/images/user/game/apply/pop_box_topbg.gif"></td>
          <td width="21" height="10" align="right" background="/images/user/game/apply/pop_box_topbg.gif"><img src="/images/user/game/apply/pop_box_toptail.gif" width="21" height="10"></td>
        </tr>
        <tr>
          <td valign="top" background="/images/user/game/apply/pop_box_lbg.gif">&nbsp;</td>
          <td align="center" valign="top" bgcolor="#FFFFFF">
		  <!-- ��ü�з��Ǻκ� -->
		  <table width="675" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="right"><a href="javascript:move(1);" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','/images/user/kocca/course/tab11_01on.gif',1)"><img src="/images/user/kocca/course/tab11_01.gif" name="Image42" border="0"></a><a href="javascript:move(2);" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image41','','/images/user/kocca/course/tab11_02on.gif',1)"><img src="/images/user/kocca/course/tab11_02.gif" name="Image41" border="0"></a><img src="/images/user/kocca/course/tab11_03on.gif"></td>
              </tr>
			    <tr> 
                <td height="1" ></td>
              </tr>
              <tr> 
                <td height="1" bgcolor="#CCCCCC"></td>
              </tr>
            </table> 
			<!-- ����Ÿ��Ʋ -->
            <table width="676" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="676">&nbsp;</td>
              </tr>
              <tr> 
                <td><img src="/images/user/kocca/course/st_map2-3.gif"></td>
              </tr>
              <tr>
                <td height="5"></td>
              </tr>
            </table>
            <table width="675" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background="/images/user/kocca/course/pop2_road_bg.jpg"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="73">&nbsp;</td>
                      <td width="602">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td valign="top"><table width="50" height="288" border="1" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td width="46" height="329" bordercolor="CFCFC4" bgcolor="#E4D6C0" class="tbl_croad"><strong>���޺�<br>
                              ���׸�<br>
                              [�ǹ���] </strong></td>
                          </tr>
                        </table></td>
                      <td valign="top"> 
                        <!-- �Ǻκ� -->
                        <table width="618" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/course/tab3_01.gif" name="Image11" border="0" onClick="MM_showHideLayers('Layer2','','hide','Layer3','','hide','Layer4','','hide','Layer5','','hide','Layer6','','hide','Layer1','','show')"><img src="/images/user/kocca/course/tab3_02.gif" name="Image12" border="0" onClick="MM_showHideLayers('Layer2','','show','Layer3','','hide','Layer4','','hide','Layer5','','hide','Layer6','','hide','Layer1','','hide')"><img src="/images/user/kocca/course/tab3_03.gif" name="Image13" border="0" onClick="MM_showHideLayers('Layer2','','hide','Layer3','','show','Layer4','','hide','Layer5','','hide','Layer6','','hide','Layer1','','hide')"><img src="/images/user/kocca/course/tab3_04.gif" name="Image14" border="0" onClick="MM_showHideLayers('Layer2','','hide','Layer3','','hide','Layer4','','show','Layer5','','hide','Layer6','','hide','Layer1','','hide')"><img src="/images/user/kocca/course/tab3_05.gif" name="Image15" border="0" onClick="MM_showHideLayers('Layer2','','hide','Layer3','','hide','Layer4','','hide','Layer5','','show','Layer6','','hide','Layer1','','hide')"><img src="/images/user/kocca/course/tab3_06.gif" name="Image16" border="0" onClick="MM_showHideLayers('Layer2','','hide','Layer3','','hide','Layer4','','hide','Layer5','','hide','Layer6','','show','Layer1','','hide')"></td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                        </table>
                        <table width="618" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="104" valign="top">&nbsp;</td>
                            <td width="103" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">��ȭ 
                                    �� ÷�ܱ��<br>
                                    �� ����</td>
                                </tr>
                              </table></td>
                            <td width="103" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">���������ǰ�<br>
                                    ����̽� </td>
                                </tr>
                              </table></td>
                            <td width="103" valign="top">&nbsp;</td>
                            <td width="104" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">����� 
                                    ��<br>
                                    ����� ������</td>
                                </tr>
                              </table></td>
                            <td width="101" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">������TV��<br>
                                    ��ȭ������ </td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td height="5" colspan="6"></td>
                          </tr>
                        </table>
                        <table width="618" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="104" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�ƽþƿ�ȭ<br>
                                    ���嵿��</td>
                                </tr>
                              </table></td>
                            <td width="103" valign="top">&nbsp;</td>
                            <td width="103" valign="top">&nbsp;</td>
                            <td width="103" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�������θ�Ʈ<br>
                                    ������� </td>
                                </tr>
                              </table></td>
                            <td width="104" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">���������<br>
                                    ���嵿��</td>
                                </tr>
                              </table></td>
                            <td width="101" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�ִϸ��̼�<br>
                                    ���ո����û�� </td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td height="5" colspan="6"></td>
                          </tr>
                        </table>
                        <table width="618" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="104" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�̱���ȭ<br>
                                    ���嵿��</td>
                                </tr>
                              </table></td>
                            <td width="103" valign="top">&nbsp;</td>
                            <td width="103" valign="top">&nbsp;</td>
                            <td width="103" valign="top">&nbsp;</td>
                            <td width="104" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">���������<br>
                                    ���嵿��</td>
                                </tr>
                              </table></td>
                            <td width="101" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�ִϸ��̼�<br>
                                    ���ո����û�� </td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td height="5" colspan="6"></td>
                          </tr>
                        </table>
                        <table width="618" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="5" background="/images/user/kocca/course/5line.gif"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                        </table>
                        <table width="618" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="104" valign="top"><table width="89" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="85" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">��ũ��</td>
                                </tr>
                              </table></td>
                            <td width="103" valign="top"><table width="89" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="85" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">��ũ��</td>
                                </tr>
                              </table></td>
                            <td width="103" valign="top"><table width="89" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="85" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">��ũ��</td>
                                </tr>
                              </table></td>
                            <td width="103" valign="top"><table width="89" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="85" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">��ũ��</td>
                                </tr>
                              </table></td>
                            <td width="104" valign="top"><table width="89" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="85" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">��ũ��</td>
                                </tr>
                              </table></td>
                            <td width="101" valign="top"><table width="89" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="85" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">��ũ��</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td height="5" colspan="6"></td>
                          </tr>
                        </table>
                        <table width="618" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="104" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�����ʿ���</td>
                                </tr>
                              </table></td>
                            <td width="103" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�����ʿ���</td>
                                </tr>
                              </table></td>
                            <td width="103" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�����ʿ���</td>
                                </tr>
                              </table></td>
                            <td width="103" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�����ʿ���</td>
                                </tr>
                              </table></td>
                            <td width="104" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�����ʿ���</td>
                                </tr>
                              </table></td>
                            <td width="101" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�����ʿ���</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td height="15" colspan="6"></td>
                          </tr>
                        </table>
                        <table width="618" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="100" valign="top">&nbsp;</td>
                            <td width="116" align="center" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">ȸ��</td>
                                </tr>
                              </table></td>
                            <td width="103" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�濵</td>
                                </tr>
                              </table></td>
                            <td width="108" valign="top"><table width="95" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="91" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">�λ�</td>
                                </tr>
                              </table></td>
                            <td width="119" valign="top"><table width="90" border="1" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="108" bordercolor="CFCFC4" bgcolor="#F0E7DB" class="tbl_croad">������</td>
                                </tr>
                              </table></td>
                            <td width="72" valign="top">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td height="5" colspan="6"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  
                </td>
              </tr>
            </table>
            <table width="675" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="25" colspan="2" align="right">&nbsp;</td>
              </tr>
              <tr> 
                <td colspan="2" align="right"><a href="javascript:self.close()"><img src="/images/user/game/button/btn_close.gif" border="0"></a></td>
              </tr>
            </table></td>
          <td background="/images/user/game/apply/pop_box_rbg.gif">&nbsp;</td>
        </tr>
        <tr>
          <td valign="bottom" background="/images/user/game/apply/pop_box_lbg.gif"><img src="/images/user/game/apply/pop_box_boh.gif" width="22" height="21"></td>
          <td background="/images/user/game/apply/pop_box_bobg.gif">&nbsp;</td>
          <td valign="bottom" background="/images/user/game/apply/pop_box_rbg.gif"><img src="/images/user/game/apply/pop_box_botail.gif" width="21" height="21"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
