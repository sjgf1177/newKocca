<script language="javascript">

function goLoginAll() {
	document.getElementById('logM').style.display = "none";
	document.getElementById('logG').style.display = "block";
}
</script>		

		<div id="aside">
			<% if(topWarp_userid.equals("")) { %>
			<div id="logM" class=common_login>
				<a href="javascript:ssoLogin();"><img src="/images/portal/asp/btn_common_login.gif" alt="����ȸ�� �α���" /></a>
				<p class="search_btn">
					<a href="javascript:ssoJoin();"><img src="/images/portal/asp/btn_comjoin.gif" alt="����ȸ������" /></a>
					<a href="javascript:ssoLosspwd();"><img src="/images/portal/asp/btn_comsearch.gif" alt="���� ID/PWã��" /></a>
					<a href="#"><img src="/images/portal/asp/btn_orsearch.gif" alt="���� ID/PWã��" /></a>
				</p>
			</div>

			<div id="logG" class="login_box" style="display:none;">
				<dl>
					<dt><img src="/images/portal/asp/login_tit.gif" alt="Member LOGIN" /></dt>
					<dd><input type="text" class="inbox" value="���̵�" name="p_userid" id="userid" onChange="$('#p_topuserid').val(this.value);" onkeypress="moveFocus(event,'p_pwd');$('#passwd').val('');" onClick="this.value=''"/><br />
					<input type="password" class="inbox" value="�н�����" name="p_pwd" id="passwd" onChange="$('#p_toppwd').val(this.value);" onkeypress="fnKeyPressEnter(event, 'topLogin');" onClick="this.value=''"/></dd>
					<dd class="btn"><a href="javascript:topLogin();"><img src="/images/portal/asp/btn_login.gif" alt="�α���" /></a></dd>
				</dl>
				<p class="search_btn">
					<a href=""><img src="/images/portal/asp/btn_idpwsearch.gif" alt="���̵� / �н����� ã��" /></a>
					<a href=""><img src="/images/portal/asp/btn_joining.gif" alt="ȸ�������ϱ�" /></a>
				</p>
			</div>
			<% } else {%>
			<div id="logO" class="logout_box">
				<dl>
					<dt><img src="/images/portal/asp/login_tit.gif" alt="Member LOGIN" /></dt>
					<dd class="txt"><%=topWarp_usernm %>��<br />�����ϼ̽��ϴ�</dd>
					<dd class="btn"><a href=""><img src="/images/portal/asp/btn_logout.gif" alt="�α׾ƿ�" /></a></dd>
				</dl>
				<p class="search_btn">
					<a href="javascript:topMemberInfoModify();"><img src="/images/portal/asp/btn_indiedit.gif" alt="�������������ϱ�" /></a>
					<a href="javascript:topLogout();"><img src="/images/portal/asp/btn_withdrawal.gif" alt="ȸ��Ż���ϱ�" /></a>
				</p>
			</div>
			<%  }  %>
			<p class="banner">
				<a href="javascript:menuForward('4','01');"><img src="/images/portal/asp/banner_1.gif" alt="���ֹ�������" /></a>
				<a href="javascript:menuForward('1','11');"><img src="/images/portal/asp/banner_2.gif" alt="������������" /></a>
				<a href="javascript:menuForward('1','13');"><img src="/images/portal/asp/banner_3.gif" alt="������û�ȳ�" /></a>
			</p>

			<dl class="menu">
				<dt><img src="/images/portal/asp/menu_tit.gif" alt="����ã�� �޴�" /></dt>
				<dd class="ty1">
					<a href="javascript:menuForward('1','01');"><img src="/images/portal/asp/menu_1_off.gif" alt="���������ȳ�" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
					<a href="javascript:menuForward('3','11');"><img src="/images/portal/asp/menu_2_off.gif" alt="�������ΰ���" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
					<a href="javascript:menuForward('5','03');"><img src="/images/portal/asp/menu_3_off.gif" alt="�����ڷ��" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
				</dd>
				<dd class="ty2">
					<a href="javascript:menuForward('4','06');"><img src="/images/portal/asp/menu_4_off.gif" alt="�¶��θ޴���" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
					<a href="javascript:menuForward('3','17');"><img src="/images/portal/asp/menu_5_off.gif" alt="������ûȮ��/���" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
					<a href="javascript:menuForward('5','06');"><img src="/images/portal/asp/menu_6_off.gif" alt="������������" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
				</dd>
				<dd class="ty3">
					<a href="javascript:menuForward('1','12');"><img src="/images/portal/asp/menu_7_off.gif" alt="������������" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
					<a href="javascript:menuForward('3','12');"><img src="/images/portal/asp/menu_8_off.gif" alt="���ǻ�㳻��" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
					<a href="javascript:menuForward('5','08');"><img src="/images/portal/asp/menu_9_off.gif" alt="�����ı�" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
				</dd>
			</dl>

			<dl class="eduservice">
				<dt><img src="/images/portal/asp/eduservice_tit.gif" alt="�������� ����" /></dt>
				<dd><img src="/images/portal/asp/eduservice.gif" alt="TEL 02-2345-6789
FAX 02-2345-6789 
�����̳� ����Ʈ �̿�ȳ� �����Ͽ� ģ���� ����� �帳�ϴ�.
��ð�: ���� 09:00~18:00" /></dd>
				<!-- <dd>
					<img src="/images/portal/asp/eduservice_num.gif" alt="TEL 02-2345-6789
FAX 02-2345-6789" />
					<img src="/images/portal/asp/eduservice_txt.gif" class="txt" alt="�����̳� ����Ʈ �̿�ȳ� �����Ͽ� ģ���� ����� �帳�ϴ�." />
					<img src="/images/portal/asp/eduservice_time.gif" class="time" alt="��ð�: ���� 09:00~18:00" />
				</dd> -->
			</dl>
		</div>