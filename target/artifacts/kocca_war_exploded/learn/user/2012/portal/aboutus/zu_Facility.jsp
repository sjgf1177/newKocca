<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	box.put("topmenu","7");
	box.put("submenu","8");
%>


<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ��ī���� �Ұ� > <u>�ü��Ұ�</u></td>
			</tr>
		</table>
		<div class="concept">
			<div>
				<img src="/images/2012/sub/page7/title/facility.gif" alt="��ī���� �ü��ȳ�">
			</div>
		</div>
		<!-- div style="margin-top:30px;">
			<script src='/learn/user/2012/portal/aboutus/information_files/swfobject.js'></script>
			<script>
				var flashvars = {
				};
				flashvars.subfolder='/learn/user/2012/portal/aboutus/information_files';
				flashvars.package='/learn/user/2012/portal/aboutus/information_files/data.swf';
				flashvars.loaderBackground='#000000';
				flashvars.loaderInside='#2E2E2E';
				flashvars.loaderContour='#636363';
				flashvars.loaderBar='#44c6f7';
				flashvars.progressOffsetY='0';
				flashvars.viewer='/learn/user/2012/portal/aboutus/information_files/null.v3d';
				var params = {
					menu: 'false',
					scale: 'noScale',
					allowFullscreen: 'true',
					allowScriptAccess: 'always',
					bgcolor: '',
					wmode: 'direct' 
				};
				var attributes = {
					id:'ScenarioPlayer'
				};
				swfobject.embedSWF(
				'/learn/user/2012/portal/aboutus/information_files/Spread3DSimpleViewer.swf', 
				'player', '978', '598', '11.4.0', 
				'/learn/user/2012/portal/aboutus/information_files/expressInstall.swf', 
				flashvars, params, attributes);
				
				$(document).ready(function(){
					$('#centeredDiv').mouseover(function(){
						$('html').css('overflow-y','hidden');
					});
					$('#centeredDiv').mouseout(function(){
						$('html').css('overflow-y','auto');
					});
					$('embed').css({'position':'relative','z-index':'-1'});
					$('object').css({'position':'relative','z-index':'-1'});
				});
			</script>
			<div id='centeredDiv' style="border:1px solid #444444;">
				<div id='player'></div>
			</div>
		</div>
		<div style="font-family:gulim; font-size:12px; color:#424242; border:1px solid #919191; padding:20px; margin-top:20px; line-height:18px;">
			�� �ܰ� ȭ�鿡 ���콺 �巡��(<img src="/images/2012/sub/page7/icon_mousetip2.gif">)�� �̿�, �Ǵ� �ü�ȭ�� ��� ������ �������� Ŭ���Ͽ� ������ �����մϴ�.<br>
			�Ʒ��� ���� �ü��� Ŭ���ϸ� ���� ������ Ȯ���� �� �ֽ��ϴ�.
			
			<p style="margin-top:8px; color:#0f6ad0;">�� �ȳ��� ������ �ټ� �ٸ� �� �ֽ��ϴ�.</p>
		</div-->
		<br>
			<img src="/images/2012/sub/page7/plant_01.gif" alt="���������� ���� �ü�">
			<img src="/images/2012/sub/page7/plant_02.gif" alt="��û�� ���� �ü�">
			<img src="/images/2012/sub/page7/plant_03.gif" alt="�����Կ� �� ���� ���� �ü�">
			<img src="/images/2012/sub/page7/subject_row.gif" alt="��ī���� ���� �ȳ���" style="margin-top:60px;">
			<style>
				table.rowguide { width:100%; margin-top:20px; }
				table.rowguide th { width:80px; font-family:"malgun gothic","dotum","sans-serif"; font-size:18px; color:#888888; font-weight:400; border-top:1px solid #ebebeb; border-bottom:1px solid #ebebeb; text-align:center; }
				table.rowguide td { font-family:"gulim","dotum","sans-serif"; font-size:12px; color:#424242; padding:20px; border-top:1px solid #cbcbcb; border-bottom:1px solid #cbcbcb; border-left:3px solid #b8b8b8; }
				table.rowguide td p { float:left; height:12px; background-image:url('/images/2012/sub/icon_dot.png'); background-repeat:no-repeat; background-position:left center; padding-left:6px; margin:5px 35px 5px 0px; }
				table.rowguide td dl dd { float:left; height:12px; background-image:url('/images/2012/sub/icon_dot.png'); background-repeat:no-repeat; background-position:left center; padding-left:6px; margin:5px 30px 5px 0px; }
			</style>
			
			<table class="rowguide" cellpadding="0" cellspacing="0">
				<tr bgcolor="#fafafa">
					<th>8F</th>
					<td>
						<dl>
							<dd style="width:150px;"><a href="javascript:facilityview('33');" title="���� ������ Ȯ���� �� �ֽ��ϴ�.">����</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('34');" title="��ī���� ������ ������ Ȯ���� �� �ֽ��ϴ�.">��ī���� ������</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('37');" title="������ �������� ���ǽ� ������ Ȯ���� �� �ֽ��ϴ�.">������ �������� ���ǽ�</a></dd>
						</dl>
					</td>
				</tr>
				<tr>
					<th>7F</th>
					<td>
						<dl>
							<dd style="width:150px;"><a href="javascript:facilityview('25');" title="���� �׷��� ���ǽ� ������ Ȯ���� �� �ֽ��ϴ�.">���� �׷��� ���ǽ�</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('26');" title="���� ������ ��ȹ ������ Ȯ���� �� �ֽ��ϴ�.">���� ������ ��ȹ</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('27');" title="���� ���̳��� ������ Ȯ���� �� �ֽ��ϴ�.">���� ���̳���</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('28');" title="���� ���α׷��� ���ǽ� ������ Ȯ���� �� �ֽ��ϴ�.">���� ���α׷��� ���ǽ�</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('29');" title="���� ������Ʈ ���ǽ� ������ Ȯ���� �� �ֽ��ϴ�.">���� ������Ʈ ���ǽ�</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('30');" title="���� ������Ʈ ���߽� ������ Ȯ���� �� �ֽ��ϴ�.">���� ������Ʈ ���߽�</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('31');" title="��ȹâ�� ���ǽ� ������ Ȯ���� �� �ֽ��ϴ�.">��ȹâ�� ���ǽ�</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('32');" title="��� ���� ������ Ȯ���� �� �ֽ��ϴ�.">��� ����</a></dd>
						</dl>
					</td>
				</tr>
				<tr bgcolor="#fafafa">
					<th>5F</th>
					<td>
						<dl>
							<dd style="width:150px;"><a href="javascript:facilityview('22');" title="Digital Editing Room ������ Ȯ���� �� �ֽ��ϴ�.">Digital Editing Room</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('23');" title="S3D Graphic Room ������ Ȯ���� �� �ֽ��ϴ�.">S3D Graphic Room</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('24');" title="��Ƽ�̵��ǽ� ������ Ȯ���� �� �ֽ��ϴ�.">��Ƽ�̵��ǽ�</a></dd>
						</dl>
					</td>
				</tr>
				<tr>
					<th>4F</th>
					<td>
						<dl>
							<dd style="width:150px;"><a href="javascript:facilityview('14');" title="Digital Editing Room I ������ Ȯ���� �� �ֽ��ϴ�.">Digital Editing Room I</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('16');" title="Digital Editing Room II ������ Ȯ���� �� �ֽ��ϴ�.">Digital Editing Room II</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('20');" title="������ ���� ���ǽ� ������ Ȯ���� �� �ֽ��ϴ�.">������ ���� ���ǽ�</a></dd>
						</dl>
					</td>
				</tr>
				<tr bgcolor="#fafafa">
					<th>3F</th>
					<td>
						<dl>
							<dd style="width:150px;"><a href="javascript:facilityview('8');" title="ȸ���� ������ Ȯ���� �� �ֽ��ϴ�.">ȸ����</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('11');" title="ȸ���� ������ Ȯ���� �� �ֽ��ϴ�.">ȸ����</a></dd>
							<dd style="width:150px;">����ȸ����</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<th>2F</th>
					<td>
						<dl>
							<dd style="width:150px;"><a href="javascript:facilityview('5');" title="S3D Post-Production ������ Ȯ���� �� �ֽ��ϴ�.">S3D Post-Production</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('6');" title="S3D Pre-Production ������ Ȯ���� �� �ֽ��ϴ�.">S3D Pre-Production</a></dd>
							<dd style="width:150px;"><a href="javascript:facilityview('7');" title="S3D Production ������ Ȯ���� �� �ֽ��ϴ�.">S3D Production</a></dd>
						</dl>
					</td>
				</tr>
				<tr bgcolor="#fafafa">
					<th>1F</th>
					<td>
						<dl style="clear:left;">
							<dd style="width:150px;"><a href="javascript:facilityview('1');" title="S3D Training Center ������ Ȯ���� �� �ֽ��ϴ�.">S3D Training Center</a></dd>
						</dl>
					</td>
				</tr>
			</table>
	</div>
	
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>