<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />


<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","5");
	box.put("submenu","3");
     
    String v_title     = "";
    String v_content   = "";
    String v_usernm    = "";
    String v_userid    = "";
    String v_regdt     = "";
    
    int v_seq = box.getInt("p_seq");
    String v_searchtext = box.getString("p_searchtext");
    String v_select     = box.getString("p_select");
    String v_selCategory = box.getString("p_selCategory");
    int    v_pageno     = box.getInt("p_pageno");
    String s_usernm     = box.getSession("name");
    String content      = "";
    String width        = "650";
    String height       = "200";
    
    String s_userid     = box.getSession("userid");

%>
<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
    //����Ʈȭ������ �̵�
    function selectList() {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "";     
        document.form1.submit();    
    }  
    
    //�����͸� �Է��Ѵ�.
    function insert() {
    
        var frm = document.form1;        
    
        if (blankCheck(frm.p_title.value)) {
            alert("������ �Է��ϼ���!");
            frm.p_title.focus();
            return;
        }                
        
        if (realsize(frm.p_title.value) > 100) {
            alert("������ �ѱ۱��� 50�ڸ� �ʰ����� ���մϴ�.");
            frmp_title.focus();
            return;
        }
    
        if (frm.p_categorycd.options[frm.p_categorycd.selectedIndex].value == "") {
            alert("�з��� �����ϼ���!");
            frm.p_categorycd.focus();
            return;
        }
        
        if (blankCheck(frm.p_content.value)) {
            alert("������ �Է��ϼ���!");
            frm.p_content.focus();
            return;
        } 
    
        //document.getElementById("p_content").value = CrossEditor.GetBodyValue();
        
        frm.p_searchtext.value    = "";
        frm.p_select.value        = "";
        frm.p_selCategory.value   = "";
        frm.p_pageno.value        =  1;
        
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "insert";
        document.form1.submit();
    }
    
    //�Է� ������ ������ üũ
    function blankCheck( msg ) {
        var mleng = msg.length;
        chk=0;
        
        for (i=0; i<mleng; i++) {
            if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
        }
        if ( chk == 0 ) return (true);
        
        return (false);
    }
    function realsize( value ) {//���ڼ��� üũ
        var len = 0;
        if ( value == null ) return 0;
        for(var i=0;i<value.length;i++){
            var c = escape(value.charAt(i));
            if ( c.length == 1 ) len ++;
            else if ( c.indexOf("%u") != -1 ) len += 2;
            else if ( c.indexOf("%") != -1 ) len += c.length/3;
        }
        return len;
    }
    

    function checkYN()
    {
        var r=$("[name='p_isopen']").val();
        if(r=="Y")
            $("[name='p_isopen']").val("N");
        else
            $("[name='p_isopen']").val("Y");
        
        //alert(document.form1.p_isopen.value);
    }
    
    
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1" enctype = "multipart/form-data" method = "post" action="">
    <input type = "hidden" name = "p_seq"           value = "<%= v_seq %>">
    <input type = "hidden" name = "p_searchtext"    value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_select"        value = "<%=v_select %>">
    <input type = "hidden" name = "p_selCategory"   value = "<%=v_selCategory %>">
    
    <input type = "hidden" name = "p_pageno"        value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_process"       value = "">
    
    <div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ���� ��ô� ȭ���� ��ġ�Դϴ�">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �н����� > <u>������ϱ�</u></td>
			</tr>
		</table>
		<div class="concept">
			<div><img src="/images/2012/sub/page4/title/qna.gif" alt="�н��� ���� �ñ��� ���� �ִٸ� �����̵� �������"></div>
			<ul class="boardsearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" tabindex="171" onfocus="typechoiceopen('1')"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" name="p_select" id="choicetype" value="title">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����','title')" tabindex="172" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('����','content')" tabindex="173" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'; searchtypeclose();" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
					</dl>
				</li>
				<li class="insert"><input type="text" name="p_searchtext" tabindex="174" class="insearch" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><a href="javascript:searchList();" tabindex="175" title="�˻��� �����մϴ�"><img src="/images/2012/sub/page2/btn_course_search.gif" alt="�����˻�"></a></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="writepost">
				<table class="writeform" cellspacing="0" cellpadding="0" summary="������ϱ��� �۾��� �����Դϴ�">
					<colgroup><col width="120"><col width="*"></colgroup>
					<tr>
						<th id="w_category"><h5>�о�</h5></th>
						<td name="w_category">
							<select id="txtfield1" tabindex="176" name="p_categorycd"  onfocus="choicefield('1');" title="�о߸� �������ּ���">
								<option value="">�о߼���</option>
								<option value="A1">���Ӱ���</option>
								<option value="B1">��ۿ���</option>
								<option value="C1">��ȭ������</option>
							</select>
						</td>
					</tr>
					<tr>
						<th id="w_option"><h5>�ɼ�</h5></th>
						<td name="w_option"><input type="checkbox" tabindex="177" name="p_isopen" id="lock" class="checkbox" value="Y" onclick="checkYN();" title="�������θ� ���ּ���"><label for="lock" class="label">�� ���� �������� �ʽ��ϴ�.</label></td>
					</tr>
					<tr>
						<th id="w_subject"><h5>����</h5></th>
						<td name="w_subject"><input type="text" name="p_title" tabindex="178" id="txtfield2" onfocus="choicefield('2');" class="txt" title="������ �Է����ּ���"></td>
					</tr>
					<tr>
						<th id="w_content"><h5>����</h5></th>
						<td name="w_content"><textarea id="p_content" tabindex="179" name="p_content" id="txtfield3" onfocus="choicefield('3');" title="������ �Է����ּ���"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="writefooter">
				<a href="javascript:insert();" tabindex="180" title="�ۼ��� ���� ���ε��ϰ� ������� ���ư��ϴ�"><img src="/images/2012/sub/page6/btn_confirm.gif" align="absmiddle" alt="�ۼ��� ���� ����մϴ�"></a>
				<a href="javascript:history.go(-1)" tabindex="181" title="�ۼ��� ����ϰ� ������������ ���ư��ϴ�"><img src="/images/2012/sub/page6/btn_cancel.gif" align="absmiddle" alt="���ۼ��� ����մϴ�"></a>
			</div>
		</div>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
