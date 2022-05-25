<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import="com.credu.homepage.LinkSiteBean" %>

<%
	RequestBox footerBox = (RequestBox)request.getAttribute("requestbox");

	//���úμ� ����Ʈ
	LinkSiteBean site = new LinkSiteBean();
	ArrayList bolist = site.SelectList(footerBox);
	
	String footerUrl = "/servlet/controller.homepage.HomePageHelpServlet";
%>
	<div id="footer">
		<div class="copyright">
			<div class="copyright_left">
			
				<h3 style="width: 109px; height: 75px; float: left;">
					<!--�ϴ� ī�Ƕ���Ʈ �� �ΰ� -->
					<img src="/images/portal/asp/typeA/main/footer_logo.jpg" />
				</h3>
				<ul>
					<%-- <li style="color: #fff;"><a href="javascript:menuMainForward('99', '<%=footerUrl %>?p_process=Footer&p_code=FOOTER_PRIVACY')" style="color:#fff">��������ó����ħ</a></li> --%>
					<li style="color: #fff;">
						<a href="http://www.kocca.kr/cop/contents.do?menuNo=200931" style="color:#fff" 
							onclick="window.open(this.href, '��������ó����ħ', 'width=1280, height=800, toolbar=no, menubar=no, scrollbars=yes'); return false;">��������ó����ħ</a>
					</li>
					<li><a href="javascript:menuForward(7,'01');" >��ī���� �Ұ�</a></li>
					<li><a href="javascript:menuForward(4,'01');" >���ֹ��� ����</a></li>
					<li style="border: none;"><a href="javascript:menuMainForward('99', '<%=footerUrl %>?p_process=Footer&p_code=FOOTER_EMAIL')" >�̸��Ϲ��ܼ����ź�</a></li>
				</ul>
				<p style="float: left; margin-left: 10px; margin-top: 20px; color: #cecece; line-height: 16px; font-size: 11px;">
					�ѱ���������ī���� | �ּ� : ����Ư���� ���빮�� ȸ��� 66<br />�¶��� ���� 02-6310-0770
				</p>
			</div>
			<div class="gray_right">
				<p style="margin-top: 40px;">
					<span style="color: #cecece; margin-right: 5px;">Family site</span>
					<select name="fsite" style="color: #626262; font-size: 11px; height: 20px;">
						<option value>���û���Ʈ �ٷΰ���</option>
						<option value='https://edu.kocca.kr'>����������ķ�۽�</option>
						<%
				            for( int ii = 0 ; ii < bolist.size() ; ii++ ){
				                DataBox ddbox = (DataBox)bolist.get(ii);
				
				                int vv_seq      = ddbox.getInt("d_seq");
				                int vv_sort     = ddbox.getInt("d_sort");
				                String vv_sitenm   = ddbox.getString("d_sitenm");
				                String vv_url      = ddbox.getString("d_url");
				                String vv_isuse    = ddbox.getString("d_isuse");
				                String vv_islogin  = ddbox.getString("d_islogin");
				                String vv_ldate    = ddbox.getString("d_ldate");
				                String vv_grcode   = ddbox.getString("d_grcode");
				                String vv_banner   = ddbox.getString("d_banner");
				        %>
				                    <option value='<%=vv_grcode%>:<%=vv_seq%>:<%=vv_islogin%>'><%=vv_sitenm%></option>
				                    
				        <%  }	%>
					</select>
					<script>
						/* ���û���Ʈ �ٷΰ��� ��â���� ����rsg20180124 */
						$("select[name='fsite']").change(function(){
							window.open( $(this).val() , "_blank" );
						});
					</script>
				</p>
			</div>
		</div>
	</div>
</div><%-- wrap start --%>