<%
    String gubun = "6";  // ��޴� ���� ����

	//������
	DataBox communityBox     = CommunityCreateBean.selectBaseMst(box);
	int v_tmp_memcnt =0;
	String  v_tmp_cmuno        = "";
	String  v_tmp_accetp_dte   ="";
	String  v_tmp_img_path     ="";
	String  v_tmp_intro        ="";
	String  v_cmu_nm           ="";
	String  v_tmp_display_fg   = "";
	String  v_tmp_layout_fg    = "";
	
	if(communityBox != null){
	  v_tmp_cmuno      = communityBox.getString("d_cmuno");
	  v_tmp_accetp_dte = communityBox.getString("d_accept_dte");
	  v_tmp_img_path   = communityBox.getString("d_img_path");
	  v_tmp_intro      = communityBox.getString("d_intro");
	  v_cmu_nm         = communityBox.getString("d_cmu_nm");
	  v_tmp_memcnt     = communityBox.getInt("d_member_cnt");
	  v_tmp_display_fg = communityBox.getString("d_html_skin_fg");
	  v_tmp_layout_fg  = communityBox.getString("d_layout_fg");
	}
	
	//����Ÿȸ������
	DataBox masterInfo     = CommunityMsMangeBean.selectMemMasterSingleData(box);
	
    String v_cafe_master_nm    = "";
    String v_cafe_master_email      = "";

    if(masterInfo != null){
      v_cafe_master_nm    = masterInfo.getString("d_kor_name");
      v_cafe_master_email      = masterInfo.getString("d_email");
    }
	
	//Ŀ�´�Ƽ Ÿ������
    String style_type = "";
    if("1".equals(v_tmp_display_fg)) style_type = "a";
    else if("2".equals(v_tmp_display_fg)) style_type = "b";
    else if("3".equals(v_tmp_display_fg)) style_type = "c";
    else if("4".equals(v_tmp_display_fg)) style_type = "d";
    else if("5".equals(v_tmp_display_fg)) style_type = "e";
    else style_type = "a";


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>�ѱ������� �����</title>
<link rel="stylesheet" type="text/css" href="/css/portal/community.css" />
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
<script type="text/javascript" src="/namo_cross/js/namo_scripteditor.js"></script> 
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/user_patch.js'></script>
<!-- script language = "VBScript" src = "/script/cresys_lib.vbs"></script-->
<script language="JavaScript" type="text/JavaScript">
//�����͹´�Ƽ Ȩ���� �̵�
function moveMyCommunity() {

	//var cmuno = document.getElementById("p_static_cmuno").value;
	var cmuno = "";
	if(cmuno == "" ) {
		cmuno = "<%=v_tmp_cmuno%>";
	}
	    document.topFrm.action = "/servlet/controller.community.CommunityIndexServlet?p_cmuno="+cmuno; 
	    document.topFrm.p_process.value = "selectmyindex";
	
	    document.topFrm.submit();
	
}
</script>
</head>
<body onload="self.focus();">
<!-- accessibility_menu -->
<ul id="accessibility_menu">
    <li><a href="#content">�������� �Ѿ��</a></li>
    <li><a href="#header">�� �޴��� �Ѿ��</a></li>
    <li><a href="#banner">�ؽ�Ʈ���ʷ� �Ѿ��</a></li>
    <li><a href="#footer">ī�Ƕ����ͷ� �Ѿ��</a></li>
</ul>
<!--// accessibility_menu -->
<hr />

<div id="color_<%=style_type %>">
    <form name = "topFrm" method="post">
    <input type="hidden" name="p_process" value=""/>
    <input type="hidden" name="tabMenu" value=""/>
    <input type="hidden" name="actionflag" value=""/>
    
    
    <div id="header">
        <p class="tit"><!-- <img src="/images/portal/community/btnbg_community.gif" alt="Ŀ�´�Ƽ��" class="va_up5" /> --><a href="javascript:moveMyCommunity();"><%=v_cmu_nm %></a></p>
        <!--<p class="name">
            <span><%=s_username%>, �ݰ����ϴ�.</span>
            <select name="p_static_cmuno" id="p_static_cmuno" onchange="javascript:moveMyCommunity('<%=v_tmp_cmuno %>');" style="width:188px;">
                <option selected>���� ������ Ŀ�´�Ƽ</option>
                <%=(new com.credu.community.CommunityIndexBean()).selectMyCuminity(s_userid,v_tmp_cmuno)%>
            </select>
        </p>
    --></div>
    </form>
    <hr />

    <div id="container">
        <!-- Left Menu Start ! -->
        <%@ include file="/learn/user/community/include/cm_leftmenu.jsp"%>
        <!-- Left Menu End ! -->
        <hr />

        <div id="main">