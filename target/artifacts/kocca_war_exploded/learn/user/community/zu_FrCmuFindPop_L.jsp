<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage   = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");
    String  v_orderby    = box.getStringDefault("p_orderby","cmu_nm");

    String  v_loc_fg     = box.getStringDefault("p_loc_fg","1");
    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    int v_dispnum    = 0;
    int v_totalpage  = 0;
    int v_rowcount   = 1;
    int v_pageno             = box.getInt("p_pageno");
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));

    ArrayList list     = (ArrayList)request.getAttribute("list");

%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>Ŀ�´�Ƽ ã��</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--

//�������̵�
function goPage(pageNum) {
    document.form1.p_pageno.value = pageNum;
    document.form1.action = "/servlet/controller.community.CommunityPopUpServlet";
    document.form1.p_process.value = "menucmufindPage";
    document.form1.submit();
}

//��ȸ
function uf_searchOK() {
    if(document.form1.p_searchtext.value ==''){
       alert('�˻�� �Է��Ͽ����մϴ�.');document.form1.p_searchtext.focus();return;
    }

    document.form1.p_pageno.value = 1;
    document.form1.action = "/servlet/controller.community.CommunityPopUpServlet";
    document.form1.p_process.value = "menucmufindPage";
    document.form1.submit();
}
//����
function uf_sendOK(cmuno,cmu_nm) {
    opener.document.form1.p_cmuno.value=cmuno;
    opener.document.form1.p_cmu_nm.value=cmu_nm;
    this.close();
}



//-->
</script>
</head>
<body id="popup"><!-- popup size : 750* -->
<form name = "form1"    method = "post">
	<input type = "hidden" name = "p_process" value="">
	<input type = "hidden" name = "p_loc_fg" value="<%=v_loc_fg%>">
	<input type = "hidden" name = "p_pageno"      value = "">
	<input type = "hidden" name = "p_cmuno"      value = "">
    
    <div id="pop_header">
        <h1><img src="/images/portal/community/pop_h1_tit1.gif" alt="Ŀ�´�Ƽ" /></h1>
    </div>
    <div id="pop_container">
        <div id="contentwrap" class="message_top">
            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_communitysearch.gif" alt="Ŀ�´�Ƽã��" class="fl_l" /> </h3>
            <p class="searchbox" style="width:690px;">
                <span class="fl_l pd_l25">
                    <select name="p_select">
                        <option value="cmu_nm"       <%if("cmu_nm".equals(v_select)) out.print(" selected");%>>��  ��</option>
                        <option value="kor_name"    <%if("kor_name".equals(v_select)) out.print(" selected");%>>��  ��</option>
                    </select>
                    <input type="text" name="p_searchtext" class="inbox" style="width:205px;" value="<%=v_searchtext%>" onkeypress="javascript:fnKeyPressEnter(event, 'uf_searchOK');"/>
                    <input type="image" src="/images/portal/btn/btn_serbox_search.gif" class="va_m mg_r12" alt="�˻�" onclick="uf_searchOK();"/>
                </span>
                <span class="fl_r pd_r25">
                    <img src="/images/portal/board/serbox_ordertxt.gif" alt="�������" class="mg_r5" />
                    <select name="p_orderby" onchange="javascript:goPage(1);">
                        <option value="cmu_nm"      <%if("cmu_nm".equals(v_orderby)) out.print(" selected");%>>Ŀ�´�Ƽ��</option>
			            <option value="kor_name"    <%if("kor_name".equals(v_orderby)) out.print(" selected");%>>�ü�</option>
			            <option value="accept_dte"  <%if("accept_dte".equals(v_orderby)) out.print(" selected");%>>��������</option>
                    </select>
                </span>
            </p>

            <table class="list com_list">
            <thead>
            <tr>
                <th>Ŀ�´�Ƽ��</th>
                <th>�û��̸�</th>
                <th>��������</th>
                <th>ȸ����</th>
                <th>��������</th>
            </tr>
            </thead>
            <tbody>
            <%  
            if(list != null && list.size() != 0){
                for(int i = 0; i < list.size(); i++) {
                    DataBox dbox = (DataBox)list.get(i);
                    v_totalpage = dbox.getInt("d_totalpage");
                    String v_cmu_nm   =dbox.getString("d_cmu_nm");
                    String v_intro    =dbox.getString("d_intro");
                    String v_kor_name =dbox.getString("d_kor_name");
                    String v_display_fg="����";
                    
                    if("1".equals(dbox.getString("d_display_fg"))) v_display_fg="����";
                    if("2".equals(dbox.getString("d_display_fg"))) v_display_fg="�����";

		            if (!v_searchtext.equals("")&&v_select.equals("cmu_nm")) {
		                v_cmu_nm = StringManager.replace(dbox.getString("d_cmu_nm"), v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
		            } else if(!v_searchtext.equals("")&&v_select.equals("intro")){
		                v_intro = StringManager.replace(dbox.getString("d_intro"), v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
		            } else if(!v_searchtext.equals("")&&v_select.equals("kor_name")){
		                v_kor_name = StringManager.replace(dbox.getString("d_kor_name"), v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
		            }
            %>
            <tr class="pop_tit">
                <td class="ta_l"><a href="javascript:uf_sendOK(<%=dbox.getString("d_cmuno")%>,'<%=v_cmu_nm%>');"><%=v_cmu_nm%></a></td>
                <td><%=v_kor_name%></td>
                <td><%=v_display_fg%></td>
                <td class="num"><%=dbox.getString("d_member_cnt")%></td>
                <td class="num"><%=FormatDate.getFormatDate(dbox.getString("d_accept_dte"), "yyyy.MM.dd")%></td>
            </tr>
            <%     }
                 
                } else {%>
            <tr> 
                <td colspan=5>�˻��� Ŀ�´�Ƽ�� �����ϴ�.</td>
            </tr>
            <%}%>
            </tbody>
            </table>
            
        <!-- ����¡ ���� ���� -->
         <%= PageUtil.printPageSizeListDivNoPagesize(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
        <!-- ����¡ ���� ���� -->
        </div>
    </div>
    <div id="pop_footer">
        <p class="f_btn"><a href="javascript:self.close()" class="btn_gr"><span>�ݱ�</span></a></p>
    </div>
</body>
</html> 
