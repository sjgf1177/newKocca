<%-- 
	��  ��    : Dhtml ������
	���ϸ�    : DhtmlEditor.jsp
	�ۼ���    : 2004.11.16
	�ۼ���    : �̿���
	��  ��    : ������ �����ϴ� ������(��ü ����)	
--%> 

<TABLE cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td><INPUT type="radio" checked value="Y" name="use_editor" onclick="changeEditor()">��������</td>
		<td width="8"></td>
		<td><INPUT type="radio" value="N" name="use_editor" onclick="changeEditor()">HTML �����Է�</td>
	</tr>
</TABLE>

<TABLE cellpadding="0" cellspacing="0" border="0">
	<tr height="5">
		<td></td>
	</tr>
	<tr>
		<td>
			<!-- EDITOR ���� -->
			
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr> 
			  <td valign="top">
					
					<script language='JavaScript' src='/script/editor.js'></script>
					<script for="window" event="onload()">return OnDocumentComplete()</script>
					
						
					<!--�̹����Է� ���̺�-->
					<div id = "imageDiv"   style="position:absolute;visibility:hidden;width:373px;height:300px">            
						<table id="imageTable" border="1" cellspacing="0" cellpadding="3" bordercolor="#666666" bgcolor="white" onmousemove="clear_timeout()" onmouseout="start_timeout(this)">
							<tr id="base"> 
								<td bordercolor="F7F7F7" bgcolor="F7F7F7">
								���ͳݿ� �÷��� �̹����� ������ �����մϴ�.<BR>
								������ �̹��� �ּ�(url)�� �־��ּ��� <br>
								<span style="font-size:8pt">(��:http://gpis.bestsme.com/a.jpg) * "http://" �� �����</span> </td>
							</tr>
							<tr id="base"> 
								<td bordercolor="F7F7F7" bgcolor="F7F7F7">
								<input name="IMAGE_URL" type="text" class="input" onfocus="has_focus=true;" onblur="has_focus=false;" value="http://" size="34">
								<input type="button" value="����" onClick="insert_image(document.all.IMAGE_URL.value);" class="button">
								<input type="button" value="���" onClick="close_div(document.all.imageDiv)" class="button">
								</td>
							</tr>
						</table>
					</div>
		
		
		
					<!--URL ���̺�-->
					<div id = "urlDiv"   style="position:absolute;visibility:hidden;width:300px;height:300px">           
						<table id="urlTable" border="1" cellspacing="0" cellpadding="3" bordercolor="#666666" bgcolor="white" onmousemove="clear_timeout()" onmouseout="start_timeout(this)">
							<tr id="base"> 
								<td bordercolor="F7F7F7" bgcolor="F7F7F7"> ���õ� �κп� �ɸ� ��ũ �ּ�(url)�� �־��ּ���. 
								<br>
								<span style="font-size:8pt">(��:http://gpis.bestsme.com) * "http://" �� 	�����</span>
								</td>
							</tr>
						<tr id="base"> 
							<td bordercolor="F7F7F7" bgcolor="F7F7F7">
							<input name="LINK_URL" type="text" class="input" onfocus="has_focus=true;" onblur="has_focus=false;" value="" size="29">
							<input type="button" value="����" onClick="patch_url();" class="button">
							<input type="button" value="���" onClick="close_div(document.all.urlDiv)" class="button">
							</td>
						</tr>
						</table>
					</div>
				  

				  
					<!--COLOR ���̺�-->
					<div id = "colorDiv"   style="position:absolute;visibility:hidden;width:300px;height:300px"></div>
					
		
		
					<!--TABLE ���̺�-->
					<div id = "tableDiv"   style="position:absolute;visibility:hidden;width:300px;height:300px">
						<table id="tableTable" border="1" cellspacing="0" cellpadding="3" bordercolor="#666666" bgcolor="white" onmousemove="clear_timeout()" onmouseout="start_timeout(this)">
							<tr id="base">
								<td align="center" bordercolor="F7F7F7" bgcolor="F7F7F7">
		
								
								<strong>������ ���̺��� ������ �Է��ϼ���.</strong><br><br>
								<strong>��� :</strong> 
								<input type="text" size=3 name="COL_NUM" value="" onfocus="has_focus=true;" onblur="has_focus=false;" class="input">
								<strong>���� :</strong> 
								<input type="text" size=3 name="ROW_NUM" value="" onfocus="has_focus=true;" onblur="has_focus=false;" class="input"> 
								<br>
								<strong>�� �β� :</strong> 
								<select name="BORDER_THICK" onfocus="has_focus=true;" onblur="has_focus=false;" class="input" style="font-size:9pt;font-family:����;width:85">
								<option value=1>1</option>
								<option value=2>2</option>
								<option value=3>3</OPTION>
								<option value=4>4</option>
								</select>
		
								</td>
							</tr>
							<tr id="base"> 
								<td align="center" bordercolor="F7F7F7" bgcolor="F7F7F7"> 
								<input type="button" value="����" onClick="make_table();" class="button"> 
								<input type="button" value="���" onClick="close_div(document.all.tableDiv)" class="button"> 
								</td>
							</tr>
						</table>
					</div>
					   <!--======================= TABLE ���̺� ��============================-->			
				 </td>
				 </tr>


				 <tr>
				 <td>
				  <!--======================= ������ ���� ============================-->
					<table width=584 border=0 cellpadding="0" cellspacing="0" align center>
						  
						 <tr>
							<td height="35" background='/images/editor/back.gif'>
								<table height="32" border="0" align="left" cellpadding="0" cellspacing="0" id="toolbar">
									<tr>
										<td width=8></td>
										<td>
										<select id="font" style="font-size:9pt;font-family:����;" onchange="command(this)">
										<option selected>����ü</option>
										<option value='����ü'>����ü</option>
										<option value='����ü'>����ü</option>
										<option value='�ü�ü'>�ü�ü</option>
										<option value='����ü'>����ü</option>
										<option value='���� ��ü'>��ü</option>
										<option value='�޸ո���ü'>����ü</option>
										<option value='HY��������M'>����ü</option>
										<option value='HY����L'>����ü</option>                                
										<option value='Arial'>Arial</option>
										<option value='Times'>Times</option>
										<option value='Courier'>Courier</option>
										</select>
										</td>
										<td>
										<select id="fontsize" style="font-size:9pt;font-family:����;" onchange="command(this)">
										<option selected>ũ ��</option>
										<option>-----</option>
										<option value="1">8pt</option>
										<option value="2">10pt</option>
										<option value="3">12pt</option>
										<option value="4">14pt</option>
										<option value="5">18pt</option>
										<option value="6">24pt</option>
										<option value="7">36pt</option>
										</select>
										</td>
										<td width=8></td>
										<td valign="bottom">
											<table height="30" border=0 cellspacing=0 cellpadding=0 onSelectStart="return false" onDragStart="return false">
												<tr>
													<td id="newdoc" title="������" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/01.gif' hspace="4"></td>
													<!--td id="bgcolor" title="����" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/02.gif' hspace="4"></td-->
													<td><img src='/images/editor/bar.gif' hspace="2"></td>
													<td id="bold" title="����" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/03.gif' hspace="6"></td>
													<td id="italic" title="����̱�" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/04.gif' hspace="6"></td>
													<td id="underline" title="����" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/05.gif' hspace="6"></td>
													<td id="fontcolor" title="���ڻ�" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/06.gif' hspace="6"></td>
													<td id="fontbgcolor" title="���ڹ���" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/07.gif' hspace="6"></td>
													
													<td><img src='/images/editor/bar.gif' hspace="2"></td>
													<td id="left" title="��������" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/08.gif' hspace="4"></td>
													<td id="center" title="�������" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/09.gif' hspace="4"></td>
													<td id="right" title="����������" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/10.gif' hspace="4"></td>
													<td id="numlist" title="���ڱ�ȣ" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/11.gif' hspace="4"></td>
													<td id="itemlist" title="���ڱ�ȣ" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/12.gif' hspace="4"></td>
													<td id="outdent" title="�����̱�" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/13.gif' hspace="4"></td>
													<td id="indent" title="�Ǵ��̱�" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/14.gif' hspace="4"></td>
													
													<td><img src='/images/editor/bar.gif' hspace="2"></td>
													<td id="table" title="ǥ�����" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/15.gif' hspace="4"></td>
													<td id="tablebgcolor" title="ǥ����" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/16.gif' hspace="4"></td>
													
													<td><img src='/images/editor/bar.gif' hspace="2"></td>
												   <td id="image" title="���̹���" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/linkImg.gif' hspace="4"></td>
													<!--td id="localimg2" title="����ǻ�� �̹���" onclick="command(this)"><a href="javascript:imgUpload(document.all.imageFileNo.value)"><img src='/images/editor/img.gif' hspace="4" border=0 align="left"></a></td-->
													<td id="link" title="��ũ�ɱ�" onmouseover="buttonover(this)" onmouseout="buttonout(this)" onmousedown="buttondown(this)" onclick="command(this)"><img src='/images/editor/18.gif' hspace="4"></td>
													<!--td title="������"><a href="javascript:PlayClick()"><img src='/images/editor/19.gif'hspace="4" border=0 width=25 height=20 ><a></td-->
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					   <tr>
						   <td colspan="2">
						   <input name="content" type="hidden" value="">
								<xmp id="edit_div" style="display:none">
										<%=content%>
								</xmp>			
								<table width=100% border=0 cellpadding=0 cellspacing=0>
									<tr>
										<td>
										<textarea name="txtDetail" rows=22 scrollbar="no" style="display:none;FONT-SIZE:9pt;width:<%=width%>px;height:<%=height%>px"></textarea>
										<iframe id="ObjEditor" style="width:<%=width%>px;height:<%=height%>px; border:1" onbeforedeactivate="deactivate_handler();" scrolling="yes"></iframe>
									   </td>
									</tr>
								</TABLE>
							</td>
					   </tr>
				  </TABLE>
				 </td>
				</tr>
			 </TABLE>											                 
			<!-- EDITOR �� -->
		</td>
	</tr>
</TABLE>