<%@ page contentType = "text/html;charset=euc-kr" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" >
<meta http-equiv="Pragma" content="no-cache" >
<TITLE> :::: ���̹� ��ȭ������ ��ī���� :::: </TITLE>
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

function MM_showHideLayers() { //v3.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
} 

//-->
</script>

</HEAD>

<BODY bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="/images/user/kocca/homepage/new_img/main_bg.jpg">

<!-- logo �� �޴� �÷��� start -->
<table border="0" cellspacing="0" cellpadding="0">
	<tr> 
		<td valign="top"><img src="/images/user/kocca/homepage/new_img/logo.jpg"></td>
		<td valign="top"><img src="/images/user/kocca/homepage/new_img/menu.jpg"><!--
			<script language = "javascript" src = "/script/user_patch.js"></script>
			<script language='javascript'>
			setParam1('/images/user/kocca/homepage/type1/menuflash.swf');
			setParam2('713');
			setParam3('42');
			//alert("1111");
			object_patch('leftmenuB');
			setParam1('');
			setParam2('');
			setParam3('');
			</script>
			--></td>
	</tr>
</table>
<!-- logo �� �޴� �÷��� end -->

<!-- ���� �÷��� start -->
<table border="0" cellspacing="0" cellpadding="0">
	<tr> 
		<td><img src="/images/user/kocca/homepage/new_img/mainflash.jpg"><!--
			<script language = "javascript" src = "/script/user_patch.js"></script>
			<script language='javascript'>
			setParam1('/images/user/kocca/homepage/type1/mainflash.swf');
			setParam2('916');
			setParam3('222');
			//alert("1111");
			object_patch('leftmenuB');
			setParam1('');
			setParam2('');
			setParam3('');
			</script>
			<!--object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="916" height="222">
			<param name="movie" value="">
			<param name="quality" value="high">
			<embed src="" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="916" height="222"></embed></object--></td>
	</tr>
</table>
<!-- ���� �÷��� end -->

<table border="0" cellspacing="0" cellpadding="0" width="916" background="/images/user/kocca/homepage/new_img/m_bg.jpg" style="background-repeat:no-repeat;">
	<tr> 
		<td width="10"><span style="width:10"></span></td>
		<td valign="top" width="190">
			
			<table width="170" border="0" cellspacing="0" cellpadding="0">
				<tr> 
					<td> 

						<!--  �α��� table start -->
						<!-- login  -->

						<form name="frmLogin" method="post" action="">
						<input type="hidden" name="p_process" value="" >

						<SCRIPT LANGUAGE="JavaScript">
						<!--

						/* �н����� ����Ű üũ */
						function password_enter(e) {
						if (e.keyCode =='13'){  login();  }
						}

						// �α���
						function login() {

						if (input_chk(frmLogin)){
						frmLogin.p_process.value   = "login";
						frmLogin.action            = "/servlet/controller.homepage.KLoginServlet";
						frmLogin.submit();
						}
						}

						// �н����� ã��
						function losspwd() {
						//frmLogin.p_process.value   = "golosspwd";
						frmLogin.action            = "/servlet/controller.homepage.KLoginServlet?p_process=golosspwd";
						frmLogin.submit();
						}

						// ȸ������
						function member() {
						//frmLogin.p_process.value   = "golosspwd";
						frmLogin.action            = "/servlet/controller.homepage.KMemberJoinServlet?p_process=join";
						frmLogin.submit();
						}

						// �Է� üũ
						function input_chk(frmLogin)  {
						var chk = ( isNull(frmLogin.elements["p_userid"],"���̵�") && isNull(frmLogin.elements["p_pwd"],"��й�ȣ"));
						return (chk);
						}

						/*
						if( getCookie( "userid" ) == "" ) {
						document.frmLogin.p_userid.focus();
						} else {
						document.frmLogin.p_userid.value = getCookie( "userid" );
						document.frmLogin.rememberId.checked = true;
						document.frmLogin.p_pwd.focus();
						}
						*/

						//-->
						</SCRIPT>	
						<!-- �α��� ��-->
						
						<table width="170" border="0" cellspacing="0" cellpadding="0">
							<tr height="120">
								<td background="/images/user/kocca/homepage/new_img/login_bg.jpg" style="background-repeat:no-repeat;padding:37 0 0 9" valign="top">
									
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td><input name="p_userid" type="text" class="main_login" style="width:105;height:18" tabindex="1" value="ID" onkeypress="password_enter(event)"></td>
											<td rowspan="2" style="padding-left:4"><a href="javascript:login()"><img src="/images/user/kocca/homepage/new_img/btn_login.gif"></td>
										</tr>
										<tr>
											<td><input name="p_pwd" type="password" class="main_login" style="width:105;height:18" tabindex="2" value="PASSWORD" onkeypress="password_enter(event)" ></td>
										</tr>
										<tr>
											<td height="10"></td>
										</tr>
										<tr>
											<td colspan="2" align="center">
												<a href="javascript:member()"><img src="/images/user/kocca/homepage/new_img/btn_joinus.gif"></a><a href="javascript:losspwd()"><img src="/images/user/kocca/homepage/new_img/btn_idpw_search.gif"></a>
											</td>
										</tr>
									</table>

								</td>
							</tr>
						</table>
						<!-- �α��� ��-->
						<!-- //�α��� ��-->
						</form>

					</td>
				</tr>
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td>
						
						<!--  ���°˻� table start -->

						<SCRIPT LANGUAGE="JavaScript">
						<!--

						function search_enter(e)  {
						if (e.keyCode =='13'){  subjSearch();}
						}


						function subjSearch() {
						if (document.subjSearch.p_lsearchtext.value=="") {
						alert("�˻�� �Է��ϼ���");
						return;
						}

						document.subjSearch.action = "/servlet/controller.propose.KMainSubjSearchServlet";
						document.subjSearch.p_process.value = "SubjSearch";
						document.subjSearch.submit();
						}
						//-->
						</SCRIPT>
						
						<form name="subjSearch" method="post" action="javascript:return;">
						<input type='hidden' name='p_process'>
						<input type='hidden' name='p_lsearch' value="">
						
						<table width="170" border="0" cellspacing="0" cellpadding="0">
							<tr height="58">
								<td background="/images/user/kocca/homepage/new_img/search_bg.jpg" style="background-repeat:no-repeat;padding:8 0 0 32" valign="top">
									
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td><input type="text" name="p_lsearchtext" class="search_input" value="" style="width:85;height:19" onkeypress="search_enter(event)"></td>
											<td style="padding-left:5"><a href="javascript:subjSearch()"><img src="/images/user/kocca/homepage/new_img/i_go.gif"></a></td>
										</tr>
									</table>

								</td>
							</tr>
						</table>
						
						</form>
						<!--  ���°˻� table end -->

					</td>
				</tr>
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td>
						
						<!--  ������û table start -->
						<table border="0" cellspacing="0" cellpadding="0">
							<tr> 
								<td><a href="/servlet/controller.propose.KProposeCourseServlet?p_process=SubjectList"><img src="/images/user/kocca/homepage/new_img/st_aplly_b.gif"></a></td>
							</tr>
							<tr> 
								<td><a href="/servlet/controller.study.KMyClassServlet?p_process=ProposeCancelPage"><img src="/images/user/kocca/homepage/new_img/st_aplly_01.gif"></a></td>
							</tr>
							<tr> 
								<td><a href="/servlet/controller.propose.KProposeCourseServlet?p_process=SubjectIntro"><img src="/images/user/kocca/homepage/new_img/st_aplly_02.gif"></a></td>
							</tr>
							<tr> 
								<td><a href="/servlet/controller.propose.KProposeCourseServlet?p_process=OffLineSubjPage"><img src="/images/user/kocca/homepage/new_img/st_aplly_03.gif"></a></td>
							</tr>
						</table>
						<!--  ������û table end -->

					</td>
				</tr>
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td>
						
						<!--  ������ table start -->
						<table border="0" cellspacing="0" cellpadding="0">
							<tr> 
								<td><a href="/servlet/controller.homepage.KHome1vs1Servlet?p_process=movePage"><img src="/images/user/kocca/homepage/new_img/quick_menu_03.gif"></a><br></td>
							</tr>
						</table>
						<!--  ������ table end -->

					</td>
				</tr>
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td>
						
						<SCRIPT LANGUAGE="JavaScript">
						<!--
							// Ŀ�´�Ƽ ��â
							function CommunityOpenPage() {
								window.self.name = "winSelectViewCommunity";
								farwindow = window.open("", "openWinCommunity", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 920, height = 640, top=0, left=0");
								document.topdefaultForm.target = "openWinCommunity"
								document.topdefaultForm.action = "/servlet/controller.community.CommunityIndexServlet";
								document.topdefaultForm.submit();

								farwindow.window.focus();
								document.topdefaultForm.target = window.self.name;
							}    
						//-->
						</SCRIPT>

						<!--  Ŀ�´�Ƽ table start -->
						<table border="0" cellspacing="0" cellpadding="0">
							<tr> 
								<td><a href="#"  onClick='CommunityOpenPage()'><img src="/images/user/kocca/homepage/new_img/quick_menu_04.gif"></a><br></td>
							</tr>
						</table>
						<!--  Ŀ�´�Ƽ table end -->

					</td>
				</tr>
			</table>
				
		</td>
		<td width="490" valign="top">
			
			<!--  �������� table start -->

			<SCRIPT LANGUAGE="JavaScript">
			<!--

			function selectView(seq){
			var url = "/servlet/controller.homepage.KHomeNoticeServlet?p_process=selectView&p_seq="+seq;
			document.form1.action = url;
			document.form1.submit();
			}

			//-->
			</SCRIPT>

			<script language="Javascript">

				function hide() {
					document.all.div1.style.display = 'none';
					document.all.div2.style.display = 'none';
				}

				function show(i) {
					switch (i) {
						case (1) : {
							document.all.div1.style.display = 'block';
						} break;
						case (2) : {
							document.all.div2.style.display = 'block';
						} break;
					}
				}

			</script>

			<!-- �������� -->
			
			<form name="form1" method="post">
			<table border="0" cellpadding="0" cellspacing="0" id="div1" style="display:block">
				<tr>
					<td><img src="/images/user/kocca/homepage/new_img/st_notice.gif" border="0" usemap="#st_notice"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<tr height="108">
					<td valign="top" style="padding-left:4">
						
						<table width="466" border="0" cellspacing="0" cellpadding="0">
							<tr height="19"> 
								<td name="p_seq" class="notice" value=""><img src="/images/user/kocca/homepage/new_img/icon.gif" align="absmiddle"> <a href="javascript:selectView(112)">[������û]1�� ��� �濵���� ������ �����ȳ�</td>
								<td class="notice_day" align="left">[2006-12-18]</td>
							</tr>
							<tr height="19"> 
								<td name="p_seq" class="notice" value=""><img src="/images/user/kocca/homepage/new_img/icon.gif" align="absmiddle"> <a href="javascript:selectView(112)">[������û]1�� ��� �濵���� ������ �����ȳ�</td>
								<td class="notice_day" align="left">[2006-12-18]</td>
							</tr>
							<tr height="19"> 
								<td name="p_seq" class="notice" value=""><img src="/images/user/kocca/homepage/new_img/icon.gif" align="absmiddle"> <a href="javascript:selectView(112)">[������û]1�� ��� �濵���� ������ �����ȳ�</td>
								<td class="notice_day" align="left">[2006-12-18]</td>
							</tr>
							<tr height="19"> 
								<td name="p_seq" class="notice" value=""><img src="/images/user/kocca/homepage/new_img/icon.gif" align="absmiddle"> <a href="javascript:selectView(112)">[������û]1�� ��� �濵���� ������ �����ȳ�</td>
								<td class="notice_day" align="left">[2006-12-18]</td>
							</tr>
							<tr height="19"> 
								<td name="p_seq" class="notice" value=""><img src="/images/user/kocca/homepage/new_img/icon.gif" align="absmiddle"> <a href="javascript:selectView(112)">[������û]1�� ��� �濵���� ������ �����ȳ�</td>
								<td class="notice_day" align="left">[2006-12-18]</td>
							</tr>
						</table>

					</td>
				</tr>
			</table>

			<map name="st_notice">
				<area shape="rect" coords="0,0,76,22" href="#" onclick='javascript:hide();show(1);' onMouseOver="MM_swapImage('tab01','','/images/user/kocca/homepage/new_img/st_notice.gif',1);javascript:hide();show(1);" onMouseOut="MM_swapImgRestore();" onFocus="this.blur()">
				<area shape="rect" coords="76,0,184,22" href="#" onclick='javascript:hide();show(2);' onMouseOver="MM_swapImage('tab02','','/images/user/kocca/homepage/new_img/st_offline_info.gif',1);javascript:hide();show(2);" onMouseOut="MM_swapImgRestore();" onFocus="this.blur()">
				<area shape="rect" coords="436,0,470,24" href="/servlet/controller.homepage.KHomeNoticeServlet?p_process=moreNotice" onFocus="this.blur()">
			</map>
			</form>

			<script language="javascript">
			//function open_window(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable) {
			var  width  = 0;
			var  height = 0;
			var  left   = 0;
			var  top    = 0;



			function notice_getCookie( name ){
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

			</script>

			<!-- �������� -->
			<!--  �������� table end -->

			<!--  �������ΰ��¼ҽ��� table start -->
			<table border="0" cellpadding="0" cellspacing="0" id="div2" style="display:none">
				<tr>
					<td><img src="/images/user/kocca/homepage/new_img/st_offline_info.gif" border="0" usemap="#st_offline_info"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<tr height="108">
					<td valign="top" style="padding-left:4">
						
						<table width="466" border="0" cellspacing="0" cellpadding="0">
							<tr height="19"> 
								<td name="p_seq" class="notice" value=""><img src="/images/user/kocca/homepage/new_img/icon.gif" align="absmiddle"> <a href="javascript:selectView(112)">[������û]1�� ��� �濵���� ������ �����ȳ�</td>
								<td class="notice_day" align="left">[2006-12-18]</td>
							</tr>
							<tr height="19"> 
								<td name="p_seq" class="notice" value=""><img src="/images/user/kocca/homepage/new_img/icon.gif" align="absmiddle"> <a href="javascript:selectView(112)">[������û]1�� ��� �濵���� ������ �����ȳ�</td>
								<td class="notice_day" align="left">[2006-12-18]</td>
							</tr>
							<tr height="19"> 
								<td name="p_seq" class="notice" value=""><img src="/images/user/kocca/homepage/new_img/icon.gif" align="absmiddle"> <a href="javascript:selectView(112)">[������û]1�� ��� �濵���� ������ �����ȳ�</td>
								<td class="notice_day" align="left">[2006-12-18]</td>
							</tr>
							<tr height="19"> 
								<td name="p_seq" class="notice" value=""><img src="/images/user/kocca/homepage/new_img/icon.gif" align="absmiddle"> <a href="javascript:selectView(112)">[������û]1�� ��� �濵���� ������ �����ȳ�</td>
								<td class="notice_day" align="left">[2006-12-18]</td>
							</tr>
							<tr height="19"> 
								<td name="p_seq" class="notice" value=""><img src="/images/user/kocca/homepage/new_img/icon.gif" align="absmiddle"> <a href="javascript:selectView(112)">[������û]1�� ��� �濵���� ������ �����ȳ�</td>
								<td class="notice_day" align="left">[2006-12-18]</td>
							</tr>
						</table>

					</td>
				</tr>
			</table>

			<map name="st_offline_info">
				<area shape="rect" coords="0,0,76,22" href="#" onclick='javascript:hide();show(1);' onMouseOver="MM_swapImage('tab01','','/images/user/kocca/homepage/new_img/st_notice.gif',1);javascript:hide();show(1);" onMouseOut="MM_swapImgRestore();" onFocus="this.blur()">
				<area shape="rect" coords="76,0,184,22" href="#" onclick='javascript:hide();show(2);' onMouseOver="MM_swapImage('tab02','','/images/user/kocca/homepage/new_img/st_offline_info.gif',1);javascript:hide();show(2);" onMouseOut="MM_swapImgRestore();" onFocus="this.blur()">
				<area shape="rect" coords="436,0,470,24" href="/servlet/controller.propose.KProposeCourseServlet?p_process=OffLineSubjPage" onFocus="this.blur()">
			</map>
			<!--  �������ΰ��¼ҽ��� table end -->

			<!--  �ٷΰ��� LINK table start -->
			<table width="470" border="0" cellspacing="0" cellpadding="0">
				<tr height="63">
					<td background="/images/user/kocca/homepage/new_img/curri_bg.gif" style="background-repeat:no-repeat;padding:26 0 0 62" valign="top">
						
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="74"><img src="/images/user/kocca/homepage/new_img/icon02.gif" align="absmiddle"> <a href="#" class="curri">�Թ�����</a></td>
								<td width="74"><img src="/images/user/kocca/homepage/new_img/icon02.gif" align="absmiddle"> <a href="#" class="curri">��������</a></td>
								<td width="80"><img src="/images/user/kocca/homepage/new_img/icon02.gif" align="absmiddle"> <a href="#" class="curri">����������</a></td>
								<td width="80"><img src="/images/user/kocca/homepage/new_img/icon02.gif" align="absmiddle"> <a href="#" class="curri">��ũ�����</a></td>
								<td width="74"><img src="/images/user/kocca/homepage/new_img/icon02.gif" align="absmiddle"> <a href="#" class="curri">������������</a></td>
							</tr>
						</table>

					</td>
				</tr>
				<tr>
					<td height="9"></td>
				</tr>
			</table>
			<!--  �ٷΰ��� LINK table end -->

			<!-- ��õ���� start -->

			<SCRIPT LANGUAGE="JavaScript">
			<!--

			// ���� ���뺸��
			function whenSubjInfo(subj,sphere){
			document.subjform.p_subj.value     = subj;
			document.subjform.p_sphere.value   = sphere;
			document.subjform.p_process.value  = 'SubjectPreviewPage';
			document.subjform.p_rprocess.value = 'SubjectListAlway';
			document.subjform.action='/servlet/controller.course.KCourseIntroServlet';
			document.subjform.target = "_self";
			document.subjform.submit();
			}
			//-->
			</SCRIPT>


			<form name="subjform" method="post" >
			<input type="hidden" name="p_process">
			<input type="hidden" name="p_subj">
			<input type='hidden' name='p_sphere' >
			<input type='hidden' name='p_rprocess' value="">

			<table width="470" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td valign="top">
						
						<!-- �̴��� ��õ���� -->
						<table border="0" cellspacing="0" cellpadding="0">
							<tr> 
								<td><img src="/images/user/kocca/homepage/new_img/st_monthly_class.gif"></td>
							</tr>
							<tr> 
								<td background="/images/user/kocca/homepage/new_img/st_monthly_bg.gif" align="center">
									
									<table width="213" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td><img src="/images/user/kocca/homepage/new_img/st_monthly_top.gif"></td>
										</tr>
										<tr bgcolor="#F1FBEB"> 
											<td align="center">
												
												<table width="199" border="0" cellpadding="0">
													<tr> 
														<td width="50"><img src="/upload/bulletin/Subject_introducefile_200605111109031_lee1.JPG" width="44" height="44"></td>
														<td width="149">
														
															
															<table border="0" cellpadding="0" cellspacing="0">
																<tr>
																	<td><strong><a href="javascript:whenSubjInfo('cbu001','ALL')" ><span class="new_main_contents_title_text">��ȭ�������� ����Ͻ� ��</span></a></strong></td>
																</tr>
																<tr>
																	<td height="5"></td>
																</tr>
																<tr>
																	<td class="main_contents02">�� ������ ��ȭ������ ����Ͻ��� ü��� ������...</td>
																</tr>
															</table>

														</td>
													</tr>
													<tr>
														<td height="10"></td>
													</tr>
													<tr> 
														<td width="50"><img src="/upload/bulletin/Subject_introducefile_200605111109031_lee1.JPG" width="44" height="44"></td>
														<td width="149">
														
															
															<table border="0" cellpadding="0" cellspacing="0">
																<tr>
																	<td><strong><a href="javascript:whenSubjInfo('cbu001','ALL')" ><span class="new_main_contents_title_text">��ȭ�������� ����Ͻ� ��</span></a></strong></td>
																</tr>
																<tr>
																	<td height="5"></td>
																</tr>
																<tr>
																	<td class="main_contents02">�� ������ ��ȭ������ ����Ͻ��� ü��� ������...</td>
																</tr>
															</table>

														</td>
													</tr>
													<tr>
												</table>

											</td>											
										</tr>
										<tr>
											<td><img src="/images/user/kocca/homepage/new_img/st_monthly_bottom.gif"></td>
										</tr>
									</table>

								</td>
							</tr>
							<tr> 
								<td><img src="/images/user/kocca/homepage/new_img/st_monthly_bottom02.gif"></td>
							</tr>
						</table>
						</form>
						<!-- �̴��� ��õ���� -->

					</td>
					<td valign="top" align="right">
						
						
						<!--  �αⰭ�� table start -->

						<SCRIPT LANGUAGE="JavaScript">
						<!--
						// ���� ���뺸��
						function whenSubjInfo(subj,sphere){
						document.frm3.p_subj.value       = subj;
						document.frm3.p_sphere.value = sphere;
						document.frm3.p_process.value  = 'SubjectPreviewPage';
						document.frm3.p_rprocess.value = 'SubjectListAlway';
						document.frm3.action='/servlet/controller.course.KCourseIntroServlet';
						document.frm3.target = "_self";
						document.frm3.submit();
						}


						//-->
						</SCRIPT>

						<FORM  name="frm3" METHOD=POST ACTION="" >
						<input type="hidden" name="p_searchYn">
						<input type='hidden' name='p_sphere' >
						<input type='hidden' name='p_subj'    value="">
						<input type='hidden' name='p_rprocess' value="">
						<input type='hidden' name='p_process' value="">
						</FORM>

						<table border="0" cellspacing="0" cellpadding="0">
							<tr> 
								<td><img src="/images/user/kocca/homepage/new_img/st_good_course.gif"></td>
							</tr>
							<tr> 
								<td background="/images/user/kocca/homepage/new_img/st_monthly_bg.gif" align="center">
									
									<table width="213" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td><img src="/images/user/kocca/homepage/new_img/st_monthly_top002.gif"></td>
										</tr>
										<tr bgcolor="#FBF7ED"> 
											<td align="center">
												
												<table width="199" border="0" cellpadding="0">
													<tr> 
														<td width="50"><img src="/upload/bulletin/Subject_introducefile_200605111109031_lee1.JPG" width="44" height="44"></td>
														<td width="149">
														
															
															<table border="0" cellpadding="0" cellspacing="0">
																<tr>
																	<td><strong><a href="javascript:whenSubjInfo('cbu001','ALL')" ><span class="new_main_contents_title_text02">��ȭ�������� ����Ͻ� ��</span></a></strong></td>
																</tr>
																<tr>
																	<td height="5"></td>
																</tr>
																<tr>
																	<td class="main_contents02">1.�� ������ ��ȭ������</td>
																</tr>
																<tr>
																	<td class="main_contents02">1.�� ������ ��ȭ������</td>
																</tr>
															</table>

														</td>
													</tr>
													<tr>
														<td height="10"></td>
													</tr>
													<tr> 
														<td width="50"><img src="/upload/bulletin/Subject_introducefile_200605111109031_lee1.JPG" width="44" height="44"></td>
														<td width="149">
														
															
															<table border="0" cellpadding="0" cellspacing="0">
																<tr>
																	<td><strong><a href="javascript:whenSubjInfo('cbu001','ALL')" ><span class="new_main_contents_title_text02">��ȭ�������� ����Ͻ� ��</span></a></strong></td>
																</tr>
																<tr>
																	<td height="5"></td>
																</tr>
																<tr>
																	<td class="main_contents02">1.�� ������ ��ȭ������</td>
																</tr>
																<tr>
																	<td class="main_contents02">1.�� ������ ��ȭ������</td>
																</tr>
															</table>

														</td>
													</tr>
													<tr>
												</table>

											</td>											
										</tr>
										<tr>
											<td><img src="/images/user/kocca/homepage/new_img/st_monthly_bottom002.gif"></td>
										</tr>
									</table>

								</td>
							</tr>
							<tr> 
								<td><img src="/images/user/kocca/homepage/new_img/st_monthly_bottom02.gif"></td>
							</tr>
						</table>
						
						<!-- �αⰭ�� table start -->

					</td>
				</tr>
				<tr>
					<td height="9"></td>
				</tr>
			</table>
			<!-- ��õ���� end -->

			<!-- �Ŀ����ͺ� table start -->

			<SCRIPT LANGUAGE="JavaScript">

			function view(seq) {
			pform1.action = "/servlet/controller.homepage.KOpenPowerServlet";
			pform1.p_seq.value = seq;
			pform1.p_process.value = "OpenPowerDetail";
			pform1.submit();
			}

			</SCRIPT>	


			<form name="pform1" method="post">
			<input type="hidden" name="p_seq">
			<input type="hidden" name="p_process">

			<table width="223" border="0" cellspacing="0" cellpadding="0">
				<tr> 
					<td><a href="http://contents.connect.or.kr/servlet/controller.homepage.KOpenPowerServlet"><img src="/images/user/kocca/homepage/new_img/st_power_interview.gif"></a></td>
				</tr>
				<tr> 
					<td background="/images/user/kocca/homepage/new_img/st_power_interview_bg.gif" align="center">
						
						<table width="450" border="0" cellspacing="0" cellpadding="0">
							<tr> 
								<td><a href="javascript:view(18)" width="95"><img src="/images/user/kocca/homepage/new_img/st_power_interview_img.gif"></td>
								<td class="tbl_gleft_small" width="355">				
									
									<table border="0" cellpadding="0" cellspacing="0">
										<tr height="20">
											<td><img src="/images/user/kocca/homepage/new_img/icon03.gif" align="absmiddle"> ��ȭ������ �帣�� ������ ����Ʈ Ʃ�� ������ Ʃ�ʹ�</td>
										</tr>
										<tr height="20">
											<td><img src="/images/user/kocca/homepage/new_img/icon03.gif" align="absmiddle"> ��ȭ������ �帣�� ������ ����Ʈ Ʃ�� ������ Ʃ�ʹ�</td>
										</tr>
										<tr height="20">
											<td><img src="/images/user/kocca/homepage/new_img/icon03.gif" align="absmiddle"> ��ȭ������ �帣�� ������ ����Ʈ Ʃ�� ������ Ʃ�ʹ�</td>
										</tr>
									</table>

								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr> 
					<td><img src="/images/user/kocca/homepage/new_img/st_power_interview_bottom.gif"></td>
				</tr>
			</table>
			<!-- �Ŀ����ͺ� table end -->

		</td>
		<td width="226" valign="top" style="padding-top:19">
			
			<!-- ���� ������ -->
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><img src="/images/user/kocca/homepage/new_img/sample.gif" align="absmiddle"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
			</table>
			<!-- ���� ������ -->

			<!-- ���� �ε�� table start -->
			<SCRIPT LANGUAGE="JavaScript">
			<!--

				 function viewLoad() {

					window.self.name = "winSelectView";
					farwindow = window.open("", "openWin", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no, width = 762, height = 750, top=0, left=0");
					document.pform1.target = "openWin"

					document.pform1.p_process.value = "select";
					document.pform1.action = "/servlet/controller.course.SubjLoadMapServlet";
					document.pform1.submit();

					farwindow.window.focus();
					document.pform1.target = window.self.name;
				 }

			//-->
			</SCRIPT>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><img src="/images/user/kocca/homepage/new_img/quick_menu_01.gif" align="absmiddle"></td>
				</tr>
				<tr>
					<td height="24" bgcolor="#F6FBFB" style="padding-left:11"><img src="/images/user/kocca/homepage/new_img/icon04.gif" align="absmiddle"> <a href="javascript:viewLoad()" class="curri">�Ϲ��� ���</a></td>
				</tr>
				<tr>
					<td height="1" background="/images/user/kocca/homepage/new_img/dot.gif"></td>
				</tr>
				<tr>
					<td height="24" bgcolor="#F6FBFB" style="padding-left:11"><img src="/images/user/kocca/homepage/new_img/icon04.gif" align="absmiddle"> <a href="javascript:viewLoad()" class="curri">���� �� ��������</a></td>
				</tr>
				<tr>
					<td height="1" background="/images/user/kocca/homepage/new_img/dot.gif"></td>
				</tr>
				<tr>
					<td height="24" bgcolor="#F6FBFB" style="padding-left:11"><img src="/images/user/kocca/homepage/new_img/icon04.gif" align="absmiddle"> <a href="javascript:viewLoad()" class="curri">��ȭ��������� ������</a></td>
				</tr>
				<tr>
					<td height="7"></td>
				</tr>
			</table>
			<!-- ���� �ε�� table end -->

			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><img src="/images/user/kocca/homepage/new_img/r_bn01.gif" align="absmiddle"></td>
				</tr>
				<tr>
					<td height="6"></td>
				</tr>
				<tr>
					<td><a href="#" onClick="MM_openBrWindow('/learn/user/kocca/homepage/pop_curri.jsp','','scrollbars=yes,width=816,height=600');"><img src="/images/user/kocca/homepage/new_img/r_bn02.gif" align="absmiddle"></a></td>
				</tr>
				<tr>
					<td height="6"></td>
				</tr>
				<tr>
					<td><a href="#" onClick="MM_openBrWindow('/learn/user/kocca/homepage/pop_map.jsp','','scrollbars=no,width=676,height=629');"><img src="/images/user/kocca/homepage/new_img/r_bn03.gif" align="absmiddle"></a></td>
				</tr>
			</table>

		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td background="/images/user/kocca/homepage/new_img/copy_bg.gif">
            
			<table width="916" border="0" cellpadding="0" cellspacing="0">	
				<tr>
					<td><img src="/images/user/kocca/homepage/new_img/bottom_logo.gif"></td>
					<td><a href="http://www.mct.go.kr/" target="_blank"><img src="/images/user/kocca/homepage/new_img/bottom01.gif"></a></td>
					<td><a href="http://www.kocca.or.kr/index.jsp" target="_blank"><img src="/images/user/kocca/homepage/new_img/bottom02.gif"></a></td>
					<td><a href="http://www.gameinfinity.or.kr" target="_blank"><img src="/images/user/kocca/homepage/new_img/bottom03.gif"></a></td>
					<td><a href="http://www.gitiss.org" target="_blank"><img src="/images/user/kocca/homepage/new_img/bottom04.gif"></a></td>
					<td><a href="http://academy.kbi.re.kr/" target="_blank"><img src="/images/user/kocca/homepage/new_img/bottom05.gif"></a></td>
					<td><a href="http://www.gameacademy.or.kr/" target="_blank"><img src="/images/user/kocca/homepage/new_img/bottom06.gif"></a></td>
				</tr>
			</table>
		
		</td>
	</tr>
	<tr>
		<td bgcolor="#F2F2F2"><img src="/images/user/kocca/homepage/new_img/copy02.gif" align="absmiddle" usemap="#copy02"></td>
	</tr>
</table>

<map name="copy02">
	<area shape="rect" coords="18,0,55,28" href="/" onFocus="this.blur()">
	<area shape="rect" coords="55,0,121,28" href="/" onFocus="this.blur()">
	<area shape="rect" coords="121,0,170,28" href="/servlet/controller.homepage.KHomeSiteMapServlet" onFocus="this.blur()">
	<area shape="rect" coords="648,6,668,24" href="#" onFocus="this.blur()">
</map>
</BODY>
<HTML>
