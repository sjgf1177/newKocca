<%@page contentType="text/html;charset=utf-8" %>
<%@include file = "manager_util.jsp"%>
<%@include file = "./include/session_check.jsp"%>
<%
	String fileRealFolder = "";
	String ContextPath = request.getContextPath();
	String urlPath = rootFolderPath(request.getRequestURI());
	urlPath = urlPath.substring(0, urlPath.indexOf("manage/jsp"));

	ServletContext context = getServletConfig().getServletContext();
	fileRealFolder = context.getRealPath(urlPath);

	//2013.08.26 [2.0.5.23] mwhong tomcat8.0 에서 getRealPath가 null을 리턴하여 수정
	if(fileRealFolder == null && urlPath != null && ContextPath != null){
		fileRealFolder = context.getRealPath(urlPath.substring(ContextPath.length()));
	}

	if (ContextPath != null && !ContextPath.equals("") && !ContextPath.equals("/")){
		File tempFileRealDIR = new File(fileRealFolder);
		if(!tempFileRealDIR.exists()){
			if (urlPath != null && urlPath.indexOf(ContextPath) != -1){
				String rename_image_temp = urlPath.substring(ContextPath.length());
				fileRealFolder = context.getRealPath(rename_image_temp);
			}
		}
	}

	if (fileRealFolder.lastIndexOf(File.separator) != fileRealFolder.length() - 1){
		fileRealFolder = fileRealFolder + File.separator;
	}

	String url = xmlUrl(fileRealFolder);
	Element root = configXMlLoad(url);
	Hashtable settingValue = childValueList(root);

	String encodingStyleValue = "";
	String EncodingValue = "";

	if (settingValue.get("UploadFileNameType") != null){
		String FileNameType = (String)settingValue.get("UploadFileNameType");
	
		if (FileNameType != ""){
			if(FileNameType.indexOf(",")!= -1){
				String FileNameTypeArr[] = FileNameType.split(",");
				encodingStyleValue = FileNameTypeArr[0];
				if(FileNameTypeArr.length > 1) EncodingValue = FileNameTypeArr[1];
			}
			else{
				encodingStyleValue = FileNameType;
			}
		}
	}

	String userAddMenuList = "";
	
	if(settingValue.get("AddMenuCheck").equals("true")){
		if(settingValue.get("AddMenu") != ""){
			List addMenuListValue = (List)settingValue.get("AddMenu");
			for(int i=0; i<addMenuListValue.size(); i++){
				if(userAddMenuList.equals("")) userAddMenuList = (String)addMenuListValue.get(i);
				else userAddMenuList += "||" + (String)addMenuListValue.get(i);
			}
		}
	}
	
	if (settingValue.get("AccessibilityOption") == null  || settingValue.get("AccessibilityOption") == "" ) settingValue.put("AccessibilityOption", "0");
	if (settingValue.get("UploadFileSubDir") == null || settingValue.get("UploadFileSubDir") == "") settingValue.put("UploadFileSubDir", "true");
	
	//CE3 추가된 요소들
	if (settingValue.get("UploadFileExtBlockList") == null|| settingValue.get("UploadFileExtBlockList") == "") settingValue.put("UploadFileExtBlockList", "0|jsp,exe,php");
	if (settingValue.get("UploadImageFileExtBlockList") == null|| settingValue.get("UploadImageFileExtBlockList") == "") settingValue.put("UploadImageFileExtBlockList", "0|gif,jpeg,jpg,png,bmp");
	if (settingValue.get("AttributeBlockList") == null || settingValue.get("AttributeBlockList") == "") settingValue.put("AttributeBlockList", "0|onclick,onerror");
	if (settingValue.get("TagBlockList") == null || settingValue.get("TagBlockList") == "") settingValue.put("TagBlockList", "0|iframe,meta");
	if (settingValue.get("FontColor") == null || settingValue.get("FontColor") == "") settingValue.put("FontColor", "#000000");
	if (settingValue.get("FontSizeList") == null || settingValue.get("FontSizeList") == "") settingValue.put("FontSizeList", "7.5pt,8pt,9pt,10pt,11pt,12pt,14pt,16pt,18pt,20pt,22pt,24pt,26pt,28pt,36pt");
	if (settingValue.get("LineHeightList") == null || settingValue.get("LineHeightList") == "") settingValue.put("LineHeightList", "100%,120%,140%,150%,160%,180%,200%");
	if (settingValue.get("IndentPaddingValue") == null || settingValue.get("IndentPaddingValue") == "") settingValue.put("IndentPaddingValue", "40");
	if (settingValue.get("ImgLineColor") == null || settingValue.get("ImgLineColor") == "") settingValue.put("ImgLineColor", "#000000");
	if (settingValue.get("TableLineColor") == null || settingValue.get("TableLineColor") == "") settingValue.put("TableLineColor", "#000000");
	if (settingValue.get("TableBGColor") == null || settingValue.get("TableBGColor") == "") settingValue.put("TableBGColor", "#FFFFFF");
	
	// BlockList 적용 체크(적용:UploadFileExtBlockListChecked, 목록:UploadFileExtBlockListTextarea)
	String[] UploadFileExtBlockListArr;
	if (settingValue.get("UploadFileExtBlockList") != null && settingValue.get("UploadFileExtBlockList").toString().indexOf("|") != -1) {
		UploadFileExtBlockListArr = settingValue.get("UploadFileExtBlockList").toString().split("\\|");
		settingValue.put("UploadFileExtBlockListChecked", ("0".equals(UploadFileExtBlockListArr[0]) ? "" : " checked=\"checked\" ")) ;
		
		if(UploadFileExtBlockListArr.length > 1){
			settingValue.put("UploadFileExtBlockListTextarea", UploadFileExtBlockListArr[1]);
		}else{
			settingValue.put("UploadFileExtBlockListTextarea", "");
		}
		
	}

	String[] UploadImageFileExtBlockListArr;
	if (settingValue.get("UploadImageFileExtBlockList") != null && settingValue.get("UploadImageFileExtBlockList").toString().indexOf("|") != -1) {
		UploadImageFileExtBlockListArr = settingValue.get("UploadImageFileExtBlockList").toString().split("\\|");
		settingValue.put("UploadImageFileExtBlockListChecked", ("0".equals(UploadImageFileExtBlockListArr[0]) ? "" : " checked=\"checked\" ")) ;
		
		if(UploadImageFileExtBlockListArr.length > 1){
			settingValue.put("UploadImageFileExtBlockListTextarea", UploadImageFileExtBlockListArr[1]);
		}else{
			settingValue.put("UploadImageFileExtBlockListTextarea", "");
		}
		
	}

	String[] AttributeBlockListArr;
	if (settingValue.get("AttributeBlockList") != null && settingValue.get("AttributeBlockList").toString().indexOf("|") != -1) {
		AttributeBlockListArr = settingValue.get("AttributeBlockList").toString().split("\\|");
		settingValue.put("AttributeBlockListChecked", ("0".equals(AttributeBlockListArr[0]) ? "" : " checked=\"checked\" ")) ;
		
		if(AttributeBlockListArr.length > 1){
			settingValue.put("AttributeBlockListTextarea", AttributeBlockListArr[1]);
		}else{
			settingValue.put("AttributeBlockListTextarea", "");
		}	
	}
	
	String[] TagBlockListArr;
	if (settingValue.get("TagBlockList") != null && settingValue.get("TagBlockList").toString().indexOf("|") != -1) {
		TagBlockListArr = settingValue.get("TagBlockList").toString().split("\\|");
		settingValue.put("TagBlockListChecked", ("0".equals(TagBlockListArr[0]) ? "" : " checked=\"checked\" ")) ;
		
		if(TagBlockListArr.length > 1){
			settingValue.put("TagBlockListTextarea", TagBlockListArr[1]);
		}else{
			settingValue.put("TagBlockListTextarea", "");
		}	
	}
	
	//줄바꾸기설정
	settingValue.put("ReturnKeyActionBRChecked", ("false".equals(settingValue.get("ReturnKeyActionBR")) ? "" : " checked=\"checked\" ")) ;

	// 아이콘 비활성화
	/*
	String[] DisableToolbarButtonsArr;
	if (settingValue.get("DisableToolbarButtons") != null && settingValue.get("DisableToolbarButtons").toString().indexOf("|") != -1) {
		DisableToolbarButtonsArr = settingValue.get("DisableToolbarButtons").toString().split("\\|");
		settingValue.put("DisableToolbarButtonsChecked", ("0".equals(DisableToolbarButtonsArr[0]) ? "" : " checked=\"checked\" ")) ;
		
		if(DisableToolbarButtonsArr.length > 1){
			settingValue.put("DisableToolbarButtonsLists", DisableToolbarButtonsArr[1]);
		}
		
	}
*/
	//템플릿 설정//////////////////////////////////////////////////////
	String[] TemplateListArr;
	TemplateListArr = new String[1];
	if (settingValue.get("Template") != null && settingValue.get("Template").toString().indexOf(",") != -1) {
		TemplateListArr = settingValue.get("Template").toString().split(",");
	}else if(settingValue.get("Template") != null) {
		
		TemplateListArr[0] = settingValue.get("Template").toString();
	}
	///////////////////////////////////////////////////////////////////
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>Namo CrossEditor : Admin</title>
	<script type="text/javascript"> var pe_mF = "pe_ui"; </script>
	<script type="text/javascript" src="../manage_common.js"></script>
	<script type="text/javascript" language="javascript" src="../../js/namo_cengine.js"></script>
	<script type="text/javascript" language="javascript" src="../manager.js"></script>
	<script type="text/javascript" src="../jscolor/jscolor.js"></script><!-- javascript 추가 -->
	<link type="text/css" rel="stylesheet" href="../../css/namose_general.css" />
	<link type="text/css" rel="stylesheet" href="../css/common.css" />
	<style>.icon{margin:1px 1px 1px 1px;padding:0px;width:18px;height:18px;cursor:pointer;}</style><!-- style 추가 -->
</head>

<body>

<%@include file = "../include/top.html"%>

<form method="post" id="adminSetForm" name="adminSetForm" action="manager_proc.jsp" onsubmit="return pe_y();">
<div id="pe_YM">
	<table class="pe_lv">
		<tr>
			<td class="pe_ej">

				<table id="Info">
					<tr>
						<td style="padding:0 0 0 10px;height:30px;text-align:left">
						<font style="font-size:14pt;color:#3e77c1;font-weight:bold;text-decoration:none;"><span id="pe_uv"></span></font></td>
						<td id="InfoText"><span id="pe_oH"></span></td>
					</tr>
					<tr>
						<td colspan="2"><img id="pe_pY" src="../images/title_line.jpg" alt="" /></td>
					</tr>
				</table>

				<table class="pe_hA">
					<tr>
						<td class="pe_Uy">				
							<ul>
								<li class="pe_fG pe_tx"><input type="button" id="setting_base" value="" style="width:110px;height:28px;" class="pe_lt pe_dh" /></li>
								<li class="pe_fG"><input type="button" id="setting_edit" value="" style="width:110px;height:28px;" class="pe_lt pe_dh" /></li><!-- 텝추가 추가 -->
								<li class="pe_fG"><input type="button" id="setting_view" value="" style="width:110px;height:28px;" class="pe_lt pe_dh" /></li>
								<li class="pe_fG"><input type="button" id="setting_ab" value="" style="width:110px;height:28px;" class="pe_lt pe_dh" /></li>
							</ul>
						
						</td>
					</tr>
					<tr>
						<td class="pe_gr pe_es"><font style="font-size:9pt;color:#FF9F4B;font-weight:bold;"><span id="pe_xN"></span></font></td>
					</tr>
				</table>

			</td>
		</tr>
		
		<tr>
			<td class="pe_ej">
				<div id="pe_En">
					<table class="pe_ln">
						<tr>
							<td>
								<table class="pe_cb"><tr><td class="pe_dv" colspan="3"></td></tr>
								</table>
							 
								<table class="pe_cb">
								
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_vs"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='WebServerOS' id='WebServerOS' class="inputSelectStyle">
												<option value=''></option>
												<option value='WINDOW' <% if(settingValue.get("WebServerOS").equals("WINDOW")) out.println("selected=\"selected\"");%>>WINDOW</option>
												<option value='LINUX' <% if(settingValue.get("WebServerOS").equals("LINUX"))out.println("selected=\"selected\"");%>>LINUX</option>
												<option value='UNIX' <% if(settingValue.get("WebServerOS").equals("UNIX")) out.println("selected=\"selected\"");%>>UNIX</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<td class = "pe_bT" colspan="3"></td>
									</tr>

									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_vq"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='WebServerInfo' id='WebServerInfo' class="inputSelectStyle">
												<option value=''></option>
												<option value='IIS' <% if(settingValue.get("WebServerInfo").equals("IIS")) out.println("selected=\"selected\"");%>>IIS</option>
												<option value='Apache' <% if(settingValue.get("WebServerInfo").equals("Apache"))out.println("selected=\"selected\"");%>>Apache</option>
												<option value='Tomcat' <% if(settingValue.get("WebServerInfo").equals("Tomcat")) out.println("selected=\"selected\"");%>>Tomcat</option>
												<option value='Resin' <% if(settingValue.get("WebServerInfo").equals("Resin")) out.println("selected=\"selected\"");%>>Resin</option>
												<option value='Jeus' <% if(settingValue.get("WebServerInfo").equals("Jeus")) out.println("selected=\"selected\"");%>>Jeus</option>
												<option value='WebLogic' <% if(settingValue.get("WebServerInfo").equals("WebLogic")) out.println("selected=\"selected\"");%>>WebLogic</option>
												<option value='WebSphere' <% if(settingValue.get("WebServerInfo").equals("WebSphere")) out.println("selected=\"selected\"");%>>WebSphere</option>
												<option value='iPlanet' <% if(settingValue.get("WebServerInfo").equals("iPlanet")) out.println("selected=\"selected\"");%>>iPlanet</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<td class = "pe_bT" colspan="3"></td>
									</tr>
									
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_vn"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='WebLanguage' id='WebLanguage' class="inputSelectStyle">
												<option value=''></option>
												<option value='ASP' <% if(settingValue.get("WebLanguage").equals("ASP")) out.println("selected=\"selected\"");%>>ASP</option>
												<option value='JSP' <% if(settingValue.get("WebLanguage").equals("JSP")) out.println("selected=\"selected\"");%>>JSP</option>
												<option value='PHP' <% if(settingValue.get("WebLanguage").equals("PHP")) out.println("selected=\"selected\"");%>>PHP</option>
												<option value='ASP.NET' <% if(settingValue.get("WebLanguage").equals("ASP.NET")) out.println("selected=\"selected\"");%>>ASP.NET</option>
												<option value='SERVLET' <% if(settingValue.get("WebLanguage").equals("SERVLET")) out.println("selected=\"selected\"");%>>SERVLET</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<td class = "pe_bT" colspan="3"></td>
									</tr>
									
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_rE"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<input type="text" id="ImageSavePath" class="pe_gj" name="ImageSavePath" value="<%=settingValue.get("ImageSavePath")%>" /> ex) http:// www.mysite.com/image
										</td>
									</tr>
									
									<tr>
										<td class = "pe_bT" colspan="3"></td>
									</tr>

									<% if (settingValue.get("UploadFileNameType") != null){ %>
									
									<div id="pe_EV">
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_uq"></span></b></td>
										<td class="pe_bQ"></td>
										<td >
											<table class="pe_cb">
												<tr>
													<td class="pe_bN"> &nbsp;&nbsp;
														<input type="radio" name="encodingStyle" id="pe_zr" value="real" /><span id="pe_uM"></span>
														<input type="hidden" id="UploadFileNameType" name="UploadFileNameType" value="" />
													</td>
												</tr>
												<tr>
													<td class = "pe_bT" colspan="3"></td>
												</tr>
												<tr>
													<td class="pe_bN"> &nbsp;&nbsp;
													<input type="radio" name="encodingStyle" id="pe_zW" value="trans" /><span id="pe_un"></span>
													</td>
												</tr>
												<tr>
													<td class = "pe_bT" colspan="3"></td>
												</tr>
												<tr>
													<td class="pe_bN"> &nbsp;&nbsp;
														<input type="radio" name="encodingStyle" id="pe_Al" value="random" /><span id="pe_yl"></span>
													</td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td class = "pe_bT" colspan="3"></td>
									</tr>
									</div>

									<% } %>

									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_yi"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN"> &nbsp;
											<input type="hidden" id="UploadFileSubDir" name ="UploadFileSubDir" value="<%=settingValue.get("UploadFileSubDir")%>" />
											<input type="radio" id="pe_rX" name="pe_Cw" value="true" /><label for="pe_rX"><span id="pe_yk"></span></label>&nbsp;&nbsp;
											<input type="radio" id="pe_rO" name="pe_Cw" value="false" /><label for="pe_rO"><span id="pe_yj"></span></label>
										</td>
									</tr>

									<tr>
										<td class = "pe_bT" colspan="3"></td>
									</tr>

									
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_rv"></span></b></td>
										<td class="pe_bQ"></td>
										<td >
											<table class="pe_cb">
												<tr>
													<td >&nbsp;&nbsp;<span id="pe_sv"></span></td>
													<td class="pe_bQ"></td>
													<td class="pe_bN"><input type="text" id="Width" name="Width" class="pe_ix" maxlength="10" value="<%=settingValue.get("Width")%>" />
													px</td>
												</tr>
												<tr>
													<td class = "pe_bT" colspan="3"></td>
												</tr>
												<tr>
													<td >&nbsp;&nbsp;<span id="pe_rG"></span></td>
													<td class="pe_bQ"></td>
													<td class="pe_bN"><input type="text" id="Height" name="Height" class="pe_ix" maxlength="10" value="<%=settingValue.get("Height")%>" /> px
													</td>
												</tr>	
											</table>
										</td>
									</tr>
								</table>

								<table class="pe_cb"><tr><td class="pe_dv" colspan="3"></td></tr>
								</table>
											
							</td>
						</tr>
						<tr>
							<td class="pe_gr pe_es"><font style="font-size:9pt;color:#FF9F4B;font-weight:bold;"><span id="pe_xw"></span></font></td>
						</tr>

						<tr>
							<td>
						
								<table class="pe_cb"><tr><td class="pe_dv" colspan="3"></td></tr>
								</table>

								<table class="pe_cb">
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_yy"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='SetFocus' id='SetFocus' class="inputSelectStyle">
												<option value='true' <% if(settingValue.get("SetFocus").equals("true")) out.println("selected=\"selected\"");%>>true</option>
												<option value='false' <% if(settingValue.get("SetFocus").equals("false")) out.println("selected=\"selected\"");%>>false</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xg"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='LineHeight' id='LineHeight' class="inputSelectStyle">
												<option value=''></option>
												<option value='100%' <% if(settingValue.get("LineHeight").equals("100%")) out.println("selected=\"selected\"");%>>100%</option>
												<option value='120%' <% if(settingValue.get("LineHeight").equals("120%")) out.println("selected=\"selected\"");%>>120%</option>
												<option value='140%' <% if(settingValue.get("LineHeight").equals("140%")) out.println("selected=\"selected\"");%>>140%</option>
												<option value='160%' <% if(settingValue.get("LineHeight").equals("160%")) out.println("selected=\"selected\"");%>>160%</option>
												<option value='180%' <% if(settingValue.get("LineHeight").equals("180%")) out.println("selected=\"selected\"");%>>180%</option>	
												<option value='200%' <% if(settingValue.get("LineHeight").equals("200%")) out.println("selected=\"selected\"");%>>200%</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xT"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='UnloadWarning' id='UnloadWarning' class="inputSelectStyle">
												<option value='false' <% if(settingValue.get("UnloadWarning").equals("false")) out.println("selected=\"selected\"");%>>false</option>
												<option value='true' <% if(settingValue.get("UnloadWarning").equals("true")) out.println("selected=\"selected\"");%>>true</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_yx"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='SetDebug' id='SetDebug' class="inputSelectStyle">
												<option value='false' <% if(settingValue.get("SetDebug").equals("false")) out.println("selected=\"selected\"");%>>false</option>
												<option value='true' <% if(settingValue.get("SetDebug").equals("true")) out.println("selected=\"selected\"");%>>true</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xA"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='HTMLTabByTableLock' id='HTMLTabByTableLock' class="inputSelectStyle">
												<option value='false' <% if(settingValue.get("HTMLTabByTableLock").equals("false")) out.println("selected=\"selected\"");%>>false</option>
												<option value='true' <% if(settingValue.get("HTMLTabByTableLock").equals("true")) out.println("selected=\"selected\"");%>>true</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xB"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='HTMLTabContents' id='HTMLTabContents' class="inputSelectStyle">
												<option value='html' <% if(settingValue.get("HTMLTabContents").equals("html")) out.println("selected=\"selected\"");%>>html</option>
												<option value='body' <% if(settingValue.get("HTMLTabContents").equals("body")) out.println("selected=\"selected\"");%>>body</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_ye"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='AllowContentScript' id='AllowContentScript' class="inputSelectStyle">
												<option value='true' <% if(settingValue.get("AllowContentScript").equals("true")) out.println("selected=\"selected\"");%>>true</option>
												<option value='false' <% if(settingValue.get("AllowContentScript").equals("false")) out.println("selected=\"selected\"");%>>false</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_ww"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='AllowContentIframe' id='AllowContentIframe' class="inputSelectStyle">
												<option value='true' <% if(settingValue.get("AllowContentIframe").equals("true")) out.println("selected=\"selected\"");%>>true</option>
												<option value='false' <% if(settingValue.get("AllowContentIframe").equals("false")) out.println("selected=\"selected\"");%>>false</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xu"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='CharSet' id='CharSet' class="inputSelectStyle">
												<option value=''></option>
												<option value='auto' <% if(settingValue.get("CharSet").equals("auto")) out.println("selected=\"selected\"");%>></option>
												<option value='utf-8' <% if(settingValue.get("CharSet").equals("utf-8")) out.println("selected=\"selected\"");%>>utf-8</option>
												<option value='euc-kr' <% if(settingValue.get("CharSet").equals("euc-kr")) out.println("selected=\"selected\"");%>>euc-kr</option>
												<option value='ks_c_5601-1987' <% if(settingValue.get("CharSet").equals("ks_c_5601-1987")) out.println("selected=\"selected\"");%>>ks_c_5601-1987</option>
												<option value='ms949' <% if(settingValue.get("CharSet").equals("ms949")) out.println("selected=\"selected\"");%>>ms949</option>
												<option value='iso-8859-1' <% if(settingValue.get("CharSet").equals("iso-8859-1")) out.println("selected=\"selected\"");%>>iso-8859-1</option>
												<option value='iso-8859-2' <% if(settingValue.get("CharSet").equals("iso-8859-2")) out.println("selected=\"selected\"");%>>iso-8859-2</option>
												<option value='euc-jp' <% if(settingValue.get("CharSet").equals("euc-jp")) out.println("selected=\"selected\"");%>>euc-jp</option>
												<option value='shift_jis' <% if(settingValue.get("CharSet").equals("shift_jis")) out.println("selected=\"selected\"");%>>shift_jis</option>
												<option value='gb2312' <% if(settingValue.get("CharSet").equals("gb2312")) out.println("selected=\"selected\"");%>>gb2312</option>
												<option value='gbk' <% if(settingValue.get("CharSet").equals("gbk")) out.println("selected=\"selected\"");%>>gbk</option>
												<option value='big5' <% if(settingValue.get("CharSet").equals("big5")) out.println("selected=\"selected\"");%>>big5</option>
												<option value='big5-hkscs' <% if(settingValue.get("CharSet").equals("big5-hkscs")) out.println("selected=\"selected\"");%>>big5-hkscs</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_tG"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<input type="text" id="DocBaseURL" name="DocBaseURL" class="pe_gj" value="<%=settingValue.get("DocBaseURL")%>" /> ex) http://www.mysite.com/doc.html 
										</td>
									</tr>
									
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									
								</table>

								
<!--  CE 3 제한설정 -->							
							</td>
						</tr> 						
						<tr>
							<td class="pe_gr pe_es"><font style="font-size:9pt;color:#FF9F4B;font-weight:bold;"><span id="pe_xq"></span></font></td>
						</tr>

						<tr>
							<td>
								<table class="pe_cb"><tr><td class="pe_dv" colspan="3"></td></tr>
								</table>
								
								<table class="pe_cb">

									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_qk"><span id="pe_qF"></span></b></td>
										<td class="pe_bQ"></td>
										<td>
											<table class="pe_cb">
												<input type="hidden" name="UploadImageFileExtBlockList" value="<%=settingValue.get("UploadImageFileExtBlockList")%>" />
												<tr>
													<td class="pe_bN"><input type="checkbox" id="UploadImageFileExtBlockListChecked" <%=settingValue.get("UploadImageFileExtBlockListChecked")%>/><span id="pe_ju"></span></td>
												</tr>
												<tr>
													<td class="pe_bN"><textarea id="UploadImageFileExtBlockListTextarea" cols="70" rows="2"><%=settingValue.get("UploadImageFileExtBlockListTextarea")%></textarea><br /><span id="pe_rN"></span></td>
												</tr>	
											</table>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_qk"></span></b></td>
										<td class="pe_bQ"></td>
										<td>
											<table class="pe_cb">
												<input type="hidden" name="UploadFileExtBlockList" value="<%=settingValue.get("UploadFileExtBlockList")%>" />
												<tr>
													<td class="pe_bN"><input type="checkbox" id="UploadFileExtBlockListChecked" <%=settingValue.get("UploadFileExtBlockListChecked")%>/><span id="pe_ju"></span></td>
												</tr>
												<tr>
													<td class="pe_bN"><textarea id="UploadFileExtBlockListTextarea" cols="70" rows="2"><%=settingValue.get("UploadFileExtBlockListTextarea")%></textarea><br /><span id="pe_rN"></span></td>
												</tr>	
											</table>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>

									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xp"></span></b></td>
										<td class="pe_bQ"></td>
										<td >
											<table class="pe_cb">
												<input type="hidden" name="AttributeBlockList" value="<%=settingValue.get("AttributeBlockList")%>" />
												<tr>
													<td class="pe_bN"><input type="checkbox" id="AttributeBlockListChecked" <%=settingValue.get("AttributeBlockListChecked")%>/><span id="pe_ju"></span></td>
												</tr>
												<tr>
													<td class="pe_bN"><textarea id="AttributeBlockListTextarea" cols="70" rows="2"><%=settingValue.get("AttributeBlockListTextarea") %></textarea><br /><span id="pe_nM"></span></td>
												</tr>	
											</table>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_yb"></span></b></td>
										<td class="pe_bQ"></td>
										<td >
											<table class="pe_cb">
												<input type="hidden" name="TagBlockList" value="<%=settingValue.get("TagBlockList")%>" />
												<tr>
													<td class="pe_bN"><input type="checkbox" id="TagBlockListChecked" <%=settingValue.get("TagBlockListChecked")%>/><span id="pe_ju"></span></td>
												</tr>
												<tr>
													<td class="pe_bN"><textarea id="TagBlockListTextarea" cols="70" rows="2"><%=settingValue.get("TagBlockListTextarea") %></textarea><br /><span id="pe_nM"></span></td>
												</tr>	
											</table>
										</td>
									</tr>

									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
								</table>
								
							</td>
						</tr>
<!--/  CE 3 제한설정 -->
												
						
<!-- CE3 템플릿 설정 mwhong 2013.04.01-->
					</tr> 						
						<tr>
							<td class="pe_gr pe_es"><font style="font-size:9pt;color:#FF9F4B;font-weight:bold;"><span id="pe_yc"></span></font></td>
						</tr>

						<tr>
							<td>
								<table class="pe_cb"><tr><td class="pe_dv" colspan="3"></td></tr>
								</table>
								
								<table class="pe_cb" >
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_yd"></span></b></td>
										<td class="pe_bQ"></td>
										<td>
											<table class="pe_cb">
												<input type="hidden" name="Template" id="Template" value="<%=settingValue.get("Template")%>" />
												<tr>
													<td class="pe_bN"><input type="button" id="pe_acm" value="+" onClick="pe_B(this)"/></td>
													<td class="pe_bN">&nbsp;</td>
													<td class="pe_bN">&nbsp;</td>
												</tr>
												<tr style="background-color:#B2EBF4;">
													<td class="pe_bN"><b>Title</b></td>
													<td class="pe_bN"><b>URL</b></td>
													<td class="pe_bN"><b>Encoding</b></td>
												</tr>
						
											<%	
											
											for(int i=0; i<TemplateListArr.length ; i++){
												String templateName;
												String templateUrl;
												String templateEncoding;
												if(TemplateListArr[i] == null || TemplateListArr[i] == ""){
													templateName = "";
													templateUrl = "";
													templateEncoding = "";
												}else{
													templateName = TemplateListArr[i].split("\\|")[0];
													templateUrl = TemplateListArr[i].split("\\|")[1];							
													templateEncoding = TemplateListArr[i].split("\\|")[2];

													%>
														<tr>
															<td><input type="text"  name="pe_Cg"  value="<%=templateName %>" style="width:100px"/></td>
															<td><input type="text"  name="pe_Fs"  value="<%=templateUrl %>" style="width:320px"/></td>
															<td><input type="text"  name="pe_Fk"  value="<%=templateEncoding %>" style="width:90px"/><input type="button" value="-" onclick="pe_o(this)"/></td>
						
														</tr>
													<% 
												}
												
											
											}
											%>
											</table>
										</td>
									</tr>


									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
								</table>
								
							</td>
						</tr>
<!--/ CE3 템플릿 설정 mwhong 2013.04.01 -->
						
						
					</table>
				</div>	
				
			</td>
		</tr>	
		
		
<!-- CE 3 편집환경 설정 -->
		<tr>
			<td class="pe_ej">
				<div id="pe_Ea">
					<table class="pe_ln">
						<tr>
							<td>
								<table class="pe_cb"><tr><td class="pe_dv" colspan="3"></td></tr>
								</table>
								
								<table class="pe_cb">
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xE"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<table>
											<tr>
											<td>
											<input type="text" id="pe_Ab" class="color{hash:true,valueElement:'FontColor',pickerFaceColor:'transparent',pickerFace:3,pickerBorder:0,pickerInsetColor:'black'}" style="width:20px;"></td>
											<td><input id="FontColor" name="FontColor" value="<%=settingValue.get("FontColor") %>"></td>
											<td style="padding-left:0px">
											<ul style="width:140px;">
											<li class="pe_dZ">
											<input type="button" class="pe_dW pe_dh" value="default" style="width:80px;height:26px;" onclick="document.getElementById('pe_Ab').color.fromString('#000000');">
											</li>
											</ul></td>
											</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xM"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
										<textarea name="FontSizeList" id="FontSizeList" cols="70" rows="2"><%=settingValue.get("FontSizeList") %></textarea></td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xh"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
										<textarea name="LineHeightList" id="LineHeightList" cols="70" rows="2"><%=settingValue.get("LineHeightList") %></textarea>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xi"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<input type="text" id="IndentPaddingValue" name="IndentPaddingValue" class="inputStyleChange" maxlength="3" value="<%=settingValue.get("IndentPaddingValue") %>" style="width:30px;" /> px 
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<input type="hidden" name="ReturnKeyActionBR">
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_yn"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN"><input type="checkbox" id="ReturnKeyActionBRChecked" <%=settingValue.get("ReturnKeyActionBRChecked")%>/><label for="ReturnKeyActionBR"><span id="pe_yw"></span></label></td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
								</table>


								<table class="pe_cb">
									<tr>
										<td class="pe_gr pe_es"><font style="font-size:9pt;color:#FF9F4B;font-weight:bold;"><span id="pe_qF"></span></font></td>
									</tr>

									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xl"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<table>
											<tr>
											<td>
											<input type="text" id="pe_Au" class="color{hash:true,valueElement:'ImgLineColor',pickerFaceColor:'transparent',pickerFace:3,pickerBorder:0,pickerInsetColor:'black'}" style="width:20px;"></td>
											<td><input id="ImgLineColor" name="ImgLineColor" value="<%=settingValue.get("ImgLineColor") %>"></td>
											<td style="padding-left:0px">
											<ul style="width:140px;">
											<li class="pe_dZ">
											<input type="button" class="pe_dW pe_dh" value="default" style="width:80px;height:26px;" onclick="document.getElementById('pe_Au').color.fromString('#000000');">
											</li>
											</ul></td>
											</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
								</table>



								<table class="pe_cb">				
									<tr>
										<td class="pe_gr pe_es"><font style="font-size:9pt;color:#FF9F4B;font-weight:bold;"><span id="pe_yt"></span></font></td>
									</tr>

									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_yu"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<table>
											<tr>
											<td>
											<input type="text" id="pe_CX" class="color{hash:true,valueElement:'TableLineColor',pickerFaceColor:'transparent',pickerFace:3,pickerBorder:0,pickerInsetColor:'black'}" style="width:20px;"></td>
											<td><input id="TableLineColor" name="TableLineColor" value="<%=settingValue.get("TableLineColor") %>"></td>
											<td style="padding-left:0px">
											<ul style="width:140px;">
											<li class="pe_dZ">
											<input type="button" class="pe_dW pe_dh" value="default" style="width:80px;height:26px;" onclick="document.getElementById('pe_CX').color.fromString('#000000');">
											</li>
											</ul></td>
											</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_ys"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<table>
											<tr>
											<td>
											<input type="text" id="pe_CE" class="color{hash:true,valueElement:'TableBGColor',pickerFaceColor:'transparent',pickerFace:3,pickerBorder:0,pickerInsetColor:'black'}" style="width:20px;"></td>
											<td><input id="TableBGColor" name="TableBGColor" value="<%=settingValue.get("TableBGColor") %>"></td>
											<td style="padding-left:0px">
											<ul style="width:140px;">
											<li class="pe_dZ">
											<input type="button" class="pe_dW pe_dh" value="default" style="width:80px;height:26px;" onclick="document.getElementById('pe_CE').color.fromString('#FFFFFF');">
											</li>
											</ul></td>
											</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
								</table>

	<!--
								<table class="tableContents">
									<tr>
										<td class="Settingpass tdTextLeft"><font style="font-size:9pt;color:#FF9F4B;font-weight:bold;"><span id="AdminPageEditorToolbarDisable"></span></font></td>
									</tr>

									<tr>
										<td class="tdlineHorizonSpace" colspan="3"></td>
									</tr>
									<tr>
										<td class="tdText">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="AdminPageEditorToolbarDisableSetting"></span></b></td>                                                         
										<td class="tdlineVertical"></td>
										<td class="tdInput">
											<input type="checkbox" id="IconBlockListChecked" <%=settingValue.get("DisableToolbarButtonsChecked")%>/><span id="AdminPageApply"></span> <br />
											<input type="hidden" id="DisableToolbarButtonsCheckedList" name="DisableToolbarButtonsCheckedList" />
											<input type="hidden" id="DisableToolbarButtons" name="DisableToolbarButtons" />
											
											<table  style="border-collapse: separate;" cellSpacing="0" cellPadding="0">
											<tbody>
											<tr>
											<td style='background-image: url("../../template/default/skin_small_bg.gif"); background-color: rgb(234, 234, 234);' class="NamoSE_skinLeft"><img id="NamoSE_Skin_Left" name="skin_left.gif" src="../../template/default/skin_left.gif"></td>
											<td style='background-image: url("../../template/default/skin_bg.gif"); background-color: rgb(234, 234, 234);' class="NamoSE_skinBg">
												<table style="border-collapse: separate; table-layout: fixed; width:560px" id="NamoSE_toolbar_namoeditor1" cellSpacing="0" cellPadding="0">
												<tbody>
												<tr>
												<td id="iconDisableToolbar" class="NamoSE_skinLine" style="padding:5px 0;"></td>
												</tr>
												</tbody>
												</table>
											</td>
											<td style='background-image: url("../../template/default/skin_small_bg.gif"); background-color: rgb(234, 234, 234);' class="NamoSE_skinRight"><img id="NamoSE_Skin_Right" name="skin_right.gif" src="../../template/default/skin_right.gif"></td>
											</tr>


											<tr>
												<td  style="border-top: 1px solid rgb(184, 184, 186);" colSpan="3">
												<table style="background-color: rgb(255, 255, 255);" cellSpacing="0" cellPadding="0" width="100%">
												<tr><td style="height: 1px;" colSpan="2"></td></tr>
												</table>
												</td>
											</tr>
											</table>

										</td>
									</tr>
									<tr>
										<td class="tdlineHorizonSpace" colspan="3"></td>
									</tr>
								</table>
								
-->
											
							</td>
						</tr>
					</table>
				</div>	
			</td>
		</tr>
<!--/ CE 3 편집환경 설정 -->
		
		
		<tr>
			<td class="pe_ej">
				<div id="pe_Em">
					<table class="pe_ln">
						<tr>
							<td>
								<table class="pe_cb"><tr><td class="pe_dv" colspan="3"></td></tr>
								</table>
								 
								<table class="pe_cb">
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_yv"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<% out.println(skinDirectory(fileRealFolder, (String)settingValue.get("Skin"))); %>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_tM"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<input type="text" id="Css" name="Css" class="pe_gj" value="<%=settingValue.get("Css")%>" />  ex) http://www.mysite.com/common.css 
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_wB"></span></b>
											<input type="hidden" id="UserSkinColor" name="UserSkinColor" value="<%=settingValue.get("UserSkinColor")%>" />
										</td>
											
										<td class="pe_bQ"></td>
										<td >
											<table class="pe_cb">
												<tr>
													<td class="pe_lr">&nbsp;&nbsp;<span id="pe_yr"></span></td>
													<td class="pe_bQ"></td>
													<td class="pe_bN">
														<input type="text" id="outlinecolor" name="outlinecolor" class="pe_ll" value="" />  ex) #000000 or black 
													</td>
												</tr>
												<tr>
													<td class="pe_bT" colspan="3"></td>
												</tr>
												
												<tr>
													<td class="pe_lr">&nbsp;&nbsp;<span id="pe_xf"></span></td>
													<td class="pe_bQ"></td>
													<td class="pe_bN">
														<input type="text" id="innerlineColor" name="innerlineColor" class="pe_ll" value="" />
													</td>
												</tr>
												<tr>
													<td class="pe_bT" colspan="3"></td>
												</tr>
												<tr>
													<td class="pe_lr">&nbsp;&nbsp;<span id="pe_xv"></span></td>
													<td class="pe_bQ"></td>
													<td class="pe_bN">
														<input type="text" id="skinfontColor" name="skinfontColor" class="pe_ll" value="" />
													</td>
												</tr>
												<tr>
													<td class="pe_bT" colspan="3"></td>
												</tr>
												<tr>
													<td class="pe_lr">&nbsp;&nbsp;<span id="pe_ya"></span></td>
													<td class="pe_bQ"></td>
													<td class="pe_bN">
														<input type="text" id="toolbarBackgroundColor" name="toolbarBackgroundColor" class="pe_ll" value="" />
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xx"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<input type="hidden" id="CreateTab" name ="CreateTab" value="<%=settingValue.get("CreateTab")%>" />
											<input type="checkbox" id="pe_qJ" name="pe_lZ" value="0" /><label for="pe_qJ"><span id="wysiwyg"></span></label>&nbsp;&nbsp;
											<input type="checkbox" id="pe_qn" name="pe_lZ" value="1" /><label for="pe_qn"><span id="html"></span></label>&nbsp;&nbsp;
											<input type="checkbox" id="pe_qM" name="pe_lZ" value="2" /><label for="pe_qM"><span id="preview"></span></label>
										</td>
									</tr>
								</table>
									
								<table class="pe_cb"><tr><td class="pe_dv" colspan="3"></td></tr>
								</table>
							</td>
						</tr>

						<tr>
							<td class="pe_gr pe_es"><font style="font-size:9pt;color:#FF9F4B;font-weight:bold;"><span id="pe_xO"></span></font></td>
						</tr>
						<tr>
							<td>
								<table class="pe_cb"><tr><td class="pe_dv" colspan="3"></td></tr>
								</table>
									
								<table class="pe_cb">
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_wx"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<select name='UserToolbar' id='UserToolbar' class="inputSelectStyle">
												<option value='false' <% if(settingValue.get("UserToolbar").equals("false")) out.println("selected=\"selected\"");%>>false</option>
												<option value='true' <% if(settingValue.get("UserToolbar").equals("true")) out.println("selected=\"selected\"");%>>true</option>
											</select>
											<input type="hidden" id="CreateToolbar" name="CreateToolbar" value="<%=settingValue.get("CreateToolbar")%>" >
											<input type="hidden" id="Name" name="Name" value="<%=settingValue.get("Name")%>">
											<input type="hidden" id="Logo" name="Logo" value="<%=settingValue.get("Logo")%>">
											<input type="hidden" id="Help" name="Help" value="<%=settingValue.get("Help")%>">
											<input type="hidden" id="Info" name="Info" value="<%=settingValue.get("Info")%>">
											<input type="hidden" id="UserAddMenu" name="UserAddMenu" value="<%=userAddMenuList%>" />
											<input type="hidden" id="AddMenuCheck" name="AddMenuCheck" value="<%=settingValue.get("AddMenuCheck")%>" />
											<input type="hidden" id="Tab" name="Tab" value="" />
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
										
								</table>	
							</td>		
						</tr>			
					</table>

					<div id="pe_zv">
						<table class="pe_hA">
							<tr>
								<td>
									<table class="pe_cb">
										<tr>
											<td class="pe_bT" colspan="5"></td>
										</tr>
										<tr>
											<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_yh"></span></b></td>
											<td class="pe_bQ"></td>
											<td>
												<table class="pe_cb">
													<tr>
														<td class="pe_mr" >&nbsp;&nbsp;<span id="pe_wv"></span></td>
														<td class="pe_bQ"></td>
														<td class="pe_bN">
															<input type="text" id="AdminPageUserMenuIdInput" name="AdminPageUserMenuIdInput" class="pe_gj" value="" /> 
														</td>
													</tr>
													<tr>
														<td class="pe_bT" colspan="3"></td>
													</tr>
													<tr>
														<td class="pe_mr">&nbsp;&nbsp;<span id="pe_wt"></span></td>
														<td class="pe_bQ"></td>
														<td class="pe_bN">
															<input type="radio" name="AdminPageUserMenuPlayKindRadio" id="pe_uw" value="function" /><label for="pe_uw"><span id="pe_wu"></span></label>&nbsp;&nbsp;<input type="radio" name="AdminPageUserMenuPlayKindRadio" id="pe_ux" value="plugin" /><label for="pe_ux"><span id="pe_wq"></span></label>
														</td>
													</tr>
													<tr>
														<td class="pe_bT" colspan="3"></td>
													</tr>
													<tr>
														<td class="pe_mr">&nbsp;&nbsp;<span id="pe_yg"></span></td>
														<td class="pe_bQ"></td>
														<td class="pe_bN" height="50px">
															<input type="text" id="AdminPageUserMenuButtonImgPathInput" name="AdminPageUserMenuButtonImgPathInput" class="pe_gj" value="" />
															<br/>ex) http://www.mysite.com/image/MenuIcon.jpg
														</td>
													</tr>
													<tr>
														<td class="pe_bT" colspan="3"></td>
													</tr>
													<tr>
														<td class="pe_mr">&nbsp;&nbsp;<span id="pe_ws"></span></td>
														<td class="pe_bQ"></td>
														<td class="pe_bN">	
															<input type="text" id="AdminPageUserMenuTitleInput" name="AdminPageUserMenuTitleInput" class="pe_gj" value="" />
														</td>
													</tr>
												</table>
											</td>
											<td class="pe_bQ"></td>
											<td style="text-align:center;vertical-align:middle;"><input type="button" id="pe_si" value="" class="" style="width:60px;height:60px;"/>
											</td>
										</tr>
										<tr>
											<td class="pe_bT" colspan="5"></td>
										</tr>
										<tr>
											<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_wr"></span></b></td>
											<td class="pe_bQ"></td>
											<td class="pe_bN" colspan="2">
												<div id="pe_XC">&nbsp;</div>
											</td>
										</tr>
										<tr>
											<td class="pe_bT" colspan="5"></td>
										</tr>
									</table>	
								</td>		
							</tr>
						</table>
					</div>
		
					<div id = "pe_cb">
						
						<table class="pe_hA">	
							<tr>
								<td id="pe_yF" class="pe_es">
									
									<table>
										<tr>
											<td id="pe_Vy">
												<span id="pe_xk"></span>: <br>
												<div id="pe_Ih" >
													<span id="pe_ou"></span> <br> 
													<span id="pe_uE"></span><br>
													<span id="pe_uC"></span><br>
												</div>
											</td>
											<td id="pe_Th">
											<span id="pe_yq"></span>:<br>
												<div id="pe_El" ></div>
											</td> 
											<td valign="bottom">
												<ul style="margin:0 auto;width:340px;">
													<li class="pe_dZ">
														<input type="button" id="spacebar" value="" class="pe_dW pe_dh" style="width:80px;height:26px;" />
													</li>
													<li class="pe_dZ"><input type="button" id="space" value="" class="pe_dW pe_dh" style="width:68px;height:26px;"></li>
													<li class="pe_dZ"><input type="button" id="enter" value="" class="pe_dW pe_dh" style="width:66px;height:26px;"></li>
												</ul>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<br />
												<span id="pe_xj"></span>
											</td>
										</tr>	
									</table>							
								</td>
							</tr>
							<tr>
								<td>
									<table class="pe_cb">
										<tr><td class="pe_dv" colspan="3"></td></tr>
									</table>
								</td>
							</tr>
						</table>	
				
						<table id="pe_aaB" class="pe_hA">
							
							<tr>
								<td id="pe_yF" class="pe_es">
									<span id="preview"></span>:<br>
									<div id="pe_EO"></div>
									<br />
									<span id="pe_xy"></span>
								</td>
							</tr>
						</table>
						
					<!--아이콘비활성-->
					<!--
						<table style="display:none" class="tableEnv">
							<tr>
								<td class="Settingpass tdTextLeft"><font style="font-size:9pt;color:#FF9F4B;font-weight:bold;"><span id="AdminPageEditorToolbarDisable"></span></font></td>
							</tr>

							<tr>
								<td class="tdlineHorizonSpace" colspan="3"></td>
							</tr>
							<tr>
								<td class="tdText">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="AdminPageEditorToolbarDisableSetting"></span></b></td>                                                         
								<td class="tdlineVertical"></td>
								<td class="tdInput">
									<input type="checkbox" id="IconBlockListChecked" <%=settingValue.get("DisableToolbarButtonsChecked")%>/><span id="AdminPageApply"></span> <br />
									<input type="hidden" id="DisableToolbarButtonsCheckedList" name="DisableToolbarButtonsCheckedList" />
									<input type="hidden" id="DisableToolbarButtons" name="DisableToolbarButtons" />
									
									<table  style="border-collapse: separate;" cellSpacing="0" cellPadding="0">
									<tbody>
									<tr>
									<td style='background-image: url("../../template/default/skin_small_bg.gif"); background-color: rgb(234, 234, 234);' class="NamoSE_skinLeft"><img id="NamoSE_Skin_Left" name="skin_left.gif" src="../../template/default/skin_left.gif"></td>
									<td style='background-image: url("../../template/default/skin_bg.gif"); background-color: rgb(234, 234, 234);' class="NamoSE_skinBg">
										<table style="border-collapse: separate; table-layout: fixed; width:560px" id="NamoSE_toolbar_namoeditor1" cellSpacing="0" cellPadding="0">
										<tbody>
										<tr>
										<td id="iconDisableToolbar" class="NamoSE_skinLine" style="padding:5px 0;"></td>
										</tr>
										</tbody>
										</table>
									</td>
									<td style='background-image: url("../../template/default/skin_small_bg.gif"); background-color: rgb(234, 234, 234);' class="NamoSE_skinRight"><img id="NamoSE_Skin_Right" name="skin_right.gif" src="../../template/default/skin_right.gif"></td>
									</tr>


									<tr>
										<td  style="border-top: 1px solid rgb(184, 184, 186);" colSpan="3">
										<table style="background-color: rgb(255, 255, 255);" cellSpacing="0" cellPadding="0" width="100%">
										<tr><td style="height: 1px;" colSpan="2"></td></tr>
										</table>
										</td>
									</tr>
									</table>

								</td>
							</tr>
							<tr>
								<td class="tdlineHorizonSpace" colspan="3"></td>
							</tr>
						 </table>
						 -->
					<!--아이콘비활성-->

					</div>
				</div>	

			</td>
		</tr>
		<tr>
			<td class="pe_ej">
				<div id="pe_Dq">
					<table class="pe_ln">
						<tr>
							<td>
								<table class="pe_cb"><tr><td class="pe_dv" colspan="3"></td></tr>
								</table>
								 
								<table class="pe_cb">
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_xz"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<input type="text" id="DocTitle" name="DocTitle" class="pe_gj" value="<%=settingValue.get("DocTitle")%>" />
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
									<tr>
										<td class="pe_bZ">&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="pe_wg"></span></b></td>
										<td class="pe_bQ"></td>
										<td class="pe_bN">
											<input type="hidden" id="AccessibilityOption" name ="AccessibilityOption" value="<%=settingValue.get("AccessibilityOption")%>" />
											<input type="radio" id="pe_ud" name="pe_qA" value="0" /><label for="pe_ud"><span id="pe_wz"></span></label>&nbsp;&nbsp;
											<input type="radio" id="pe_tP" name="pe_qA" value="1" /><label for="pe_tP"><span id="pe_wy"></span></label>&nbsp;&nbsp;
											<input type="radio" id="pe_tR" name="pe_qA" value="2" /><label for="pe_tR"><span id="pe_wA"></span></label>
										</td>
									</tr>
									<tr>
										<td class="pe_bT" colspan="3"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
</table>

<table class="pe_lv">
	<tr id="pe_yz">
		<td id="pe_wM">
			<ul style="margin:0 auto;width:170px;">
				<li class="pe_dZ">
					<input type="submit" id="pe_tS" value="" class="pe_dW pe_dh" style="width:66px;height:26px;" />
				</li>
				<li class="pe_dZ"><input type="button" id="pe_pl" value="" class="pe_dW pe_dh" style="width:66px;height:26px;"></li>
			</ul>
		</td>
	</tr>
</table>
	
</div>
</form>
<%@include file = "../include/bottom.html"%>
<script>
	var webPageKind = '<%=detectXSSEx(session.getAttribute("webPageKind").toString())%>';
	var encodingStyleChecked = '<%=encodingStyleValue%>';
	topInit();
	managerInit('<% if(detectXSSEx(request.getParameter("Tab")) != null) out.print(detectXSSEx(request.getParameter("Tab")));%>');
	</script>

</body> 
</html>